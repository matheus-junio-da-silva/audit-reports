// ============================================================
// file: BasePoolV2.spec
// verified contract: BasePoolV2.sol
// source: contracts/dex-v2/pool/BasePoolV2.sol
// properties: 4
// categories: S4.1.G9, S4.2.G1
// ============================================================

use builtin rule sanity;

methods {
    function router() external returns (address) envfree;
    function supported(address) external returns (bool) envfree;

    function swap(address,uint256,uint256,address) external returns (uint256);
    function doubleSwap(address,address,uint256,address) external returns (uint256);
    function mint(address,uint256,uint256,address,address) external returns (uint256);
    function rescue(address) external;
}

// S4.1.G9 / CAC-AC-006 — router-gated swap
rule swap_rejects_non_router(env e, address foreignAsset, uint256 nativeAmountIn, uint256 foreignAmountIn, address to) {
    require e.msg.sender != router();

    swap@withrevert(e, foreignAsset, nativeAmountIn, foreignAmountIn, to);
    bool reverted = lastReverted;
    assert reverted, "swap must revert for a non-router caller";
}

// S4.1.G9 / CAC-AC-006 — router-gated double swap
rule doubleSwap_rejects_non_router(env e, address foreignAssetA, address foreignAssetB, uint256 foreignAmountIn, address to) {
    require e.msg.sender != router();

    doubleSwap@withrevert(e, foreignAssetA, foreignAssetB, foreignAmountIn, to);
    bool reverted = lastReverted;
    assert reverted, "doubleSwap must revert for a non-router caller";
}

// S4.1.G9 / CAC-AC-006 — router-gated liquidity mint
rule mint_rejects_non_router(env e, address foreignAsset, uint256 nativeDeposit, uint256 foreignDeposit, address from) {
    require e.msg.sender != router();

    mint@withrevert(e, foreignAsset, nativeDeposit, foreignDeposit, from, e.msg.sender);
    bool reverted = lastReverted;
    assert reverted, "mint must revert for a non-router caller";
}

// S4.2.G1 / CAC-AC-001 — rescue sweep is unguarded; witness that any caller can execute it
// NOTE: no authorization predicate is defined in source; recorded as manual_model_required.
rule rescue_succeeds_for_arbitrary_caller(env e, address foreignAsset) {
    rescue@withrevert(e, foreignAsset);
    bool reverted = lastReverted;

    satisfy !reverted, "an arbitrary caller can execute rescue when unaccounted balance exists";
}