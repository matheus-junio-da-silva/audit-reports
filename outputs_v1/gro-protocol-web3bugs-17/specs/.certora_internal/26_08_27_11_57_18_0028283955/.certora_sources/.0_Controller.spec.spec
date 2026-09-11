// ============================================================
// file: Controller.spec
// verified contract: Controller.sol
// total properties: 10
// categories:
//   S4.1.G1  dynamic allowlist gating (emergency/distributeCurveAssets)
//   S4.2.G1  owner-only configuration setters (param rule, 17 methods)
//   S4.2.G3  trusted-handler gating (mintGToken/burnGToken/addReferral)
//   S4.2.G3  registered-vault gating (distributeStrategyGainLoss)
// items NOT applicable: G4, G7, G8, G9 (partial, no explicit
//   whitelisted asset withdrawal beyond handler paths), G10, G11,
//   S4.2.G4 (see property-plan; pause() and emergency() whitelisted
//   claim recorded but deferred: pause()/emergency() have further
//   post-gate reverts that need applicable handler/vault wiring)
// items requiring manual models: cross-contract trusted-source rules for
//   withdrawSingle* on LifeGuard are exercised there as
//   depositHandler()/withdrawHandler() local getter proofs; Controller
//   mint/burn trust is proven locally against the handler registry.
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function whitelist(address) external returns (bool) envfree;
    function vaultIndexes(address) external returns (uint256) envfree;
    function depositHandler() external returns (address) envfree;
    function withdrawHandler() external returns (address) envfree;
    function emergencyHandler() external returns (address) envfree;
    function paused() external returns (bool) envfree;

    function pause() external;
    function emergency(uint256) external;
    function distributeCurveAssets(uint256, uint256[3]) external;

    function mintGToken(bool, address, uint256) external;
    function burnGToken(bool, bool, address, uint256, uint256) external;
    function addReferral(address, address) external;
    function distributeStrategyGainLoss(uint256, uint256) external;

    function setWithdrawHandler(address, address) external;
    function setDepositHandler(address) external;
    function setVault(uint256, address) external;
    function setCurveVault(address) external;
    function setLifeGuard(address) external;
    function setInsurance(address) external;
    function setPnL(address) external;
    function addSafeAddress(address) external;
    function switchEoaOnly(bool) external;
    function setBigFishThreshold(uint256, uint256) external;
    function setReward(address) external;
    function setWithdrawalFee(bool, uint256) external;
    function realizePriceChange(uint256) external;
    function setUtilisationRatioLimitPwrd(uint256) external;
    function setUtilisationRatioLimitGvt(uint256) external;
    function unpause() external;
    function restart(uint256[]) external;
}

rule pause_rejects_non_whitelisted(env e) {
    require !whitelist(e.msg.sender);

    pause@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "pause in Controller requires whitelist membership (S4.1.G1)";
}

rule emergency_rejects_non_whitelisted(env e, uint256 coin) {
    require !whitelist(e.msg.sender);

    emergency@withrevert(e, coin);
    bool reverted = lastReverted;

    assert reverted,
        "emergency in Controller requires whitelist membership (S4.1.G1)";
}

rule distribute_curve_assets_rejects_non_whitelisted(env e,
                                                     uint256 amount,
                                                     uint256[3] delta) {
    require !whitelist(e.msg.sender);

    distributeCurveAssets@withrevert(e, amount, delta);
    bool reverted = lastReverted;

    assert reverted,
        "distributeCurveAssets in Controller requires whitelist membership (S4.1.G1)";
}

rule mint_gtoken_rejects_non_deposit_handler(env e,
                                             bool pwrd,
                                             address account,
                                             uint256 amount) {
    address dh = depositHandler();
    require e.msg.sender != dh;

    mintGToken@withrevert(e, pwrd, account, amount);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered deposit handler may mint GTokens (S4.2.G3)";
}

rule burn_gtoken_rejects_non_trusted_handler(env e,
                                             bool pwrd,
                                             bool all,
                                             address account,
                                             uint256 amount,
                                             uint256 bonus) {
    address wh = withdrawHandler();
    address eh = emergencyHandler();
    require e.msg.sender != wh;
    require e.msg.sender != eh;

    burnGToken@withrevert(e, pwrd, all, account, amount, bonus);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered withdraw or emergency handler may burn GTokens (S4.2.G3)";
}

rule add_referral_rejects_non_deposit_handler(env e,
                                              address account,
                                              address referral) {
    address dh = depositHandler();
    require e.msg.sender != dh;

    addReferral@withrevert(e, account, referral);
    bool reverted = lastReverted;

    assert reverted,
        "only the registered deposit handler may add referrals (S4.2.G3)";
}

rule distribute_strategy_gain_loss_rejects_unregistered_vault(env e,
                                                              uint256 gain,
                                                              uint256 loss) {
    require vaultIndexes(e.msg.sender) == 0;

    distributeStrategyGainLoss@withrevert(e, gain, loss);
    bool reverted = lastReverted;

    assert reverted,
        "only a registered vault may distribute strategy gain/loss (S4.2.G3)";
}

rule owner_configuration_setters_reject_non_owner(method f,
                                                  env e,
                                                  calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setWithdrawHandler(address,address).selector
          || f.selector == sig:setDepositHandler(address).selector
          || f.selector == sig:setVault(uint256,address).selector
          || f.selector == sig:setCurveVault(address).selector
          || f.selector == sig:setLifeGuard(address).selector
          || f.selector == sig:setInsurance(address).selector
          || f.selector == sig:setPnL(address).selector
          || f.selector == sig:addSafeAddress(address).selector
          || f.selector == sig:switchEoaOnly(bool).selector
          || f.selector == sig:setBigFishThreshold(uint256,uint256).selector
          || f.selector == sig:setReward(address).selector
          || f.selector == sig:setWithdrawalFee(bool,uint256).selector
          || f.selector == sig:realizePriceChange(uint256).selector
          || f.selector == sig:setUtilisationRatioLimitPwrd(uint256).selector
          || f.selector == sig:setUtilisationRatioLimitGvt(uint256).selector
          || f.selector == sig:unpause().selector
          || f.selector == sig:restart(uint256[]).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "every owner-only configuration method reverts on a non-owner caller (S4.2.G1)";
}

rule pause_whitelisted_reaches(env e) {
    require whitelist(e.msg.sender);
    require !paused();

    pause@withrevert(e);
    bool reverted = lastReverted;

    satisfy !reverted && paused(),
        "a whitelisted pause path is reachable (S4.1.G1)";
}