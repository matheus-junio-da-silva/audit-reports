// ============================================================
// file: Allocation.spec
// verified contract: Allocation.sol
// total properties: 3
// categories:
//   S4.2.G1 owner-only allocation governance (setSwapThreshold,
//            setCurvePercentThreshold)
// items NOT applicable: G4, G7, G8, G9, G10, G11, S4.2.G3,
//   S4.2.G4, S4.1.G2 (see property-plan). All other external/public
//   functions are view/pure calculation helpers with no state mutation.
// items requiring manual models: none
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;

    function setSwapThreshold(uint256) external;
    function setCurvePercentThreshold(uint256) external;
}

rule owner_configuration_setters_reject_non_owner(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setSwapThreshold(uint256).selector
          || f.selector == sig:setCurvePercentThreshold(uint256).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "owner-only allocation configuration methods revert for non-owners (S4.2.G1)";
}

rule set_swap_threshold_owner_reachable(env e, uint256 threshold) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;

    setSwapThreshold@withrevert(e, threshold);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an owner-granted setSwapThreshold must be reachable (S4.2.G1)";
}