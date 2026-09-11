# Project Summary

## Contract: IUniswapV3Factory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `owner() returns (address)` [external]
- `feeAmountTickSpacing(uint24) returns (int24)` [external]
- `getPool(address,address,uint24) returns (address)` [external]
- `createPool(address,address,uint24) returns (address)` [external]
- `setOwner(address)` [external]
- `enableFeeAmount(uint24,int24)` [external]

---

## Contract: Migrations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public owner` 
- `uint256 public last_completed_migration` 

### Public/External Functions
- `setCompleted(uint256)` [public]

---

## Contract: FluxAggregator
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 public version` 
- `uint8 public decimals` 
- `string public description` 
- `int256 public value` 
- `uint80 internal latestRoundId` 

### Public/External Functions
- `setValue(int256)` [public]
- `getRoundData(uint80) returns (uint80, int256, uint256, uint256, uint80)` [external]
- `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)` [external]

---

## Contract: GovernanceTester
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public gov` 
- `uint256 public value` 

### Public/External Functions
- `update(uint256)` [public]

---

## Contract: AggregatorV3Interface
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `decimals() returns (uint8)` [external]
- `description() returns (string)` [external]
- `version() returns (uint256)` [external]
- `getRoundData(uint80) returns (uint80, int256, uint256, uint256, uint80)` [external]
- `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)` [external]

---

## Contract: SafeMathUpgradeable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: AddressUpgradeable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: ECDSA
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: SafeMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: SafeERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Address
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IUniswapV3Pool
**Inheritance (C3 Linearized):** IUniswapV3PoolEvents -> IUniswapV3PoolOwnerActions -> IUniswapV3PoolActions -> IUniswapV3PoolDerivedState -> IUniswapV3PoolState -> IUniswapV3PoolImmutables

### State Variables & Constants
- None

### Public/External Functions
- `setFeeProtocol(uint8,uint8)` [external]
- `collectProtocol(address,uint128,uint128) returns (uint128, uint128)` [external]
- `initialize(uint160)` [external]
- `mint(address,int24,int24,uint128,bytes) returns (uint256, uint256)` [external]
- `collect(address,int24,int24,uint128,uint128) returns (uint128, uint128)` [external]
- `burn(int24,int24,uint128) returns (uint256, uint256)` [external]
- `swap(address,bool,int256,uint160,bytes) returns (int256, int256)` [external]
- `flash(address,uint256,uint256,bytes)` [external]
- `increaseObservationCardinalityNext(uint16)` [external]
- `observe(uint32[]) returns (int56[], uint160[])` [external]
- `snapshotCumulativesInside(int24,int24) returns (int56, uint160, uint32)` [external]
- `slot0() returns (uint160, int24, uint16, uint16, uint16, uint8, bool)` [external]
- `feeGrowthGlobal0X128() returns (uint256)` [external]
- `feeGrowthGlobal1X128() returns (uint256)` [external]
- `protocolFees() returns (uint128, uint128)` [external]
- `liquidity() returns (uint128)` [external]
- `ticks(int24) returns (uint128, int128, uint256, uint256, int56, uint160, uint32, bool)` [external]
- `tickBitmap(int16) returns (uint256)` [external]
- `positions(bytes32) returns (uint128, uint256, uint256, uint128, uint128)` [external]
- `observations(uint256) returns (uint32, int56, uint160, bool)` [external]
- `factory() returns (address)` [external]
- `token0() returns (address)` [external]
- `token1() returns (address)` [external]
- `fee() returns (uint24)` [external]
- `tickSpacing() returns (int24)` [external]
- `maxLiquidityPerTick() returns (uint128)` [external]

---

