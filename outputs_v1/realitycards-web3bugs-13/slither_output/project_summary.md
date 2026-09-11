# Project Summary

## Contract: Clones
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IERC721Receiver
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `onERC721Received(address,address,uint256,bytes) returns (bytes4)` [external]

---

## Contract: Address
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Strings
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes16 private alphabet` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: SafeCast
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Migrations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public owner` 
- `uint256 public last_completed_migration` 

### Public/External Functions
- `setCompleted(uint256)` [public]
- `upgrade(address)` [public]

---

## Contract: RCFactory
**Inheritance (C3 Linearized):** IRCFactory -> NativeMetaTransaction -> Ownable -> Context

### State Variables & Constants
- `IRCTreasury public treasury` 
- `IRCNftHubL2 public nfthub` 
- `IRCOrderbook public orderbook` 
- `IRealitio public realitio` 
- `address public referenceContractAddress` 
- `uint256 public referenceContractVersion` 
- `mapping(uint256 => address[]) public marketAddresses` 
- `mapping(address => bool) public mappingOfMarkets` 
- `uint256[5] public potDistribution` 
- `uint256 public sponsorshipRequired` 
- `uint256 public minimumPriceIncreasePercent` 
- `uint32 public advancedWarning` 
- `uint32 public maximumDuration` 
- `mapping(address => bool) public governors` 
- `bool public marketCreationGovernorsOnly` 
- `bool public approvedAffilliatesOnly` 
- `bool public approvedArtistsOnly` 
- `bool public trapIfUnapproved` 
- `address public uberOwner` 
- `uint256 public maxRentIterations` 
- `address public arbitrator` 
- `uint32 public timeout` 
- `mapping(address => bool) public isMarketApproved` 
- `mapping(address => bool) public isArtistApproved` 
- `mapping(address => bool) public isAffiliateApproved` 
- `mapping(address => bool) public isCardAffiliateApproved` 
- `uint256 public nftMintingLimit` 
- `uint256 public totalNftMintCount` 

### Public/External Functions
- `nfthub() returns (IRCNftHubL2)` [external]
- `treasury() returns (IRCTreasury)` [external]
- `orderbook() returns (IRCOrderbook)` [external]
- `getPotDistribution() returns (uint256[5])` [external]
- `minimumPriceIncreasePercent() returns (uint256)` [external]
- `trapIfUnapproved() returns (bool)` [external]
- `isMarketApproved(address) returns (bool)` [external]
- `maxRentIterations() returns (uint256)` [external]
- `setminimumPriceIncreasePercent(uint256)` [external]
- `setNFTMintingLimit(uint256)` [external]
- `setMaxRentIterations(uint256)` [external]
- `getOracleSettings() returns (IRealitio, address, uint32)` [external]
- `owner() returns (address)` [external]
- `isGovernor(address) returns (bool)` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `getMostRecentMarket(uint256) returns (address)` [external]
- `getAllMarkets(uint256) returns (address[])` [external]
- `getPotDistribution() returns (uint256[5])` [external]
- `setNftHubAddress(IRCNftHubL2,uint256)` [external]
- `setOrderbookAddress(IRCOrderbook)` [external]
- `setPotDistribution(uint256,uint256,uint256,uint256,uint256)` [public]
- `setminimumPriceIncreasePercent(uint256)` [public]
- `setNFTMintingLimit(uint256)` [public]
- `setMaxRentIterations(uint256)` [public]
- `setRealitioAddress(address)` [public]
- `setArbitrator(address)` [public]
- `setTimeout(uint32)` [public]
- `changeMarketCreationGovernorsOnly()` [external]
- `changeApprovedArtistsOnly()` [external]
- `changeApprovedAffilliatesOnly()` [external]
- `setSponsorshipRequired(uint256)` [external]
- `changeTrapCardsIfUnapproved()` [external]
- `setAdvancedWarning(uint32)` [external]
- `setMaximumDuration(uint32)` [external]
- `owner() returns (address)` [public]
- `isGovernor(address) returns (bool)` [external]
- `changeGovernorApproval(address)` [external]
- `changeMarketApproval(address)` [external]
- `changeArtistApproval(address)` [external]
- `changeAffiliateApproval(address)` [external]
- `changeCardAffiliateApproval(address)` [external]
- `setReferenceContractAddress(address)` [external]
- `changeUberOwner(address)` [external]
- `createMarket(uint32,string,uint32[],string[],address,address,address[],string,uint256) returns (address)` [external]
- `getOracleSettings() returns (IRealitio, address, uint32)` [external]

