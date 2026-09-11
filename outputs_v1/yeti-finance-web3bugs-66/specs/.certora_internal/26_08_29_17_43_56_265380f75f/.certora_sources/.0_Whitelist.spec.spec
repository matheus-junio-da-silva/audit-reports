methods {
    function owner() external returns (address) envfree;
    function setAddresses(address,address,address,address,address) external;
    function addCollateral(address,uint256,address,uint256,address,bool,address) external;
    function deprecateCollateral(address) external;
    function undeprecateCollateral(address) external;
    function changeOracle(address,address) external;
    function changePriceCurve(address,address) external;
    function changeRatio(address,uint256) external;
    function setDefaultRouter(address,address) external;
}

rule setAddresses_rejects_non_owner(env e, address a1, address a2, address a3, address a4, address a5) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    setAddresses@withrevert(e, a1, a2, a3, a4, a5);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not bootstrap the whitelist";
}

rule setAddresses_cannot_succeed_twice(env e1, env e2, address a1, address a2, address a3, address a4, address a5, address b1, address b2, address b3, address b4, address b5) {
    require e1.msg.sender == owner();
    require e1.msg.sender != 0;

    setAddresses@withrevert(e1, a1, a2, a3, a4, a5);
    bool firstReverted = lastReverted;

    require e2.msg.sender != 0;
    setAddresses@withrevert(e2, b1, b2, b3, b4, b5);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "WL: after one successful setAddresses every later call must revert (init-once)";
}

rule addCollateral_rejects_non_owner(env e, address collateral, uint256 minRatio, address oracle, uint256 decimals, address priceCurve, bool isWrapped, address routerAddress) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    addCollateral@withrevert(e, collateral, minRatio, oracle, decimals, priceCurve, isWrapped, routerAddress);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not add collateral to the whitelist";
}

rule addCollateral_owner_can_add(env e, address collateral, uint256 minRatio, address oracle, uint256 decimals, address priceCurve, bool isWrapped, address routerAddress) {
    require e.msg.sender == owner();
    require e.msg.sender != 0;

    addCollateral@withrevert(e, collateral, minRatio, oracle, decimals, priceCurve, isWrapped, routerAddress);
    bool reverted = lastReverted;

    satisfy !reverted, "WL: the owner must be able to add collateral for some inputs";
}

rule deprecateCollateral_rejects_non_owner(env e, address collateral) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    deprecateCollateral@withrevert(e, collateral);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not deprecate collateral";
}

rule undeprecateCollateral_rejects_non_owner(env e, address collateral) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    undeprecateCollateral@withrevert(e, collateral);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not undeprecate collateral";
}

rule changeOracle_rejects_non_owner(env e, address collateral, address oracle) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    changeOracle@withrevert(e, collateral, oracle);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not change an oracle";
}

rule changePriceCurve_rejects_non_owner(env e, address collateral, address priceCurve) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    changePriceCurve@withrevert(e, collateral, priceCurve);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not change a price curve";
}

rule changeRatio_rejects_non_owner(env e, address collateral, uint256 ratio) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    changeRatio@withrevert(e, collateral, ratio);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not change a stability ratio";
}

rule setDefaultRouter_rejects_non_owner(env e, address collateral, address router) {
    require e.msg.sender != owner();
    require e.msg.sender != 0;

    setDefaultRouter@withrevert(e, collateral, router);
    bool reverted = lastReverted;

    assert reverted, "WL: a non-owner must not set a default router";
}