// ============================================================
// file: Allocation.spec
// verified contract: Allocation.sol
// total properties: 3
// categories: S4.2.G1 (owner-only allocation governance)
// items NOT applicable: G4, G7, G8, G9, G10, G11, S4.2.G3,
//   S4.2.G4, S4.1.G2 (see property-plan)
// items requiring manual models: none
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function anchor() external returns (uint256) envfree;
    function getWeights() external returns (uint256[5]);
}

rule set_anchor_rejects_non_owner(env e, uint256 newAnchor) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setAnchor@withrevert(e, newAnchor);
    bool reverted = lastReverted;

    assert reverted, "only the owner may set the anchor value";
}

rule set_lst_rejects_non_owner(env e, uint256 newLst) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setLst@withrevert(e, newLst);
    bool reverted = lastReverted;

    assert reverted, "only the owner may set the Lst value";
}

rule set_lst_owner_reachable(env e, uint256 newLst) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;

    setLst@withrevert(e, newLst);
    bool reverted = lastReverted;

    satisfy !reverted, "an owner-granted setLst must be reachable";
}