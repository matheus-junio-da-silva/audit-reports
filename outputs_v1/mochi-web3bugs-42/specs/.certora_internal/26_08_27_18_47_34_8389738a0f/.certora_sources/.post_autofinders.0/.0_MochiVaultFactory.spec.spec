// ============================================================
// file: MochiVaultFactory.spec
// verified contract: MochiVaultFactory.sol
// total properties: 2
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function MochiEngine.governance() external returns (address);

    function updateTemplate(address) external;
}

rule updateTemplate_rejects_non_governance(env e, address newTemplate) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    updateTemplate@withrevert(e, newTemplate);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not update the vault template";
}

rule updateTemplate_governance_can_update(env e, address newTemplate) {
    address eng = engine();
    require e.msg.sender == eng.governance(e);

    updateTemplate@withrevert(e, newTemplate);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to update the vault template";
}