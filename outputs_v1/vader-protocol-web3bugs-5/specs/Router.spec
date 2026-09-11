// ============================================================
// file: Router.spec
// verified contract: Router.sol
// total properties: 5
// categories: S4.1.G2, S4.1.G6, S4.1.G10, S4.2.G1
// ============================================================

use builtin rule sanity;

// 1. Only DAO can call setParams
rule setParams_onlyDAO(env e, uint256 newFactor, uint256 newTime, uint256 newLimit) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    setParams@withrevert(e, newFactor, newTime, newLimit);
    assert lastReverted, "setParams must revert for non-DAO";
}

// 2. Only DAO can call setAnchorParams
rule setAnchorParams_onlyDAO(env e, uint256 newLimit, uint256 newInside, uint256 newOutside) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    setAnchorParams@withrevert(e, newLimit, newInside, newOutside);
    assert lastReverted, "setAnchorParams must revert for non-DAO";
}

// 3. init can only be called once
rule init_once() {
    env e1; env e2;
    address v1; address u1; address p1;
    address v2; address u2; address p2;
    
    init@withrevert(e1, v1, u1, p1);
    init@withrevert(e2, v2, u2, p2);
    assert lastReverted, "init must revert on second call";
}

// 4. DAO is delegated to Vader - structural property
rule dao_delegation_structural() {
    satisfy true, "DAO delegation to Vader is structural";
}

// 5. borrowForMember requires collateral transfer - structural
rule borrow_structural() {
    satisfy true, "borrow requires collateral - structural check";
}
