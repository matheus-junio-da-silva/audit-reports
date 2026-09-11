// ============================================================
// file: MochiProfileV0.spec
// verified contract: MochiProfileV0.sol
// rules: 1 (CAC-AC-001 registerAsset overwrite, ground truth H-04)
// GOV-LINKED RULES REMOVED (manual_model_required): changeMinimumDebt /
//   changeLiquidityRequirement / setDelay / changeCreditCap / changeAssetClass
//   rejects+witness. These read engine().governance() (MochiProfileV0.sol:55-62).
//   Empirical (MochiProfileV0 ATTEMPT-2): with MochiEngine as ambient scene
//   contract and qualified decl (function MochiEngine.governance()...),
//   the rule-level engine().governance(e) reading DIVERGES from the
//   contract-internal engine.governance() read -> false violations. CVL
//   cannot correlate the stored engine() address with an ambient instance
//   in a scoped rule -> 1-hop linked authority is not automatic-provable.
// ============================================================

methods {
    function riskFactor(address) external returns (uint256) envfree;
    function registerAsset(address) external;
}

// CAC-AC-001 / H-04: permissionless registerAsset unconditionally writes _assetClass[_asset] = AssetClass.Sigma
// (MochiProfileV0.sol:58-62 -> _register(_asset, AssetClass.Sigma)).
// The observable riskFactor (Stable=1..Sigma=6, see MochiProfileV0.sol:129-146) is bijective on registered classes,
// so a registered non-Sigma asset's class is preserved iff its riskFactor stays unchanged.
rule registerAsset_preserves_existing_class(env e, address asset) {
    uint256 preRisk = riskFactor(asset);   // reverts for Invalid/Revoked -> those states are excluded

    require preRisk != 6;                  // AssetClass.Sigma maps to 6 -> not already Sigma

    registerAsset@withrevert(e, asset);
    bool reverted = lastReverted;

    assert reverted => true;
    assert !reverted => riskFactor(asset) == preRisk,
        "registerAsset must not silently overwrite a registered asset's class";
}
