# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: Migrations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Migrations` |
| `last_completed_migration` | `uint256` | **1** | **0** | Storage | `Migrations` |

---

## Contract: RCFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `_initializedEIP712` | `bool` | **0** | **20** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `NativeMetaTransaction` |
| `treasury` | `IRCTreasury` | **2** | **0** | Storage | `RCFactory` |
| `nfthub` | `IRCNftHubL2` | **3** | **0** | Storage | `RCFactory` |
| `orderbook` | `IRCOrderbook` | **4** | **0** | Storage | `RCFactory` |
| `realitio` | `IRealitio` | **5** | **0** | Storage | `RCFactory` |
| `referenceContractAddress` | `address` | **6** | **0** | Storage | `RCFactory` |
| `referenceContractVersion` | `uint256` | **7** | **0** | Storage | `RCFactory` |
| `marketAddresses` | `mapping(uint256 => address[])` | **8** | **0** | Storage | `RCFactory` |
| `mappingOfMarkets` | `mapping(address => bool)` | **9** | **0** | Storage | `RCFactory` |
| `potDistribution` | `uint256[5]` | **10** | **0** | Storage | `RCFactory` |
| `sponsorshipRequired` | `uint256` | **15** | **0** | Storage | `RCFactory` |
| `minimumPriceIncreasePercent` | `uint256` | **16** | **0** | Storage | `RCFactory` |
| `advancedWarning` | `uint32` | **17** | **0** | Storage | `RCFactory` |
| `maximumDuration` | `uint32` | **17** | **4** | Storage | `RCFactory` |
| `governors` | `mapping(address => bool)` | **18** | **0** | Storage | `RCFactory` |
| `marketCreationGovernorsOnly` | `bool` | **19** | **0** | Storage | `RCFactory` |
| `approvedAffilliatesOnly` | `bool` | **19** | **1** | Storage | `RCFactory` |
| `approvedArtistsOnly` | `bool` | **19** | **2** | Storage | `RCFactory` |
| `trapIfUnapproved` | `bool` | **19** | **3** | Storage | `RCFactory` |
| `uberOwner` | `address` | **19** | **4** | Storage | `RCFactory` |
| `maxRentIterations` | `uint256` | **20** | **0** | Storage | `RCFactory` |
| `arbitrator` | `address` | **21** | **0** | Storage | `RCFactory` |
| `timeout` | `uint32` | **21** | **20** | Storage | `RCFactory` |
| `isMarketApproved` | `mapping(address => bool)` | **22** | **0** | Storage | `RCFactory` |
| `isArtistApproved` | `mapping(address => bool)` | **23** | **0** | Storage | `RCFactory` |
| `isAffiliateApproved` | `mapping(address => bool)` | **24** | **0** | Storage | `RCFactory` |
| `isCardAffiliateApproved` | `mapping(address => bool)` | **25** | **0** | Storage | `RCFactory` |
| `nftMintingLimit` | `uint256` | **26** | **0** | Storage | `RCFactory` |
| `totalNftMintCount` | `uint256` | **27** | **0** | Storage | `RCFactory` |

---

