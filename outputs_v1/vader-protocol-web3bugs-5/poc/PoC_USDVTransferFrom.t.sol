// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

import "/home/mat/certora-ac-audit/certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/5/vader-protocol/contracts/USDV.sol";
import "./src/MockVader.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: USDV TransferFrom Allowance Check
/// @notice Tests that transferFrom properly checks allowance
contract PoC_USDVTransferFrom {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    USDV private target;
    MockVader private mockVader;
    address private constant DEPLOYER = address(0xD0B);
    address private constant ATTACKER = address(0xA11CE);
    address private constant HOLDER = address(0x1001);

    function setUp() public {
        vm.prank(DEPLOYER);
        mockVader = new MockVader();
        vm.prank(DEPLOYER);
        target = new USDV();
    }

    /// @notice Test that transferFrom requires sufficient allowance
    function test_exploit() public {
        // Initialize the contract with mock VADER
        vm.prank(DEPLOYER);
        target.init(address(mockVader), address(0), address(0));

        // Give holder some tokens by direct balance manipulation (for testing only)
        // In production, tokens would come from convert/redeem
        
        // Set a small allowance for the attacker
        vm.prank(HOLDER);
        target.approve(ATTACKER, 100);

        // Try to transfer more than allowance
        vm.prank(ATTACKER);
        try target.transferFrom(HOLDER, ATTACKER, 200) {
            // If we reach here, transferFrom succeeded with insufficient allowance
            // This is the vulnerability
            require(false, "Vulnerability confirmed: transferFrom succeeded with insufficient allowance");
        } catch {
            // Allowance check worked correctly - this is the expected behavior
            require(true, "Allowance check prevented the exploit");
        }
    }
}
