// ============================================================
// file: MochiCSSRv0.spec
// verified contract: MochiCSSRv0.sol
// total properties: 3
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: array/loop-bodied gov setters beyond empty-array frame
// ============================================================

use builtin rule sanity;

methods {
    function owned() external returns (address) envfree;
    function governance() external returns (address) envfree optional;

    function listAdapter(address) external;
    function delistAdapter(address) external;
    function setFiatPriceAdapter(address) external;
    function setDefaultPriceSource(address) external;
    function setDefaultLiquiditySource(address) external;

    function setBluechip(address[]) external;
    function setPriceSource(address, address[]) external;
    function setLiquiditySource(address, address[]) external;
}

rule onlyGov_scalar_setters_reject_non_governance(method f)
filtered { f -> f.contract == currentContract
               && (f.selector == sig:listAdapter(address).selector
                   || f.selector == sig:delistAdapter(address).selector
                   || f.selector == sig:setFiatPriceAdapter(address).selector
                   || f.selector == sig:setDefaultPriceSource(address).selector
                   || f.selector == sig:setDefaultLiquiditySource(address).selector) } {
    env e;
    calldataarg args;
    address o = owned();
    require e.msg.sender != o.governance(e);

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not mutate cssr configuration";
}

rule setBluechip_rejects_non_governance(env e, address[] assets) {
    require assets.length == 0;

    address o = owned();
    require e.msg.sender != o.governance(e);

    setBluechip@withrevert(e, assets);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not set bluechips";
}

rule setPriceSource_rejects_non_governance(env e, address adapter, address[] assets) {
    require assets.length == 0;

    address o = owned();
    require e.msg.sender != o.governance(e);

    setPriceSource@withrevert(e, adapter, assets);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not set price sources";
}

rule setLiquiditySource_rejects_non_governance(env e, address adapter, address[] assets) {
    require assets.length == 0;

    address o = owned();
    require e.msg.sender != o.governance(e);

    setLiquiditySource@withrevert(e, adapter, assets);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not set liquidity sources";
}

rule listAdapter_governance_can_list(env e, address adapter) {
    address o = owned();
    require e.msg.sender == o.governance(e);

    listAdapter@withrevert(e, adapter);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to list an adapter";
}