## Contract: FullMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: LowGasSafeMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: TickMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `int24 internal MIN_TICK` constant
- `int24 internal MAX_TICK` constant
- `uint160 internal MIN_SQRT_RATIO` constant
- `uint160 internal MAX_SQRT_RATIO` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: OracleLibrary
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: PoolAddress
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes32 internal POOL_INIT_CODE_HASH` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: CreditLine
**Inheritance (C3 Linearized):** OwnableUpgradeable -> ContextUpgradeable -> Initializable -> ReentrancyGuard

### State Variables & Constants
- `uint256 public creditLineCounter` 
- `uint256 internal YEAR_IN_SECONDS` constant
- `mapping(uint256 => mapping(address => uint256)) public collateralShareInStrategy` 
- `mapping(uint256 => CreditLine.CreditLineVariables) public creditLineVariables` 
- `mapping(uint256 => CreditLine.CreditLineConstants) public creditLineConstants` 
- `address public savingsAccount` 
- `address public priceOracle` 
- `address public strategyRegistry` 
- `address public defaultStrategy` 
- `uint256 public protocolFeeFraction` 
- `address public protocolFeeCollector` 
- `uint256 public liquidatorRewardFraction` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `initialize(address,address,address,address,address,uint256,address,uint256)` [external]
- `updateDefaultStrategy(address)` [external]
- `updatePriceOracle(address)` [external]
- `updateSavingsAccount(address)` [external]
- `updateProtocolFeeFraction(uint256)` [external]
- `updateProtocolFeeCollector(address)` [external]
- `updateStrategyRegistry(address)` [external]
- `updateLiquidatorRewardFraction(uint256)` [external]
- `calculateInterest(uint256,uint256,uint256) returns (uint256)` [public]
- `calculateInterestAccrued(uint256) returns (uint256)` [public]
- `calculateCurrentDebt(uint256) returns (uint256)` [public]
- `calculateBorrowableAmount(uint256) returns (uint256)` [public]
- `request(address,uint256,uint256,bool,uint256,address,address,bool) returns (uint256)` [external]
- `accept(uint256)` [external]
- `depositCollateral(uint256,uint256,address,bool)` [external]
- `borrow(uint256,uint256)` [external]
- `repay(uint256,uint256,bool)` [external]
- `close(uint256)` [external]
- `calculateCurrentCollateralRatio(uint256) returns (uint256)` [public]
- `calculateTotalCollateralTokens(uint256) returns (uint256)` [public]
- `withdrawCollateral(uint256,uint256,bool)` [external]
- `withdrawableCollateral(uint256) returns (uint256)` [public]
- `liquidate(uint256,bool)` [external]
- `borrowTokensToLiquidate(uint256) returns (uint256)` [external]
- `receive()` [external]

---

## Contract: Extension
**Inheritance (C3 Linearized):** IExtension -> Initializable

### State Variables & Constants
- `mapping(address => Extension.ExtensionVariables) public extensions` 
- `IPoolFactory internal poolFactory` 
- `uint256 public votingPassRatio` 

### Public/External Functions
- `initializePoolExtension(uint256)` [external]
- `closePoolExtension()` [external]
- `removeVotes(address,address,uint256)` [external]
- `initialize(address,uint256)` [external]
- `initializePoolExtension(uint256)` [external]
- `requestExtension(address)` [external]
- `removeVotes(address,address,uint256)` [external]
- `voteOnExtension(address)` [external]
- `closePoolExtension()` [external]
- `updateVotingPassRatio(uint256)` [external]
- `updatePoolFactory(address)` [external]

---

## Contract: Pool
**Inheritance (C3 Linearized):** ReentrancyGuard -> IPool -> ERC20PausableUpgradeable -> PausableUpgradeable -> ERC20Upgradeable -> IERC20Upgradeable -> ContextUpgradeable -> Initializable

### State Variables & Constants
- `address internal poolFactory` 
- `mapping(address => Pool.LendingDetails) public lenders` 
- `Pool.PoolConstants public poolConstants` 
- `Pool.PoolVariables public poolVariables` 

### Public/External Functions
- `getLoanStatus() returns (uint256)` [external]
- `depositCollateral(uint256,bool)` [external]
- `addCollateralInMarginCall(address,uint256,bool)` [external]
- `withdrawBorrowedAmount()` [external]
- `borrower() returns (address)` [external]
- `getMarginCallEndTime(address) returns (uint256)` [external]
- `getBalanceDetails(address) returns (uint256, uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `closeLoan()` [external]
- `paused() returns (bool)` [public]
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
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `initialize(uint256,uint256,address,address,address,uint256,uint256,uint256,address,uint256,bool,address,uint256,uint256)` [external]
- `depositCollateral(uint256,bool)` [external]
- `addCollateralInMarginCall(address,uint256,bool)` [external]
- `withdrawBorrowedAmount()` [external]
- `lend(address,uint256,address)` [external]
- `cancelPool()` [external]
- `liquidateCancelPenalty(bool,bool)` [external]
- `terminatePool()` [external]
- `closeLoan()` [external]
- `withdrawLiquidity()` [external]
- `requestMarginCall()` [external]
- `interestToPay() returns (uint256)` [public]
- `calculateCollateralRatio(uint256,uint256) returns (uint256)` [public]
- `getCurrentCollateralRatio() returns (uint256)` [public]
- `getCurrentCollateralRatio(address) returns (uint256)` [public]
- `liquidatePool(bool,bool,bool)` [external]
- `liquidateForLender(address,bool,bool,bool)` [external]
- `correspondingBorrowTokens(uint256,address,uint256) returns (uint256)` [public]
- `interestPerSecond(uint256) returns (uint256)` [public]
- `interestPerPeriod(uint256) returns (uint256)` [external]
- `calculateCurrentPeriod() returns (uint256)` [external]
- `calculateRepaymentWithdrawable(address) returns (uint256)` [public]
- `withdrawRepayment()` [external]
- `getMarginCallEndTime(address) returns (uint256)` [public]
- `getBalanceDetails(address) returns (uint256, uint256)` [external]
- `getLoanStatus() returns (uint256)` [external]
- `receive()` [external]
- `getEquivalentTokens(address,address,uint256) returns (uint256)` [public]
- `borrower() returns (address)` [external]
- `totalSupply() returns (uint256)` [public]

---

## Contract: PoolFactory
**Inheritance (C3 Linearized):** IPoolFactory -> OwnableUpgradeable -> ContextUpgradeable -> Initializable

### State Variables & Constants
- `bytes4 public poolInitFuncSelector` 
- `address public poolImpl` 
- `address public userRegistry` 
- `address public strategyRegistry` 
- `address public extension` 
- `address public repaymentImpl` 
- `address public priceOracle` 
- `address public savingsAccount` 
- `uint256 public collectionPeriod` 
- `uint256 public loanWithdrawalDuration` 
- `uint256 public marginCallDuration` 
- `uint256 public minBorrowFraction` 
- `uint256 public liquidatorRewardFraction` 
- `uint256 public poolCancelPenaltyMultiple` 
- `address public noStrategyAddress` 
- `uint256 internal protocolFeeFraction` 
- `address internal protocolFeeCollector` 
- `mapping(address => bool) internal isBorrowToken` 
- `mapping(address => bool) internal isCollateralToken` 
- `mapping(address => bool) public poolRegistry` 
- `PoolFactory.Limits internal poolSizeLimit` 
- `PoolFactory.Limits internal idealCollateralRatioLimit` 
- `PoolFactory.Limits internal borrowRateLimit` 
- `PoolFactory.Limits internal repaymentIntervalLimit` 
- `PoolFactory.Limits internal noOfRepaymentIntervalsLimit` 

### Public/External Functions
- `savingsAccount() returns (address)` [external]
- `owner() returns (address)` [external]
- `poolRegistry(address) returns (bool)` [external]
- `priceOracle() returns (address)` [external]
- `extension() returns (address)` [external]
- `repaymentImpl() returns (address)` [external]
- `userRegistry() returns (address)` [external]
- `collectionPeriod() returns (uint256)` [external]
- `loanWithdrawalDuration() returns (uint256)` [external]
- `marginCallDuration() returns (uint256)` [external]
- `minBorrowFraction() returns (uint256)` [external]
- `liquidatorRewardFraction() returns (uint256)` [external]
- `poolCancelPenaltyMultiple() returns (uint256)` [external]
- `getProtocolFeeData() returns (uint256, address)` [external]
- `noStrategyAddress() returns (address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `owner() returns (address)` [public]
- `initialize(address,uint256,uint256,uint256,bytes4,uint256,uint256,uint256,uint256,address,address)` [external]
- `setImplementations(address,address,address,address,address,address,address)` [external]
- `createPool(uint256,uint256,address,address,uint256,uint256,uint256,address,uint256,bool,bytes32,address,address)` [external]
- `updateSupportedBorrowTokens(address,bool)` [external]
- `updateSupportedCollateralTokens(address,bool)` [external]
- `updatepoolInitFuncSelector(bytes4)` [external]
- `updatePoolLogic(address)` [external]
- `updateUserRegistry(address)` [external]
- `updateStrategyRegistry(address)` [external]
- `updateRepaymentImpl(address)` [external]
- `updateNoStrategy(address)` [external]
- `updatePriceoracle(address)` [external]
- `updatedExtension(address)` [external]
- `updateSavingsAccount(address)` [external]
- `updateCollectionPeriod(uint256)` [external]
- `updateLoanWithdrawalDuration(uint256)` [external]
- `updateMarginCallDuration(uint256)` [external]
- `updateMinBorrowFraction(uint256)` [external]
- `updateLiquidatorRewardFraction(uint256)` [external]
- `updatePoolCancelPenaltyMultiple(uint256)` [external]
- `updateProtocolFeeFraction(uint256)` [external]
- `updateProtocolFeeCollector(address)` [external]
- `updatePoolSizeLimit(uint256,uint256)` [external]
- `updateidealCollateralRatioLimit(uint256,uint256)` [external]
- `updateBorrowRateLimit(uint256,uint256)` [external]
- `updateRepaymentIntervalLimit(uint256,uint256)` [external]
- `updateNoOfRepaymentIntervalsLimit(uint256,uint256)` [external]
- `getProtocolFeeData() returns (uint256, address)` [external]

---

## Contract: Repayments
**Inheritance (C3 Linearized):** ReentrancyGuard -> IRepayment -> Initializable

### State Variables & Constants
- `uint256 internal MAX_INT` constant
- `uint256 internal YEAR_IN_SECONDS` constant
- `IPoolFactory internal poolFactory` 
- `uint256 internal gracePenaltyRate` 
- `uint256 internal gracePeriodFraction` 
- `mapping(address => Repayments.RepaymentVariables) public repayVariables` 
- `mapping(address => Repayments.RepaymentConstants) public repayConstants` 

### Public/External Functions
- `initializeRepayment(uint256,uint256,uint256,uint256,address)` [external]
- `getTotalRepaidAmount(address) returns (uint256)` [external]
- `getInterestCalculationVars(address) returns (uint256, uint256)` [external]
- `getCurrentLoanInterval(address) returns (uint256)` [external]
- `instalmentDeadlineExtended(address)` [external]
- `didBorrowerDefault(address) returns (bool)` [external]
- `getGracePeriodFraction() returns (uint256)` [external]
- `getNextInstalmentDeadline(address) returns (uint256)` [external]
- `initialize(address,uint256,uint256)` [external]
- `updatePoolFactory(address)` [external]
- `updateGracePeriodFraction(uint256)` [external]
- `updateGracePenaltyRate(uint256)` [external]
- `initializeRepayment(uint256,uint256,uint256,uint256,address)` [external]
- `getInterestPerSecond(address) returns (uint256)` [public]
- `getInstalmentsCompleted(address) returns (uint256)` [public]
- `getInterestDueTillInstalmentDeadline(address) returns (uint256)` [public]
- `getNextInstalmentDeadline(address) returns (uint256)` [public]
- `getCurrentInstalmentInterval(address) returns (uint256)` [public]
- `getCurrentLoanInterval(address) returns (uint256)` [external]
- `isGracePenaltyApplicable(address) returns (bool)` [public]
- `didBorrowerDefault(address) returns (bool)` [external]
- `getInterestLeft(address) returns (uint256)` [public]
- `getInterestOverdue(address) returns (uint256)` [public]
- `repay(address,uint256)` [external]
- `repayPrincipal(address)` [external]
- `getTotalRepaidAmount(address) returns (uint256)` [external]
- `instalmentDeadlineExtended(address)` [external]
- `getInterestCalculationVars(address) returns (uint256, uint256)` [external]
- `getGracePeriodFraction() returns (uint256)` [external]

---

## Contract: PriceOracle
**Inheritance (C3 Linearized):** IPriceOracle -> OwnableUpgradeable -> ContextUpgradeable -> Initializable

### State Variables & Constants
- `uint32 internal uniswapPriceAveragingPeriod` 
- `mapping(address => PriceOracle.PriceData) public chainlinkFeedAddresses` 
- `mapping(address => uint256) internal decimals` 
- `mapping(bytes32 => address) public uniswapPools` 

### Public/External Functions
- `getLatestPrice(address,address) returns (uint256, uint256)` [external]
- `doesFeedExist(address,address) returns (bool)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `initialize(address)` [external]
- `getChainlinkLatestPrice(address,address) returns (uint256, uint256)` [public]
- `getUniswapLatestPrice(address,address) returns (uint256, uint256)` [public]
- `getLatestPrice(address,address) returns (uint256, uint256)` [external]
- `doesFeedExist(address,address) returns (bool)` [external]
- `setChainlinkFeedAddress(address,address)` [external]
- `setUniswapFeedAddress(address,address,address)` [external]
- `setUniswapPriceAveragingPeriod(uint32)` [external]

---

## Contract: SublimeProxy
**Inheritance (C3 Linearized):** TransparentUpgradeableProxy -> UpgradeableProxy -> Proxy

### State Variables & Constants
- None

### Public/External Functions
- `admin() returns (address)` [external]
- `implementation() returns (address)` [external]
- `changeAdmin(address)` [external]
- `upgradeTo(address)` [external]
- `upgradeToAndCall(address,bytes)` [external]
- `fallback()` [external]
- `receive()` [external]

---

## Contract: SavingsAccount
**Inheritance (C3 Linearized):** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> ISavingsAccount

### State Variables & Constants
- `address public strategyRegistry` 
- `address public creditLine` 
- `mapping(address => mapping(address => mapping(address => uint256))) public balanceInShares` 
- `mapping(address => mapping(address => mapping(address => uint256))) public allowance` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `deposit(uint256,address,address,address) returns (uint256)` [external]
- `switchStrategy(uint256,address,address,address)` [external]
- `withdraw(uint256,address,address,address,bool) returns (uint256)` [external]
- `withdrawAll(address) returns (uint256)` [external]
- `withdrawAll(address,address) returns (uint256)` [external]
- `approve(uint256,address,address)` [external]
- `increaseAllowance(uint256,address,address)` [external]
- `decreaseAllowance(uint256,address,address)` [external]
- `transfer(uint256,address,address,address) returns (uint256)` [external]
- `transferFrom(uint256,address,address,address,address) returns (uint256)` [external]
- `balanceInShares(address,address,address) returns (uint256)` [external]
- `increaseAllowanceToCreditLine(uint256,address,address)` [external]
- `withdrawFrom(uint256,address,address,address,address,bool) returns (uint256)` [external]
- `getTotalTokens(address,address) returns (uint256)` [external]
- `initialize(address,address,address)` [external]
- `updateCreditLine(address)` [external]
- `updateStrategyRegistry(address)` [external]
- `deposit(uint256,address,address,address) returns (uint256)` [external]
- `switchStrategy(uint256,address,address,address)` [external]
- `withdraw(uint256,address,address,address,bool) returns (uint256)` [external]
- `withdrawFrom(uint256,address,address,address,address,bool) returns (uint256)` [external]
- `withdrawAll(address) returns (uint256)` [external]
- `withdrawAll(address,address) returns (uint256)` [external]
- `approve(uint256,address,address)` [external]
- `increaseAllowance(uint256,address,address)` [external]
- `decreaseAllowance(uint256,address,address)` [external]
- `increaseAllowanceToCreditLine(uint256,address,address)` [external]
- `transfer(uint256,address,address,address) returns (uint256)` [external]
- `transferFrom(uint256,address,address,address,address) returns (uint256)` [external]
- `getTotalTokens(address,address) returns (uint256)` [external]
- `receive()` [external]

---

## Contract: SavingsAccountUtil
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Verification
**Inheritance (C3 Linearized):** OwnableUpgradeable -> ContextUpgradeable -> IVerification -> Initializable

### State Variables & Constants
- `uint256 public activationDelay` 
- `mapping(address => bool) public verifiers` 
- `mapping(address => mapping(address => uint256)) public masterAddresses` 
- `mapping(address => Verification.LinkedAddress) public linkedAddresses` 
- `mapping(address => mapping(address => bool)) public pendingLinkAddresses` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `isUser(address,address) returns (bool)` [external]
- `registerMasterAddress(address,bool)` [external]
- `unregisterMasterAddress(address,address)` [external]
- `initialize(address,uint256)` [external]
- `updateActivationDelay(uint256)` [external]
- `addVerifier(address)` [external]
- `removeVerifier(address)` [external]
- `registerMasterAddress(address,bool)` [external]
- `unregisterMasterAddress(address,address)` [external]
- `requestAddressLinking(address)` [external]
- `cancelAddressLinkingRequest(address)` [external]
- `linkAddress(address)` [external]
- `unlinkAddress(address)` [external]
- `isUser(address,address) returns (bool)` [external]

---

## Contract: AdminVerifier
**Inheritance (C3 Linearized):** OwnableUpgradeable -> ContextUpgradeable -> IVerifier -> Initializable

### State Variables & Constants
- `IVerification public verification` 
- `mapping(address => string) public userData` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `initialize(address,address)` [external]
- `registerUser(address,string,bool)` [external]
- `unregisterUser(address)` [external]
- `updateVerification(address)` [external]

---

## Contract: AaveLendingPool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `deposit(address,uint256,address,uint16)` [external]
- `withdraw(address,uint256,address) returns (uint256)` [external]
- `getReserveData(address) returns (DataTypes.ReserveData)` [external]
- `getAddressesProvider() returns (ILendingPoolAddressesProvider)` [external]

---

## Contract: DataTypes
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: ICEther
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `mint()` [external]
- `repayBorrow()` [external]
- `repayBorrowBehalf(address)` [external]
- `liquidateBorrow(address,address)` [external]

---

## Contract: ICToken
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `underlying() returns (address)` [external]
- `mint(uint256) returns (uint256)` [external]
- `redeem(uint256) returns (uint256)` [external]
- `liquidateBorrow(address,uint256,address) returns (uint256)` [external]
- `repayBorrow(uint256) returns (uint256)` [external]
- `repayBorrowBehalf(address,uint256) returns (uint256)` [external]
- `balanceOfUnderlying(address) returns (uint256)` [external]
- `exchangeRateCurrent() returns (uint256)` [external]
- `exchangeRateStored() returns (uint256)` [external]
- `supplyRatePerBlock() returns (uint256)` [external]
- `redeemUnderlying(uint256) returns (uint256)` [external]

---

## Contract: ILendingPoolAddressesProvider
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getMarketId() returns (string)` [external]
- `setMarketId(string)` [external]
- `setAddress(bytes32,address)` [external]
- `setAddressAsProxy(bytes32,address)` [external]
- `getAddress(bytes32) returns (address)` [external]
- `getLendingPool() returns (address)` [external]
- `setLendingPoolImpl(address)` [external]
- `getLendingPoolConfigurator() returns (address)` [external]
- `setLendingPoolConfiguratorImpl(address)` [external]
- `getLendingPoolCollateralManager() returns (address)` [external]
- `setLendingPoolCollateralManager(address)` [external]
- `getPoolAdmin() returns (address)` [external]
- `setPoolAdmin(address)` [external]
- `getEmergencyAdmin() returns (address)` [external]
- `setEmergencyAdmin(address)` [external]
- `getPriceOracle() returns (address)` [external]
- `setPriceOracle(address)` [external]
- `getLendingRateOracle() returns (address)` [external]
- `setLendingRateOracle(address)` [external]

---

## Contract: IProtocolDataProvider
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `ADDRESSES_PROVIDER() returns (ILendingPoolAddressesProvider)` [external]
- `getAllReservesTokens() returns (IProtocolDataProvider.TokenData[])` [external]
- `getAllATokens() returns (IProtocolDataProvider.TokenData[])` [external]
- `getReserveConfigurationData(address) returns (uint256, uint256, uint256, uint256, uint256, bool, bool, bool, bool, bool)` [external]
- `getReserveData(address) returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint40)` [external]
- `getUserReserveData(address,address) returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint40, bool)` [external]
- `getReserveTokensAddresses(address) returns (address, address, address)` [external]

---

## Contract: IScaledBalanceToken
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `scaledBalanceOf(address) returns (uint256)` [external]

---

## Contract: IWETHGateway
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `depositETH(address,address,uint16)` [external]
- `withdrawETH(uint256,address)` [external]
- `getWETHAddress() returns (address)` [external]
- `getAWETHAddress() returns (address)` [external]
- `getLendingPoolAddress() returns (address)` [external]

---

## Contract: IyVault
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `earn()` [external]
- `depositAll()` [external]
- `deposit(uint256)` [external]
- `depositETH()` [external]
- `withdrawAll()` [external]
- `withdrawAllETH()` [external]
- `harvest(address,uint256)` [external]
- `withdraw(uint256)` [external]
- `withdrawETH(uint256)` [external]
- `getPricePerFullShare() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `setMin(uint256)` [external]
- `min() returns (uint256)` [external]

