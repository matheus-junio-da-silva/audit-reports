// ============================================================
// file: MochiTreasuryV0.spec
// verified contract: MochiTreasuryV0.sol
// rules: 1 (M-14 probe: withdrawLock missing authority gate)
// GOV-LINKED RULES REMOVED (manual_model_required): withdrawCRV / toggleLocking
//   rejects+witness (engine().governance() 1-hop link, CVL address-correlation
//   limit as MochiProfileV0 ATTEMPT-2).
// M-14 root cause: withdrawLock() at MochiTreasuryV0.sol:40-52 contains NO
//   require at all (no auth gate). Claim below is deliberately unsatisfiable;
//   its VIOLATION demonstrates the missing access control.
// ============================================================

methods {
    function withdrawLock() external;
}

rule withdrawLock_missing_auth_gate(env e) {
    withdrawLock@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "withdrawLock must not be callable by an arbitrary caller";
}
