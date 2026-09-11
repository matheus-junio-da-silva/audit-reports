// ============================================================
// file: NoMochiFeePool.spec
// verified contract: NoMochiFeePool.sol
// total properties: 1
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: remaining S4.1.* / S4.2.*
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree;

    function changeWithdrawer(address) external;
}

rule changeWithdrawer_rejects_non_governance(env e, address newWithdrawer) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    changeWithdrawer@withrevert(e, newWithdrawer);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change the withdrawer";
}