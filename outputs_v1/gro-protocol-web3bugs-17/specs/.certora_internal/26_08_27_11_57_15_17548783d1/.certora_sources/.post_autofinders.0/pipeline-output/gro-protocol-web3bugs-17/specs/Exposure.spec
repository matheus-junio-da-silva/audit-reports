// ============================================================
// file: Exposure.spec
// verified contract: Exposure.sol
// total properties: 3
// categories: S4.2.G1 (owner-only exposure governance)
// items NOT applicable: G4, G7, G8, G9, G10, G11, S4.2.G3,
//   S4.2.G4, S4.1.G2 (see property-plan)
// items requiring manual models: none
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function er() external returns (uint256) envfree;
    function getExposure() external returns (int256[5]);
}

rule set_er_rejects_non_owner(env e, uint256 newEr) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setEr@withrevert(e, newEr);
    bool reverted = lastReverted;

    assert reverted, "only the owner may set the exposure ratio";
}

rule set_coefficients_rejects_non_owner(env e) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setCoefficients@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "only the owner may set the exposure coefficients";
}

rule set_er_owner_reachable(env e, uint256 newEr) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;

    setEr@withrevert(e, newEr);
    bool reverted = lastReverted;

    satisfy !reverted, "an owner-granted setEr must be reachable";
}