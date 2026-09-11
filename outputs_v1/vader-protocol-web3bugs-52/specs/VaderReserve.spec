// ============================================================
// file: VaderReserve.spec
// verified contract: VaderReserve.sol
// source: contracts/reserve/VaderReserve.sol
// properties: 4
// categories: S4.1.G6, S4.1.G9
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function router() external returns (address) envfree;

    function reimburseImpermanentLoss(address,uint256) external;
    function grant(address,uint256) external;
    function initialize(address,address) external;
}

// S4.1.G9 / CAC-AC-006 — router-gated IL payout
rule reimburseImpermanentLoss_rejects_non_router(env e, address recipient, uint256 amount) {
    require e.msg.sender != router();

    reimburseImpermanentLoss@withrevert(e, recipient, amount);
    bool reverted = lastReverted;
    assert reverted, "reimburseImpermanentLoss must revert for a non-router caller";
}

// S4.1.G9 / CAC-AC-006 — authorized router path is reachable
rule reimburseImpermanentLoss_router_path(env e, address recipient, uint256 amount) {
    require e.msg.sender == router();

    reimburseImpermanentLoss@withrevert(e, recipient, amount);
    bool reverted = lastReverted;

    satisfy !reverted, "the router can reimburse impermanent loss";
}

// S4.1.G6 / CAC-AC-001 — owner-only grant distribution
rule grant_onlyOwner(env e, address recipient, uint256 amount) {
    require e.msg.sender != owner();

    grant@withrevert(e, recipient, amount);
    bool reverted = lastReverted;
    assert reverted, "grant must revert for a non-owner caller";
}

// S4.1.G6 / CAC-AC-001 — owner-only initialization
rule initialize_onlyOwner(env e, address _router, address _dao) {
    require e.msg.sender != owner();

    initialize@withrevert(e, _router, _dao);
    bool reverted = lastReverted;
    assert reverted, "initialize must revert for a non-owner caller";
}