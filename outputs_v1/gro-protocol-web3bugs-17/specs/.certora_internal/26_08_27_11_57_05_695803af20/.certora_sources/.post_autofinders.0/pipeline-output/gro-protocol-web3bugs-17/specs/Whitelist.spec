// ============================================================
// file: Whitelist.spec
// verified contract: Whitelist.sol
// total properties: 4
// categories: S4.1.G6 / S4.2.G1 (owner-only allowlist governance)
// items NOT applicable: S4.1.G2, S4.1.G4, S4.1.G7, S4.1.G8,
//   S4.1.G10, S4.1.G11, S4.2.G3, S4.2.G4 (see property-plan)
// items requiring manual models: none
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function whitelist(address) external returns (bool) envfree;
    function addToWhitelist(address) external;
    function removeFromWhitelist(address) external;
}

rule add_to_whitelist_rejects_non_owner(env e, address user) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    addToWhitelist@withrevert(e, user);
    bool reverted = lastReverted;

    assert reverted, "only the owner may add a member to the allowlist";
}

rule remove_from_whitelist_rejects_non_owner(env e, address user) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    removeFromWhitelist@withrevert(e, user);
    bool reverted = lastReverted;

    assert reverted, "only the owner may remove a member from the allowlist";
}

rule add_to_whitelist_owner_reachable(env e, address user) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;
    require user != 0;

    addToWhitelist@withrevert(e, user);
    bool reverted = lastReverted;

    satisfy !reverted && whitelist(user),
        "an owner-granted addToWhitelist must be reachable and effective";
}

rule remove_from_whitelist_owner_reachable(env e, address user) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;
    require whitelist(user);

    removeFromWhitelist@withrevert(e, user);
    bool reverted = lastReverted;

    satisfy !reverted && !whitelist(user),
        "an owner-granted removeFromWhitelist must be reachable and effective";
}