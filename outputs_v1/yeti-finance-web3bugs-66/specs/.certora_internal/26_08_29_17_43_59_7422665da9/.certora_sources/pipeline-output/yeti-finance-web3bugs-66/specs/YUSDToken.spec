methods {
    function transfer(address,uint256) external;
    function transferFrom(address,address,uint256) external;
    function approve(address,uint256) external;
    function increaseAllowance(address,uint256) external;
    function decreaseAllowance(address,uint256) external;
    function allowance(address,address) external returns (uint256) envfree;
    function balanceOf(address) external returns (uint256) envfree;
}

rule transferFrom_rejects_insufficient_allowance(env e, address from, address recipient, uint256 amount) {
    require e.msg.sender != from;
    require from != 0;

    uint256 allowanceBefore = allowance(from, e.msg.sender);
    require allowanceBefore < amount;

    transferFrom@withrevert(e, from, recipient, amount);
    bool reverted = lastReverted;

    assert reverted, "YUSD: transferFrom must revert when the allowance is insufficient";
}

rule transferFrom_succeeds_with_sufficient_allowance(env e, address from, address recipient, uint256 amount) {
    require e.msg.sender != from;

    uint256 allowanceBefore = allowance(from, e.msg.sender);
    require allowanceBefore >= amount;

    transferFrom@withrevert(e, from, recipient, amount);
    bool reverted = lastReverted;

    satisfy !reverted, "YUSD: a caller with sufficient allowance must be able to spend for some state";
}

rule decreaseAllowance_rejects_below_zero(env e, address spender, uint256 subtractedValue) {
    uint256 current = allowance(e.msg.sender, spender);
    require current < subtractedValue;

    decreaseAllowance@withrevert(e, spender, subtractedValue);
    bool reverted = lastReverted;

    assert reverted, "YUSD: decreaseAllowance must revert when subtracting more than the current allowance";
}