## Contract: RCMarket
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `_initializedEIP712` | `bool` | **0** | **2** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `NativeMetaTransaction` |
| `numberOfCards` | `uint256` | **2** | **0** | Storage | `RCMarket` |
| `state` | `IRCMarket.States` | **3** | **0** | Storage | `RCMarket` |
| `mode` | `RCMarket.Mode` | **3** | **1** | Storage | `RCMarket` |
| `totalNftMintCount` | `uint256` | **4** | **0** | Storage | `RCMarket` |
| `treasury` | `IRCTreasury` | **5** | **0** | Storage | `RCMarket` |
| `factory` | `IRCFactory` | **6** | **0** | Storage | `RCMarket` |
| `nfthub` | `IRCNftHubL2` | **7** | **0** | Storage | `RCMarket` |
| `orderbook` | `IRCOrderbook` | **8** | **0** | Storage | `RCMarket` |
| `cardPrice` | `mapping(uint256 => uint256)` | **9** | **0** | Storage | `RCMarket` |
| `rentCollectedPerUser` | `mapping(address => uint256)` | **10** | **0** | Storage | `RCMarket` |
| `rentCollectedPerCard` | `mapping(uint256 => uint256)` | **11** | **0** | Storage | `RCMarket` |
| `rentCollectedPerUserPerCard` | `mapping(address => mapping(uint256 => uint256))` | **12** | **0** | Storage | `RCMarket` |
| `totalRentCollected` | `uint256` | **13** | **0** | Storage | `RCMarket` |
| `exitedTimestamp` | `mapping(address => uint256)` | **14** | **0** | Storage | `RCMarket` |
| `minimumPriceIncreasePercent` | `uint256` | **15** | **0** | Storage | `RCMarket` |
| `minRentalDayDivisor` | `uint256` | **16** | **0** | Storage | `RCMarket` |
| `maxRentIterations` | `uint256` | **17** | **0** | Storage | `RCMarket` |
| `timeHeld` | `mapping(uint256 => mapping(address => uint256))` | **18** | **0** | Storage | `RCMarket` |
| `totalTimeHeld` | `mapping(uint256 => uint256)` | **19** | **0** | Storage | `RCMarket` |
| `timeLastCollected` | `mapping(uint256 => uint256)` | **20** | **0** | Storage | `RCMarket` |
| `longestTimeHeld` | `mapping(uint256 => uint256)` | **21** | **0** | Storage | `RCMarket` |
| `longestOwner` | `mapping(uint256 => address)` | **22** | **0** | Storage | `RCMarket` |
| `cardTimeLimit` | `mapping(uint256 => uint256)` | **23** | **0** | Storage | `RCMarket` |
| `marketOpeningTime` | `uint32` | **24** | **0** | Storage | `RCMarket` |
| `marketLockingTime` | `uint32` | **24** | **4** | Storage | `RCMarket` |
| `oracleResolutionTime` | `uint32` | **24** | **8** | Storage | `RCMarket` |
| `winningOutcome` | `uint256` | **25** | **0** | Storage | `RCMarket` |
| `userAlreadyWithdrawn` | `mapping(address => bool)` | **26** | **0** | Storage | `RCMarket` |
| `userAlreadyClaimed` | `mapping(uint256 => mapping(address => bool))` | **27** | **0** | Storage | `RCMarket` |
| `artistAddress` | `address` | **28** | **0** | Storage | `RCMarket` |
| `artistCut` | `uint256` | **29** | **0** | Storage | `RCMarket` |
| `artistPaid` | `bool` | **30** | **0** | Storage | `RCMarket` |
| `affiliateAddress` | `address` | **30** | **1** | Storage | `RCMarket` |
| `affiliateCut` | `uint256` | **31** | **0** | Storage | `RCMarket` |
| `affiliatePaid` | `bool` | **32** | **0** | Storage | `RCMarket` |
| `winnerCut` | `uint256` | **33** | **0** | Storage | `RCMarket` |
| `marketCreatorAddress` | `address` | **34** | **0** | Storage | `RCMarket` |
| `creatorCut` | `uint256` | **35** | **0** | Storage | `RCMarket` |
| `creatorPaid` | `bool` | **36** | **0** | Storage | `RCMarket` |
| `cardAffiliateAddresses` | `address[]` | **37** | **0** | Storage | `RCMarket` |
| `cardAffiliateCut` | `uint256` | **38** | **0** | Storage | `RCMarket` |
| `cardAffiliatePaid` | `mapping(uint256 => bool)` | **39** | **0** | Storage | `RCMarket` |
| `questionId` | `bytes32` | **40** | **0** | Storage | `RCMarket` |
| `questionFinalised` | `bool` | **41** | **0** | Storage | `RCMarket` |
| `arbitrator` | `address` | **41** | **1** | Storage | `RCMarket` |
| `timeout` | `uint32` | **41** | **21** | Storage | `RCMarket` |
| `realitio` | `IRealitio` | **42** | **0** | Storage | `RCMarket` |
| `_realitioAddress` | `address` | **43** | **0** | Storage | `RCMarket` |

---

## Contract: RCOrderbook
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `_initializedEIP712` | `bool` | **0** | **20** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `NativeMetaTransaction` |
| `user` | `mapping(address => RCOrderbook.Bid[])` | **2** | **0** | Storage | `RCOrderbook` |
| `index` | `mapping(address => mapping(address => mapping(uint256 => uint256)))` | **3** | **0** | Storage | `RCOrderbook` |
| `market` | `mapping(address => RCOrderbook.Market)` | **4** | **0** | Storage | `RCOrderbook` |
| `isMarket` | `mapping(address => bool)` | **5** | **0** | Storage | `RCOrderbook` |
| `ownerOf` | `mapping(address => mapping(uint256 => address))` | **6** | **0** | Storage | `RCOrderbook` |
| `closedMarkets` | `address[]` | **7** | **0** | Storage | `RCOrderbook` |
| `userClosedMarketIndex` | `mapping(address => uint256)` | **8** | **0** | Storage | `RCOrderbook` |
| `uberOwner` | `address` | **9** | **0** | Storage | `RCOrderbook` |
| `factoryAddress` | `address` | **10** | **0** | Storage | `RCOrderbook` |
| `treasuryAddress` | `address` | **11** | **0** | Storage | `RCOrderbook` |
| `treasury` | `IRCTreasury` | **12** | **0** | Storage | `RCOrderbook` |
| `maxSearchIterations` | `uint256` | **13** | **0** | Storage | `RCOrderbook` |
| `maxDeletions` | `uint256` | **14** | **0** | Storage | `RCOrderbook` |
| `cleaningLoops` | `uint256` | **15** | **0** | Storage | `RCOrderbook` |
| `nonce` | `uint256` | **16** | **0** | Storage | `RCOrderbook` |

