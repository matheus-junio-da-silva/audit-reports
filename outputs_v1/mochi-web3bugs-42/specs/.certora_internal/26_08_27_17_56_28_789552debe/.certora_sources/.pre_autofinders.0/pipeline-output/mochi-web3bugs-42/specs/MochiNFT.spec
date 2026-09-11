// ============================================================
// file: MochiNFT.spec
// verified contract: MochiNft.sol (contract MochiNFT)
// total properties: 2
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: mint only-vault (getVault multi-hop linked)
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree optional;

    function setDescriptor(address) external;
}

rule setDescriptor_rejects_non_governance(env e, address newDescriptor) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    setDescriptor@withrevert(e, newDescriptor);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not set the descriptor";
}

rule setDescriptor_governance_can_set(env e, address newDescriptor) {
    address eng = engine();
    require e.msg.sender == eng.governance(e);

    setDescriptor@withrevert(e, newDescriptor);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to set the descriptor";
}