use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function uberOwner() external returns (address) envfree;
    function isGovernor(address) external returns (bool) envfree;
    function marketCreationGovernorsOnly() external returns (bool) envfree;

    function changeUberOwner(address) external;
    function setReferenceContractAddress(address) external;
    function setNftHubAddress(address, uint256) external;
    function setOrderbookAddress(address) external;
    function setPotDistribution(uint256, uint256, uint256, uint256, uint256) external;
    function setminimumPriceIncreasePercent(uint256) external;
    function setNFTMintingLimit(uint256) external;
    function setMaxRentIterations(uint256) external;
    function setRealitioAddress(address) external;
    function setArbitrator(address) external;
    function setTimeout(uint32) external;
    function changeMarketCreationGovernorsOnly() external;
    function changeApprovedArtistsOnly() external;
    function changeApprovedAffilliatesOnly() external;
    function setSponsorshipRequired(uint256) external;
    function changeTrapCardsIfUnapproved() external;
    function setAdvancedWarning(uint32) external;
    function setMaximumDuration(uint32) external;
    function changeGovernorApproval(address) external;
    function changeMarketApproval(address) external;
    function changeArtistApproval(address) external;
    function changeAffiliateApproval(address) external;
    function changeCardAffiliateApproval(address) external;
}

rule onlyUberOwnerCanChangeUberOwner(env e, address newOwner) {
    require e.msg.sender != uberOwner();
    changeUberOwner@withrevert(e, newOwner);
    bool reverted = lastReverted;
    assert reverted, "changeUberOwner must revert for non-uberOwner";
}

rule onlyUberOwnerCanSetReferenceContractAddress(env e, address addr) {
    require e.msg.sender != uberOwner();
    setReferenceContractAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setReferenceContractAddress must revert for non-uberOwner";
}

rule onlyOwnerCanSetNftHubAddress(env e, address addr, uint256 count) {
    require e.msg.sender != owner();
    setNftHubAddress@withrevert(e, addr, count);
    bool reverted = lastReverted;
    assert reverted, "setNftHubAddress must revert for non-owner";
}

rule onlyOwnerCanSetOrderbookAddress(env e, address addr) {
    require e.msg.sender != owner();
    setOrderbookAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setOrderbookAddress must revert for non-owner";
}

rule onlyOwnerCanSetPotDistribution(env e, uint256 a, uint256 b, uint256 c, uint256 d, uint256 f) {
    require e.msg.sender != owner();
    setPotDistribution@withrevert(e, a, b, c, d, f);
    bool reverted = lastReverted;
    assert reverted, "setPotDistribution must revert for non-owner";
}

rule onlyOwnerCanSetMinimumPriceIncreasePercent(env e, uint256 val) {
    require e.msg.sender != owner();
    setminimumPriceIncreasePercent@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setminimumPriceIncreasePercent must revert for non-owner";
}

rule onlyOwnerCanSetNFTMintingLimit(env e, uint256 val) {
    require e.msg.sender != owner();
    setNFTMintingLimit@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setNFTMintingLimit must revert for non-owner";
}

rule onlyOwnerCanSetMaxRentIterations(env e, uint256 val) {
    require e.msg.sender != owner();
    setMaxRentIterations@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setMaxRentIterations must revert for non-owner";
}

rule onlyOwnerCanSetRealitioAddress(env e, address addr) {
    require e.msg.sender != owner();
    setRealitioAddress@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setRealitioAddress must revert for non-owner";
}

rule onlyOwnerCanSetArbitrator(env e, address addr) {
    require e.msg.sender != owner();
    setArbitrator@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "setArbitrator must revert for non-owner";
}

rule onlyOwnerCanSetTimeout(env e, uint32 val) {
    require e.msg.sender != owner();
    setTimeout@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setTimeout must revert for non-owner";
}

rule onlyOwnerCanChangeMarketCreationGovernorsOnly(env e) {
    require e.msg.sender != owner();
    changeMarketCreationGovernorsOnly@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "changeMarketCreationGovernorsOnly must revert for non-owner";
}

rule onlyOwnerCanChangeApprovedArtistsOnly(env e) {
    require e.msg.sender != owner();
    changeApprovedArtistsOnly@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "changeApprovedArtistsOnly must revert for non-owner";
}

rule onlyOwnerCanChangeApprovedAffilliatesOnly(env e) {
    require e.msg.sender != owner();
    changeApprovedAffilliatesOnly@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "changeApprovedAffilliatesOnly must revert for non-owner";
}

rule onlyOwnerCanSetSponsorshipRequired(env e, uint256 val) {
    require e.msg.sender != owner();
    setSponsorshipRequired@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setSponsorshipRequired must revert for non-owner";
}

rule onlyOwnerCanChangeTrapCardsIfUnapproved(env e) {
    require e.msg.sender != owner();
    changeTrapCardsIfUnapproved@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "changeTrapCardsIfUnapproved must revert for non-owner";
}

rule onlyOwnerCanSetAdvancedWarning(env e, uint32 val) {
    require e.msg.sender != owner();
    setAdvancedWarning@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setAdvancedWarning must revert for non-owner";
}

rule onlyOwnerCanSetMaximumDuration(env e, uint32 val) {
    require e.msg.sender != owner();
    setMaximumDuration@withrevert(e, val);
    bool reverted = lastReverted;
    assert reverted, "setMaximumDuration must revert for non-owner";
}

rule onlyOwnerCanChangeGovernorApproval(env e, address addr) {
    require e.msg.sender != owner();
    changeGovernorApproval@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "changeGovernorApproval must revert for non-owner";
}

rule onlyGovernorOrOwnerCanChangeMarketApproval(env e, address addr) {
    require !isGovernor(e.msg.sender);
    require e.msg.sender != owner();
    changeMarketApproval@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "changeMarketApproval must revert for non-governor non-owner";
}

rule onlyGovernorOrOwnerCanChangeArtistApproval(env e, address addr) {
    require !isGovernor(e.msg.sender);
    require e.msg.sender != owner();
    changeArtistApproval@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "changeArtistApproval must revert for non-governor non-owner";
}

rule onlyGovernorOrOwnerCanChangeAffiliateApproval(env e, address addr) {
    require !isGovernor(e.msg.sender);
    require e.msg.sender != owner();
    changeAffiliateApproval@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "changeAffiliateApproval must revert for non-governor non-owner";
}

rule onlyGovernorOrOwnerCanChangeCardAffiliateApproval(env e, address addr) {
    require !isGovernor(e.msg.sender);
    require e.msg.sender != owner();
    changeCardAffiliateApproval@withrevert(e, addr);
    bool reverted = lastReverted;
    assert reverted, "changeCardAffiliateApproval must revert for non-governor non-owner";
}
