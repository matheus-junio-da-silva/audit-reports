// ============================================================
// file: Owned.spec
// verified contract: Owned.sol
// source: contracts/staking-rewards/Owned.sol
// properties: 4
// categories: S4.1.G11
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function nominatedOwner() external returns (address) envfree;

    function nominateNewOwner(address) external;
    function acceptOwnership() external;
}

// S4.1.G11 / CAC-AC-008 — only the current owner can nominate
rule nominateNewOwner_onlyOwner(env e, address newOwner) {
    require e.msg.sender != owner();

    nominateNewOwner@withrevert(e, newOwner);
    bool reverted = lastReverted;
    assert reverted, "nominateNewOwner must revert for a non-owner caller";
}

// S4.1.G11 / CAC-AC-008 — nomination alone must not change the current owner
rule nominateNewOwner_preserves_owner(env e, address newOwner) {
    address ownerBefore = owner();
    require e.msg.sender == owner();

    nominateNewOwner@withrevert(e, newOwner);
    bool reverted = lastReverted;

    assert !reverted => owner() == ownerBefore,
        "nomination must not change the current owner";
    assert !reverted => nominatedOwner() == newOwner,
        "nomination must record the nominated owner";
}

// S4.1.G11 / CAC-AC-008 — only the nominated address can accept
rule acceptOwnership_only_nominated(env e) {
    require e.msg.sender != nominatedOwner();

    acceptOwnership@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "acceptOwnership must revert for a caller other than the nominated owner";
}

// S4.1.G11 / CAC-AC-008 — the nominated address completes the transfer
rule nominated_can_accept_and_transfer(env e) {
    require e.msg.sender == nominatedOwner();
    require nominatedOwner() != 0;

    acceptOwnership@withrevert(e);
    bool reverted = lastReverted;

    assert !reverted => owner() == e.msg.sender,
        "accepting transfers ownership to the nominator";
    assert !reverted => nominatedOwner() == 0,
        "acceptance must clear the nomination";
}