---

## Contract: RCMarket
**Inheritance (C3 Linearized):** IRCMarket -> NativeMetaTransaction -> Initializable

### State Variables & Constants
- `uint256 public numberOfCards` 
- `uint256 public MAX_UINT256` constant
- `uint256 public MIN_RENTAL_VALUE` constant
- `IRCMarket.States public state` 
- `RCMarket.Mode public mode` 
- `bool public isMarket` constant
- `uint256 public totalNftMintCount` 
- `IRCTreasury public treasury` 
- `IRCFactory public factory` 
- `IRCNftHubL2 public nfthub` 
- `IRCOrderbook public orderbook` 
- `mapping(uint256 => uint256) public cardPrice` 
- `mapping(address => uint256) public rentCollectedPerUser` 
- `mapping(uint256 => uint256) public rentCollectedPerCard` 
- `mapping(address => mapping(uint256 => uint256)) public rentCollectedPerUserPerCard` 
- `uint256 public totalRentCollected` 
- `mapping(address => uint256) public exitedTimestamp` 
- `uint256 public minimumPriceIncreasePercent` 
- `uint256 public minRentalDayDivisor` 
- `uint256 public maxRentIterations` 
- `mapping(uint256 => mapping(address => uint256)) public timeHeld` 
- `mapping(uint256 => uint256) public totalTimeHeld` 
- `mapping(uint256 => uint256) public timeLastCollected` 
- `mapping(uint256 => uint256) public longestTimeHeld` 
- `mapping(uint256 => address) public longestOwner` 
- `mapping(uint256 => uint256) public cardTimeLimit` 
- `uint32 public marketOpeningTime` 
- `uint32 public marketLockingTime` 
- `uint32 public oracleResolutionTime` 
- `uint256 public winningOutcome` 
- `mapping(address => bool) public userAlreadyWithdrawn` 
- `mapping(uint256 => mapping(address => bool)) public userAlreadyClaimed` 
- `address public artistAddress` 
- `uint256 public artistCut` 
- `bool public artistPaid` 
- `address public affiliateAddress` 
- `uint256 public affiliateCut` 
- `bool public affiliatePaid` 
- `uint256 public winnerCut` 
- `address public marketCreatorAddress` 
- `uint256 public creatorCut` 
- `bool public creatorPaid` 
- `address[] public cardAffiliateAddresses` 
- `uint256 public cardAffiliateCut` 
- `mapping(uint256 => bool) public cardAffiliatePaid` 
- `bytes32 public questionId` 
- `bool public questionFinalised` 
- `address public arbitrator` 
- `uint32 public timeout` 
- `IRealitio public realitio` 
- `address public _realitioAddress` 

