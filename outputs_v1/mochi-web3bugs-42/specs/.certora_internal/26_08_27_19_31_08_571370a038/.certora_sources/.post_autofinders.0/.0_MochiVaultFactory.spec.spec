// ============================================================
// file: MochiVaultFactory.spec
// verified contract: MochiVaultFactory.sol
// rules: 1 (M-12 probe: deployVault permissionless)
// GOV-LINKED RULES REMOVED (manual_model_required): updateTemplate rejects+
//   witness (engine().governance() 1-hop link, CVL address-correlation limit).
// M-12 root cause: deployVault(address) at MochiVaultFactory.sol:26-37 has NO
//   require (any caller, any asset; no profile/asset checks). Claim below is
//   deliberately unsatisfiable; its VIOLATION demonstrates permissionless
//   deployment (matching ground-truth M-12).
// ============================================================

methods {
    function deployVault(address) external returns (address);
}

rule deployVault_permissionless_probe(env e, address asset) {
    deployVault@withrevert(e, asset);
    bool reverted = lastReverted;

    assert reverted, "deployVault must be gated (not callable by an arbitrary caller)";
}
