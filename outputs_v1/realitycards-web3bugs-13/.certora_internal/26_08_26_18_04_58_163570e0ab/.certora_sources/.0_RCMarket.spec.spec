use builtin rule sanity;

methods {
    function state() external returns (uint8) envfree;
    function factory() external returns (address) envfree;
    function orderbook() external returns (address) envfree;
    function treasury() external returns (address) envfree;
    function ownerOf(uint256) external returns (address) envfree;
    function questionFinalised() external returns (bool) envfree;
    function userAlreadyWithdrawn(address) external returns (bool) envfree;
    function userAlreadyClaimed(uint256, address) external returns (bool) envfree;

    function initialize(
        uint256, uint256, uint256, uint256, address, address, uint256, uint256,
        uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256,
        uint256, address, uint256, uint256, address, uint256, bytes32
    ) external;
    function transferCard(address, address, uint256, uint256, uint256) external;
    function setAmicableResolution(uint256) external;
    function withdraw() external;
    function claimCard(uint256) external;
    function lockMarket() external;
}

// initialize must revert on second call (initializer guard)
rule initializeOnlyOnce(
    env e,
    uint256 numberOfCards, uint256 minRentalDayDivisor, uint256 maxRentIterations,
    uint256 minimumPriceIncreasePercent, address arbitrator_addr, address realitio_addr,
    uint256 timeout_val, uint256 marketOpeningTime, uint256 marketLockingTime,
    uint256 oracleResolutionTime, uint256 artistCut_val, uint256 creatorCut_val,
    uint256 winnerCut_val, uint256 affiliateCut_val, uint256 cardAffiliateCut_val,
    uint256 cardTimeLimit_val, address artistAddress_val, address marketCreatorAddress_val,
    address affiliateAddress_val, uint256, address _treasury, bytes32 _questionId
) {
    initialize@withrevert(e, numberOfCards, minRentalDayDivisor, maxRentIterations,
        minimumPriceIncreasePercent, arbitrator_addr, realitio_addr, timeout_val,
        marketOpeningTime, marketLockingTime, oracleResolutionTime, artistCut_val,
        creatorCut_val, winnerCut_val, affiliateCut_val, cardAffiliateCut_val,
        cardTimeLimit_val, artistAddress_val, marketCreatorAddress_val,
        affiliateAddress_val, 0, _treasury, _questionId);
    bool firstCallReverted = lastReverted;

    initialize@withrevert(e, numberOfCards, minRentalDayDivisor, maxRentIterations,
        minimumPriceIncreasePercent, arbitrator_addr, realitio_addr, timeout_val,
        marketOpeningTime, marketLockingTime, oracleResolutionTime, artistCut_val,
        creatorCut_val, winnerCut_val, affiliateCut_val, cardAffiliateCut_val,
        cardTimeLimit_val, artistAddress_val, marketCreatorAddress_val,
        affiliateAddress_val, 0, _treasury, _questionId);
    bool secondCallReverted = lastReverted;
    assert secondCallReverted, "initialize must revert on second call";
}

// transferCard must only be callable by orderbook
rule onlyOrderbookCanTransferCard(
    env e, address from, address to, uint256 card, uint256 price, uint256 timeHeldLimit
) {
    require e.msg.sender != orderbook();
    transferCard@withrevert(e, from, to, card, price, timeHeldLimit);
    bool reverted = lastReverted;
    assert reverted, "transferCard must revert for non-orderbook callers";
}

// withdraw must revert if user already withdrawn
rule withdrawRevertsIfAlreadyWithdrawn(env e) {
    require userAlreadyWithdrawn(e.msg.sender);
    withdraw@withrevert(e);
    bool reverted = lastReverted;
    assert reverted, "withdraw must revert if user already withdrawn";
}

// claimCard must revert if user already claimed
rule claimCardRevertsIfAlreadyClaimed(env e, uint256 card) {
    require userAlreadyClaimed(card, e.msg.sender);
    claimCard@withrevert(e, card);
    bool reverted = lastReverted;
    assert reverted, "claimCard must revert if user already claimed this card";
}
