// ============================================================
// file: ChainlinkAdapterEth.spec
// verified contract: ChainlinkAdapter.sol (contract ChainlinkAdapterEth)
// total properties: 2
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G7/G8/G9/G10/G11, S4.2.G3/G4
// ============================================================

use builtin rule sanity;

methods {
    function owned() external returns (address) envfree;
    function governance() external returns (address) envfree optional;

    function setFeed(address[], address[]) external;
}

rule setFeed_rejects_non_governance(env e, address[] assets, address[] feeds) {
    require feeds.length == 0;

    address o = owned();
    require e.msg.sender != o.governance(e);

    setFeed@withrevert(e, assets, feeds);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not set price feeds";
}

rule setFeed_governance_can_set(env e, address[] assets, address[] feeds) {
    require feeds.length == 0;

    address o = owned();
    require e.msg.sender == o.governance(e);

    setFeed@withrevert(e, assets, feeds);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to set price feeds";
}