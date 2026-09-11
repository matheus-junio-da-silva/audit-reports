// ============================================================
// file: Verification.spec
// verified contract: Verification.sol
// total properties: 8
// categories: S4.1.G6 (owner auth), S4.1.G9 (verifier whitelist), S4.1.G10 (init once)
// items NOT applicable: S4.1.G2 (no RBAC), S4.1.G4 (no assets), S4.1.G7 (no custody),
//   S4.1.G8 (no timelock), S4.1.G11 (one-step OZ transfer), S4.2.G3 (no callback),
//   S4.2.G4 (no allowance)
// items requiring manual models: none
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function initialize(address admin, uint256 _activationDelay) external;
    function updateActivationDelay(uint256 _activationDelay) external;
    function addVerifier(address _verifier) external;
    function removeVerifier(address _verifier) external;
    function registerMasterAddress(address _masterAddress, bool _isMasterLinked) external;
    function verifiers(address) external returns (bool) envfree;
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can add a verifier
rule addVerifier_rejects_non_owner(env e, address _verifier) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    addVerifier@withrevert(e, _verifier);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not add a verifier";
}

rule addVerifier_has_authorized_path(env e, address _verifier) {
    require e.msg.sender == owner();
    addVerifier@withrevert(e, _verifier);
    bool reverted = lastReverted;
    satisfy !reverted, "owner should be able to add a verifier for some input";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can remove a verifier
rule removeVerifier_rejects_non_owner(env e, address _verifier) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    removeVerifier@withrevert(e, _verifier);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not remove a verifier";
}

// S4.1.G6 / CAC-AC-001: only the pre-state owner can update the activation delay
rule updateActivationDelay_rejects_non_owner(env e, uint256 _activationDelay) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    updateActivationDelay@withrevert(e, _activationDelay);
    bool reverted = lastReverted;

    assert reverted, "a non-owner must not update the activation delay";
}

// S4.1.G9 / CAC-AC-006: a non-verifier must not register a master address
rule registerMasterAddress_rejects_non_verifier(env e, address _masterAddress, bool _isMasterLinked) {
    require verifiers(e.msg.sender) == false;

    registerMasterAddress@withrevert(e, _masterAddress, _isMasterLinked);
    bool reverted = lastReverted;

    assert reverted, "a caller who is not a verifier must not register a master address";
}

// S4.1.G9 / CAC-AC-006: reachability witness - a registered verifier can register
rule registerMasterAddress_has_verifier_path(env e, address _masterAddress, bool _isMasterLinked) {
    require verifiers(e.msg.sender) == true;

    registerMasterAddress@withrevert(e, _masterAddress, _isMasterLinked);
    bool reverted = lastReverted;
    satisfy !reverted, "a verifier should be able to register a master address for some input";
}

// S4.1.G10 / CAC-AC-007: initialization cannot succeed twice
rule initialize_cannot_succeed_twice(env e1, env e2, address admin, uint256 _activationDelay) {
    initialize@withrevert(e1, admin, _activationDelay);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, admin, _activationDelay);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

// S4.1.G10 / CAC-AC-007: reachability witness - initialization can succeed
rule initialize_can_succeed(env e, address admin, uint256 _activationDelay) {
    initialize@withrevert(e, admin, _activationDelay);
    bool reverted = lastReverted;
    satisfy !reverted, "initialize should be reachable from a fresh state";
}
