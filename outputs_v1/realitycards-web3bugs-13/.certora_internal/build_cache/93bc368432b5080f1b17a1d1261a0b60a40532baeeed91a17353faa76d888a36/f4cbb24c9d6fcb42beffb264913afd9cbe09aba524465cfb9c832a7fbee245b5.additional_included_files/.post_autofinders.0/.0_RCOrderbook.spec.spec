use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function uberOwner() external returns (address) envfree;
    function factoryAddress() external returns (address) envfree;
    function isMarket(address) external returns (bool) envfree;

    function changeUberOwner(address) external;
    function setFactoryAddress(address) external;
    function setLimits(uint256, uint256, uint256) external;
    function addMarket(address, uint256, uint256) external;
    function addBidToOrderbook(address, uint256, uint256, uint256, address) external;
    function removeBidFromOrderbook(address, uint256) external;
    function findNewOwner(uint256, uint256) external;
    function closeMarket() external;
    function removeUserFromOrderbook(address) external;
}

rule onlyUberOwnerCanChangeUberOwner(env e, address newOwner) {
    require e.msg.sender != uberOwner();
    changeUberOwner@withrevert(e, newOwner);
    bool reverted = lastReverted;
    assert reverted, "changeUberOwner must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetFactoryAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setFactoryAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setFactoryAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetLimits(env e, uint256 maxDeletions, uint256 cleaningLoops, uint256 maxSearch) {
    require e.msg.sender != uberOwner();
    setLimits@withrevert(e, maxDeletions, cleaningLoops, maxSearch);
    bool reverted = lastReverted;
    assert reverted, "setLimits must revert for non-uberOwner";
}

rule onlyFactoryCanAddMarket(env e, address marketAddr, uint256 tokenCount, uint256 minPrice) {
    require e.msg.sender != factoryAddress();
    addMarket@withrevert(e, marketAddr, tokenCount, minPrice);
    bool reverted = lastReverted;
    assert reverted, "addMarket must revert for non-factory callers";
}

rule onlyMarketsCanAddBidToOrderbook(
    env e, address user, uint256 token, uint256 price, uint256 timeHeldLimit, address prev
) {
    require !isMarket(e.msg.sender);
    addBidToOrderbook@withrevert(e, user, token, price, timeHeldLimit, prev);
    bool reverted = lastReverted;
    assert reverted, "addBidToOrderbook must revert for non-market callers";
}

rule onlyMarketsCanRemoveBidFromOrderbook(env e, address user, uint256 token) {
    require !isMarket(e.msg.sender);
    removeBidFromOrderbook@withrevert(e, user, token);
    bool reverted = lastReverted;
    assert reverted, "removeBidFromOrderbook must revert for non-market callers";
}

rule onlyMarketsCanFindNewOwner(env e, uint256 token, uint256 iterations) {
    require !isMarket(e.msg.sender);
    findNewOwner@withrevert(e, token, iterations);
    bool reverted = lastReverted;
    assert reverted, "findNewOwner must revert for non-market callers";
}

rule onlyMarketsCanCloseMarket(env e) {
    require !isMarket(e.msg.sender);
    closeMarket@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "closeMarket must revert for non-market callers";
}
