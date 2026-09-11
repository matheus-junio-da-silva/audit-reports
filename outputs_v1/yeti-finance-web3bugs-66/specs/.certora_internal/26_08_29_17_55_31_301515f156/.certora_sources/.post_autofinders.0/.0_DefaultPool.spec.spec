methods {
    function owner() external returns (address) envfree;
    function setAddresses(address,address,address,address) external;
}

rule setAddresses_rejects_non_owner(env e, address a1, address a2, address a3, address a4) {
    address ownerBefore = owner();
    require ownerBefore != 0;
    require e.msg.sender != ownerBefore;
    require e.msg.sender != 0;

    setAddresses@withrevert(e, a1, a2, a3, a4);
    bool reverted = lastReverted;

    assert reverted, "DP: a caller that is not the owner must not configure the pool";
}

rule setAddresses_owner_can_configure(env e, address a1, address a2, address a3, address a4) {
    require e.msg.sender == owner();
    require e.msg.sender != 0;

    setAddresses@withrevert(e, a1, a2, a3, a4);
    bool reverted = lastReverted;

    satisfy !reverted, "DP: the owner must be able to configure the pool in the pre-init state";
}

rule setAddresses_cannot_succeed_twice(env e1, env e2, address a1, address a2, address a3, address a4, address b1, address b2, address b3, address b4) {
    require e1.msg.sender == owner();
    require e1.msg.sender != 0;

    setAddresses@withrevert(e1, a1, a2, a3, a4);
    bool firstReverted = lastReverted;

    require e2.msg.sender != 0;
    setAddresses@withrevert(e2, b1, b2, b3, b4);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "DP: after one successful setAddresses every later call must revert (init-once)";
}