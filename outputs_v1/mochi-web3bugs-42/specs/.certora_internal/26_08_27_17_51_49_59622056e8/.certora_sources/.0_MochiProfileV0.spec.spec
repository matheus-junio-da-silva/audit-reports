// ============================================================
// file: MochiProfileV0.spec
// verified contract: MochiProfileV0.sol
// total properties: 7
// categories: S4.1.G6, S4.2.G1, CAC-AC-001 (registerAsset overwrite, H-04)
// items NOT applicable: S4.1.G1/G2/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree;

    function assetClass(address) external returns (uint8) envfree;

    function registerAsset(address) external;
    function changeMinimumDebt(uint256) external;
    function changeLiquidityRequirement(uint256) external;
    function setDelay(uint256) external;
    function changeCreditCap(address[], uint256[]) external;
    function changeAssetClass(address[], uint8[]) external;
}

// CAC-AC-001 / H-04: permissionless registerAsset unconditionally writes _assetClass[_asset] = AssetClass.Sigma.
// A non-Sigma registered asset must keep its class after registerAsset.
rule registerAsset_preserves_existing_class(env e, address asset) {
    uint8 oldClass = assetClass(asset);

    require oldClass != 0;       // AssetClass.Invalid -> must be already registered
    require oldClass != 6;       // AssetClass.Sigma -> overwrite would be a no-op
    require oldClass != 7;       // AssetClass.Revoked -> revoked assets must stay revoked

    registerAsset@withrevert(e, asset);
    bool reverted = lastReverted;

    assert reverted => true;
    assert !reverted => assetClass(asset) == oldClass,
        "registerAsset must not silently overwrite a registered asset's class";
}

rule changeMinimumDebt_rejects_non_governance(env e, uint256 newDebt) {
    address eng = engine();
    require e.msg.sender != eng.governance();

    changeMinimumDebt@withrevert(e, newDebt);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change minimumDebt";
}

rule changeLiquidityRequirement_rejects_non_governance(env e, uint256 newReq) {
    address eng = engine();
    require e.msg.sender != eng.governance();

    changeLiquidityRequirement@withrevert(e, newReq);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change liquidityRequirement";
}

rule setDelay_rejects_non_governance(env e, uint256 newDelay) {
    address eng = engine();
    require e.msg.sender != eng.governance();

    setDelay@withrevert(e, newDelay);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change the delay";
}

rule changeCreditCap_rejects_non_governance(env e, address[] assets, uint256[] caps) {
    require caps.length == 0;

    address eng = engine();
    require e.msg.sender != eng.governance();

    changeCreditCap@withrevert(e, assets, caps);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change credit caps";
}

rule changeAssetClass_rejects_non_governance(env e, address[] assets, uint8[] classes) {
    require classes.length == 0;

    address eng = engine();
    require e.msg.sender != eng.governance();

    changeAssetClass@withrevert(e, assets, classes);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change asset classes";
}

rule setDelay_governance_can_change(env e, uint256 newDelay) {
    address eng = engine();
    require e.msg.sender == eng.governance();

    setDelay@withrevert(e, newDelay);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to change the delay";
}