// ============================================================
// file: MinterV0.spec
// verified contract: UsdmMinter.sol (contract MinterV0)
// total properties: 3
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: mint onlyPermission (isVault multi-hop linked)
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree;

    function addMinter(address) external;
    function removeMinter(address) external;
}

rule addMinter_rejects_non_governance(env e, address minter) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    addMinter@withrevert(e, minter);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not add minters";
}

rule removeMinter_rejects_non_governance(env e, address minter) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    removeMinter@withrevert(e, minter);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not remove minters";
}

rule addMinter_governance_can_add(env e, address minter) {
    address eng = engine();
    require e.msg.sender == eng.governance(e);

    addMinter@withrevert(e, minter);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to add a minter";
}