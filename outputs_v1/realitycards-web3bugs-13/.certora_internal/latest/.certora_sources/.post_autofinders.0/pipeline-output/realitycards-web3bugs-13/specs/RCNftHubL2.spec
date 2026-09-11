use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function factoryAddress() external returns (address) envfree;
    function isMarket(address) external returns (bool) envfree;
    function withdrawnTokens(uint256) external returns (bool) envfree;

    function addMarket(address) external;
    function setFactoryAddress(address) external;
    function mint(address, uint256, string) external;
    function transferNft(address, address, uint256) external;
    function withdraw(uint256) external;
    function withdrawWithMetadata(uint256) external;
    function transferFrom(address, address, uint256) external;
    function safeTransferFrom(address, address, uint256, bytes) external;
}

rule onlyFactoryCanAddMarket(env e, address marketAddr) {
    require e.msg.sender != factoryAddress();
    addMarket@withrevert(e, marketAddr);
    bool reverted = lastReverted;
    assert reverted, "addMarket must revert for non-factory callers";
}

rule onlyFactoryCanMint(env e, address user, uint256 tokenId, string uri) {
    require e.msg.sender != factoryAddress();
    mint@withrevert(e, user, tokenId, uri);
    bool reverted = lastReverted;
    assert reverted, "mint must revert for non-factory callers";
}

rule onlyOwnerCanSetFactoryAddress(env e, address addr) {
    require e.msg.sender != owner();
    setFactoryAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setFactoryAddress must revert for non-owner";
}

rule onlyMarketsCanTransferNft(env e, address from, address to, uint256 tokenId) {
    require !isMarket(e.msg.sender);
    transferNft@withrevert(e, from, to, tokenId);
    bool reverted = lastReverted;
    assert reverted, "transferNft must revert for non-market callers";
}

rule withdrawRevertsIfTokenAlreadyWithdrawn(env e, uint256 tokenId) {
    require withdrawnTokens(tokenId);
    withdraw@withrevert(e, tokenId);
    bool reverted = lastReverted;
    assert reverted, "withdraw must revert if token already withdrawn to L1";
}

rule withdrawWithMetadataRevertsIfTokenAlreadyWithdrawn(env e, uint256 tokenId) {
    require withdrawnTokens(tokenId);
    withdrawWithMetadata@withrevert(e, tokenId);
    bool reverted = lastReverted;
    assert reverted, "withdrawWithMetadata must revert if token already withdrawn to L1";
}
