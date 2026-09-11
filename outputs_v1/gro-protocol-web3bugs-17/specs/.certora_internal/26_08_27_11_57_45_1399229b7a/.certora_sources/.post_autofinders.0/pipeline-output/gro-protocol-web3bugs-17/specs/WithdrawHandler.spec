// ============================================================
// file: WithdrawHandler.spec
// verified contract: WithdrawHandler.sol
// total properties: 1
// categories:
//   S4.2.G1 owner-only configuration (setDependencies)
// items NOT applicable: G2, G4, G7, G8, G9, G10, G11, S4.2.G3,
//   S4.2.G4 (see property-plan). Withdrawal entry points are public
//   by design — burn authorization is enforced on the Controller side
//   (burnGToken = withdrawHandler/emergencyHandler) and is verified in
//   Controller.spec.
// items requiring manual models: none.
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;

    function setDependencies() external;
}

rule set_dependencies_rejects_non_owner(env e) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setDependencies@withrevert(e);
    bool reverted = lastReverted;

    assert reverted,
        "only the owner may rewire the withdrawal dependencies (S4.2.G1)";
}