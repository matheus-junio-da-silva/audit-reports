methods {
    function owner() external returns (address) envfree;
    function pendingOwner() external returns (address) envfree;
    function transferOwnership(address,bool,bool) external;
    function claimOwnership() external;
}

rule transferOwnership_rejects_non_owner(env e, address newOwner, bool direct, bool renounce) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    transferOwnership@withrevert(e, newOwner, direct, renounce);
    bool reverted = lastReverted;

    assert reverted, "BO: a caller that is not the owner must not transfer ownership";
}

rule nomination_does_not_change_owner(env e, address newOwner) {
    require e.msg.sender == owner();

    address ownerBefore = owner();
    transferOwnership@withrevert(e, newOwner, false, false);
    bool reverted = lastReverted;

    assert !reverted => owner() == ownerBefore,
        "BO: nominating a pending owner must not change the current owner";
}

rule claimOwnership_rejects_non_pending(env e) {
    require e.msg.sender != pendingOwner();
    require e.msg.sender != 0;

    claimOwnership@withrevert(e);
    bool reverted = lastReverted;

    assert reverted, "BO: a caller that is not the pending owner must not claim ownership";
}

rule claimOwnership_pending_can_claim(env e) {
    require pendingOwner() != 0;
    require e.msg.sender == pendingOwner();

    claimOwnership@withrevert(e);
    bool reverted = lastReverted;

    satisfy !reverted, "BO: the pending owner must be able to claim ownership";
}

rule owner_changes_only_through_ownership_methods(method f)
filtered {
    f -> f.contract == currentContract
      && f.selector != sig:transferOwnership(address,bool,bool).selector
      && f.selector != sig:claimOwnership().selector
} {
    env e;
    calldataarg args;
    address ownerBefore = owner();

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert !reverted => owner() == ownerBefore,
        "BO: an unrelated successful method must not change owner";
}