### Public/External Functions
- `isMarket() returns (bool)` [external]
- `sponsor(address,uint256)` [external]
- `sponsor(uint256)` [external]
- `initialize(uint256,uint32[],uint256,uint256,address,address,address[],address,string)` [external]
- `tokenURI(uint256) returns (string)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `state() returns (IRCMarket.States)` [external]
- `collectRentAllCards() returns (bool)` [external]
- `exitAll()` [external]
- `exit(uint256)` [external]
- `marketLockingTime() returns (uint32)` [external]
- `transferCard(address,address,uint256,uint256,uint256)` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `initialize(uint256,uint32[],uint256,uint256,address,address,address[],address,string)` [external]
- `upgradeCard(uint256)` [external]
- `ownerOf(uint256) returns (address)` [public]
- `tokenURI(uint256) returns (string)` [public]
- `transferCard(address,address,uint256,uint256,uint256)` [external]
- `isFinalized() returns (bool)` [public]
- `getWinnerFromOracle()` [external]
- `setAmicableResolution(uint256)` [external]
- `lockMarket()` [public]
- `withdraw()` [external]
- `claimCard(uint256)` [external]
- `payArtist()` [external]
- `payMarketCreator()` [external]
- `payAffiliate()` [external]
- `payCardAffiliate(uint256)` [external]
- `collectRentAllCards() returns (bool)` [public]
- `rentAllCards(uint256)` [external]
- `newRental(uint256,uint256,address,uint256)` [public]
- `updateTimeHeldLimit(uint256,uint256)` [external]
- `exitAll()` [external]
- `exit(uint256)` [public]
- `sponsor(uint256)` [external]
- `sponsor(address,uint256)` [external]
- `circuitBreaker()` [external]

---

## Contract: RCOrderbook
**Inheritance (C3 Linearized):** IRCOrderbook -> NativeMetaTransaction -> Ownable -> Context

### State Variables & Constants
- `mapping(address => RCOrderbook.Bid[]) public user` 
- `mapping(address => mapping(address => mapping(uint256 => uint256))) public index` 
- `mapping(address => RCOrderbook.Market) public market` 
- `mapping(address => bool) public isMarket` 
- `mapping(address => mapping(uint256 => address)) public ownerOf` 
- `address[] public closedMarkets` 
- `mapping(address => uint256) public userClosedMarketIndex` 
- `address public uberOwner` 
- `address public factoryAddress` 
- `address public treasuryAddress` 
- `IRCTreasury public treasury` 
- `uint256 public maxSearchIterations` 
- `uint256 public maxDeletions` 
- `uint256 public cleaningLoops` 
- `uint256 public nonce` 

### Public/External Functions
- `changeUberOwner(address)` [external]
- `setFactoryAddress(address)` [external]
- `addMarket(address,uint256,uint256)` [external]
- `setLimits(uint256,uint256,uint256)` [external]
- `addBidToOrderbook(address,uint256,uint256,uint256,address)` [external]
- `removeBidFromOrderbook(address,uint256)` [external]
- `closeMarket()` [external]
- `findNewOwner(uint256,uint256) returns (address)` [external]
- `getBidValue(address,uint256) returns (uint256)` [external]
- `getTimeHeldlimit(address,uint256) returns (uint256)` [external]
- `bidExists(address,address,uint256) returns (bool)` [external]
- `setTimeHeldlimit(address,uint256,uint256)` [external]
- `removeUserFromOrderbook(address) returns (bool)` [external]
- `removeOldBids(address)` [external]
- `reduceTimeHeldLimit(address,uint256,uint256)` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `changeUberOwner(address)` [external]
- `setFactoryAddress(address)` [external]
- `setLimits(uint256,uint256,uint256)` [external]
- `addMarket(address,uint256,uint256)` [external]
- `addBidToOrderbook(address,uint256,uint256,uint256,address)` [external]
- `removeBidFromOrderbook(address,uint256)` [public]
- `findNewOwner(uint256,uint256) returns (address)` [external]
- `removeUserFromOrderbook(address) returns (bool)` [external]
- `closeMarket()` [external]
- `removeOldBids(address)` [external]
- `bidExists(address,address,uint256) returns (bool)` [public]
- `getBidValue(address,uint256) returns (uint256)` [external]
- `getBid(address,address,uint256) returns (RCOrderbook.Bid)` [external]
- `getTimeHeldlimit(address,uint256) returns (uint256)` [external]
- `setTimeHeldlimit(address,uint256,uint256)` [external]
- `reduceTimeHeldLimit(address,uint256,uint256)` [external]

---

## Contract: RCTreasury
**Inheritance (C3 Linearized):** IRCTreasury -> NativeMetaTransaction -> Ownable -> Context

### State Variables & Constants
- `IRCOrderbook public orderbook` 
- `IRCNftHubL2 public nfthub` 
- `IERC20 public erc20` 
- `address public bridgeAddress` 
- `address public factoryAddress` 
- `mapping(address => bool) public isMarket` 
- `uint256 public totalDeposits` 
- `mapping(address => uint256) public marketPot` 
- `uint256 public totalMarketPots` 
- `uint256 public marketBalance` 
- `mapping(address => bool) public isForeclosed` 
- `uint256 internal marketBalanceDiscrepancy` 
- `mapping(address => RCTreasury.User) public user` 
- `uint256 public minRentalDayDivisor` 
- `uint256 public maxContractBalance` 
- `mapping(address => bool) public isAllowed` 
- `bool public whitelistEnabled` 
- `bool public globalPause` 
- `mapping(address => bool) public marketPaused` 
- `address public uberOwner` 

### Public/External Functions
- `setTokenAddress(address)` [external]
- `foreclosureTimeUser(address,uint256,uint256) returns (uint256)` [external]
- `refundUser(address,uint256)` [external]
- `bridgeAddress() returns (address)` [external]
- `factoryAddress() returns (address)` [external]
- `isMarket(address) returns (bool)` [external]
- `isForeclosed(address) returns (bool)` [external]
- `totalDeposits() returns (uint256)` [external]
- `marketPot(address) returns (uint256)` [external]
- `totalMarketPots() returns (uint256)` [external]
- `minRentalDayDivisor() returns (uint256)` [external]
- `maxContractBalance() returns (uint256)` [external]
- `globalPause() returns (bool)` [external]
- `marketPaused(address) returns (bool)` [external]
- `uberOwner() returns (address)` [external]
- `addMarket(address)` [external]
- `setMinRental(uint256)` [external]
- `setMaxContractBalance(uint256)` [external]
- `setBridgeAddress(address)` [external]
- `changeGlobalPause()` [external]
- `changePauseMarket(address)` [external]
- `setFactoryAddress(address)` [external]
- `changeUberOwner(address)` [external]
- `erc20() returns (IERC20)` [external]
- `deposit(uint256,address) returns (bool)` [external]
- `withdrawDeposit(uint256,bool)` [external]
- `payRent(uint256) returns (bool)` [external]
- `payout(address,uint256) returns (bool)` [external]
- `sponsor(address,uint256) returns (bool)` [external]
- `updateLastRentalTime(address) returns (bool)` [external]
- `userTotalBids(address) returns (uint256)` [external]
- `checkSponsorship(address,uint256)` [external]
- `updateRentalRate(address,address,uint256,uint256,uint256)` [external]
- `increaseBidRate(address,uint256)` [external]
- `decreaseBidRate(address,uint256)` [external]
- `resetUser(address)` [external]
- `collectRentUser(address,uint256) returns (uint256)` [external]
- `userDeposit(address) returns (uint256)` [external]
- `topupMarketBalance(uint256)` [external]
- `toggleWhitelist()` [external]
- `addToWhitelist(address)` [external]
- `batchAddToWhitelist(address[])` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `addMarket(address)` [external]
- `setMinRental(uint256)` [public]
- `setMaxContractBalance(uint256)` [public]
- `changeGlobalPause()` [external]
- `changePauseMarket(address)` [external]
- `toggleWhitelist()` [external]
- `addToWhitelist(address)` [public]
- `batchAddToWhitelist(address[])` [public]
- `setFactoryAddress(address)` [external]
- `setOrderbookAddress(address)` [external]
- `setNftHubAddress(address)` [external]
- `setTokenAddress(address)` [public]
- `setBridgeAddress(address)` [public]
- `changeUberOwner(address)` [external]
- `deposit(uint256,address) returns (bool)` [public]
- `withdrawDeposit(uint256,bool)` [external]
- `topupMarketBalance(uint256)` [external]
- `checkSponsorship(address,uint256)` [external]
- `payRent(uint256) returns (bool)` [external]
- `payout(address,uint256) returns (bool)` [external]
- `refundUser(address,uint256)` [external]
- `sponsor(address,uint256) returns (bool)` [external]
- `updateLastRentalTime(address) returns (bool)` [external]
- `userTotalBids(address) returns (uint256)` [external]
- `userDeposit(address) returns (uint256)` [external]
- `updateRentalRate(address,address,uint256,uint256,uint256)` [external]
- `increaseBidRate(address,uint256)` [external]
- `decreaseBidRate(address,uint256)` [external]
- `resetUser(address)` [external]
- `foreclosureTimeUser(address,uint256,uint256) returns (uint256)` [external]
- `collectRentUser(address,uint256) returns (uint256)` [public]

---

## Contract: IERC20Dai
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,bool,uint8,bytes32,bytes32)` [external]

