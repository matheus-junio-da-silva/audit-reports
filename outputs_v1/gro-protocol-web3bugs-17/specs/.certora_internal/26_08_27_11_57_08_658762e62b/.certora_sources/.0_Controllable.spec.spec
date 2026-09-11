// ============================================================
// file: Controllable.spec
// verified contract: Controllable.sol (base contract)
// total properties: 2
// categories: S4.2.G1 (owner-only controller retarget)
// items NOT applicable: G2, G4, G7, G8, G9, G10, G11,
//   S4.2.G3, S4.2.G4 (see property-plan)
// items requiring manual models: none (controller() is a storage getter)
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function setController(address) external;
}

rule set_controller_rejects_non_owner(env e, address newController) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setController@withrevert(e, newController);
    bool reverted = lastReverted;

    assert reverted, "only the owner may retarget the controller";
}

rule set_controller_owner_reachable(env e, address newController) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;
    require newController != 0;

    setController@withrevert(e, newController);
    bool reverted = lastReverted;

    satisfy !reverted, "an owner-granted setController must be reachable";
}