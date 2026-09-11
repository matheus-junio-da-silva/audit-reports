// ============================================================
// file: adminVerifier.spec
// verified contract: AdminVerifier.sol (contract AdminVerifier)
// total properties: 7
// categories: S4.1.G6 (owner auth), S4.1.G10 (init once)
// items NOT applicable: S4.1.G2 (no RBAC), S4.1.G4 (no assets), S4.1.G7 (no custody),
//   S4.1.G8 (no timelock), S4.1.G11 (one-step OZ transfer), S4.2.G3 (no callback),
//   S4.2.G4 (no allowance)
// items requiring manual models: owner registration/unregistration reachability
//   paths require modeling linked IVerification; left to interpreter/manual review
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function initialize(address _admin, address _verification) external;
    function registerUser(address _user, string _metadata, bool _isMasterLinked) external;
    function unregisterUser(address _user) external;
    function updateVerification(address _verification) external;
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can register a user
rule registerUser_rejects_non_owner(env e, address _user, string _metadata, bool _isMasterLinked) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    registerUser@withrevert(e, _user, _metadata, _isMasterLinked);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not register a user";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can unregister a user
rule unregisterUser_rejects_non_owner(env e, address _user) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    unregisterUser@withrevert(e, _user);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not unregister a user";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the verification contract
rule updateVerification_rejects_non_owner(env e, address _verification) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateVerification@withrevert(e, _verification);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the verification contract";
}

// S4.1.G10 / CAC-AC-007: initialization cannot succeed twice
rule initialize_cannot_succeed_twice(env e1, env e2, address _admin, address _verification) {
    initialize@withrevert(e1, _admin, _verification);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, _admin, _verification);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

// S4.1.G10 / CAC-AC-007: reachability witness - initialization can succeed
rule initialize_can_succeed(env e, address _admin, address _verification) {
    initialize@withrevert(e, _admin, _verification);
    bool reverted = lastReverted;
    satisfy !reverted, "initialize should be reachable from a fresh state";
}
