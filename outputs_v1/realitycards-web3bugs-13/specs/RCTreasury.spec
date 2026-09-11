use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function uberOwner() external returns (address) envfree;
    function factoryAddress() external returns (address) envfree;
    function isMarket(address) external returns (bool) envfree;
    function whitelistEnabled() external returns (bool) envfree;
    function globalPause() external returns (bool) envfree;

    function setMinRental(uint256) external;
    function setMaxContractBalance(uint256) external;
    function changeGlobalPause() external;
    function toggleWhitelist() external;
    function setFactoryAddress(address) external;
    function setOrderbookAddress(address) external;
    function setNftHubAddress(address) external;
    function setTokenAddress(address) external;
    function setBridgeAddress(address) external;
    function changeUberOwner(address) external;
    function addToWhitelist(address) external;
    function batchAddToWhitelist(address[]) external;
    function addMarket(address) external;
    function deposit(uint256, address) external;
    function payRent(uint256) external;
    function payout(address, uint256) external;
    function refundUser(address, uint256) external;
    function updateRentalRate(address, address, uint256, uint256, uint256) external;
    function increaseBidRate(address, uint256) external;
    function decreaseBidRate(address, uint256) external;
    function resetUser(address) external;
}

// Owner-only functions must revert when called by non-owner
rule onlyOwnerCanSetMinRental(env e, uint256 value) {
    require e.msg.sender != owner();
    setMinRental@withrevert(e, value);
    bool reverted = lastReverted;
    assert reverted, "setMinRental must revert for non-owner";
}

rule onlyOwnerCanSetMaxContractBalance(env e, uint256 value) {
    require e.msg.sender != owner();
    setMaxContractBalance@withrevert(e, value);
    bool reverted = lastReverted;
    assert reverted, "setMaxContractBalance must revert for non-owner";
}

rule onlyOwnerCanChangeGlobalPause(env e) {
    require e.msg.sender != owner();
    changeGlobalPause@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "changeGlobalPause must revert for non-owner";
}

rule onlyOwnerCanToggleWhitelist(env e) {
    require e.msg.sender != owner();
    toggleWhitelist@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "toggleWhitelist must revert for non-owner";
}

// UberOwner-only functions must revert when called by non-uberOwner
rule onlyUberOwnerCanSetFactoryAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setFactoryAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setFactoryAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetOrderbookAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setOrderbookAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setOrderbookAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetNftHubAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setNftHubAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setNftHubAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetTokenAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setTokenAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setTokenAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetBridgeAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setBridgeAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setBridgeAddress must revert for non-uberOwner";
}

rule onlyUberOwnerCanChangeUberOwner(env e, address newOwner) {
    require e.msg.sender != uberOwner();
    changeUberOwner@withrevert(e, newOwner);
    bool reverted = lastReverted;
    assert reverted, "changeUberOwner must revert for non-uberOwner";
}

// Factory-only: addMarket must revert when called by non-factory
rule onlyFactoryCanAddMarket(env e, address marketAddr) {
    require e.msg.sender != factoryAddress();
    addMarket@withrevert(e, marketAddr);
    bool reverted = lastReverted;
    assert reverted, "addMarket must revert for non-factory";
}

// payRent must only be callable by registered markets
rule onlyMarketsCanPayRent(env e, uint256 tokenId) {
    require !isMarket(e.msg.sender);
    payRent@withrevert(e, tokenId);
    bool reverted = lastReverted;
    assert reverted, "payRent must revert for non-market callers";
}

// payout must only be callable by registered markets
rule onlyMarketsCanPayout(env e, address user, uint256 amount) {
    require !isMarket(e.msg.sender);
    payout@withrevert(e, user, amount);
    bool reverted = lastReverted;
    assert reverted, "payout must revert for non-market callers";
}

// refundUser must only be callable by registered markets
rule onlyMarketsCanRefundUser(env e, address user, uint256 amount) {
    require !isMarket(e.msg.sender);
    refundUser@withrevert(e, user, amount);
    bool reverted = lastReverted;
    assert reverted, "refundUser must revert for non-market callers";
}