---

## Contract: RCTreasury
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `_initializedEIP712` | `bool` | **0** | **20** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `NativeMetaTransaction` |
| `orderbook` | `IRCOrderbook` | **2** | **0** | Storage | `RCTreasury` |
| `nfthub` | `IRCNftHubL2` | **3** | **0** | Storage | `RCTreasury` |
| `erc20` | `IERC20` | **4** | **0** | Storage | `RCTreasury` |
| `bridgeAddress` | `address` | **5** | **0** | Storage | `RCTreasury` |
| `factoryAddress` | `address` | **6** | **0** | Storage | `RCTreasury` |
| `isMarket` | `mapping(address => bool)` | **7** | **0** | Storage | `RCTreasury` |
| `totalDeposits` | `uint256` | **8** | **0** | Storage | `RCTreasury` |
| `marketPot` | `mapping(address => uint256)` | **9** | **0** | Storage | `RCTreasury` |
| `totalMarketPots` | `uint256` | **10** | **0** | Storage | `RCTreasury` |
| `marketBalance` | `uint256` | **11** | **0** | Storage | `RCTreasury` |
| `isForeclosed` | `mapping(address => bool)` | **12** | **0** | Storage | `RCTreasury` |
| `marketBalanceDiscrepancy` | `uint256` | **13** | **0** | Storage | `RCTreasury` |
| `user` | `mapping(address => RCTreasury.User)` | **14** | **0** | Storage | `RCTreasury` |
| `minRentalDayDivisor` | `uint256` | **15** | **0** | Storage | `RCTreasury` |
| `maxContractBalance` | `uint256` | **16** | **0** | Storage | `RCTreasury` |
| `isAllowed` | `mapping(address => bool)` | **17** | **0** | Storage | `RCTreasury` |
| `whitelistEnabled` | `bool` | **18** | **0** | Storage | `RCTreasury` |
| `globalPause` | `bool` | **18** | **1** | Storage | `RCTreasury` |
| `marketPaused` | `mapping(address => bool)` | **19** | **0** | Storage | `RCTreasury` |
| `uberOwner` | `address` | **20** | **0** | Storage | `RCTreasury` |

---

## Contract: BridgeMockup
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `oracleProxyMainnetAddress` | `address` | **0** | **0** | Storage | `BridgeMockup` |
| `oracleProxyXdaiAddress` | `address` | **1** | **0** | Storage | `BridgeMockup` |

---

## Contract: RealitioMockup
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `result` | `uint256` | **0** | **0** | Storage | `RealitioMockup` |
| `actualQuestionId` | `bytes32` | **1** | **0** | Storage | `RealitioMockup` |
| `actualContentHash` | `bytes32` | **2** | **0** | Storage | `RealitioMockup` |

---

## Contract: tokenMockup
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |

---

## Contract: RCNftHubL1
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `_name` | `string` | **1** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **2** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **3** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **5** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **6** | **0** | Storage | `ERC721` |
| `_tokenURIs` | `mapping(uint256 => string)` | **7** | **0** | Storage | `ERC721URIStorage` |
| `_roles` | `mapping(bytes32 => AccessControl.RoleData)` | **8** | **0** | Storage | `AccessControl` |
| `_initializedEIP712` | `bool` | **9** | **0** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **10** | **0** | Storage | `NativeMetaTransaction` |

---

## Contract: RCNftHubL2
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `_name` | `string` | **1** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **2** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **3** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **5** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **6** | **0** | Storage | `ERC721` |
| `_tokenURIs` | `mapping(uint256 => string)` | **7** | **0** | Storage | `ERC721URIStorage` |
| `_roles` | `mapping(bytes32 => AccessControl.RoleData)` | **8** | **0** | Storage | `AccessControl` |
| `_initializedEIP712` | `bool` | **9** | **0** | Storage | `NativeMetaTransaction` |
| `_nonces` | `mapping(address => uint256)` | **10** | **0** | Storage | `NativeMetaTransaction` |
| `isMarket` | `mapping(address => bool)` | **11** | **0** | Storage | `RCNftHubL2` |
| `marketTracker` | `mapping(uint256 => address)` | **12** | **0** | Storage | `RCNftHubL2` |
| `factoryAddress` | `address` | **13** | **0** | Storage | `RCNftHubL2` |
| `withdrawnTokens` | `mapping(uint256 => bool)` | **14** | **0** | Storage | `RCNftHubL2` |

---
