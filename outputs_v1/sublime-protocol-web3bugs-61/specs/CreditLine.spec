// ============================================================
// file: CreditLine.spec
// verified contract: CreditLine.sol
// total properties: 11
// categories: S4.1.G6 (owner auth on config), S4.1.G10 (init once)
// items NOT applicable: S4.1.G8 (no timelock), S4.1.G11 (one-step OZ transfer),
//   S4.2.G3 (no callback)
// items requiring manual models: S4.1.G4 (debit via SavingsAccountUtil),
//   S4.1.G7 (solvency needs linked asset accounting), S4.1.G9 (no simple whitelist gate),
//   borrow() onlyCreditLineBorrower struct-field predicate (creditLineConstants)
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function initialize(address _defaultStrategy, address _priceOracle, address _savingsAccount, address _strategyRegistry, address _owner, uint256 _protocolFeeFraction, address _protocolFeeCollector, uint256 _liquidatorRewardFraction) external;
    function updateDefaultStrategy(address _defaultStrategy) external;
    function updatePriceOracle(address _priceOracle) external;
    function updateSavingsAccount(address _savingsAccount) external;
    function updateProtocolFeeFraction(uint256 _protocolFeeFraction) external;
    function updateProtocolFeeCollector(address _protocolFeeCollector) external;
    function updateStrategyRegistry(address _strategyRegistry) external;
    function updateLiquidatorRewardFraction(uint256 _rewardFraction) external;
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the default strategy
rule updateDefaultStrategy_rejects_non_owner(env e, address _defaultStrategy) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateDefaultStrategy@withrevert(e, _defaultStrategy);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the default strategy";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the price oracle
rule updatePriceOracle_rejects_non_owner(env e, address _priceOracle) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updatePriceOracle@withrevert(e, _priceOracle);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the price oracle";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the savings account
rule updateSavingsAccount_rejects_non_owner(env e, address _savingsAccount) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateSavingsAccount@withrevert(e, _savingsAccount);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the savings account";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the protocol fee fraction
rule updateProtocolFeeFraction_rejects_non_owner(env e, uint256 _protocolFeeFraction) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateProtocolFeeFraction@withrevert(e, _protocolFeeFraction);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the protocol fee fraction";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the protocol fee collector
rule updateProtocolFeeCollector_rejects_non_owner(env e, address _protocolFeeCollector) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateProtocolFeeCollector@withrevert(e, _protocolFeeCollector);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the protocol fee collector";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the strategy registry
rule updateStrategyRegistry_rejects_non_owner(env e, address _strategyRegistry) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateStrategyRegistry@withrevert(e, _strategyRegistry);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the strategy registry";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the liquidator reward fraction
rule updateLiquidatorRewardFraction_rejects_non_owner(env e, uint256 _rewardFraction) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateLiquidatorRewardFraction@withrevert(e, _rewardFraction);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the liquidator reward fraction";
}

rule updateDefaultStrategy_has_authorized_path(env e, address _defaultStrategy) {
    require e.msg.sender == owner();
    updateDefaultStrategy@withrevert(e, _defaultStrategy);
    bool reverted = lastReverted;
    satisfy !reverted, "owner should be able to update the default strategy for some input";
}

// S4.1.G10 / CAC-AC-007: initialization cannot succeed twice
rule initialize_cannot_succeed_twice(env e1, env e2, address _defaultStrategy, address _priceOracle, address _savingsAccount, address _strategyRegistry, address _owner, uint256 _protocolFeeFraction, address _protocolFeeCollector, uint256 _liquidatorRewardFraction) {
    initialize@withrevert(e1, _defaultStrategy, _priceOracle, _savingsAccount, _strategyRegistry, _owner, _protocolFeeFraction, _protocolFeeCollector, _liquidatorRewardFraction);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, _defaultStrategy, _priceOracle, _savingsAccount, _strategyRegistry, _owner, _protocolFeeFraction, _protocolFeeCollector, _liquidatorRewardFraction);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

// S4.1.G10 / CAC-AC-007: reachability witness - initialization can succeed
rule initialize_can_succeed(env e, address _defaultStrategy, address _priceOracle, address _savingsAccount, address _strategyRegistry, address _owner, uint256 _protocolFeeFraction, address _protocolFeeCollector, uint256 _liquidatorRewardFraction) {
    initialize@withrevert(e, _defaultStrategy, _priceOracle, _savingsAccount, _strategyRegistry, _owner, _protocolFeeFraction, _protocolFeeCollector, _liquidatorRewardFraction);
    bool reverted = lastReverted;
    satisfy !reverted, "initialize should be reachable from a fresh state";
}
