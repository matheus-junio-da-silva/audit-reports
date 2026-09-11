// ============================================================
// file: Timelock.spec
// verified contract: Timelock.sol
// source: contracts/governance/Timelock.sol
// properties: 7
// categories: S4.1.G6, S4.1.G8, S4.1.G11, S4.2.G1
// ============================================================

use builtin rule sanity;

methods {
    function admin() external returns (address) envfree;
    function pendingAdmin() external returns (address) envfree;
    function delay() external returns (uint256) envfree;

    function queueTransaction(address,uint256,string,bytes,uint256) external returns (bytes32);
    function cancelTransaction(address,uint256,string,bytes,uint256) external;
    function executeTransaction(address,uint256,string,bytes,uint256) external returns (bytes);
    function acceptAdmin() external;
    function setDelay(uint256) external;
    function setPendingAdmin(address) external;
}

// S4.1.G6 / CAC-AC-001 — admin-gated queue/cancel/execute
rule queueTransaction_onlyAdmin(env e, address target, uint256 value, string signature, bytes data, uint256 eta) {
    require e.msg.sender != admin();

    queueTransaction@withrevert(e, target, value, signature, data, eta);
    bool reverted = lastReverted;
    assert reverted, "queueTransaction must revert for a non-admin caller";
}

rule cancelTransaction_onlyAdmin(env e, address target, uint256 value, string signature, bytes data, uint256 eta) {
    require e.msg.sender != admin();

    cancelTransaction@withrevert(e, target, value, signature, data, eta);
    bool reverted = lastReverted;
    assert reverted, "cancelTransaction must revert for a non-admin caller";
}

rule executeTransaction_onlyAdmin(env e, address target, uint256 value, string signature, bytes data, uint256 eta) {
    require e.msg.sender != admin();

    executeTransaction@withrevert(e, target, value, signature, data, eta);
    bool reverted = lastReverted;
    assert reverted, "executeTransaction must revert for a non-admin caller";
}

// S4.1.G8 / CAC-AC-005 — a queued transaction cannot execute before its eta
rule executeTransaction_reverts_before_eta(env e1, env e2, address target, uint256 value, string signature, bytes data, uint256 eta) {
    require e1.msg.sender == admin();
    require eta >= e1.block.timestamp + delay();

    queueTransaction@withrevert(e1, target, value, signature, data, eta);
    bool queueReverted = lastReverted;
    require !queueReverted, "the queue path must be reachable";

    require e2.msg.sender == admin();
    require e2.block.timestamp < eta;
    executeTransaction@withrevert(e2, target, value, signature, data, eta);
    bool executeReverted = lastReverted;

    assert executeReverted, "a queued transaction must not execute before eta";
}

// S4.1.G11 / CAC-AC-008 — two-step admin transfer
rule acceptAdmin_rejects_non_pending(env e) {
    require e.msg.sender != pendingAdmin();

    acceptAdmin@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "only the pending admin can accept the admin role";
}

rule pendingAdmin_can_accept_admin(env e) {
    require e.msg.sender == pendingAdmin();
    require pendingAdmin() != 0;

    acceptAdmin@withrevert(e);
    bool reverted = lastReverted;

    assert !reverted => admin() == e.msg.sender,
        "accepting the admin role transfers it to the pending admin";
    assert !reverted => pendingAdmin() == 0,
        "pendingAdmin must be cleared after acceptance";
}

// S4.2.G1 / CAC-AC-001 — timelock self-governed configuration
rule setDelay_rejects_external(env e, uint256 newDelay) {
    require e.msg.sender != currentContract;

    setDelay@withrevert(e, newDelay);
    bool reverted = lastReverted;
    assert reverted, "setDelay must only run through an executed queued transaction";
}

rule setPendingAdmin_rejects_external(env e, address pendingAdmin_) {
    require e.msg.sender != currentContract;

    setPendingAdmin@withrevert(e, pendingAdmin_);
    bool reverted = lastReverted;
    assert reverted, "setPendingAdmin must only run through an executed queued transaction";
}