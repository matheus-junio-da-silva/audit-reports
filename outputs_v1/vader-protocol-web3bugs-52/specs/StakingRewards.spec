// ============================================================
// file: StakingRewards.spec
// verified contract: StakingRewards.sol
// source: contracts/staking-rewards/StakingRewards.sol
// properties: 4
// categories: S4.1.G6
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function rewardsDistribution() external returns (address) envfree;

    function notifyRewardAmount(uint256) external;
    function setRewardsDistribution(address) external;
    function setRewardsDuration(uint256) external;
    function recoverERC20(address,uint256) external;
}

// S4.1.G6 / CAC-AC-001 — only the rewards distribution role can seed rewards
rule notifyRewardAmount_onlyRewardsDistribution(env e, uint256 reward) {
    require e.msg.sender != rewardsDistribution();

    notifyRewardAmount@withrevert(e, reward);
    bool reverted = lastReverted;
    assert reverted, "notifyRewardAmount must revert for a caller other than the rewards distribution";
}

// S4.1.G6 / CAC-AC-001 — owner-only role administration
rule setRewardsDistribution_onlyOwner(env e, address rd) {
    require e.msg.sender != owner();

    setRewardsDistribution@withrevert(e, rd);
    bool reverted = lastReverted;
    assert reverted, "setRewardsDistribution must revert for a non-owner caller";
}

rule setRewardsDuration_onlyOwner(env e, uint256 duration) {
    require e.msg.sender != owner();

    setRewardsDuration@withrevert(e, duration);
    bool reverted = lastReverted;
    assert reverted, "setRewardsDuration must revert for a non-owner caller";
}

rule recoverERC20_onlyOwner(env e, address tokenAddress, uint256 tokenAmount) {
    require e.msg.sender != owner();

    recoverERC20@withrevert(e, tokenAddress, tokenAmount);
    bool reverted = lastReverted;
    assert reverted, "recoverERC20 must revert for a non-owner caller";
}