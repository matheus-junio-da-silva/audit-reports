// ============================================================
// file: VaderPoolV2.spec
// verified contract: VaderPoolV2.sol
// source: contracts/dex-v2/pool/VaderPoolV2.sol
// properties: 7
// categories: S4.1.G6, S4.1.G9, S4.1.G10, S4.2.G1
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function router() external returns (address) envfree;
    function synthFactory() external returns (address) envfree;
    function wrapper() external returns (address) envfree;
    function supported(address) external returns (bool) envfree;

    function mint(address,uint256,uint256,address,address) external returns (uint256);
    function burn(uint256,address) external returns (uint256,uint256,uint256);
    function mintSynth(address,uint256,address,address) external returns (uint256);
    function mintFungible(address,uint256,uint256,address,address) external returns (uint256);
    function toggleQueue() external;
    function setTokenSupport(address,bool) external;
    function initialize(address,address,address) external;
}

// S4.1.G9 / CAC-AC-006 — liquidity mint is router-gated
rule mint_rejects_non_router(env e, address foreignAsset, uint256 nativeDeposit, uint256 foreignDeposit, address from) {
    require e.msg.sender != router();

    mint@withrevert(e, foreignAsset, nativeDeposit, foreignDeposit, from, e.msg.sender);
    bool reverted = lastReverted;
    assert reverted, "mint must revert for a non-router caller";
}

// S4.1.G9 / CAC-AC-006 — position burn is router-gated
rule burn_rejects_non_router(env e, uint256 id, address to) {
    require e.msg.sender != router();

    burn@withrevert(e, id, to);
    bool reverted = lastReverted;
    assert reverted, "burn must revert for a non-router caller";
}

// S4.2.G1 / CAC-AC-001 — mintSynth has NO router restriction (confirmed-vuln probe)
// The analogous mint on BasePoolV2 carries onlyRouter; mintSynth does not.
rule mintSynth_not_router_restricted(env e, address foreignAsset, uint256 nativeDeposit, address from) {
    require e.msg.sender != router();
    require synthFactory() != 0;
    require supported(foreignAsset);

    mintSynth@withrevert(e, foreignAsset, nativeDeposit, from, e.msg.sender);
    bool reverted = lastReverted;
    assert reverted, "mintSynth must be restricted to the router";
}

// S4.2.G1 / CAC-AC-001 — mintFungible has NO router restriction (confirmed-vuln probe)
rule mintFungible_not_router_restricted(env e, address foreignAsset, uint256 nativeDeposit, uint256 foreignDeposit, address from) {
    require e.msg.sender != router();
    require wrapper() != 0;
    require supported(foreignAsset);

    mintFungible@withrevert(e, foreignAsset, nativeDeposit, foreignDeposit, from, e.msg.sender);
    bool reverted = lastReverted;
    assert reverted, "mintFungible must be restricted to the router";
}

// S4.1.G6 / CAC-AC-001 — owner-only protocol configuration
rule toggleQueue_onlyOwner(env e) {
    require e.msg.sender != owner();

    toggleQueue@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "toggleQueue must revert for a non-owner caller";
}

rule setTokenSupport_onlyOwner(env e, address foreignAsset, bool support) {
    require e.msg.sender != owner();

    setTokenSupport@withrevert(e, foreignAsset, support);
    bool reverted = lastReverted;
    assert reverted, "setTokenSupport must revert for a non-owner caller";
}

// S4.1.G10 / CAC-AC-007 — initialization can only happen once
rule initialize_cannot_succeed_twice(env e1, env e2, address w, address sf, address r) {
    initialize@withrevert(e1, w, sf, r);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, w, sf, r);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialize every later initialize must revert";
}