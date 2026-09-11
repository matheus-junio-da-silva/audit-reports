// ============================================================
// file: StrategyRegistry.spec
// verified contract: StrategyRegistry.sol
// total properties: 8
// categories: S4.1.G6 (owner auth), S4.1.G10 (init once)
// items NOT applicable: S4.1.G2 (no RBAC), S4.1.G4 (no assets), S4.1.G7 (no custody),
//   S4.1.G8 (no timelock), S4.1.G11 (one-step OZ transfer), S4.2.G3 (no callback),
//   S4.2.G4 (strategy cap is owner-config count, not allowance)
// items requiring manual models: owner reachability for removeStrategy/updateStrategy
//   depends on array contents; guarded revert claims are asserted directly
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function initialize(address _owner, uint256 _maxStrategies) external;
    function updateMaxStrategies(uint256 _maxStrategies) external;
    function addStrategy(address _strategy) external;
    function removeStrategy(uint256 _strategyIndex) external;
    function updateStrategy(uint256 _strategyIndex, address _oldStrategy, address _newStrategy) external;
    function registry(address) external returns (bool) envfree;
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can add a strategy
rule addStrategy_rejects_non_owner(env e, address _strategy) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    addStrategy@withrevert(e, _strategy);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not add a strategy";
}

rule addStrategy_has_authorized_path(env e, address _strategy) {
    require e.msg.sender == owner();
    addStrategy@withrevert(e, _strategy);
    bool reverted = lastReverted;
    satisfy !reverted, "owner should be able to add a strategy for some input";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can remove a strategy
rule removeStrategy_rejects_non_owner(env e, uint256 _strategyIndex) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    removeStrategy@withrevert(e, _strategyIndex);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not remove a strategy";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update a strategy
rule updateStrategy_rejects_non_owner(env e, uint256 _strategyIndex, address _oldStrategy, address _newStrategy) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateStrategy@withrevert(e, _strategyIndex, _oldStrategy, _newStrategy);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update a strategy";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update max strategies
rule updateMaxStrategies_rejects_non_owner(env e, uint256 _maxStrategies) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateMaxStrategies@withrevert(e, _maxStrategies);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the max strategies bound";
}

// S4.1.G10 / CAC-AC-007: initialization cannot succeed twice
rule initialize_cannot_succeed_twice(env e1, env e2, address _owner, uint256 _maxStrategies) {
    initialize@withrevert(e1, _owner, _maxStrategies);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, _owner, _maxStrategies);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

// S4.1.G10 / CAC-AC-007: reachability witness - initialization can succeed
rule initialize_can_succeed(env e, address _owner, uint256 _maxStrategies) {
    initialize@withrevert(e, _owner, _maxStrategies);
    bool reverted = lastReverted;
    satisfy !reverted, "initialize should be reachable from a fresh state";
}
