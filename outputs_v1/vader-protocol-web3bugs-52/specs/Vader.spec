// ============================================================
// file: Vader.spec
// verified contract: Vader.sol
// source: contracts/tokens/Vader.sol
// properties: 5
// categories: S4.1.G6, S4.1.G10
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function converter() external returns (address) envfree;

    function createEmission(address,uint256) external;
    function setComponents(address,address,address,address) external;
    function claimGrant(address,uint256) external;
    function adjustMaxSupply(uint256) external;
}

// S4.1.G6 / CAC-AC-001 — owner-only emission mint
rule createEmission_onlyOwner(env e, address user, uint256 amount) {
    require e.msg.sender != owner();

    createEmission@withrevert(e, user, amount);
    bool reverted = lastReverted;
    assert reverted, "createEmission must revert for a non-owner caller";
}

// S4.1.G6 / CAC-AC-001 — owner-only component setup
rule setComponents_onlyOwner(env e, address c, address v, address u, address dao) {
    require e.msg.sender != owner();

    setComponents@withrevert(e, c, v, u, dao);
    bool reverted = lastReverted;
    assert reverted, "setComponents must revert for a non-owner caller";
}

// S4.1.G10 / CAC-AC-007 — components can only be initialized once
rule setComponents_cannot_succeed_twice(env e1, env e2, address c, address v, address u, address dao) {
    setComponents@withrevert(e1, c, v, u, dao);
    bool firstReverted = lastReverted;

    setComponents@withrevert(e2, c, v, u, dao);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after a successful setComponents every later call must revert";
}

// S4.1.G6 / CAC-AC-001 — DAO-only grant claims and supply cap adjustment
rule claimGrant_onlyDAO(env e, address beneficiary, uint256 amount) {
    require e.msg.sender != owner();

    claimGrant@withrevert(e, beneficiary, amount);
    bool reverted = lastReverted;
    assert reverted, "claimGrant must revert for a caller other than the DAO";
}

rule adjustMaxSupply_onlyDAO(env e, uint256 _maxSupply) {
    require e.msg.sender != owner();

    adjustMaxSupply@withrevert(e, _maxSupply);
    bool reverted = lastReverted;
    assert reverted, "adjustMaxSupply must revert for a caller other than the DAO";
}