---

## Contract: IRCBridge
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `withdrawToMainnet(address,uint256)` [external]

---

## Contract: IRealitio
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `askQuestion(uint256,string,address,uint32,uint32,uint256) returns (bytes32)` [external]
- `resultFor(bytes32) returns (bytes32)` [external]
- `isFinalized(bytes32) returns (bool)` [external]
- `getContentHash(bytes32) returns (bytes32)` [external]

---

## Contract: BridgeMockup
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public oracleProxyMainnetAddress` 
- `address public oracleProxyXdaiAddress` 

### Public/External Functions
- `requireToPassMessage(address,bytes,uint256)` [external]
- `messageSender() returns (address)` [external]
- `setProxyL1Address(address)` [external]
- `setProxyL2Address(address)` [external]

---

## Contract: DaiMockup
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]

---

## Contract: RealitioMockup
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 internal result` 
- `bytes32 public actualQuestionId` 
- `bytes32 public actualContentHash` 

### Public/External Functions
- `setResult(uint256)` [public]
- `askQuestion(uint256,string,address,uint32,uint32,uint256) returns (bytes32)` [external]
- `resultFor(bytes32) returns (bytes32)` [external]
- `isFinalized(bytes32) returns (bool)` [external]
- `getContentHash(bytes32) returns (bytes32)` [external]

