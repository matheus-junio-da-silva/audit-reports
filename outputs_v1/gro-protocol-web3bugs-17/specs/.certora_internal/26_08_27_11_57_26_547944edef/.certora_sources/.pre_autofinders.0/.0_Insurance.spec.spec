// ============================================================
// file: Insurance.spec
// verified contract: Insurance.sol
// total properties: 4
// categories:
//   S4.2.G1  owner-only configuration (setAllocation/setExposure/
//            setCurveVaultPercent/setExposureBufferRebalance/
//            setWhaleThresholdWithdraw/setWhaleThresholdDeposit)
//   S4.2.G1  dual-authority setter (setUnderlyingTokenPercent:
//            owner or controller)
//   S4.1.G9  whitelist gating (rebalance)
// items NOT applicable: G2, G4, G7, G8, G10, G11, S4.2.G4
//   (see property-plan)
// items requiring manual models:
//   S4.2.G3 rebalanceForWithdraw — trusted caller is derived
//   cross-contract (IController.withdrawHandler()); controller not
//   linked into this proof, so no sound local predicate exists.
//   Recorded manual_model_required; the handler registry trust is
//   instead proven on the Controller side (burnGToken rules).
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function controller() external returns (address) envfree;
    function whitelist(address) external returns (bool) envfree;

    function setAllocation(address) external;
    function setExposure(address) external;
    function setCurveVaultPercent(uint256) external;
    function setExposureBufferRebalance(uint256) external;
    function setWhaleThresholdWithdraw(uint256) external;
    function setWhaleThresholdDeposit(uint256) external;
    function setUnderlyingTokenPercent(uint256, uint256) external;
    function rebalance() external;
}

rule owner_configuration_setters_reject_non_owner(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setAllocation(address).selector
          || f.selector == sig:setExposure(address).selector
          || f.selector == sig:setCurveVaultPercent(uint256).selector
          || f.selector == sig:setExposureBufferRebalance(uint256).selector
          || f.selector == sig:setWhaleThresholdWithdraw(uint256).selector
          || f.selector == sig:setWhaleThresholdDeposit(uint256).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "owner-only insurance configuration methods revert for non-owners (S4.2.G1)";
}

rule set_underlying_token_percent_rejects_unprivileged(env e,
                                                       uint256 token,
                                                       uint256 percent) {
    address ownerBefore = owner();
    address ctrl = controller();
    require e.msg.sender != ownerBefore;
    require e.msg.sender != ctrl;

    setUnderlyingTokenPercent@withrevert(e, token, percent);
    bool reverted = lastReverted;

    assert reverted,
        "setUnderlyingTokenPercent requires the controller or the owner (S4.2.G1)";
}

rule rebalance_rejects_non_whitelisted(env e) {
    require !whitelist(e.msg.sender);

    rebalance@withrevert(e);
    bool reverted = lastReverted;

    assert reverted,
        "rebalance requires whitelist membership (S4.1.G9)";
}

rule set_allocation_owner_reachable(env e, address allocation) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;
    require allocation != 0;

    setAllocation@withrevert(e, allocation);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an owner-granted setAllocation must be reachable (S4.2.G1)";
}