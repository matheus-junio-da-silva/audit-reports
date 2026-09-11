// ============================================================
// file: PoolFactory.spec
// verified contract: PoolFactory.sol
// total properties: 15
// categories: S4.1.G6 (owner auth on config/upgrade), S4.1.G10 (init once)
// items NOT applicable: S4.1.G2 (no RBAC), S4.1.G4 (no assets), S4.1.G7 (no custody),
//   S4.1.G8 (no timelock), S4.1.G11 (one-step OZ transfer), S4.2.G3 (no callback),
//   S4.2.G4 (no allowance)
// items requiring manual models: S4.1.G9 createPool whitelist depends on linked
//   IVerification.isUser; requires a harness (manual_model_required)
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function initialize(address _admin, uint256 _collectionPeriod, uint256 _loanWithdrawalDuration, uint256 _marginCallDuration, bytes4 _poolInitFuncSelector, uint256 _liquidatorRewardFraction, uint256 _poolCancelPenaltyMultiple, uint256 _minBorrowFraction, uint256 _protocolFeeFraction, address _protocolFeeCollector, address _noStrategy) external;
    function setImplementations(address _poolImpl, address _repaymentImpl, address _userRegistry, address _strategyRegistry, address _priceOracle, address _savingsAccount, address _extension) external;
    function updatePoolLogic(address _poolLogic) external;
    function updateUserRegistry(address _userRegistry) external;
    function updateStrategyRegistry(address _strategyRegistry) external;
    function updateRepaymentImpl(address _repaymentImpl) external;
    function updatePriceoracle(address _priceOracle) external;
    function updatedExtension(address _extension) external;
    function updateSavingsAccount(address _savingsAccount) external;
    function updateSupportedBorrowTokens(address _borrowToken, bool _isSupported) external;
    function updateSupportedCollateralTokens(address _collateralToken, bool _isSupported) external;
    function updateProtocolFeeFraction(uint256 _protocolFee) external;
    function updateProtocolFeeCollector(address _protocolFeeCollector) external;
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can set implementations
rule setImplementations_rejects_non_owner(env e, address _poolImpl, address _repaymentImpl, address _userRegistry, address _strategyRegistry, address _priceOracle, address _savingsAccount, address _extension) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _poolImpl != 0;
    require _repaymentImpl != 0;
    require _userRegistry != 0;
    require _strategyRegistry != 0;
    require _priceOracle != 0;
    require _savingsAccount != 0;
    require _extension != 0;

    setImplementations@withrevert(e, _poolImpl, _repaymentImpl, _userRegistry, _strategyRegistry, _priceOracle, _savingsAccount, _extension);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not set implementations";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the pool logic
rule updatePoolLogic_rejects_non_owner(env e, address _poolLogic) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updatePoolLogic@withrevert(e, _poolLogic);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the pool logic";
}

rule updatePoolLogic_has_authorized_path(env e, address _poolLogic) {
    require e.msg.sender == owner();
    updatePoolLogic@withrevert(e, _poolLogic);
    bool reverted = lastReverted;
    satisfy !reverted, "owner should be able to update the pool logic for some input";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the user registry
rule updateUserRegistry_rejects_non_owner(env e, address _userRegistry) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _userRegistry != 0;

    updateUserRegistry@withrevert(e, _userRegistry);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the user registry";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the strategy registry
rule updateStrategyRegistry_rejects_non_owner(env e, address _strategyRegistry) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _strategyRegistry != 0;

    updateStrategyRegistry@withrevert(e, _strategyRegistry);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the strategy registry";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the repayment implementation
rule updateRepaymentImpl_rejects_non_owner(env e, address _repaymentImpl) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _repaymentImpl != 0;

    updateRepaymentImpl@withrevert(e, _repaymentImpl);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the repayment implementation";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the price oracle
rule updatePriceoracle_rejects_non_owner(env e, address _priceOracle) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _priceOracle != 0;

    updatePriceoracle@withrevert(e, _priceOracle);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the price oracle";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the extension
rule updatedExtension_rejects_non_owner(env e, address _extension) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _extension != 0;

    updatedExtension@withrevert(e, _extension);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the extension";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the savings account
rule updateSavingsAccount_rejects_non_owner(env e, address _savingsAccount) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _savingsAccount != 0;

    updateSavingsAccount@withrevert(e, _savingsAccount);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the savings account";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update supported borrow tokens
rule updateSupportedBorrowTokens_rejects_non_owner(env e, address _borrowToken, bool _isSupported) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateSupportedBorrowTokens@withrevert(e, _borrowToken, _isSupported);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update supported borrow tokens";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update supported collateral tokens
rule updateSupportedCollateralTokens_rejects_non_owner(env e, address _collateralToken, bool _isSupported) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateSupportedCollateralTokens@withrevert(e, _collateralToken, _isSupported);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update supported collateral tokens";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the protocol fee fraction
rule updateProtocolFeeFraction_rejects_non_owner(env e, uint256 _protocolFee) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateProtocolFeeFraction@withrevert(e, _protocolFee);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the protocol fee fraction";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the protocol fee collector
rule updateProtocolFeeCollector_rejects_non_owner(env e, address _protocolFeeCollector) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;
    require _protocolFeeCollector != 0;

    updateProtocolFeeCollector@withrevert(e, _protocolFeeCollector);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the protocol fee collector";
}

// S4.1.G10 / CAC-AC-007: initialization cannot succeed twice
rule initialize_cannot_succeed_twice(env e1, env e2, address _admin, uint256 _collectionPeriod, uint256 _loanWithdrawalDuration, uint256 _marginCallDuration, bytes4 _poolInitFuncSelector, uint256 _liquidatorRewardFraction, uint256 _poolCancelPenaltyMultiple, uint256 _minBorrowFraction, uint256 _protocolFeeFraction, address _protocolFeeCollector, address _noStrategy) {
    initialize@withrevert(e1, _admin, _collectionPeriod, _loanWithdrawalDuration, _marginCallDuration, _poolInitFuncSelector, _liquidatorRewardFraction, _poolCancelPenaltyMultiple, _minBorrowFraction, _protocolFeeFraction, _protocolFeeCollector, _noStrategy);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, _admin, _collectionPeriod, _loanWithdrawalDuration, _marginCallDuration, _poolInitFuncSelector, _liquidatorRewardFraction, _poolCancelPenaltyMultiple, _minBorrowFraction, _protocolFeeFraction, _protocolFeeCollector, _noStrategy);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

// S4.1.G10 / CAC-AC-007: reachability witness - initialization can succeed
rule initialize_can_succeed(env e, address _admin, uint256 _collectionPeriod, uint256 _loanWithdrawalDuration, uint256 _marginCallDuration, bytes4 _poolInitFuncSelector, uint256 _liquidatorRewardFraction, uint256 _poolCancelPenaltyMultiple, uint256 _minBorrowFraction, uint256 _protocolFeeFraction, address _protocolFeeCollector, address _noStrategy) {
    initialize@withrevert(e, _admin, _collectionPeriod, _loanWithdrawalDuration, _marginCallDuration, _poolInitFuncSelector, _liquidatorRewardFraction, _poolCancelPenaltyMultiple, _minBorrowFraction, _protocolFeeFraction, _protocolFeeCollector, _noStrategy);
    bool reverted = lastReverted;
    satisfy !reverted, "initialize should be reachable from a fresh state";
}
