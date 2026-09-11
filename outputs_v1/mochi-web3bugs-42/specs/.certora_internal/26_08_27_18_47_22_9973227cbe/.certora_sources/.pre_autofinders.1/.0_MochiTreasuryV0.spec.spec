// ============================================================
// file: MochiTreasuryV0.spec
// verified contract: MochiTreasuryV0.sol
// total properties: 4
// categories: S4.1.G6, S4.2.G1, CAC-AC-001 (M-14 probe)
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: S4.1.G7 (veCRV linking)
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function MochiEngine.governance() external returns (address);

    function withdrawCRV() external;
    function withdrawLock() external;
    function toggleLocking() external;
}

rule withdrawCRV_rejects_non_governance(env e) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    withdrawCRV@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not withdraw CRV";
}

rule toggleLocking_rejects_non_governance(env e) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    toggleLocking@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not toggle locking";
}

// M-14 probe: withdrawLock() at MochiTreasuryV0.sol:40-42 has NO authority check.
// If the intended authority is governance (consistent with withdrawCRV/toggleLocking),
// a non-governance caller must be rejected.
rule withdrawLock_rejects_non_governance(env e) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    withdrawLock@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "withdrawLock must be governance-only";
}

rule withdrawCRV_governance_can_withdraw(env e) {
    address eng = engine();
    require e.msg.sender == eng.governance(e);

    withdrawCRV@withrevert(e);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to withdraw CRV";
}