---

## Contract: Token
**Inheritance (C3 Linearized):** Ownable -> ERC20 -> IERC20 -> Context

### State Variables & Constants
- None

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `mint(address,uint256)` [external]

---

## Contract: IStrategy
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `want() returns (address)` [external]
- `deposit()` [external]
- `withdraw(address)` [external]
- `withdraw(uint256)` [external]
- `withdrawAll() returns (uint256)` [external]
- `balanceOf() returns (uint256)` [external]

---

## Contract: Converter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `convert(address) returns (uint256)` [external]

---

## Contract: OneSplitAudit
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `swap(address,address,uint256,uint256,uint256[],uint256) returns (uint256)` [external]
- `getExpectedReturn(address,address,uint256,uint256,uint256) returns (uint256, uint256[])` [external]

---

## Contract: Controller
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public governance` 
- `address public strategist` 
- `address public onesplit` 
- `address public rewards` 
- `mapping(address => address) public vaults` 
- `mapping(address => address) public strategies` 
- `mapping(address => mapping(address => address)) public converters` 
- `mapping(address => mapping(address => bool)) public approvedStrategies` 
- `uint256 public split` 
- `uint256 public max` constant

### Public/External Functions
- `setRewards(address)` [public]
- `setStrategist(address)` [public]
- `setSplit(uint256)` [public]
- `setOneSplit(address)` [public]
- `setGovernance(address)` [public]
- `setVault(address,address)` [public]
- `approveStrategy(address,address)` [public]
- `revokeStrategy(address,address)` [public]
- `setConverter(address,address,address)` [public]
- `setStrategy(address,address)` [public]
- `earn(address,uint256)` [public]
- `balanceOf(address) returns (uint256)` [external]
- `withdrawAll(address)` [public]
- `inCaseTokensGetStuck(address,uint256)` [public]
- `inCaseStrategyTokenGetStuck(address,address)` [public]
- `getExpectedReturn(address,address,uint256) returns (uint256)` [public]
- `yearn(address,address,uint256)` [public]
- `withdraw(address,uint256)` [public]

---

## Contract: IController
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `vaults(address) returns (address)` [external]
- `strategies(address) returns (address)` [external]
- `rewards() returns (address)` [external]
- `approveStrategy(address,address)` [external]
- `setStrategy(address,address)` [external]
- `withdraw(address,uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `earn(address,uint256)` [external]

---

## Contract: Strategy
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public want` 
- `address public governance` 
- `address public controller` 
- `address public strategist` 

### Public/External Functions
- `deposit()` [public]
- `withdraw(IERC20) returns (uint256)` [external]
- `withdraw(uint256)` [external]
- `withdrawAll() returns (uint256)` [external]
- `balanceOf() returns (uint256)` [public]
- `setGovernance(address)` [external]
- `setController(address)` [external]

---

## Contract: WETH
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `deposit()` [external]
- `withdraw(uint256)` [external]

---

## Contract: yVault
**Inheritance (C3 Linearized):** ERC20Detailed -> ERC20 -> Context

### State Variables & Constants
- `ERC20 public token` 
- `uint256 public min` 
- `uint256 public max` constant
- `address public governance` 
- `address public controller` 

### Public/External Functions
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
- `balance() returns (uint256)` [public]
- `setMin(uint256)` [external]
- `setGovernance(address)` [public]
- `setController(address)` [public]
- `available() returns (uint256)` [public]
- `earn()` [public]
- `depositAll()` [external]
- `deposit(uint256)` [public]
- `depositETH()` [public]
- `withdrawAll()` [external]
- `withdrawAllETH()` [external]
- `harvest(address,uint256)` [external]
- `withdraw(uint256)` [public]
- `withdrawETH(uint256)` [public]
- `getPricePerFullShare() returns (uint256)` [public]
- `receive()` [external]

---

## Contract: AaveYield
**Inheritance (C3 Linearized):** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield

### State Variables & Constants
- `address public wethGateway` 
- `address public protocolDataProvider` 
- `address public lendingPoolAddressesProvider` 
- `address public savingsAccount` 
- `uint16 public referralCode` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `liquidityToken(address) returns (address)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [external]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `initialize(address,address,address,address,address)` [external]
- `liquidityToken(address) returns (address)` [public]
- `updateSavingsAccount(address)` [external]
- `updateAaveAddresses(address,address,address)` [external]
- `updateReferralCode(uint16)` [external]
- `emergencyWithdraw(address,address) returns (uint256)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [public]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `receive()` [external]

---

## Contract: CompoundYield
**Inheritance (C3 Linearized):** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield

### State Variables & Constants
- `address public savingsAccount` 
- `mapping(address => address) public liquidityToken` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `liquidityToken(address) returns (address)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [external]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `initialize(address,address)` [external]
- `updateSavingsAccount(address)` [external]
- `updateProtocolAddresses(address,address)` [external]
- `emergencyWithdraw(address,address) returns (uint256)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [public]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `receive()` [external]

---

## Contract: NoYield
**Inheritance (C3 Linearized):** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield

### State Variables & Constants
- `address public savingsAccount` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `liquidityToken(address) returns (address)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [external]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `initialize(address,address)` [external]
- `liquidityToken(address) returns (address)` [external]
- `updateSavingsAccount(address)` [external]
- `emergencyWithdraw(address,address) returns (uint256)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [external]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]

---

## Contract: StrategyRegistry
**Inheritance (C3 Linearized):** IStrategyRegistry -> OwnableUpgradeable -> ContextUpgradeable -> Initializable

### State Variables & Constants
- `address[] public strategies` 
- `uint256 public maxStrategies` 
- `mapping(address => bool) public registry` 

### Public/External Functions
- `registry(address) returns (bool)` [external]
- `getStrategies() returns (address[])` [external]
- `addStrategy(address)` [external]
- `removeStrategy(uint256)` [external]
- `updateStrategy(uint256,address,address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `initialize(address,uint256)` [external]
- `updateMaxStrategies(uint256)` [external]
- `getStrategies() returns (address[])` [external]
- `addStrategy(address)` [external]
- `removeStrategy(uint256)` [external]
- `updateStrategy(uint256,address,address)` [external]

---

## Contract: YearnYield
**Inheritance (C3 Linearized):** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield

### State Variables & Constants
- `address public savingsAccount` 
- `mapping(address => address) public liquidityToken` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `liquidityToken(address) returns (address)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [external]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `initialize(address,address)` [external]
- `updateSavingsAccount(address)` [external]
- `updateProtocolAddresses(address,address)` [external]
- `emergencyWithdraw(address,address) returns (uint256)` [external]
- `lockTokens(address,address,uint256) returns (uint256)` [external]
- `unlockTokens(address,uint256) returns (uint256)` [external]
- `unlockShares(address,uint256) returns (uint256)` [external]
- `getTokensForShares(uint256,address) returns (uint256)` [public]
- `getSharesForTokens(uint256,address) returns (uint256)` [external]
- `receive()` [external]

---
