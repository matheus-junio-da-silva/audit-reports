use builtin rule sanity;

methods {
    function factory() external returns (address) envfree;
    function orderbook() external returns (address) envfree;
    function treasury() external returns (address) envfree;
    function userAlreadyWithdrawn(address) external returns (bool) envfree;
    function userAlreadyClaimed(uint256, address) external returns (bool) envfree;

    function transferCard(address, address, uint256, uint256, uint256) external;
    function withdraw() external;
    function claimCard(uint256) external;
}

rule onlyOrderbookCanTransferCard(
    env e, address from, address to, uint256 card, uint256 price, uint256 timeHeldLimit
) {
    require e.msg.sender != orderbook();
    transferCard@withrevert(e, from, to, card, price, timeHeldLimit);
    bool reverted = lastReverted;
    assert reverted, "transferCard must revert for non-orderbook callers";
}

rule withdrawRevertsIfAlreadyWithdrawn(env e) {
    require userAlreadyWithdrawn(e.msg.sender);
    withdraw@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "withdraw must revert if user already withdrawn";
}

rule claimCardRevertsIfAlreadyClaimed(env e, uint256 card) {
    require userAlreadyClaimed(card, e.msg.sender);
    claimCard@withrevert(e, card);
    bool reverted = lastReverted;
    assert reverted, "claimCard must revert if user already claimed this card";
}
