// ============================================================
// file: LifeGuard3Pool.spec
// verified contract: LifeGuard3Pool.sol
// total properties: 9
// categories:
//   S4.2.G1  owner-only configuration (setDependencies/approveVaults/setInvestToCurveThreshold)
//   S4.1.G1  whitelist gating (investToCurveVault)
//   S4.2.G3  trusted-handler gating (deposit/depositStable/invest/investSingle)
//             and withdrawSingle* (withdrawHandler via local getter)
//   S4.2.G3  controller gating (distributeCurveVault)
// items NOT applicable: G4, G7, G8, G10, G11, S4.1.G2,
//   S4.2.G4 (see property-plan)
// items requiring manual models: none; the withdrawHandler trust source
//   is read from the local storage getter (no cross-contract view needed).
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function whitelist(address) external returns (bool) envfree;
    function controller() external returns (address) envfree;
    function insurance() external returns (address) envfree;
    function depositHandler() external returns (address) envfree;
    function withdrawHandler() external returns (address) envfree;

    function setDependencies() external;
    function approveVaults(uint256) external;
    function setInvestToCurveThreshold(uint256) external;
    function investToCurveVault() external;
    function distributeCurveVault(uint256, uint256[3]) external;
    function depositStable(bool) external returns (uint256);
    function deposit() external returns (uint256);
    function withdrawSingleByLiquidity(uint256, uint256, address) external returns (uint256, uint256);
    function withdrawSingleByExchange(uint256, uint256, address) external returns (uint256, uint256);
    function invest(uint256, uint256[3]) external returns (uint256);
    function investSingle(uint256[3], uint256, uint256) external returns (uint256);
}

rule owner_configuration_setters_reject_non_owner(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setDependencies().selector
          || f.selector == sig:approveVaults(uint256).selector
          || f.selector == sig:setInvestToCurveThreshold(uint256).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "owner-only LifeGuard configuration methods revert for non-owners (S4.2.G1)";
}

rule invest_to_curve_vault_rejects_non_whitelisted(env e) {
    require !whitelist(e.msg.sender);

    investToCurveVault@withrevert(e);
    bool reverted = lastReverted;

    assert reverted,
        "investToCurveVault requires whitelist membership (S4.1.G1)";
}

rule distribute_curve_vault_rejects_non_controller(env e,
                                                   uint256 amount,
                                                   uint256[3] delta) {
    address ctrl = controller();
    require e.msg.sender != ctrl;

    distributeCurveVault@withrevert(e, amount, delta);
    bool reverted = lastReverted;

    assert reverted,
        "only the controller may distribute Curve vault assets (S4.2.G3)";
}

rule deposit_stable_rejects_non_trusted(env e, bool pwrd) {
    address wh = withdrawHandler();
    address ins = insurance();
    require e.msg.sender != wh;
    require e.msg.sender != ins;

    depositStable@withrevert(e, pwrd);
    bool reverted = lastReverted;

    assert reverted,
        "only the withdraw handler or insurance may rebalance stable deposits (S4.2.G3)";
}

rule deposit_rejects_non_deposit_handler(env e) {
    address dh = depositHandler();
    require e.msg.sender != dh;

    deposit@withrevert(e);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered deposit handler may run deposit (S4.2.G3)";
}

rule withdraw_single_rejects_non_withdraw_handler(method f,
                                                  env e,
                                                  calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:withdrawSingleByLiquidity(uint256,uint256,address).selector
          || f.selector == sig:withdrawSingleByExchange(uint256,uint256,address).selector)
} {
    address wh = withdrawHandler();
    require e.msg.sender != wh;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "withdrawSingle* requires the registered withdraw handler (S4.2.G3)";
}

rule invest_rejects_non_trusted(env e, uint256 amount, uint256[3] delta) {
    address ins = insurance();
    address dh = depositHandler();
    require e.msg.sender != ins;
    require e.msg.sender != dh;

    invest@withrevert(e, amount, delta);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered insurance or deposit handler may invest vault funds (S4.2.G3)";
}

rule invest_single_rejects_non_deposit_handler(env e,
                                               uint256[3] amounts,
                                               uint256 minAmount,
                                               uint256 t) {
    address dh = depositHandler();
    require e.msg.sender != dh;

    investSingle@withrevert(e, amounts, minAmount, t);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered deposit handler may run investSingle (S4.2.G3)";
}

rule set_invest_to_curve_threshold_owner_reachable(env e, uint256 newThreshold) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;

    setInvestToCurveThreshold@withrevert(e, newThreshold);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an owner-granted setInvestToCurveThreshold must be reachable (S4.2.G1)";
}