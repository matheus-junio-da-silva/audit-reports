// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.11;

import "yeti/StabilityPool.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: StabilityPool_receiveCollateral
/// @notice web3bugs-66 H-01 / S5-3: "receiveCollateral callable by anyone".
/// The current snapshot guards receiveCollateral with
/// _requireCallerIsActivePool() (StabilityPool.sol:1133-1137, checked at 1155).
/// This PoC proves the unauthorized path reverts and the authorized path is
/// reachable, i.e. the H-01 exploit is NOT reproducible on this snapshot.
contract PoC_StabilityPool_receiveCollateral {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    address private constant ATTACKER = address(0xA11CE);

    StabilityPool private sp;
    ActivePoolStub private activePoolStub;

    function setUp() public {
        Dummy d = new Dummy();
        activePoolStub = new ActivePoolStub();
        sp = new StabilityPool();
        activePoolStub.setSp(sp);
        sp.setAddresses(
            address(d),           // borrowerOperations
            address(d),           // troveManager
            address(activePoolStub), // activePool (authorized caller)
            address(d),           // yusdToken
            address(d),           // sortedTroves
            address(d),           // communityIssuance
            address(d),           // whitelist
            address(d)            // troveManagerLiquidations
        );
    }

    /// @notice Unauthorized caller (ATTACKER) must be rejected.
    function test_attacker_receiveCollateral_reverts() public {
        address[] memory tokens = new address[](1);
        tokens[0] = address(0x1);
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 1;

        vm.prank(ATTACKER);
        (bool ok, ) = address(sp).call(
            abi.encodeWithSelector(
                bytes4(keccak256("receiveCollateral(address[],uint256[])")),
                tokens,
                amounts
            )
        );
        require(!ok, "H-01 reproduced: receiveCollateral callable by non-ActivePool");
    }

    /// @notice Authorized caller (ActivePool) completes the accounting update.
    function test_activePool_authorized_path_reachable() public {
        activePoolStub.trigger();
        (address[] memory ts, uint256[] memory amountsOut) = sp.getAllCollateral();
        require(ts.length == 0, "unexpected collateral tokens recorded");
        require(amountsOut.length == 0, "unexpected collateral amounts recorded");
    }
}

/// @notice Empty contract, satisfies CheckContract extcodesize requirements.
contract Dummy {}

/// @notice Plays the ActivePool role so msg.sender == activePool at the guard.
contract ActivePoolStub {
    StabilityPool private sp;

    function setSp(StabilityPool _sp) external {
        sp = _sp;
    }

    function trigger() external {
        address[] memory tokens = new address[](0);
        uint256[] memory amounts = new uint256[](0);
        sp.receiveCollateral(tokens, amounts);
    }
}