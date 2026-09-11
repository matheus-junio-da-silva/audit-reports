# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: Clones
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `clone(address)` | **internal** | Yes | None | None direct | None |
| `cloneDeterministic(address,bytes32)` | **internal** | Yes | None | None direct | None |
| `predictDeterministicAddress(address,bytes32,address)` | **internal** | Yes | None | None direct | None |
| `predictDeterministicAddress(address,bytes32)` | **internal** | Yes | None | None direct | None |

---

## Contract: IERC721Receiver
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `onERC721Received(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: Address
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `isContract(address)` | **internal** | Yes | None | None direct | None |
| `sendValue(address,uint256)` | **internal** | Yes | None | None direct | None |
| `functionCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `functionCallWithValue(address,bytes,uint256)` | **internal** | Yes | None | None direct | None |
| `functionCallWithValue(address,bytes,uint256,string)` | **internal** | Yes | None | None direct | None |
| `functionStaticCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionStaticCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `functionDelegateCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionDelegateCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `_verifyCallResult(bool,bytes,string)` | **private** | Yes | None | None direct | None |

---

## Contract: Strings
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes16 alphabet`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `toString(uint256)` | **internal** | Yes | None | None direct | None |
| `toHexString(uint256)` | **internal** | Yes | None | None direct | None |
| `toHexString(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | alphabet |

---

## Contract: SafeCast
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `toUint128(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint64(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint32(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint16(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint8(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint256(int256)` | **internal** | Yes | None | None direct | None |
| `toInt128(int256)` | **internal** | Yes | None | None direct | None |
| `toInt64(int256)` | **internal** | Yes | None | None direct | None |
| `toInt32(int256)` | **internal** | Yes | None | None direct | None |
| `toInt16(int256)` | **internal** | Yes | None | None direct | None |
| `toInt8(int256)` | **internal** | Yes | None | None direct | None |
| `toInt256(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: Migrations
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setCompleted(uint256)` | **public** | No (msg/tx) | restricted | None direct | last_completed_migration |
| `upgrade(address)` | **public** | No (msg/tx) | restricted | None direct | None |

---

## Contract: RCFactory
**Linearized C3 Inheritance Tree:** IRCFactory -> NativeMetaTransaction -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address uberOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `nfthub()` | **external** | Yes | None | None direct | None |
| `treasury()` | **external** | Yes | None | None direct | None |
| `orderbook()` | **external** | Yes | None | None direct | None |
| `getPotDistribution()` | **external** | Yes | None | None direct | None |
| `minimumPriceIncreasePercent()` | **external** | Yes | None | None direct | None |
| `trapIfUnapproved()` | **external** | Yes | None | None direct | None |
| `isMarketApproved(address)` | **external** | Yes | None | None direct | None |
| `maxRentIterations()` | **external** | Yes | None | None direct | None |
| `setminimumPriceIncreasePercent(uint256)` | **external** | Yes | None | None direct | None |
| `setNFTMintingLimit(uint256)` | **external** | Yes | None | None direct | None |
| `setMaxRentIterations(uint256)` | **external** | Yes | None | None direct | None |
| `getOracleSettings()` | **external** | Yes | None | None direct | None |
| `owner()` | **external** | Yes | None | None direct | None |
| `isGovernor(address)` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `getMostRecentMarket(uint256)` | **external** | Yes | None | None direct | None |
| `getAllMarkets(uint256)` | **external** | Yes | None | None direct | None |
| `getPotDistribution()` | **external** | Yes | None | None direct | None |
| `setNftHubAddress(IRCNftHubL2,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | nfthub, totalNftMintCount |
| `setOrderbookAddress(IRCOrderbook)` | **external** | No (msg/tx) | onlyOwner | None direct | orderbook |
| `setPotDistribution(uint256,uint256,uint256,uint256,uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | potDistribution |
| `setminimumPriceIncreasePercent(uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | minimumPriceIncreasePercent |
| `setNFTMintingLimit(uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | nftMintingLimit |
| `setMaxRentIterations(uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | maxRentIterations |
| `setRealitioAddress(address)` | **public** | No (msg/tx) | onlyOwner | None direct | realitio |
| `setArbitrator(address)` | **public** | No (msg/tx) | onlyOwner | None direct | arbitrator |
| `setTimeout(uint32)` | **public** | No (msg/tx) | onlyOwner | None direct | timeout |
| `changeMarketCreationGovernorsOnly()` | **external** | No (msg/tx) | onlyOwner | None direct | marketCreationGovernorsOnly |
| `changeApprovedArtistsOnly()` | **external** | No (msg/tx) | onlyOwner | None direct | approvedArtistsOnly |
| `changeApprovedAffilliatesOnly()` | **external** | No (msg/tx) | onlyOwner | None direct | approvedAffilliatesOnly |
| `setSponsorshipRequired(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | sponsorshipRequired |
| `changeTrapCardsIfUnapproved()` | **external** | No (msg/tx) | onlyOwner | None direct | trapIfUnapproved |
| `setAdvancedWarning(uint32)` | **external** | No (msg/tx) | onlyOwner | None direct | advancedWarning |
| `setMaximumDuration(uint32)` | **external** | No (msg/tx) | onlyOwner | None direct | maximumDuration |
| `owner()` | **public** | Yes | None | None direct | None |
| `isGovernor(address)` | **external** | Yes | None | None direct | None |
| `changeGovernorApproval(address)` | **external** | No (msg/tx) | onlyOwner | None direct | governors |
| `changeMarketApproval(address)` | **external** | No (msg/tx) | onlyGovernors | None direct | isMarketApproved |
| `changeArtistApproval(address)` | **external** | No (msg/tx) | onlyGovernors | None direct | isArtistApproved |
| `changeAffiliateApproval(address)` | **external** | No (msg/tx) | onlyGovernors | None direct | isAffiliateApproved |
| `changeCardAffiliateApproval(address)` | **external** | No (msg/tx) | onlyGovernors | None direct | isCardAffiliateApproved |
| `setReferenceContractAddress(address)` | **external** | No (msg/tx) | None | None direct | referenceContractAddress, referenceContractVersion |
| `changeUberOwner(address)` | **external** | No (msg/tx) | None | None direct | uberOwner |
| `createMarket(uint32,string,uint32[],string[],address,address,address[],string,uint256)` | **external** | No (msg/tx) | None | None direct | mappingOfMarkets, marketAddresses, totalNftMintCount |
| `getOracleSettings()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | approvedAffilliatesOnly, approvedArtistsOnly, marketCreationGovernorsOnly, trapIfUnapproved |

---

## Contract: RCMarket
**Linearized C3 Inheritance Tree:** IRCMarket -> NativeMetaTransaction -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 MAX_UINT256`
- Privilege: `uint256 MIN_RENTAL_VALUE`
- Privilege: `bool isMarket`
- Privilege: `mapping(uint256 => address) longestOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `isMarket()` | **external** | Yes | None | None direct | None |
| `sponsor(address,uint256)` | **external** | Yes | None | None direct | None |
| `sponsor(uint256)` | **external** | Yes | None | None direct | None |
| `initialize(uint256,uint32[],uint256,uint256,address,address,address[],address,string)` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `state()` | **external** | Yes | None | None direct | None |
| `collectRentAllCards()` | **external** | Yes | None | None direct | None |
| `exitAll()` | **external** | Yes | None | None direct | None |
| `exit(uint256)` | **external** | Yes | None | None direct | None |
| `marketLockingTime()` | **external** | Yes | None | None direct | None |
| `transferCard(address,address,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `initialize(uint256,uint32[],uint256,uint256,address,address,address[],address,string)` | **external** | No (msg/tx) | initializer | None direct | affiliateAddress, affiliateCut, arbitrator, artistAddress, artistCut, cardAffiliateAddresses, cardAffiliateCut, creatorCut, factory, marketCreatorAddress, marketLockingTime, marketOpeningTime, maxRentIterations, minRentalDayDivisor, minimumPriceIncreasePercent, mode, nfthub, numberOfCards, oracleResolutionTime, orderbook, questionFinalised, realitio, timeout, totalNftMintCount, treasury, winnerCut, winningOutcome |
| `upgradeCard(uint256)` | **external** | No (msg/tx) | onlyTokenOwner | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_transferCard(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `transferCard(address,address,uint256,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | cardPrice, cardTimeLimit |
| `_postQuestionToOracle(string,uint32)` | **internal** | Yes | None | None direct | questionId |
| `isFinalized()` | **public** | Yes | None | None direct | None |
| `getWinnerFromOracle()` | **external** | No (msg/tx) | None | None direct | questionFinalised |
| `setAmicableResolution(uint256)` | **external** | No (msg/tx) | None | None direct | questionFinalised |
| `lockMarket()` | **public** | No (msg/tx) | None | None direct | None |
| `setWinner(uint256)` | **internal** | No (msg/tx) | None | None direct | marketLockingTime, winningOutcome |
| `withdraw()` | **external** | No (msg/tx) | None | None direct | userAlreadyWithdrawn |
| `claimCard(uint256)` | **external** | No (msg/tx) | None | None direct | userAlreadyClaimed |
| `_payoutWinnings()` | **internal** | No (msg/tx) | None | None direct | None |
| `_returnRent()` | **internal** | No (msg/tx) | None | None direct | None |
| `_payout(address,uint256)` | **internal** | Yes | None | None direct | None |
| `payArtist()` | **external** | Yes | None | None direct | artistPaid |
| `payMarketCreator()` | **external** | Yes | None | None direct | creatorPaid |
| `payAffiliate()` | **external** | Yes | None | None direct | affiliatePaid |
| `payCardAffiliate(uint256)` | **external** | Yes | None | None direct | cardAffiliatePaid |
| `_processStakeholderPayment(uint256,address)` | **internal** | Yes | None | None direct | None |
| `collectRentAllCards()` | **public** | No (msg/tx) | None | None direct | None |
| `rentAllCards(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `newRental(uint256,uint256,address,uint256)` | **public** | No (msg/tx) | autoUnlock, autoLock | None direct | None |
| `_checkTimeHeldLimit(uint256)` | **internal** | Yes | None | None direct | None |
| `updateTimeHeldLimit(uint256,uint256)` | **external** | No (msg/tx) | None | None direct | cardTimeLimit |
| `exitAll()` | **external** | No (msg/tx) | None | None direct | None |
| `exit(uint256)` | **public** | No (msg/tx) | None | None direct | exitedTimestamp |
| `sponsor(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `sponsor(address,uint256)` | **external** | Yes | None | None direct | None |
| `_sponsor(address,uint256)` | **internal** | Yes | None | None direct | rentCollectedPerCard, rentCollectedPerUser, totalRentCollected |
| `_collectRentAction(uint256)` | **internal** | No (msg/tx) | None | None direct | timeLastCollected |
| `_collectRent(uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_processRentCollection(address,uint256,uint256)` | **internal** | Yes | None | None direct | cardTimeLimit, longestOwner, longestTimeHeld, rentCollectedPerCard, rentCollectedPerUser, rentCollectedPerUserPerCard, timeHeld, timeLastCollected, totalRentCollected, totalTimeHeld |
| `_checkState(IRCMarket.States)` | **internal** | Yes | None | None direct | None |
| `_checkNotState(IRCMarket.States)` | **internal** | Yes | None | None direct | None |
| `_incrementState()` | **internal** | Yes | None | None direct | state |
| `circuitBreaker()` | **external** | No (msg/tx) | None | None direct | state |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | MAX_UINT256, MIN_RENTAL_VALUE, isMarket |

---

## Contract: RCOrderbook
**Linearized C3 Inheritance Tree:** IRCOrderbook -> NativeMetaTransaction -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `mapping(address => mapping(uint256 => address)) ownerOf`
- Privilege: `address uberOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `changeUberOwner(address)` | **external** | Yes | None | None direct | None |
| `setFactoryAddress(address)` | **external** | Yes | None | None direct | None |
| `addMarket(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `setLimits(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `addBidToOrderbook(address,uint256,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `removeBidFromOrderbook(address,uint256)` | **external** | Yes | None | None direct | None |
| `closeMarket()` | **external** | Yes | None | None direct | None |
| `findNewOwner(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getBidValue(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTimeHeldlimit(address,uint256)` | **external** | Yes | None | None direct | None |
| `bidExists(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `setTimeHeldlimit(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `removeUserFromOrderbook(address)` | **external** | Yes | None | None direct | None |
| `removeOldBids(address)` | **external** | Yes | None | None direct | None |
| `reduceTimeHeldLimit(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `changeUberOwner(address)` | **external** | No (msg/tx) | None | None direct | uberOwner |
| `setFactoryAddress(address)` | **external** | No (msg/tx) | None | None direct | factoryAddress |
| `setLimits(uint256,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | cleaningLoops, maxDeletions, maxSearchIterations |
| `addMarket(address,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | index, isMarket, market, user |
| `addBidToOrderbook(address,uint256,uint256,uint256,address)` | **external** | No (msg/tx) | onlyMarkets | None direct | userClosedMarketIndex |
| `_searchOrderbook(RCOrderbook.Bid,address,uint256,uint256)` | **internal** | Yes | None | None direct | user |
| `_newBidInOrderbook(address,address,uint256,uint256,uint256,RCOrderbook.Bid)` | **internal** | No (msg/tx) | None | None direct | index, nonce, user |
| `_updateBidInOrderbook(address,address,uint256,uint256,uint256,RCOrderbook.Bid)` | **internal** | No (msg/tx) | None | None direct | nonce, user |
| `removeBidFromOrderbook(address,uint256)` | **public** | No (msg/tx) | onlyMarkets | None direct | index, user |
| `_removeBidFromOrderbookIgnoreOwner(address,uint256)` | **internal** | No (msg/tx) | None | None direct | index, user |
| `findNewOwner(uint256,uint256)` | **external** | No (msg/tx) | onlyMarkets | None direct | None |
| `removeUserFromOrderbook(address)` | **external** | No (msg/tx) | None | None direct | index, user |
| `closeMarket()` | **external** | No (msg/tx) | onlyMarkets | None direct | closedMarkets, user |
| `removeOldBids(address)` | **external** | Yes | None | None direct | index, user, userClosedMarketIndex |
| `cleanWastePile()` | **internal** | Yes | None | None direct | index, user |
| `bidExists(address,address,uint256)` | **public** | Yes | None | None direct | None |
| `getBidValue(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `getBid(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getTimeHeldlimit(address,uint256)` | **external** | No (msg/tx) | onlyMarkets | None direct | None |
| `setTimeHeldlimit(address,uint256,uint256)` | **external** | No (msg/tx) | onlyMarkets | None direct | user |
| `reduceTimeHeldLimit(address,uint256,uint256)` | **external** | No (msg/tx) | onlyMarkets | None direct | user |
| `transferCard(address,uint256,address,address,uint256)` | **internal** | Yes | None | None direct | ownerOf |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | cleaningLoops, maxDeletions, maxSearchIterations |

---

## Contract: RCTreasury
**Linearized C3 Inheritance Tree:** IRCTreasury -> NativeMetaTransaction -> Ownable -> Context
**Pausable Safety (Unprotected Mutative Actions):** ⚠️ Warning: `setTokenAddress`, `refundUser`, `addMarket`, `setMinRental`, `setMaxContractBalance`, `setBridgeAddress`, `changeGlobalPause`, `changePauseMarket`, `setFactoryAddress`, `changeUberOwner`, `erc20`, `deposit`, `withdrawDeposit`, `payRent`, `payout`, `sponsor`, `updateLastRentalTime`, `updateRentalRate`, `increaseBidRate`, `decreaseBidRate`, `resetUser`, `collectRentUser`, `topupMarketBalance`, `toggleWhitelist`, `addToWhitelist`, `batchAddToWhitelist`, `executeMetaTransaction`, `renounceOwnership`, `transferOwnership`, `addMarket`, `setMinRental`, `setMaxContractBalance`, `changeGlobalPause`, `changePauseMarket`, `toggleWhitelist`, `addToWhitelist`, `batchAddToWhitelist`, `setFactoryAddress`, `setOrderbookAddress`, `setNftHubAddress`, `setTokenAddress`, `setBridgeAddress`, `changeUberOwner`, `deposit`, `withdrawDeposit`, `topupMarketBalance`, `payRent`, `payout`, `refundUser`, `sponsor`, `updateLastRentalTime`, `updateRentalRate`, `increaseBidRate`, `decreaseBidRate`, `resetUser`, `collectRentUser`

### Configured Privileges & Roles
- Privilege: `address uberOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setTokenAddress(address)` | **external** | Yes | None | None direct | None |
| `foreclosureTimeUser(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `refundUser(address,uint256)` | **external** | Yes | None | None direct | None |
| `bridgeAddress()` | **external** | Yes | None | None direct | None |
| `factoryAddress()` | **external** | Yes | None | None direct | None |
| `isMarket(address)` | **external** | Yes | None | None direct | None |
| `isForeclosed(address)` | **external** | Yes | None | None direct | None |
| `totalDeposits()` | **external** | Yes | None | None direct | None |
| `marketPot(address)` | **external** | Yes | None | None direct | None |
| `totalMarketPots()` | **external** | Yes | None | None direct | None |
| `minRentalDayDivisor()` | **external** | Yes | None | None direct | None |
| `maxContractBalance()` | **external** | Yes | None | None direct | None |
| `globalPause()` | **external** | Yes | None | None direct | None |
| `marketPaused(address)` | **external** | Yes | None | None direct | None |
| `uberOwner()` | **external** | Yes | None | None direct | None |
| `addMarket(address)` | **external** | Yes | None | None direct | None |
| `setMinRental(uint256)` | **external** | Yes | None | None direct | None |
| `setMaxContractBalance(uint256)` | **external** | Yes | None | None direct | None |
| `setBridgeAddress(address)` | **external** | Yes | None | None direct | None |
| `changeGlobalPause()` | **external** | Yes | None | None direct | None |
| `changePauseMarket(address)` | **external** | Yes | None | None direct | None |
| `setFactoryAddress(address)` | **external** | Yes | None | None direct | None |
| `changeUberOwner(address)` | **external** | Yes | None | None direct | None |
| `erc20()` | **external** | Yes | None | None direct | None |
| `deposit(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawDeposit(uint256,bool)` | **external** | Yes | None | None direct | None |
| `payRent(uint256)` | **external** | Yes | None | None direct | None |
| `payout(address,uint256)` | **external** | Yes | None | None direct | None |
| `sponsor(address,uint256)` | **external** | Yes | None | None direct | None |
| `updateLastRentalTime(address)` | **external** | Yes | None | None direct | None |
| `userTotalBids(address)` | **external** | Yes | None | None direct | None |
| `checkSponsorship(address,uint256)` | **external** | Yes | None | None direct | None |
| `updateRentalRate(address,address,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `increaseBidRate(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseBidRate(address,uint256)` | **external** | Yes | None | None direct | None |
| `resetUser(address)` | **external** | Yes | None | None direct | None |
| `collectRentUser(address,uint256)` | **external** | Yes | None | None direct | None |
| `userDeposit(address)` | **external** | Yes | None | None direct | None |
| `topupMarketBalance(uint256)` | **external** | Yes | None | None direct | None |
| `toggleWhitelist()` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | Yes | None | None direct | None |
| `batchAddToWhitelist(address[])` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `addMarket(address)` | **external** | No (msg/tx) | None | None direct | isMarket |
| `setMinRental(uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | minRentalDayDivisor |
| `setMaxContractBalance(uint256)` | **public** | No (msg/tx) | onlyOwner | None direct | maxContractBalance |
| `changeGlobalPause()` | **external** | No (msg/tx) | onlyOwner | None direct | globalPause |
| `changePauseMarket(address)` | **external** | No (msg/tx) | onlyOwner | None direct | marketPaused |
| `toggleWhitelist()` | **external** | No (msg/tx) | onlyOwner | None direct | whitelistEnabled |
| `addToWhitelist(address)` | **public** | No (msg/tx) | None | None direct | isAllowed |
| `batchAddToWhitelist(address[])` | **public** | No (msg/tx) | None | None direct | None |
| `setFactoryAddress(address)` | **external** | No (msg/tx) | None | None direct | factoryAddress |
| `setOrderbookAddress(address)` | **external** | No (msg/tx) | None | None direct | orderbook |
| `setNftHubAddress(address)` | **external** | No (msg/tx) | None | None direct | nfthub |
| `setTokenAddress(address)` | **public** | No (msg/tx) | None | None direct | erc20 |
| `setBridgeAddress(address)` | **public** | No (msg/tx) | None | None direct | bridgeAddress |
| `changeUberOwner(address)` | **external** | No (msg/tx) | None | None direct | uberOwner |
| `deposit(uint256,address)` | **public** | No (msg/tx) | balancedBooks | None direct | isForeclosed, totalDeposits, user |
| `withdrawDeposit(uint256,bool)` | **external** | No (msg/tx) | balancedBooks | None direct | isForeclosed, totalDeposits, user |
| `topupMarketBalance(uint256)` | **external** | No (msg/tx) | None | None direct | marketBalance, marketBalanceDiscrepancy |
| `checkSponsorship(address,uint256)` | **external** | Yes | None | None direct | None |
| `payRent(uint256)` | **external** | No (msg/tx) | balancedBooks, onlyMarkets | None direct | marketBalance, marketBalanceDiscrepancy, marketPot, totalMarketPots |
| `payout(address,uint256)` | **external** | No (msg/tx) | balancedBooks, onlyMarkets | None direct | marketPot, totalDeposits, totalMarketPots, user |
| `refundUser(address,uint256)` | **external** | No (msg/tx) | onlyMarkets | None direct | isForeclosed, marketBalance, totalDeposits, user |
| `sponsor(address,uint256)` | **external** | No (msg/tx) | balancedBooks, onlyMarkets | None direct | marketPot, totalMarketPots |
| `updateLastRentalTime(address)` | **external** | No (msg/tx) | onlyMarkets | None direct | user |
| `userTotalBids(address)` | **external** | Yes | None | None direct | None |
| `userDeposit(address)` | **external** | Yes | None | None direct | None |
| `updateRentalRate(address,address,uint256,uint256,uint256)` | **external** | No (msg/tx) | onlyOrderbook | None direct | user |
| `increaseBidRate(address,uint256)` | **external** | No (msg/tx) | onlyOrderbook | None direct | user |
| `decreaseBidRate(address,uint256)` | **external** | No (msg/tx) | onlyOrderbook | None direct | user |
| `resetUser(address)` | **external** | No (msg/tx) | onlyOrderbook | None direct | isForeclosed |
| `rentOwedUser(address,uint256)` | **internal** | Yes | None | None direct | None |
| `rentOwedBetweenTimestmaps(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `depositAbleToWithdraw(address)` | **internal** | No (msg/tx) | None | None direct | None |
| `foreclosureTimeUser(address,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `collectRentUser(address,uint256)` | **public** | Yes | None | None direct | isForeclosed, user |
| `_increaseMarketBalance(uint256,address)` | **internal** | Yes | None | None direct | marketBalance, totalDeposits, user |

---

## Contract: IERC20Dai
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,bool,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |

---

## Contract: IRCBridge
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdrawToMainnet(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IRealitio
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `askQuestion(uint256,string,address,uint32,uint32,uint256)` | **external** | Yes | None | None direct | None |
| `resultFor(bytes32)` | **external** | Yes | None | None direct | None |
| `isFinalized(bytes32)` | **external** | Yes | None | None direct | None |
| `getContentHash(bytes32)` | **external** | Yes | None | None direct | None |

---

## Contract: BridgeMockup
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `requireToPassMessage(address,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `messageSender()` | **external** | No (msg/tx) | None | None direct | None |
| `setProxyL1Address(address)` | **external** | Yes | None | None direct | oracleProxyMainnetAddress |
| `setProxyL2Address(address)` | **external** | Yes | None | None direct | oracleProxyXdaiAddress |

---

## Contract: DaiMockup
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | Yes | None | None direct | None |

---

## Contract: RealitioMockup
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setResult(uint256)` | **public** | Yes | None | None direct | result |
| `askQuestion(uint256,string,address,uint32,uint32,uint256)` | **external** | No (msg/tx) | None | None direct | actualContentHash, actualQuestionId |
| `resultFor(bytes32)` | **external** | Yes | None | None direct | None |
| `isFinalized(bytes32)` | **external** | Yes | None | None direct | None |
| `getContentHash(bytes32)` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | result |

---

## Contract: SelfDestructMockup
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `killme(address)` | **public** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---

## Contract: tokenMockup
**Linearized C3 Inheritance Tree:** ERC20PresetFixedSupply -> ERC20Burnable -> ERC20 -> IERC20Metadata -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `burn(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |

---

## Contract: RCNftHubL1
**Linearized C3 Inheritance Tree:** IRCNftHubL1 -> NativeMetaTransaction -> AccessControl -> ERC721URIStorage -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> IAccessControl -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 DEFAULT_ADMIN_ROLE`
- Privilege: `bytes32 PREDICATE_ROLE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `exists(uint256)` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `hasRole(bytes32,address)` | **public** | Yes | None | None direct | None |
| `_checkRole(bytes32,address)` | **internal** | Yes | None | None direct | None |
| `getRoleAdmin(bytes32)` | **public** | Yes | None | None direct | None |
| `grantRole(bytes32,address)` | **public** | No (msg/tx) | onlyRole | None direct | None |
| `revokeRole(bytes32,address)` | **public** | No (msg/tx) | onlyRole | None direct | None |
| `renounceRole(bytes32,address)` | **public** | No (msg/tx) | None | None direct | None |
| `_setupRole(bytes32,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_setRoleAdmin(bytes32,bytes32)` | **internal** | Yes | None | None direct | _roles |
| `_grantRole(bytes32,address)` | **private** | No (msg/tx) | None | None direct | _roles |
| `_revokeRole(bytes32,address)` | **private** | No (msg/tx) | None | None direct | _roles |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `hasRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `getRoleAdmin(bytes32)` | **external** | Yes | None | None direct | None |
| `grantRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `revokeRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `renounceRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_setTokenURI(uint256,string)` | **internal** | Yes | None | None direct | _tokenURIs |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _tokenURIs |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | _operatorApprovals |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyRole | None direct | None |
| `mint(address,uint256,bytes)` | **external** | No (msg/tx) | onlyRole | None direct | None |
| `setTokenMetadata(uint256,bytes)` | **internal** | Yes | None | None direct | None |
| `exists(uint256)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DEFAULT_ADMIN_ROLE, PREDICATE_ROLE |

---

## Contract: RCNftHubL2
**Linearized C3 Inheritance Tree:** IRCNftHubL2 -> NativeMetaTransaction -> AccessControl -> ERC721URIStorage -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> IAccessControl -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 DEFAULT_ADMIN_ROLE`
- Privilege: `bytes32 DEPOSITOR_ROLE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `marketTracker(uint256)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `addMarket(address)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,string)` | **external** | Yes | None | None direct | None |
| `transferNft(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `deposit(address,bytes)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `withdrawWithMetadata(uint256)` | **external** | Yes | None | None direct | None |
| `_initializeEIP712(string,string)` | **internal** | Yes | None | None direct | _initializedEIP712 |
| `getNonce(address)` | **public** | Yes | None | None direct | None |
| `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` | **external** | Yes | None | None direct | None |
| `msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `hasRole(bytes32,address)` | **public** | Yes | None | None direct | None |
| `_checkRole(bytes32,address)` | **internal** | Yes | None | None direct | None |
| `getRoleAdmin(bytes32)` | **public** | Yes | None | None direct | None |
| `grantRole(bytes32,address)` | **public** | No (msg/tx) | onlyRole | None direct | None |
| `revokeRole(bytes32,address)` | **public** | No (msg/tx) | onlyRole | None direct | None |
| `renounceRole(bytes32,address)` | **public** | No (msg/tx) | None | None direct | None |
| `_setupRole(bytes32,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_setRoleAdmin(bytes32,bytes32)` | **internal** | Yes | None | None direct | _roles |
| `_grantRole(bytes32,address)` | **private** | No (msg/tx) | None | None direct | _roles |
| `_revokeRole(bytes32,address)` | **private** | No (msg/tx) | None | None direct | _roles |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `hasRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `getRoleAdmin(bytes32)` | **external** | Yes | None | None direct | None |
| `grantRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `revokeRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `renounceRole(bytes32,address)` | **external** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_setTokenURI(uint256,string)` | **internal** | Yes | None | None direct | _tokenURIs |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _tokenURIs |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | _operatorApprovals |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `addMarket(address)` | **external** | No (msg/tx) | None | None direct | isMarket |
| `setFactoryAddress(address)` | **public** | No (msg/tx) | onlyOwner | None direct | factoryAddress |
| `mint(address,uint256,string)` | **external** | No (msg/tx) | None | None direct | marketTracker |
| `transferNft(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `deposit(address,bytes)` | **external** | No (msg/tx) | onlyRole | None direct | withdrawnTokens |
| `withdraw(uint256)` | **external** | No (msg/tx) | None | None direct | withdrawnTokens |
| `withdrawWithMetadata(uint256)` | **external** | No (msg/tx) | None | None direct | withdrawnTokens |
| `encodeTokenMetadata(uint256)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DEFAULT_ADMIN_ROLE, DEPOSITOR_ROLE |

---

## Contract: console
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address CONSOLE_ADDRESS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sendLogPayloadImplementation(bytes)` | **internal** | Yes | None | None direct | None |
| `_castToPure(function(bytes))` | **internal** | Yes | None | None direct | None |
| `_sendLogPayload(bytes)` | **internal** | Yes | None | None direct | None |
| `log()` | **internal** | Yes | None | None direct | None |
| `logInt(int256)` | **internal** | Yes | None | None direct | None |
| `logUint(uint256)` | **internal** | Yes | None | None direct | None |
| `logString(string)` | **internal** | Yes | None | None direct | None |
| `logBool(bool)` | **internal** | Yes | None | None direct | None |
| `logAddress(address)` | **internal** | Yes | None | None direct | None |
| `logBytes(bytes)` | **internal** | Yes | None | None direct | None |
| `logBytes1(bytes1)` | **internal** | Yes | None | None direct | None |
| `logBytes2(bytes2)` | **internal** | Yes | None | None direct | None |
| `logBytes3(bytes3)` | **internal** | Yes | None | None direct | None |
| `logBytes4(bytes4)` | **internal** | Yes | None | None direct | None |
| `logBytes5(bytes5)` | **internal** | Yes | None | None direct | None |
| `logBytes6(bytes6)` | **internal** | Yes | None | None direct | None |
| `logBytes7(bytes7)` | **internal** | Yes | None | None direct | None |
| `logBytes8(bytes8)` | **internal** | Yes | None | None direct | None |
| `logBytes9(bytes9)` | **internal** | Yes | None | None direct | None |
| `logBytes10(bytes10)` | **internal** | Yes | None | None direct | None |
| `logBytes11(bytes11)` | **internal** | Yes | None | None direct | None |
| `logBytes12(bytes12)` | **internal** | Yes | None | None direct | None |
| `logBytes13(bytes13)` | **internal** | Yes | None | None direct | None |
| `logBytes14(bytes14)` | **internal** | Yes | None | None direct | None |
| `logBytes15(bytes15)` | **internal** | Yes | None | None direct | None |
| `logBytes16(bytes16)` | **internal** | Yes | None | None direct | None |
| `logBytes17(bytes17)` | **internal** | Yes | None | None direct | None |
| `logBytes18(bytes18)` | **internal** | Yes | None | None direct | None |
| `logBytes19(bytes19)` | **internal** | Yes | None | None direct | None |
| `logBytes20(bytes20)` | **internal** | Yes | None | None direct | None |
| `logBytes21(bytes21)` | **internal** | Yes | None | None direct | None |
| `logBytes22(bytes22)` | **internal** | Yes | None | None direct | None |
| `logBytes23(bytes23)` | **internal** | Yes | None | None direct | None |
| `logBytes24(bytes24)` | **internal** | Yes | None | None direct | None |
| `logBytes25(bytes25)` | **internal** | Yes | None | None direct | None |
| `logBytes26(bytes26)` | **internal** | Yes | None | None direct | None |
| `logBytes27(bytes27)` | **internal** | Yes | None | None direct | None |
| `logBytes28(bytes28)` | **internal** | Yes | None | None direct | None |
| `logBytes29(bytes29)` | **internal** | Yes | None | None direct | None |
| `logBytes30(bytes30)` | **internal** | Yes | None | None direct | None |
| `logBytes31(bytes31)` | **internal** | Yes | None | None direct | None |
| `logBytes32(bytes32)` | **internal** | Yes | None | None direct | None |
| `log(uint256)` | **internal** | Yes | None | None direct | None |
| `log(string)` | **internal** | Yes | None | None direct | None |
| `log(bool)` | **internal** | Yes | None | None direct | None |
| `log(address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,address)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CONSOLE_ADDRESS |

---