---

## Contract: SelfDestructMockup
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `killme(address)` [public]
- `receive()` [external]

---

## Contract: tokenMockup
**Inheritance (C3 Linearized):** ERC20PresetFixedSupply -> ERC20Burnable -> ERC20 -> IERC20Metadata -> IERC20 -> Context

### State Variables & Constants
- None

### Public/External Functions
- `burn(uint256)` [public]
- `burnFrom(address,uint256)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `decreaseAllowance(address,uint256) returns (bool)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

---

## Contract: RCNftHubL1
**Inheritance (C3 Linearized):** IRCNftHubL1 -> NativeMetaTransaction -> AccessControl -> ERC721URIStorage -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> IAccessControl -> Ownable -> Context

### State Variables & Constants
- `bytes32 public DEFAULT_ADMIN_ROLE` constant
- `bytes32 public PREDICATE_ROLE` constant

### Public/External Functions
- `mint(address,uint256)` [external]
- `mint(address,uint256,bytes)` [external]
- `exists(uint256) returns (bool)` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]
- `hasRole(bytes32,address) returns (bool)` [public]
- `getRoleAdmin(bytes32) returns (bytes32)` [public]
- `grantRole(bytes32,address)` [public]
- `revokeRole(bytes32,address)` [public]
- `renounceRole(bytes32,address)` [public]
- `supportsInterface(bytes4) returns (bool)` [public]
- `supportsInterface(bytes4) returns (bool)` [external]
- `hasRole(bytes32,address) returns (bool)` [external]
- `getRoleAdmin(bytes32) returns (bytes32)` [external]
- `grantRole(bytes32,address)` [external]
- `revokeRole(bytes32,address)` [external]
- `renounceRole(bytes32,address)` [external]
- `tokenURI(uint256) returns (string)` [public]
- `supportsInterface(bytes4) returns (bool)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `ownerOf(uint256) returns (address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `tokenURI(uint256) returns (string)` [public]
- `approve(address,uint256)` [public]
- `getApproved(uint256) returns (address)` [public]
- `setApprovalForAll(address,bool)` [public]
- `isApprovedForAll(address,address) returns (bool)` [public]
- `transferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256,bytes)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `tokenURI(uint256) returns (string)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `safeTransferFrom(address,address,uint256)` [external]
- `transferFrom(address,address,uint256)` [external]
- `approve(address,uint256)` [external]
- `getApproved(uint256) returns (address)` [external]
- `setApprovalForAll(address,bool)` [external]
- `isApprovedForAll(address,address) returns (bool)` [external]
- `safeTransferFrom(address,address,uint256,bytes)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `mint(address,uint256)` [external]
- `mint(address,uint256,bytes)` [external]
- `exists(uint256) returns (bool)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]

