// ============================================================
// file: UniswapV2TokenAdapter.spec
// verified contract: UniswapV2TokenAdapter.sol
// total properties: 2
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// ============================================================

use builtin rule sanity;

methods {
    function owned() external returns (address) envfree;
    function governance() external returns (address) envfree;

    function addKeyCurrency(address) external;
    function removeKeyCurrency(uint256, address) external;
    function setMinimumLiquidity(uint256) external;
}

rule onlyGov_setters_reject_non_governance(method f)
filtered { f -> f.contract == currentContract
               && (f.selector == sig:addKeyCurrency(address).selector
                   || f.selector == sig:removeKeyCurrency(uint256,address).selector
                   || f.selector == sig:setMinimumLiquidity(uint256).selector) } {
    env e;
    calldataarg args;
    address o = owned();
    require e.msg.sender != o.governance();

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not mutate adapter configuration";
}

rule addKeyCurrency_governance_can_add(env e, address currency) {
    address o = owned();
    require e.msg.sender == o.governance();

    addKeyCurrency@withrevert(e, currency);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to add a key currency";
}