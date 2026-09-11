// ============================================================
// file: PnL.spec
// verified contract: PnL.sol
// total properties: 3
// categories:
//   S4.2.G1 owner-only configuration (setRebase/setPerformanceFee)
//   S4.2.G3 controller-only accounting (increaseGTokenLastAmount,
//            decreaseGTokenLastAmount, emergencyPnL, recover,
//            distributeStrategyGainLoss, distributePriceChange)
// items NOT applicable: G2, G4, G7, G8, G9, G10, G11, S4.2.G4
//   (see property-plan)
// items requiring manual models: none; controller() is a local
//   storage getter.
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function controller() external returns (address) envfree;

    function setRebase(bool) external;
    function setPerformanceFee(uint256) external;
    function increaseGTokenLastAmount(bool, uint256) external;
    function decreaseGTokenLastAmount(bool, uint256, uint256) external;
    function emergencyPnL() external;
    function recover() external;
    function distributeStrategyGainLoss(uint256, uint256, address) external;
    function distributePriceChange(uint256) external;
}

rule owner_configuration_setters_reject_non_owner(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setRebase(bool).selector
          || f.selector == sig:setPerformanceFee(uint256).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "owner-only PnL configuration methods revert for non-owners (S4.2.G1)";
}

rule controller_accounting_rejects_non_controller(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:increaseGTokenLastAmount(bool,uint256).selector
          || f.selector == sig:decreaseGTokenLastAmount(bool,uint256,uint256).selector
          || f.selector == sig:emergencyPnL().selector
          || f.selector == sig:recover().selector
          || f.selector == sig:distributeStrategyGainLoss(uint256,uint256,address).selector
          || f.selector == sig:distributePriceChange(uint256).selector)
} {
    address ctrl = controller();
    require e.msg.sender != ctrl;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "controller-only PnL accounting methods revert for other callers (S4.2.G3)";
}

rule set_performance_fee_owner_reachable(env e, uint256 fee) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;

    setPerformanceFee@withrevert(e, fee);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an owner-granted setPerformanceFee must be reachable (S4.2.G1)";
}