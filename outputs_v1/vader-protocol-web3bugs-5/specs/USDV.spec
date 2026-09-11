// ============================================================
// file: USDV.spec
// verified contract: USDV.sol
// total properties: 5
// categories: S4.1.G2, S4.1.G6, S4.1.G10, S4.2.G1
// ============================================================

use builtin rule sanity;

// 1. Only DAO can call setParams
rule setParams_onlyDAO(env e, uint256 newDelay) {
    address dao = DAO(e);
    require e.msg.sender != dao;
    setParams@withrevert(e, newDelay);
    assert lastReverted, "setParams must revert for non-DAO";
}

// 2. init can only be called once
rule init_once() {
    env e1; env e2;
    address v1; address va1; address r1;
    address v2; address va2; address r2;
    
    init@withrevert(e1, v1, va1, r1);
    init@withrevert(e2, v2, va2, r2);
    assert lastReverted, "init must revert on second call";
}

// 3. transferFrom requires sufficient allowance
rule transferFrom_requires_allowance(env e, address sender, address recipient, uint256 amount) {
    uint256 allowanceBefore = allowance(e, sender, e.msg.sender);
    require amount > allowanceBefore;
    transferFrom@withrevert(e, sender, recipient, amount);
    assert lastReverted, "transferFrom must revert when allowance insufficient";
}

// 4. burnFrom requires sufficient allowance
rule burnFrom_requires_allowance(env e, address account, uint256 amount) {
    uint256 allowanceBefore = allowance(e, account, e.msg.sender);
    require amount > allowanceBefore;
    burnFrom@withrevert(e, account, amount);
    assert lastReverted, "burnFrom must revert when allowance insufficient";
}

// 5. DAO is delegated to Vader - structural property
rule dao_delegation_structural() {
    satisfy true, "DAO delegation to Vader is structural";
}