---

## Contract: RCNftHubL2
**Inheritance (C3 Linearized):** IRCNftHubL2 -> NativeMetaTransaction -> AccessControl -> ERC721URIStorage -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> IAccessControl -> Ownable -> Context

### State Variables & Constants
- `bytes32 public DEFAULT_ADMIN_ROLE` constant
- `mapping(address => bool) public isMarket` 
- `mapping(uint256 => address) public marketTracker` 
- `address public factoryAddress` 
- `bytes32 public DEPOSITOR_ROLE` constant
- `mapping(uint256 => bool) public withdrawnTokens` 

### Public/External Functions
- `marketTracker(uint256) returns (address)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `tokenURI(uint256) returns (string)` [external]
- `addMarket(address)` [external]
- `mint(address,uint256,string) returns (bool)` [external]
- `transferNft(address,address,uint256) returns (bool)` [external]
- `deposit(address,bytes)` [external]
- `withdraw(uint256)` [external]
- `withdrawWithMetadata(uint256)` [external]
- `getNonce(address) returns (uint256)` [public]
- `executeMetaTransaction(address,address,bytes,uint256,bytes,bytes)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]
- `hasRole(bytes32,address) returns (bool)` [public]
- `getRoleAdmin(bytes32) returns (bytes32)` [public]
- `grantRole(bytes32,address)` [public]
- `revokeRole(bytes32,address)` [public]
- `renounceRole(bytes32,address)` [public]
- `supportsInterface(bytes4) returns (bool)` [public]
- `supportsInterface(bytes4) returns (bool)` [external]
- `hasRole(bytes32,address) returns (bool)` [external]
- `getRoleAdmin(bytes32) returns (bytes32)` [external]
- `grantRole(bytes32,address)` [external]
- `revokeRole(bytes32,address)` [external]
- `renounceRole(bytes32,address)` [external]
- `tokenURI(uint256) returns (string)` [public]
- `supportsInterface(bytes4) returns (bool)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `ownerOf(uint256) returns (address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `tokenURI(uint256) returns (string)` [public]
- `approve(address,uint256)` [public]
- `getApproved(uint256) returns (address)` [public]
- `setApprovalForAll(address,bool)` [public]
- `isApprovedForAll(address,address) returns (bool)` [public]
- `transferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256,bytes)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `tokenURI(uint256) returns (string)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `safeTransferFrom(address,address,uint256)` [external]
- `transferFrom(address,address,uint256)` [external]
- `approve(address,uint256)` [external]
- `getApproved(uint256) returns (address)` [external]
- `setApprovalForAll(address,bool)` [external]
- `isApprovedForAll(address,address) returns (bool)` [external]
- `safeTransferFrom(address,address,uint256,bytes)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `addMarket(address)` [external]
- `setFactoryAddress(address)` [public]
- `mint(address,uint256,string) returns (bool)` [external]
- `transferNft(address,address,uint256) returns (bool)` [external]
- `ownerOf(uint256) returns (address)` [public]
- `tokenURI(uint256) returns (string)` [public]
- `deposit(address,bytes)` [external]
- `withdraw(uint256)` [external]
- `withdrawWithMetadata(uint256)` [external]
- `encodeTokenMetadata(uint256) returns (bytes)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]
- `transferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256,bytes)` [public]

---

## Contract: console
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal CONSOLE_ADDRESS` constant

### Public/External Functions
- *No public/external functions.*

---
