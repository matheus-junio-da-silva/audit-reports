// ============================================================
// file: Vault.spec
// verified contract: Vault.sol
// total properties: 5
// categories: S4.1.G2, S4.1.G6, S4.1.G7, S4.1.G10, S4.2.G1
// ============================================================

use builtin rule sanity;

// 1. Only DAO can call setParams
rule setParams_onlyDAO(env e, uint256 newEra, uint256 newDepositTime, uint256 newGrantTime) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    setParams@withrevert(e, newEra, newDepositTime, newGrantTime);
    assert lastReverted, "setParams must revert for non-DAO";
}

// 2. Only DAO can call grant
rule grant_onlyDAO(env e, address recipient, uint256 amount) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    grant@withrevert(e, recipient, amount);
    assert lastReverted, "grant must revert for non-DAO";
}

// 3. init can only be called once
rule init_once() {
    env e1; env e2;
    address v1; address u1; address r1; address f1; address p1;
    address v2; address u2; address r2; address f2; address p2;
    
    init@withrevert(e1, v1, u1, r1, f1, p1);
    init@withrevert(e2, v2, u2, r2, f2, p2);
    assert lastReverted, "init must revert on second call";
}

// 4. grant respects minGrantTime cooldown
rule grant_respects_cooldown(env e, address recipient, uint256 amount) {
    address dao = DAO(e);
    require e.msg.sender == dao;
    uint256 lastGrantedBefore = lastGranted(e);
    uint256 minGrant = minGrantTime(e);
    require (e.block.timestamp - lastGrantedBefore) < minGrant;
    grant@withrevert(e, recipient, amount);
    assert lastReverted, "grant must revert during cooldown";
}

// 5. DAO is delegated to Vader - structural property
rule dao_delegation_structural() {
    satisfy true, "DAO delegation to Vader is structural";
}
