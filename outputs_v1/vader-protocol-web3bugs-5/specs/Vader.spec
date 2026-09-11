// ============================================================
// file: Vader.spec
// verified contract: Vader.sol
// total properties: 6
// categories: S4.1.G2, S4.1.G6, S4.1.G10, S4.2.G1
// ============================================================

use builtin rule sanity;

// 1. Only DAO can call flipEmissions
rule flipEmissions_onlyDAO(env e) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    flipEmissions@withrevert(e);
    assert lastReverted, "flipEmissions must revert for non-DAO";
}

// 2. Only DAO can call flipMinting
rule flipMinting_onlyDAO(env e) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    flipMinting@withrevert(e);
    assert lastReverted, "flipMinting must revert for non-DAO";
}

// 3. Only DAO can call setParams
rule setParams_onlyDAO(env e, uint256 newEra, uint256 newCurve) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    setParams@withrevert(e, newEra, newCurve);
    assert lastReverted, "setParams must revert for non-DAO";
}

// 4. Only DAO can call changeDAO
rule changeDAO_onlyDAO(env e, address newDAO) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    changeDAO@withrevert(e, newDAO);
    assert lastReverted, "changeDAO must revert for non-DAO";
}

// 5. Only DAO can call purgeDAO
rule purgeDAO_onlyDAO(env e) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    purgeDAO@withrevert(e);
    assert lastReverted, "purgeDAO must revert for non-DAO";
}

// 6. init can only be called once
rule init_once() {
    env e1; env e2;
    address v1; address u1; address s1;
    address v2; address u2; address s2;
    
    init@withrevert(e1, v1, u1, s1);
    init@withrevert(e2, v2, u2, s2);
    assert lastReverted, "init must revert on second call";
}
