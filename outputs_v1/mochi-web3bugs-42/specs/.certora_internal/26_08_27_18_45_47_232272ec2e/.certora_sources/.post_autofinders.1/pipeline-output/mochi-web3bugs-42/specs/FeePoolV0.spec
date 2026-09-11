// ============================================================
// file: FeePoolV0.spec
// verified contract: FeePoolV0.sol
// total properties: 4
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: S4.1.G7
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree;

    function changecrvVoterRewardPool(address) external;
    function changeTreasuryRatio(uint256) external;
    function changevMochiRatio(uint256) external;
}

rule changecrvVoterRewardPool_rejects_non_governance(env e, address newPool) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    changecrvVoterRewardPool@withrevert(e, newPool);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change crvVoterRewardPool";
}

rule changeTreasuryRatio_rejects_non_governance(env e, uint256 newRatio) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    changeTreasuryRatio@withrevert(e, newRatio);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change treasuryRatio";
}

rule changevMochiRatio_rejects_non_governance(env e, uint256 newRatio) {
    address eng = engine();
    require e.msg.sender != eng.governance(e);

    changevMochiRatio@withrevert(e, newRatio);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change vMochiRatio";
}

rule changeTreasuryRatio_governance_can_change(env e, uint256 newRatio) {
    address eng = engine();
    require e.msg.sender == eng.governance(e);

    changeTreasuryRatio@withrevert(e, newRatio);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to change treasuryRatio";
}