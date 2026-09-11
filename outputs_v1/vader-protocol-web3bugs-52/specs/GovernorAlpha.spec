// ============================================================
// file: GovernorAlpha.spec
// verified contract: GovernorAlpha.sol
// source: contracts/governance/GovernorAlpha.sol
// properties: 8
// categories: S4.1.G2
// ============================================================

use builtin rule sanity;

methods {
    function guardian() external returns (address) envfree;
    function council() external returns (address) envfree;
    function timelock() external returns (address) envfree;

    function setTimelock(address) external;
    function changeFeeReceiver(address) external;
    function changeFeeAmount(uint256) external;
    function cancel(uint256) external;
    function __acceptAdmin() external;
    function __abdicate() external;
    function veto(uint256,bool) external;
    function changeCouncil(address) external;
}

// S4.1.G2 / CAC-AC-002 — guardian-gated governance configuration
rule setTimelock_onlyGuardian(env e, address _timelock) {
    require e.msg.sender != guardian();

    setTimelock@withrevert(e, _timelock);
    bool reverted = lastReverted;
    assert reverted, "setTimelock must revert for a non-guardian caller";
}

rule changeFeeReceiver_onlyGuardian(env e, address feeReceiver_) {
    require e.msg.sender != guardian();

    changeFeeReceiver@withrevert(e, feeReceiver_);
    bool reverted = lastReverted;
    assert reverted, "changeFeeReceiver must revert for a non-guardian caller";
}

rule changeFeeAmount_onlyGuardian(env e, uint256 feeAmount_) {
    require e.msg.sender != guardian();

    changeFeeAmount@withrevert(e, feeAmount_);
    bool reverted = lastReverted;
    assert reverted, "changeFeeAmount must revert for a non-guardian caller";
}

rule cancel_onlyGuardian(env e, uint256 proposalId) {
    require e.msg.sender != guardian();

    cancel@withrevert(e, proposalId);
    bool reverted = lastReverted;
    assert reverted, "cancel must revert for a non-guardian caller";
}

rule acceptAdmin_onlyGuardian(env e) {
    require e.msg.sender != guardian();

    __acceptAdmin@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "__acceptAdmin must revert for a non-guardian caller";
}

rule abdicate_onlyGuardian(env e) {
    require e.msg.sender != guardian();

    __abdicate@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "__abdicate must revert for a non-guardian caller";
}

// S4.1.G2 / CAC-AC-002 — council-gated veto
rule veto_onlyCouncil(env e, uint256 proposalId, bool support) {
    require e.msg.sender != council();

    veto@withrevert(e, proposalId, support);
    bool reverted = lastReverted;
    assert reverted, "veto must revert for a non-council caller";
}

// S4.1.G2 / CAC-AC-002 — timelock-gated council change
rule changeCouncil_onlyTimelock(env e, address council_) {
    require e.msg.sender != timelock();

    changeCouncil@withrevert(e, council_);
    bool reverted = lastReverted;
    assert reverted, "changeCouncil must revert for a caller other than the timelock";
}