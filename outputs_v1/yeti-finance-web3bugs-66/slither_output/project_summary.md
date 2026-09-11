# Project Summary

## Contract: Address
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

## Contract: IERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]

---

## Contract: YetiFinanceTreasury
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal teamWallet` 

### Public/External Functions
- `sendToken(IERC20,address,uint256)` [external]
- `updateTeamWallet(address)` [external]
- `getTeamWallet() returns (address)` [external]

---


# Project Summary

## Contract: BorrowerOperations
**Inheritance (C3 Linearized):** ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `ITroveManager internal troveManager` 
- `address internal stabilityPoolAddress` 
- `address internal gasPoolAddress` 
- `ICollSurplusPool internal collSurplusPool` 
- `ISYETI internal sYETI` 
- `address internal sYETIAddress` 
- `IYUSDToken internal yusdToken` 
- `uint256 internal BOOTSTRAP_PERIOD` constant
- `uint256 internal deploymentTime` 
- `ISortedTroves internal sortedTroves` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]

---

## Contract: LiquityMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 internal DECIMAL_PRECISION` constant
- `uint256 internal HALF_DECIMAL_PRECISION` constant

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

## Contract: IActivePool
**Inheritance (C3 Linearized):** IPool -> ICollateralReceiver

### State Variables & Constants
- None

### Public/External Functions
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `sendCollaterals(address,address[],uint256[]) returns (bool)` [external]
- `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)` [external]
- `sendSingleCollateral(address,address,uint256) returns (bool)` [external]
- `sendSingleCollateralUnwrap(address,address,address,uint256) returns (bool)` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]

---

## Contract: ICollSurplusPool
**Inheritance (C3 Linearized):** ICollateralReceiver

### State Variables & Constants
- None

### Public/External Functions
- `receiveCollateral(address[],uint256[])` [external]
- `setAddresses(address,address,address,address,address)` [external]
- `getCollVC() returns (uint256)` [external]
- `getAmountClaimable(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `accountSurplus(address,address[],uint256[])` [external]
- `claimColl(address)` [external]
- `addCollateralType(address)` [external]

---

## Contract: IDefaultPool
**Inheritance (C3 Linearized):** IPool -> ICollateralReceiver

### State Variables & Constants
- None

### Public/External Functions
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `sendCollsToActivePool(address[],uint256[],address)` [external]
- `addCollateralType(address)` [external]
- `getCollateralVC(address) returns (uint256)` [external]

---

## Contract: IPriceFeed
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `fetchPrice_v() returns (uint256)` [external]

---

## Contract: ISYETI
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `mint(uint256) returns (bool)` [external]
- `burn(address,uint256) returns (bool)` [external]

---

## Contract: ISortedTroves
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setParams(uint256,address,address,address)` [external]
- `insert(address,uint256,address,address)` [external]
- `remove(address)` [external]
- `reInsert(address,uint256,address,address)` [external]
- `contains(address) returns (bool)` [external]
- `isFull() returns (bool)` [external]
- `isEmpty() returns (bool)` [external]
- `getSize() returns (uint256)` [external]
- `getMaxSize() returns (uint256)` [external]
- `getFirst() returns (address)` [external]
- `getLast() returns (address)` [external]
- `getNext(address) returns (address)` [external]
- `getPrev(address) returns (address)` [external]
- `getOldICR(address) returns (uint256)` [external]
- `validInsertPosition(uint256,address,address) returns (bool)` [external]
- `findInsertPosition(uint256,address,address) returns (address, address)` [external]

---

## Contract: IStabilityPool
**Inheritance (C3 Linearized):** ICollateralReceiver

### State Variables & Constants
- None

### Public/External Functions
- `receiveCollateral(address[],uint256[])` [external]
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]
- `registerFrontEnd(uint256)` [external]
- `offset(uint256,address[],uint256[])` [external]
- `getDepositorGains(address) returns (address[], uint256[])` [external]
- `getVC() returns (uint256)` [external]
- `getTotalYUSDDeposits() returns (uint256)` [external]
- `getDepositorYETIGain(address) returns (uint256)` [external]
- `getFrontEndYETIGain(address) returns (uint256)` [external]
- `getCompoundedYUSDDeposit(address) returns (uint256)` [external]
- `getCompoundedFrontEndStake(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]
- `getDepositSnapshotS(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]

---

## Contract: ITroveManager
**Inheritance (C3 Linearized):** ILiquityBase

### State Variables & Constants
- None

### Public/External Functions
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `stabilityPool() returns (IStabilityPool)` [external]
- `yusdToken() returns (IYUSDToken)` [external]
- `yetiToken() returns (IYETIToken)` [external]
- `sYETI() returns (ISYETI)` [external]
- `getTroveOwnersCount() returns (uint256)` [external]
- `getTroveFromTroveOwnersArray(uint256) returns (address)` [external]
- `getCurrentICR(address) returns (uint256)` [external]
- `liquidate(address)` [external]
- `batchLiquidateTroves(address[],address)` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `updateStakeAndTotalStakes(address)` [external]
- `updateTroveCollTMR(address,address[],uint256[])` [external]
- `updateTroveRewardSnapshots(address)` [external]
- `addTroveOwnerToArray(address) returns (uint256)` [external]
- `applyPendingRewards(address)` [external]
- `getPendingCollRewards(address) returns (address[], uint256[])` [external]
- `getPendingYUSDDebtReward(address) returns (uint256)` [external]
- `hasPendingRewards(address) returns (bool)` [external]
- `closeTrove(address)` [external]
- `removeStake(address)` [external]
- `removeStakeTMR(address)` [external]
- `updateTroveDebt(address,uint256)` [external]
- `getRedemptionRate() returns (uint256)` [external]
- `getRedemptionRateWithDecay() returns (uint256)` [external]
- `getRedemptionFeeWithDecay(uint256) returns (uint256)` [external]
- `getBorrowingRate() returns (uint256)` [external]
- `getBorrowingRateWithDecay() returns (uint256)` [external]
- `getBorrowingFee(uint256) returns (uint256)` [external]
- `getBorrowingFeeWithDecay(uint256) returns (uint256)` [external]
- `decayBaseRateFromBorrowing()` [external]
- `getTroveStatus(address) returns (uint256)` [external]
- `isTroveActive(address) returns (bool)` [external]
- `getTroveStake(address,address) returns (uint256)` [external]
- `getTotalStake(address) returns (uint256)` [external]
- `getTroveDebt(address) returns (uint256)` [external]
- `getL_Coll(address) returns (uint256)` [external]
- `getL_YUSD(address) returns (uint256)` [external]
- `getRewardSnapshotColl(address,address) returns (uint256)` [external]
- `getRewardSnapshotYUSD(address,address) returns (uint256)` [external]
- `getTroveVC(address) returns (uint256)` [external]
- `getTroveColls(address) returns (address[], uint256[])` [external]
- `getCurrentTroveState(address) returns (address[], uint256[], uint256)` [external]
- `setTroveStatus(address,uint256)` [external]
- `updateTroveColl(address,address[],uint256[])` [external]
- `increaseTroveDebt(address,uint256) returns (uint256)` [external]
- `decreaseTroveDebt(address,uint256) returns (uint256)` [external]
- `getTCR() returns (uint256)` [external]
- `checkRecoveryMode() returns (bool)` [external]
- `closeTroveRedemption(address)` [external]
- `closeTroveLiquidation(address)` [external]
- `removeStakeTLR(address)` [external]
- `updateBaseRate(uint256)` [external]
- `calcDecayedBaseRate() returns (uint256)` [external]
- `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` [external]
- `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` [external]
- `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])` [external]
- `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` [external]
- `collSurplusUpdate(address,address[],uint256[])` [external]

---

## Contract: IWAsset
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `wrap(uint256,address,address,address)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `claimReward(address)` [external]
- `claimRewardFor(address)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `endTreasuryReward(address,uint256)` [external]

---

## Contract: IWhitelist
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getValidCollateral() returns (address[])` [external]
- `setAddresses(address,address,address,address,address)` [external]
- `isValidRouter(address) returns (bool)` [external]
- `getOracle(address) returns (address)` [external]
- `getRatio(address) returns (uint256)` [external]
- `getIsActive(address) returns (bool)` [external]
- `getPriceCurve(address) returns (address)` [external]
- `getDecimals(address) returns (uint256)` [external]
- `getFee(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getIndex(address) returns (uint256)` [external]
- `isWrapped(address) returns (bool)` [external]
- `setDefaultRouter(address,address)` [external]
- `getValueVC(address,uint256) returns (uint256)` [external]
- `getValueUSD(address,uint256) returns (uint256)` [external]
- `getDefaultRouterAddress(address) returns (address)` [external]

---

## Contract: IYETIToken
**Inheritance (C3 Linearized):** IERC2612 -> IERC20

### State Variables & Constants
- None

### Public/External Functions
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `sendToSYETI(address,uint256)` [external]
- `getDeploymentStartTime() returns (uint256)` [external]

---

## Contract: IYUSDToken
**Inheritance (C3 Linearized):** IERC2612 -> IERC20

### State Variables & Constants
- None

### Public/External Functions
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `mint(address,uint256)` [external]
- `burn(address,uint256)` [external]
- `sendToPool(address,address,uint256)` [external]
- `returnFromPool(address,address,uint256)` [external]

---

## Contract: IYetiRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `route(address,address,address,uint256,uint256) returns (uint256)` [external]
- `unRoute(address,address,address,uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ITroveManagerLiquidations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `batchLiquidateTroves(address[],address)` [external]

---

## Contract: ITroveManagerRedemptions
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` [external]

---

## Contract: TroveManager
**Inheritance (C3 Linearized):** ReentrancyGuard -> ITroveManager -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `address internal borrowerOperationsAddress` 
- `IStabilityPool internal stabilityPoolContract` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdTokenContract` 
- `IYETIToken internal yetiTokenContract` 
- `ISYETI internal sYETIContract` 
- `ITroveManagerRedemptions internal troveManagerRedemptions` 
- `ITroveManagerLiquidations internal troveManagerLiquidations` 
- `address internal gasPoolAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal troveManagerLiquidationsAddress` 
- `ISortedTroves internal sortedTroves` 
- `ICollSurplusPool internal collSurplusPool` 
- `bytes32 public NAME` constant
- `uint256 internal SECONDS_IN_ONE_MINUTE` constant
- `uint256 public MINUTE_DECAY_FACTOR` constant
- `uint256 public MAX_BORROWING_FEE` constant
- `uint256 public BOOTSTRAP_PERIOD` constant
- `uint256 public baseRate` 
- `uint256 public lastFeeOperationTime` 
- `mapping(address => TroveManagerBase.Trove) internal Troves` 
- `mapping(address => uint256) public totalStakes` 
- `mapping(address => uint256) public totalStakesSnapshot` 
- `mapping(address => uint256) public totalCollateralSnapshot` 
- `mapping(address => uint256) private L_Coll` 
- `mapping(address => uint256) public L_YUSDDebt` 
- `mapping(address => TroveManager.RewardSnapshot) internal rewardSnapshots` 
- `address[] private TroveOwners` 
- `mapping(address => uint256) public lastCollError_Redistribution` 
- `mapping(address => uint256) public lastYUSDDebtError_Redistribution` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `stabilityPool() returns (IStabilityPool)` [external]
- `yusdToken() returns (IYUSDToken)` [external]
- `yetiToken() returns (IYETIToken)` [external]
- `sYETI() returns (ISYETI)` [external]
- `getTroveOwnersCount() returns (uint256)` [external]
- `getTroveFromTroveOwnersArray(uint256) returns (address)` [external]
- `getCurrentICR(address) returns (uint256)` [external]
- `liquidate(address)` [external]
- `batchLiquidateTroves(address[],address)` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `updateStakeAndTotalStakes(address)` [external]
- `updateTroveCollTMR(address,address[],uint256[])` [external]
- `updateTroveRewardSnapshots(address)` [external]
- `addTroveOwnerToArray(address) returns (uint256)` [external]
- `applyPendingRewards(address)` [external]
- `getPendingCollRewards(address) returns (address[], uint256[])` [external]
- `getPendingYUSDDebtReward(address) returns (uint256)` [external]
- `hasPendingRewards(address) returns (bool)` [external]
- `closeTrove(address)` [external]
- `removeStake(address)` [external]
- `removeStakeTMR(address)` [external]
- `updateTroveDebt(address,uint256)` [external]
- `getRedemptionRate() returns (uint256)` [external]
- `getRedemptionRateWithDecay() returns (uint256)` [external]
- `getRedemptionFeeWithDecay(uint256) returns (uint256)` [external]
- `getBorrowingRate() returns (uint256)` [external]
- `getBorrowingRateWithDecay() returns (uint256)` [external]
- `getBorrowingFee(uint256) returns (uint256)` [external]
- `getBorrowingFeeWithDecay(uint256) returns (uint256)` [external]
- `decayBaseRateFromBorrowing()` [external]
- `getTroveStatus(address) returns (uint256)` [external]
- `isTroveActive(address) returns (bool)` [external]
- `getTroveStake(address,address) returns (uint256)` [external]
- `getTotalStake(address) returns (uint256)` [external]
- `getTroveDebt(address) returns (uint256)` [external]
- `getL_Coll(address) returns (uint256)` [external]
- `getL_YUSD(address) returns (uint256)` [external]
- `getRewardSnapshotColl(address,address) returns (uint256)` [external]
- `getRewardSnapshotYUSD(address,address) returns (uint256)` [external]
- `getTroveVC(address) returns (uint256)` [external]
- `getTroveColls(address) returns (address[], uint256[])` [external]
- `getCurrentTroveState(address) returns (address[], uint256[], uint256)` [external]
- `setTroveStatus(address,uint256)` [external]
- `updateTroveColl(address,address[],uint256[])` [external]
- `increaseTroveDebt(address,uint256) returns (uint256)` [external]
- `decreaseTroveDebt(address,uint256) returns (uint256)` [external]
- `getTCR() returns (uint256)` [external]
- `checkRecoveryMode() returns (bool)` [external]
- `closeTroveRedemption(address)` [external]
- `closeTroveLiquidation(address)` [external]
- `removeStakeTLR(address)` [external]
- `updateBaseRate(uint256)` [external]
- `calcDecayedBaseRate() returns (uint256)` [external]
- `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` [external]
- `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` [external]
- `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])` [external]
- `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` [external]
- `collSurplusUpdate(address,address[],uint256[])` [external]
- `getEntireSystemDebt() returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `getTroveOwnersCount() returns (uint256)` [external]
- `getTroveFromTroveOwnersArray(uint256) returns (address)` [external]
- `liquidate(address)` [external]
- `batchLiquidateTroves(address[],address)` [external]
- `collSurplusUpdate(address,address[],uint256[])` [external]
- `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` [external]
- `updateTroves(address[],address[],address[])` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `getCurrentICR(address) returns (uint256)` [external]
- `applyPendingRewards(address)` [external]
- `updateTroveRewardSnapshots(address)` [external]
- `getPendingCollRewards(address) returns (address[], uint256[])` [external]
- `getPendingYUSDDebtReward(address) returns (uint256)` [public]
- `hasPendingRewards(address) returns (bool)` [public]
- `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])` [public]
- `removeStake(address)` [external]
- `updateStakeAndTotalStakes(address)` [external]
- `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` [external]
- `closeTrove(address)` [external]
- `closeTroveLiquidation(address)` [external]
- `closeTroveRedemption(address)` [external]
- `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` [external]
- `addTroveOwnerToArray(address) returns (uint256)` [external]
- `getTCR() returns (uint256)` [external]
- `checkRecoveryMode() returns (bool)` [external]
- `updateBaseRate(uint256)` [external]
- `getRedemptionRate() returns (uint256)` [public]
- `getRedemptionRateWithDecay() returns (uint256)` [public]
- `getRedemptionFeeWithDecay(uint256) returns (uint256)` [external]
- `getBorrowingRate() returns (uint256)` [public]
- `getBorrowingRateWithDecay() returns (uint256)` [public]
- `getBorrowingFee(uint256) returns (uint256)` [external]
- `getBorrowingFeeWithDecay(uint256) returns (uint256)` [external]
- `decayBaseRateFromBorrowing()` [external]
- `calcDecayedBaseRate() returns (uint256)` [public]
- `getTroveStatus(address) returns (uint256)` [external]
- `isTroveActive(address) returns (bool)` [external]
- `getTroveStake(address,address) returns (uint256)` [external]
- `getTroveDebt(address) returns (uint256)` [external]
- `getTotalStake(address) returns (uint256)` [external]
- `getL_Coll(address) returns (uint256)` [external]
- `getL_YUSD(address) returns (uint256)` [external]
- `getRewardSnapshotColl(address,address) returns (uint256)` [external]
- `getRewardSnapshotYUSD(address,address) returns (uint256)` [external]
- `getTroveVC(address) returns (uint256)` [external]
- `getTroveColls(address) returns (address[], uint256[])` [external]
- `getCurrentTroveState(address) returns (address[], uint256[], uint256)` [external]
- `updateTroveDebt(address,uint256)` [external]
- `updateTroveCollTMR(address,address[],uint256[])` [external]
- `removeStakeTMR(address)` [external]
- `removeStakeTLR(address)` [external]
- `setTroveStatus(address,uint256)` [external]
- `updateTroveColl(address,address[],uint256[])` [external]
- `increaseTroveDebt(address,uint256) returns (uint256)` [external]
- `decreaseTroveDebt(address,uint256) returns (uint256)` [external]
- `stabilityPool() returns (IStabilityPool)` [external]
- `yusdToken() returns (IYUSDToken)` [external]
- `yetiToken() returns (IYETIToken)` [external]
- `sYETI() returns (ISYETI)` [external]

---


# Project Summary

## Contract: DefaultPool
**Inheritance (C3 Linearized):** YetiCustomBase -> BaseMath -> IDefaultPool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `string public NAME` constant
- `address internal troveManagerAddress` 
- `address internal activePoolAddress` 
- `address internal whitelistAddress` 
- `address internal yetiFinanceTreasury` 
- `YetiCustomBase.newColls internal poolColl` 
- `uint256 internal YUSDDebt` 

### Public/External Functions
- `sendCollsToActivePool(address[],uint256[],address)` [external]
- `addCollateralType(address)` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address,address,address)` [external]
- `getCollateral(address) returns (uint256)` [public]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `sendCollsToActivePool(address[],uint256[],address)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]

---


# Project Summary

## Contract: YUSDToken
**Inheritance (C3 Linearized):** IYUSDToken -> IERC2612 -> IERC20 -> CheckContract

### State Variables & Constants
- `uint256 private _totalSupply` 
- `string internal _NAME` constant
- `string internal _SYMBOL` constant
- `string internal _VERSION` constant
- `uint8 internal _DECIMALS` constant
- `bytes32 private _PERMIT_TYPEHASH` constant
- `bytes32 private _TYPE_HASH` constant
- `bytes32 private _CACHED_DOMAIN_SEPARATOR` immutable
- `uint256 private _CACHED_CHAIN_ID` immutable
- `bytes32 private _HASHED_NAME` immutable
- `bytes32 private _HASHED_VERSION` immutable
- `mapping(address => uint256) private _nonces` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `address internal troveManagerAddress` immutable
- `address internal troveManagerLiquidationsAddress` immutable
- `address internal troveManagerRedemptionsAddress` immutable
- `address internal stabilityPoolAddress` immutable
- `address internal borrowerOperationsAddress` immutable

### Public/External Functions
- `mint(address,uint256)` [external]
- `burn(address,uint256)` [external]
- `sendToPool(address,address,uint256)` [external]
- `returnFromPool(address,address,uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `mint(address,uint256)` [external]
- `burn(address,uint256)` [external]
- `sendToPool(address,address,uint256)` [external]
- `returnFromPool(address,address,uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `domainSeparator() returns (bytes32)` [public]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]

---


# Project Summary

## Contract: TroveManagerRedemptions
**Inheritance (C3 Linearized):** ITroveManagerRedemptions -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `IStabilityPool internal stabilityPoolContract` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdTokenContract` 
- `IYETIToken internal yetiTokenContract` 
- `ISYETI internal sYETIContract` 
- `ITroveManagerRedemptions internal troveManagerRedemptions` 
- `address internal gasPoolAddress` 
- `ISortedTroves internal sortedTroves` 
- `ICollSurplusPool internal collSurplusPool` 
- `uint256 public BETA` constant
- `uint256 public BOOTSTRAP_PERIOD` constant

### Public/External Functions
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` [external]
- `redeemCollateralSingle(uint256,uint256,address,address,address,uint256,address)` [external]

---


# Project Summary

## Contract: CollSurplusPool
**Inheritance (C3 Linearized):** LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase -> ICollSurplusPool -> ICollateralReceiver -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal activePoolAddress` 
- `YetiCustomBase.newColls internal poolColl` 
- `mapping(address => YetiCustomBase.newColls) internal balances` 

### Public/External Functions
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address)` [external]
- `getCollVC() returns (uint256)` [external]
- `getAmountClaimable(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `accountSurplus(address,address[],uint256[])` [external]
- `claimColl(address)` [external]
- `addCollateralType(address)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address,address,address,address)` [external]
- `getCollVC() returns (uint256)` [external]
- `getAmountClaimable(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `accountSurplus(address,address[],uint256[])` [external]
- `claimColl(address)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]

---


# Project Summary

## Contract: TroveManagerLiquidations
**Inheritance (C3 Linearized):** ITroveManagerLiquidations -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `IStabilityPool internal stabilityPoolContract` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdTokenContract` 
- `IYETIToken internal yetiTokenContract` 
- `ISYETI internal sYETIContract` 
- `ITroveManagerLiquidations internal troveManagerLiquidations` 
- `address internal gasPoolAddress` 
- `address internal troveManagerAddress` 
- `ISortedTroves internal sortedTroves` 
- `ICollSurplusPool internal collSurplusPool` 
- `address internal yetiFinanceTreasury` 

### Public/External Functions
- `batchLiquidateTroves(address[],address)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `batchLiquidateTroves(address[],address)` [external]

---


# Project Summary

## Contract: SortedTroves
**Inheritance (C3 Linearized):** ISortedTroves -> CheckContract -> Ownable

### State Variables & Constants
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal troveManagerAddress` 
- `SortedTroves.Data public data` 

### Public/External Functions
- `setParams(uint256,address,address,address)` [external]
- `insert(address,uint256,address,address)` [external]
- `remove(address)` [external]
- `reInsert(address,uint256,address,address)` [external]
- `contains(address) returns (bool)` [external]
- `isFull() returns (bool)` [external]
- `isEmpty() returns (bool)` [external]
- `getSize() returns (uint256)` [external]
- `getMaxSize() returns (uint256)` [external]
- `getFirst() returns (address)` [external]
- `getLast() returns (address)` [external]
- `getNext(address) returns (address)` [external]
- `getPrev(address) returns (address)` [external]
- `getOldICR(address) returns (uint256)` [external]
- `validInsertPosition(uint256,address,address) returns (bool)` [external]
- `findInsertPosition(uint256,address,address) returns (address, address)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setParams(uint256,address,address,address)` [external]
- `insert(address,uint256,address,address)` [external]
- `remove(address)` [external]
- `reInsert(address,uint256,address,address)` [external]
- `contains(address) returns (bool)` [public]
- `isFull() returns (bool)` [public]
- `isEmpty() returns (bool)` [public]
- `getSize() returns (uint256)` [external]
- `getMaxSize() returns (uint256)` [external]
- `getFirst() returns (address)` [external]
- `getLast() returns (address)` [external]
- `getNext(address) returns (address)` [external]
- `getPrev(address) returns (address)` [external]
- `getOldICR(address) returns (uint256)` [external]
- `validInsertPosition(uint256,address,address) returns (bool)` [external]
- `findInsertPosition(uint256,address,address) returns (address, address)` [external]

---


# Project Summary

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

## Contract: ITellorCaller
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getTellorCurrentValue(uint256) returns (bool, uint256, uint256)` [external]

---

## Contract: PriceFeed
**Inheritance (C3 Linearized):** IPriceFeed -> BaseMath -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `bytes32 public NAME` constant
- `AggregatorV3Interface public priceAggregator` 
- `ITellorCaller public tellorCaller` 
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerAddress` 
- `uint256 public ETHUSD_TELLOR_REQ_ID` constant
- `uint256 public TARGET_DIGITS` constant
- `uint256 public TELLOR_DIGITS` constant
- `uint256 public TIMEOUT` constant
- `uint256 public MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND` constant
- `uint256 public MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES` constant
- `uint256 public lastGoodPrice` 
- `PriceFeed.Status public status` 

### Public/External Functions
- `fetchPrice_v() returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address)` [external]
- `fetchPrice() returns (uint256)` [external]
- `fetchPrice_v() returns (uint256)` [external]

---


# Project Summary

## Contract: TeamAllocation
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `IERC20 internal YETI` 
- `address internal teamWallet` 
- `address[7] internal team` 
- `uint256[7] internal allocations` 
- `bool internal allocationClaimed` 
- `bool internal yetiSet` 
- `uint256 internal _94_5_thousand` 

### Public/External Functions
- `setYetiAddress(IERC20)` [external]
- `sendAllocatedYETI()` [external]
- `sendUnallocatedYETI(address,uint256)` [external]
- `updateTeamAddress(address)` [external]
- `getTeamWallet() returns (address)` [external]

---


# Project Summary

## Contract: Whitelist
**Inheritance (C3 Linearized):** CheckContract -> IBaseOracle -> IWhitelist -> Ownable

### State Variables & Constants
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `IStabilityPool internal stabilityPool` 
- `ICollSurplusPool internal collSurplusPool` 
- `address internal borrowerOperationsAddress` 
- `bool private addressesSet` 
- `mapping(address => Whitelist.CollateralParams) public collateralParams` 
- `mapping(address => bool) public validRouter` 
- `address[] public validCollateral` 

### Public/External Functions
- `getPrice(address) returns (uint256)` [external]
- `getValidCollateral() returns (address[])` [external]
- `setAddresses(address,address,address,address,address)` [external]
- `isValidRouter(address) returns (bool)` [external]
- `getOracle(address) returns (address)` [external]
- `getRatio(address) returns (uint256)` [external]
- `getIsActive(address) returns (bool)` [external]
- `getPriceCurve(address) returns (address)` [external]
- `getDecimals(address) returns (uint256)` [external]
- `getFee(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getIndex(address) returns (uint256)` [external]
- `isWrapped(address) returns (bool)` [external]
- `setDefaultRouter(address,address)` [external]
- `getValueVC(address,uint256) returns (uint256)` [external]
- `getValueUSD(address,uint256) returns (uint256)` [external]
- `getDefaultRouterAddress(address) returns (address)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address,address,address,address)` [external]
- `addCollateral(address,uint256,address,uint256,address,bool,address)` [external]
- `deprecateCollateral(address)` [external]
- `undeprecateCollateral(address)` [external]
- `changeOracle(address,address)` [external]
- `changePriceCurve(address,address)` [external]
- `changeRatio(address,uint256)` [external]
- `setDefaultRouter(address,address)` [external]
- `getDefaultRouterAddress(address) returns (address)` [external]
- `isValidRouter(address) returns (bool)` [external]
- `isWrapped(address) returns (bool)` [external]
- `getValidCollateral() returns (address[])` [external]
- `getRatio(address) returns (uint256)` [external]
- `getOracle(address) returns (address)` [external]
- `getPriceCurve(address) returns (address)` [external]
- `getIsActive(address) returns (bool)` [external]
- `getDecimals(address) returns (uint256)` [external]
- `getIndex(address) returns (uint256)` [external]
- `getFee(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(address,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getPrice(address) returns (uint256)` [public]
- `getValueUSD(address,uint256) returns (uint256)` [external]
- `getValueVC(address,uint256) returns (uint256)` [external]

---

## Contract: IPriceCurve
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setAddresses(address)` [external]
- `setDecayTime(uint256)` [external]
- `getFee(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `setFeeCapAndTime(uint256,uint256)` [external]
- `getFeeCapAndTime() returns (uint256, uint256)` [external]
- `calculateDecayedFee() returns (uint256)` [external]

---

## Contract: MultiTroveGetter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `TroveManager public troveManager` 
- `ISortedTroves public sortedTroves` 
- `IWhitelist public whitelist` 

### Public/External Functions
- `getMultipleSortedTroves(int256,uint256) returns (MultiTroveGetter.CombinedTroveData[])` [external]

---


# Project Summary

## Contract: GasPool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: Migrations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public owner` 
- `uint256 public last_completed_migration` 

### Public/External Functions
- `setCompleted(uint256)` [public]
- `upgrade(address)` [public]

---


# Project Summary

## Contract: ActivePool
**Inheritance (C3 Linearized):** YetiCustomBase -> BaseMath -> IActivePool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerAddress` 
- `address internal stabilityPoolAddress` 
- `address internal defaultPoolAddress` 
- `address internal troveManagerLiquidationsAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal collSurplusPoolAddress` 
- `YetiCustomBase.newColls internal poolColl` 
- `uint256 internal YUSDDebt` 

### Public/External Functions
- `sendCollaterals(address,address[],uint256[]) returns (bool)` [external]
- `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)` [external]
- `sendSingleCollateral(address,address,uint256) returns (bool)` [external]
- `sendSingleCollateralUnwrap(address,address,address,uint256) returns (bool)` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `getCollateral(address) returns (uint256)` [public]
- `getAllCollateral() returns (address[], uint256[])` [public]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `sendCollaterals(address,address[],uint256[]) returns (bool)` [external]
- `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)` [external]
- `sendSingleCollateral(address,address,uint256) returns (bool)` [external]
- `sendSingleCollateralUnwrap(address,address,address,uint256) returns (bool)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]

---


# Project Summary

## Contract: HintHelpers
**Inheritance (C3 Linearized):** CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `bytes32 public NAME` constant
- `ISortedTroves internal sortedTroves` 
- `ITroveManager internal troveManager` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address)` [external]
- `getRedemptionHints(uint256,uint256) returns (address, uint256, uint256)` [external]
- `getApproxHint(uint256,uint256,uint256) returns (address, uint256, uint256)` [external]

---


# Project Summary

## Contract: LiquitySafeMath128
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IBorrowerOperations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]

---

## Contract: ICommunityIssuance
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setAddresses(address,address)` [external]
- `issueYETI() returns (uint256)` [external]
- `sendYETI(address,uint256)` [external]

---

## Contract: StabilityPool
**Inheritance (C3 Linearized):** IStabilityPool -> ICollateralReceiver -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `address internal troveManagerLiquidationsAddress` 
- `address internal whitelistAddress` 
- `IBorrowerOperations internal borrowerOperations` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdToken` 
- `ICommunityIssuance internal communityIssuance` 
- `ISortedTroves internal sortedTroves` 
- `uint256 internal totalYUSDDeposits` 
- `YetiCustomBase.newColls internal totalColl` 
- `mapping(address => StabilityPool.Deposit) public deposits` 
- `mapping(address => StabilityPool.Snapshots) public depositSnapshots` 
- `mapping(address => StabilityPool.FrontEnd) public frontEnds` 
- `mapping(address => uint256) public frontEndStakes` 
- `mapping(address => StabilityPool.Snapshots) public frontEndSnapshots` 
- `uint256 public P` 
- `uint256 public SCALE_FACTOR` constant
- `uint128 public currentScale` 
- `uint128 public currentEpoch` 
- `mapping(address => mapping(uint128 => mapping(uint128 => uint256))) public epochToScaleToSum` 
- `mapping(uint128 => mapping(uint128 => uint256)) public epochToScaleToG` 
- `uint256 public lastYETIError` 
- `uint256[] public lastAssetError_Offset` 
- `uint256 public lastYUSDLossError_Offset` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]
- `registerFrontEnd(uint256)` [external]
- `offset(uint256,address[],uint256[])` [external]
- `getDepositorGains(address) returns (address[], uint256[])` [external]
- `getVC() returns (uint256)` [external]
- `getTotalYUSDDeposits() returns (uint256)` [external]
- `getDepositorYETIGain(address) returns (uint256)` [external]
- `getFrontEndYETIGain(address) returns (uint256)` [external]
- `getCompoundedYUSDDeposit(address) returns (uint256)` [external]
- `getCompoundedFrontEndStake(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]
- `getDepositSnapshotS(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getTotalYUSDDeposits() returns (uint256)` [external]
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]
- `offset(uint256,address[],uint256[])` [external]
- `getDepositorGains(address) returns (address[], uint256[])` [public]
- `getDepositorYETIGain(address) returns (uint256)` [public]
- `getFrontEndYETIGain(address) returns (uint256)` [public]
- `getCompoundedYUSDDeposit(address) returns (uint256)` [public]
- `getCompoundedFrontEndStake(address) returns (uint256)` [public]
- `registerFrontEnd(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]
- `getDepositSnapshotS(address,address) returns (uint256)` [external]

---


# Project Summary

## Contract: IsYETIRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `swap(uint256,uint256,address) returns (uint256[])` [external]

---


# Project Summary

## Contract: ShortLockupContract
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes32 public NAME` constant
- `uint256 public SECONDS_IN_ONE_YEAR` constant
- `address public beneficiary` immutable
- `IYETIToken public yetiToken` immutable
- `uint256 public unlockTime` 

### Public/External Functions
- `withdrawYETI()` [external]

---


# Project Summary

## Contract: YETIToken
**Inheritance (C3 Linearized):** IYETIToken -> IERC2612 -> IERC20

### State Variables & Constants
- `string internal _NAME` constant
- `string internal _SYMBOL` constant
- `string internal _VERSION` constant
- `uint8 internal _DECIMALS` constant
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `uint256 private _totalSupply` 
- `bytes32 private _PERMIT_TYPEHASH` immutable
- `bytes32 private _TYPE_HASH` constant
- `bytes32 private _CACHED_DOMAIN_SEPARATOR` immutable
- `uint256 private _CACHED_CHAIN_ID` immutable
- `bytes32 private _HASHED_NAME` immutable
- `bytes32 private _HASHED_VERSION` immutable
- `mapping(address => uint256) private _nonces` 
- `uint256 internal _1_MILLION` 
- `uint256 internal deploymentStartTime` immutable
- `address public sYETIAddress` immutable

### Public/External Functions
- `sendToSYETI(address,uint256)` [external]
- `getDeploymentStartTime() returns (uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `sendToSYETI(address,uint256)` [external]
- `domainSeparator() returns (bytes32)` [public]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `getDeploymentStartTime() returns (uint256)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]

---


# Project Summary

## Contract: TeamLockup
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal multisig` 
- `IERC20 internal YETI` 
- `uint256 internal vestingStart` immutable
- `uint256 internal vestingLength` immutable
- `uint256 internal totalVest` immutable
- `uint256 internal totalClaimed` 

### Public/External Functions
- `claimYeti(uint256)` [external]
- `updateMultisig(address)` [external]

---


# Project Summary

## Contract: LockupContract
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes32 public NAME` constant
- `uint256 public SECONDS_IN_ONE_YEAR` constant
- `address public beneficiary` immutable
- `IYETIToken public yetiToken` immutable
- `uint256 public unlockTime` 

### Public/External Functions
- `withdrawYETI()` [external]

---

## Contract: LockupContractFactory
**Inheritance (C3 Linearized):** CheckContract -> Ownable -> ILockupContractFactory

### State Variables & Constants
- `bytes32 public NAME` constant
- `uint256 public SECONDS_IN_ONE_YEAR` constant
- `address public yetiTokenAddress` 
- `mapping(address => address) public lockupContractToDeployer` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setYETITokenAddress(address)` [external]
- `deployLockupContract(address,uint256)` [external]
- `isRegisteredLockup(address) returns (bool)` [external]
- `setYETITokenAddress(address)` [external]
- `deployLockupContract(address,uint256)` [external]
- `isRegisteredLockup(address) returns (bool)` [public]

---


# Project Summary


# Project Summary

## Contract: BoringERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes4 private SIG_SYMBOL` constant
- `bytes4 private SIG_NAME` constant
- `bytes4 private SIG_DECIMALS` constant
- `bytes4 private SIG_BALANCE_OF` constant
- `bytes4 private SIG_TRANSFER` constant
- `bytes4 private SIG_TRANSFER_FROM` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: BoringMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: BoringMath128
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: BoringMath64
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: BoringMath32
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: ERC20Data
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `mapping(address => uint256) public balanceOf` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `mapping(address => uint256) public nonces` 

### Public/External Functions
- *No public/external functions.*

---

## Contract: ERC20WithSupply
**Inheritance (C3 Linearized):** ERC20 -> Domain -> IERC20

### State Variables & Constants
- `mapping(address => uint256) public balanceOf` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `mapping(address => uint256) public nonces` 
- `uint256 public totalSupply` 

### Public/External Functions
- `transfer(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]

---

## Contract: sYETIToken
**Inheritance (C3 Linearized):** BoringOwnable -> BoringOwnableData -> Domain -> IERC20

### State Variables & Constants
- `address public owner` 
- `address public pendingOwner` 
- `string public symbol` constant
- `string public name` constant
- `uint8 public decimals` constant
- `uint256 public totalSupply` 
- `uint256 private LOCK_TIME` constant
- `uint256 public effectiveYetiTokenBalance` 
- `uint256 public lastBuybackTime` 
- `uint256 public lastBuybackPrice` 
- `uint256 public lastRebaseTime` 
- `uint256 public transferRatio` 
- `IYETIToken public yetiToken` 
- `IERC20 public yusdToken` 
- `bool private addressesSet` 
- `mapping(address => bool) public validRouters` 
- `mapping(address => sYETIToken.User) public users` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `mapping(address => uint256) public nonces` 
- `bytes32 private PERMIT_SIGNATURE_HASH` constant

### Public/External Functions
- `transferOwnership(address,bool,bool)` [public]
- `claimOwnership()` [public]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `setAddresses(IYETIToken,IERC20)` [external]
- `transfer(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `mint(uint256) returns (bool)` [public]
- `burn(address,uint256) returns (bool)` [public]
- `burnFrom(address,address,uint256) returns (bool)` [public]
- `buyBack(address,uint256,uint256)` [external]
- `publicBuyBack(address)` [external]
- `rebase()` [external]
- `setTransferRatio(uint256)` [external]
- `addValidRouter(address)` [external]
- `removeValidRouter(address)` [external]

---


# Project Summary

## Contract: CommunityIssuance
**Inheritance (C3 Linearized):** BaseMath -> CheckContract -> Ownable -> ICommunityIssuance

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `bytes32 public NAME` constant
- `uint256 public SECONDS_IN_ONE_MINUTE` constant
- `uint256 public ISSUANCE_FACTOR` constant
- `uint256 public YETISupplyCap` constant
- `IYETIToken public yetiToken` 
- `address public stabilityPoolAddress` 
- `uint256 public totalYETIIssued` 
- `uint256 public deploymentTime` immutable

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address)` [external]
- `issueYETI() returns (uint256)` [external]
- `sendYETI(address,uint256)` [external]
- `setAddresses(address,address)` [external]
- `issueYETI() returns (uint256)` [external]
- `sendYETI(address,uint256)` [external]

---


# Project Summary

## Contract: dummyUniV2Router
**Inheritance (C3 Linearized):** BoringOwnable -> BoringOwnableData -> IsYETIRouter

### State Variables & Constants
- `address public owner` 
- `address public pendingOwner` 
- `IRouter internal JOERouter` 
- `address internal JOERouterAddress` 
- `address[] internal path` 
- `IERC20 internal yusdToken` 
- `IERC20 internal yetiToken` 

### Public/External Functions
- `transferOwnership(address,bool,bool)` [public]
- `claimOwnership()` [public]
- `swap(uint256,uint256,address) returns (uint256[])` [external]
- `setup(address,address,address)` [external]
- `swap(uint256,uint256,address) returns (uint256[])` [external]

---

## Contract: IRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256[])` [external]

---


# Project Summary

## Contract: Domain
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes32 private DOMAIN_SEPARATOR_SIGNATURE_HASH` constant
- `string private EIP191_PREFIX_FOR_EIP712_STRUCTURED_DATA` constant
- `bytes32 private _DOMAIN_SEPARATOR` immutable
- `uint256 private DOMAIN_SEPARATOR_CHAIN_ID` immutable

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary


# Project Summary

## Contract: BoringBatchable
**Inheritance (C3 Linearized):** BaseBoringBatchable

### State Variables & Constants
- None

### Public/External Functions
- `batch(bytes[],bool)` [external]
- `permitToken(IERC20,address,address,uint256,uint256,uint8,bytes32,bytes32)` [public]

---


# Project Summary


# Project Summary

## Contract: BoringOwnable
**Inheritance (C3 Linearized):** BoringOwnableData

### State Variables & Constants
- `address public owner` 
- `address public pendingOwner` 

### Public/External Functions
- `transferOwnership(address,bool,bool)` [public]
- `claimOwnership()` [public]

---


# Project Summary


# Project Summary

## Contract: YetiCustomBase
**Inheritance (C3 Linearized):** BaseMath

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: BaseMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: TroveManagerBase
**Inheritance (C3 Linearized):** CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: ReentrancyGuard
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 private _NOT_ENTERED` constant
- `uint256 private _ENTERED` constant
- `uint256 private _status` 

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary

## Contract: CheckContract
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: HomoraMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: Ownable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address private _owner` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]

---


# Project Summary

## Contract: LiquityBase
**Inheritance (C3 Linearized):** YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 

### Public/External Functions
- `getEntireSystemDebt() returns (uint256)` [external]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: TellorCaller
**Inheritance (C3 Linearized):** ITellorCaller

### State Variables & Constants
- `ITellor public tellor` 

### Public/External Functions
- `getTellorCurrentValue(uint256) returns (bool, uint256, uint256)` [external]
- `getTellorCurrentValue(uint256) returns (bool, uint256, uint256)` [external]

---

## Contract: ITellor
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `beginDispute(uint256,uint256,uint256)` [external]
- `vote(uint256,bool)` [external]
- `tallyVotes(uint256)` [external]
- `proposeFork(address)` [external]
- `addTip(uint256,uint256)` [external]
- `submitMiningSolution(string,uint256,uint256)` [external]
- `submitMiningSolution(string,uint256[5],uint256[5])` [external]
- `proposeOwnership(address)` [external]
- `claimOwnership()` [external]
- `depositStake()` [external]
- `requestStakingWithdraw()` [external]
- `withdrawStake()` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `getNewCurrentVariables() returns (bytes32, uint256[5], uint256, uint256)` [external]
- `getTopRequestIDs() returns (uint256[5])` [external]
- `getNewVariablesOnDeck() returns (uint256[5], uint256[5])` [external]
- `updateTellor(uint256)` [external]
- `unlockDisputeFee(uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `allowedToTrade(address,uint256) returns (bool)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `balanceOfAt(address,uint256) returns (uint256)` [external]
- `didMine(bytes32,address) returns (bool)` [external]
- `didVote(uint256,address) returns (bool)` [external]
- `getAddressVars(bytes32) returns (address)` [external]
- `getAllDisputeVars(uint256) returns (bytes32, bool, bool, bool, address, address, address, uint256[9], int256)` [external]
- `getCurrentVariables() returns (bytes32, uint256, uint256, string, uint256, uint256)` [external]
- `getDisputeIdByDisputeHash(bytes32) returns (uint256)` [external]
- `getDisputeUintVars(uint256,bytes32) returns (uint256)` [external]
- `getLastNewValue() returns (uint256, bool)` [external]
- `getLastNewValueById(uint256) returns (uint256, bool)` [external]
- `getMinedBlockNum(uint256,uint256) returns (uint256)` [external]
- `getMinersByRequestIdAndTimestamp(uint256,uint256) returns (address[5])` [external]
- `getNewValueCountbyRequestId(uint256) returns (uint256)` [external]
- `getRequestIdByRequestQIndex(uint256) returns (uint256)` [external]
- `getRequestIdByTimestamp(uint256) returns (uint256)` [external]
- `getRequestIdByQueryHash(bytes32) returns (uint256)` [external]
- `getRequestQ() returns (uint256[51])` [external]
- `getRequestUintVars(uint256,bytes32) returns (uint256)` [external]
- `getRequestVars(uint256) returns (string, string, bytes32, uint256, uint256, uint256)` [external]
- `getStakerInfo(address) returns (uint256, uint256)` [external]
- `getSubmissionsByTimestamp(uint256,uint256) returns (uint256[5])` [external]
- `getTimestampbyRequestIDandIndex(uint256,uint256) returns (uint256)` [external]
- `getUintVar(bytes32) returns (uint256)` [external]
- `getVariablesOnDeck() returns (uint256, uint256, string)` [external]
- `isInDispute(uint256,uint256) returns (bool)` [external]
- `retrieveData(uint256,uint256) returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: TokenScript
**Inheritance (C3 Linearized):** CheckContract

### State Variables & Constants
- `bytes32 public NAME` constant
- `IERC20 internal token` immutable

### Public/External Functions
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]

---


# Project Summary

## Contract: BorrowerOperationsScript
**Inheritance (C3 Linearized):** CheckContract

### State Variables & Constants
- `IBorrowerOperations internal borrowerOperations` immutable

### Public/External Functions
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawYUSD(uint256,address,address,uint256)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `claimCollateral()` [external]

---


# Project Summary

## Contract: ETHTransferScript
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `transferETH(address,uint256) returns (bool)` [external]

---


# Project Summary

## Contract: SYETIScript
**Inheritance (C3 Linearized):** CheckContract

### State Variables & Constants
- `ISYETI internal SYETI` immutable

### Public/External Functions
- `stake(uint256)` [external]

---


# Project Summary

## Contract: TroveManagerScript
**Inheritance (C3 Linearized):** CheckContract

### State Variables & Constants
- `bytes32 public NAME` constant
- `ITroveManager internal troveManager` immutable

### Public/External Functions
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: BorrowerWrappersScript
**Inheritance (C3 Linearized):** SYETIScript -> ETHTransferScript -> BorrowerOperationsScript -> CheckContract

### State Variables & Constants
- `IBorrowerOperations internal borrowerOperations` immutable
- `ISYETI internal SYETI` immutable
- `bytes32 public NAME` constant
- `ITroveManager internal troveManager` immutable
- `IStabilityPool internal stabilityPool` immutable
- `IERC20 internal yusdToken` immutable
- `IERC20 internal yetiToken` immutable
- `ISYETI internal sYETI` immutable

### Public/External Functions
- `stake(uint256)` [external]
- `transferETH(address,uint256) returns (bool)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawYUSD(uint256,address,address,uint256)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `claimCollateral()` [external]

---


# Project Summary

## Contract: StabilityPoolScript
**Inheritance (C3 Linearized):** CheckContract

### State Variables & Constants
- `bytes32 public NAME` constant
- `IStabilityPool internal stabilityPool` immutable

### Public/External Functions
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]

---


# Project Summary


# Project Summary

## Contract: IRewarder
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IMasterChefJoeV2
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `deposit(uint256,uint256)` [external]
- `withdraw(uint256,uint256)` [external]
- `poolInfo(uint256) returns (IMasterChefJoeV2.PoolInfo)` [external]
- `poolLength() returns (uint256)` [external]

---

## Contract: WJLP
**Inheritance (C3 Linearized):** IWAsset -> ERC20_8 -> IERC20

### State Variables & Constants
- `string public _symbol` 
- `string public _name` 
- `uint8 public _decimals` 
- `uint256 public _totalSupply` 
- `mapping(address => uint256) internal balances` 
- `mapping(address => mapping(address => uint256)) internal allowed` 
- `IERC20 public JLP` immutable
- `IERC20 public JOE` immutable
- `IMasterChefJoeV2 public _MasterChefJoe` immutable
- `uint256 public _poolPid` 
- `address internal activePool` 
- `address internal TML` 
- `address internal TMR` 
- `address internal defaultPool` 
- `address internal stabilityPool` 
- `address internal YetiFinanceTreasury` 
- `address internal borrowerOperations` 
- `address internal collSurplusPool` 
- `bool internal addressesSet` 
- `mapping(address => WJLP.UserInfo) internal userInfo` 

### Public/External Functions
- `wrap(uint256,address,address,address)` [external]
- `unwrap(uint256)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `claimReward(address)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `decimals() returns (uint8)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `wrap(uint256,address,address,address)` [external]
- `unwrap(uint256)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `unwrapFor(address,address,uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `claimReward(address)` [external]

---


# Project Summary

## Contract: IComptroller
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `claimReward(uint8,address,address[])` [external]
- `claimReward(uint8,address)` [external]

---

## Contract: WBQI
**Inheritance (C3 Linearized):** IWAsset -> ERC20_8 -> IERC20

### State Variables & Constants
- `string public _symbol` 
- `string public _name` 
- `uint8 public _decimals` 
- `uint256 public _totalSupply` 
- `mapping(address => uint256) internal balances` 
- `mapping(address => mapping(address => uint256)) internal allowed` 
- `IERC20 public Qtoken` 
- `IERC20 public QI` 
- `address[] internal qiTokens` 
- `IComptroller public _Comptroller` 
- `bool internal lock` 
- `address internal activePool` 
- `address internal TML` 
- `address internal TMR` 
- `address internal defaultPool` 
- `address internal stabilityPool` 
- `address internal YetiFinanceTreasury` 
- `uint256 public SHAREOFFSET` 
- `bool internal addressesSet` 
- `mapping(address => WBQI.UserInfo) internal userInfo` 
- `uint256 public globalAVAXRewardPending` 
- `uint256 public globalQIRewardPending` 

### Public/External Functions
- `wrap(uint256,address,address,address)` [external]
- `unwrap(uint256)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `claimReward(address)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `decimals() returns (uint8)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `setAddresses(address,address,address,address,address,address)` [external]
- `wrap(uint256,address,address,address)` [external]
- `unwrap(uint256)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `claimReward(address)` [external]
- `fallback()` [external]

---


# Project Summary


# Project Summary

## Contract: WAAVE
**Inheritance (C3 Linearized):** IWAsset -> ERC20_8 -> IERC20

### State Variables & Constants
- `string public _symbol` 
- `string public _name` 
- `uint8 public _decimals` 
- `uint256 public _totalSupply` 
- `mapping(address => uint256) internal balances` 
- `mapping(address => mapping(address => uint256)) internal allowed` 
- `IERC20 public aToken` 
- `address internal activePool` 
- `address internal TML` 
- `address internal TMR` 
- `address internal defaultPool` 
- `address internal stabilityPool` 
- `address internal YetiFinanceTreasury` 
- `uint256 public SHAREOFFSET` 
- `bool internal addressesSet` 
- `mapping(address => WAAVE.UserInfo) internal userInfo` 

### Public/External Functions
- `wrap(uint256,address,address,address)` [external]
- `unwrap(uint256)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `claimReward(address)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `decimals() returns (uint8)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `setAddresses(address,address,address,address,address,address)` [external]
- `wrap(uint256,address,address,address)` [external]
- `aavePerShare() returns (uint256)` [public]
- `unwrap(uint256)` [external]
- `unwrapFor(address,address,uint256)` [external]
- `endTreasuryReward(address,uint256)` [external]
- `updateReward(address,address,uint256)` [external]
- `getPendingRewards(address) returns (address[], uint256[])` [external]
- `getUserInfo(address) returns (uint256, uint256, uint256)` [external]
- `claimRewardTreasury()` [external]
- `claimReward(address)` [external]

---


# Project Summary

## Contract: ERC20_8
**Inheritance (C3 Linearized):** IERC20

### State Variables & Constants
- `string public _symbol` 
- `string public _name` 
- `uint8 public _decimals` 
- `uint256 public _totalSupply` 
- `mapping(address => uint256) internal balances` 
- `mapping(address => mapping(address => uint256)) internal allowed` 

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `decimals() returns (uint8)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: IZap
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `zapInToken(address,uint256,address)` [external]
- `zapIn(address)` [external]
- `zapOut(address,uint256)` [external]

---


# Project Summary

## Contract: IBaseOracle
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getPrice(address) returns (uint256)` [external]

---

## Contract: IUniswapV2Pair
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `PERMIT_TYPEHASH() returns (bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `MINIMUM_LIQUIDITY() returns (uint256)` [external]
- `factory() returns (address)` [external]
- `token0() returns (address)` [external]
- `token1() returns (address)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `price0CumulativeLast() returns (uint256)` [external]
- `price1CumulativeLast() returns (uint256)` [external]
- `kLast() returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `burn(address) returns (uint256, uint256)` [external]
- `swap(uint256,uint256,address,bytes)` [external]
- `skim(address)` [external]
- `sync()` [external]
- `initialize(address,address)` [external]

---

## Contract: UniswapV2LPTokenPriceFeed
**Inheritance (C3 Linearized):** Ownable -> IPriceFeed

### State Variables & Constants
- `IBaseOracle internal base` 
- `address internal pair` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `fetchPrice_v() returns (uint256)` [external]
- `setParam(IBaseOracle,address)` [external]
- `fetchPrice_v() returns (uint256)` [external]

---


# Project Summary

## Contract: IQIToken
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `exchangeRateCurrent() returns (uint256)` [external]
- `underlying() returns (address)` [external]

---

## Contract: BQIOracle
**Inheritance (C3 Linearized):** Ownable

### State Variables & Constants
- `IBaseOracle internal base` 
- `address internal underlying` 
- `IQIToken internal BQI` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setParam(IBaseOracle,address,address)` [external]
- `fetchPrice_v() returns (uint256)` [external]
- `fetchPrice() returns (uint256)` [external]

---


# Project Summary

## Contract: IWAAVE
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `aavePerShare() returns (uint256)` [external]

---

## Contract: AAVEOracle
**Inheritance (C3 Linearized):** Ownable

### State Variables & Constants
- `IBaseOracle internal base` 
- `address internal underlying` 
- `IWAAVE internal WAAVE` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setParam(IBaseOracle,address,address)` [external]
- `fetchPrice_v() returns (uint256)` [external]
- `fetchPrice() returns (uint256)` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: IJoeZapper
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `zapInToken(address,uint256,address)` [external]
- `zapIn(address)` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: IPool
**Inheritance (C3 Linearized):** ICollateralReceiver

### State Variables & Constants
- None

### Public/External Functions
- `receiveCollateral(address[],uint256[])` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]

---


# Project Summary

## Contract: ILockupContractFactory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setYETITokenAddress(address)` [external]
- `deployLockupContract(address,uint256)` [external]
- `isRegisteredLockup(address) returns (bool)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: IERC2612
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]

---


# Project Summary


# Project Summary

## Contract: IOracle
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getPrice() returns (uint256)` [external]
- `getValue(uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ILiquityBase
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getEntireSystemDebt() returns (uint256)` [external]

---


# Project Summary


# Project Summary

## Contract: ICollateralReceiver
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `receiveCollateral(address[],uint256[])` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: ITraderJoeZap
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `zapOut(address,uint256)` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: ERC20Router
**Inheritance (C3 Linearized):** IYetiRouter

### State Variables & Constants
- `address internal activePoolAddress` 
- `address internal traderJoeRouter` 
- `address internal yusdTokenAddress` 
- `string public name` 

### Public/External Functions
- `route(address,address,address,uint256,uint256) returns (uint256)` [external]
- `unRoute(address,address,address,uint256,uint256) returns (uint256)` [external]
- `route(address,address,address,uint256,uint256) returns (uint256)` [public]
- `unRoute(address,address,address,uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: WJLPRouter
**Inheritance (C3 Linearized):** IYetiRouter

### State Variables & Constants
- `address internal activePoolAddress` 
- `address public JLPAddress` 
- `address public WJLPAddress` 
- `IJoeZapper public joeZapper` 
- `IWAsset public WJLP` 
- `address internal yusdTokenAddress` 

### Public/External Functions
- `route(address,address,address,uint256,uint256) returns (uint256)` [external]
- `unRoute(address,address,address,uint256,uint256) returns (uint256)` [external]
- `route(address,address,address,uint256,uint256) returns (uint256)` [public]
- `unRoute(address,address,address,uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: Unipool
**Inheritance (C3 Linearized):** IUnipool -> CheckContract -> Ownable -> LPTokenWrapper -> ILPTokenWrapper

### State Variables & Constants
- `IERC20 public uniToken` 
- `bytes32 public NAME` constant
- `uint256 public duration` 
- `IYETIToken public yetiToken` 
- `uint256 public periodFinish` 
- `uint256 public rewardRate` 
- `uint256 public lastUpdateTime` 
- `uint256 public rewardPerTokenStored` 
- `mapping(address => uint256) public userRewardPerTokenPaid` 
- `mapping(address => uint256) public rewards` 

### Public/External Functions
- `setParams(address,address,uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [external]
- `rewardPerToken() returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `withdrawAndClaim()` [external]
- `claimReward()` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `stake(uint256)` [public]
- `withdraw(uint256)` [public]
- `stake(uint256)` [external]
- `withdraw(uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `setParams(address,address,uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [public]
- `rewardPerToken() returns (uint256)` [public]
- `earned(address) returns (uint256)` [public]
- `stake(uint256)` [public]
- `withdraw(uint256)` [public]
- `withdrawAndClaim()` [external]
- `claimReward()` [public]

---


# Project Summary

## Contract: Pool2Unipool
**Inheritance (C3 Linearized):** IUnipool -> CheckContract -> Ownable -> LPTokenWrapper -> ILPTokenWrapper

### State Variables & Constants
- `IERC20 public uniToken` 
- `bytes32 public NAME` constant
- `uint256 public duration` 
- `IYETIToken public yetiToken` 
- `uint256 public periodFinish` 
- `uint256 public rewardRate` 
- `uint256 public lastUpdateTime` 
- `uint256 public rewardPerTokenStored` 
- `mapping(address => uint256) public userRewardPerTokenPaid` 
- `mapping(address => uint256) public rewards` 

### Public/External Functions
- `setParams(address,address,uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [external]
- `rewardPerToken() returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `withdrawAndClaim()` [external]
- `claimReward()` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `stake(uint256)` [public]
- `withdraw(uint256)` [public]
- `stake(uint256)` [external]
- `withdraw(uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `setParams(address,address,uint256)` [external]
- `setReward(uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [public]
- `rewardPerToken() returns (uint256)` [public]
- `earned(address) returns (uint256)` [public]
- `stake(uint256)` [public]
- `withdraw(uint256)` [public]
- `withdrawAndClaim()` [external]
- `claimReward()` [public]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: ILPTokenWrapper
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `stake(uint256)` [external]
- `withdraw(uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]

---


# Project Summary

## Contract: IUnipool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setParams(address,address,uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [external]
- `rewardPerToken() returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `withdrawAndClaim()` [external]
- `claimReward()` [external]

---


# Project Summary

## Contract: ERC20Mock
**Inheritance (C3 Linearized):** ERC20 -> IERC20 -> Context

### State Variables & Constants
- None

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
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `mint(address,uint256)` [public]
- `burn(address,uint256)` [public]
- `transferInternal(address,address,uint256)` [public]
- `approveInternal(address,address,uint256)` [public]

---


# Project Summary

## Contract: StabilityPoolTester
**Inheritance (C3 Linearized):** StabilityPool -> IStabilityPool -> ICollateralReceiver -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `address internal troveManagerLiquidationsAddress` 
- `address internal whitelistAddress` 
- `IBorrowerOperations internal borrowerOperations` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdToken` 
- `ICommunityIssuance internal communityIssuance` 
- `ISortedTroves internal sortedTroves` 
- `uint256 internal totalYUSDDeposits` 
- `YetiCustomBase.newColls internal totalColl` 
- `mapping(address => StabilityPool.Deposit) public deposits` 
- `mapping(address => StabilityPool.Snapshots) public depositSnapshots` 
- `mapping(address => StabilityPool.FrontEnd) public frontEnds` 
- `mapping(address => uint256) public frontEndStakes` 
- `mapping(address => StabilityPool.Snapshots) public frontEndSnapshots` 
- `uint256 public P` 
- `uint256 public SCALE_FACTOR` constant
- `uint128 public currentScale` 
- `uint128 public currentEpoch` 
- `mapping(address => mapping(uint128 => mapping(uint128 => uint256))) public epochToScaleToSum` 
- `mapping(uint128 => mapping(uint128 => uint256)) public epochToScaleToG` 
- `uint256 public lastYETIError` 
- `uint256[] public lastAssetError_Offset` 
- `uint256 public lastYUSDLossError_Offset` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getTotalYUSDDeposits() returns (uint256)` [external]
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]
- `offset(uint256,address[],uint256[])` [external]
- `getDepositorGains(address) returns (address[], uint256[])` [public]
- `getDepositorYETIGain(address) returns (uint256)` [public]
- `getFrontEndYETIGain(address) returns (uint256)` [public]
- `getCompoundedYUSDDeposit(address) returns (uint256)` [public]
- `getCompoundedFrontEndStake(address) returns (uint256)` [public]
- `registerFrontEnd(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]
- `getDepositSnapshotS(address,address) returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `provideToSP(uint256,address)` [external]
- `withdrawFromSP(uint256)` [external]
- `registerFrontEnd(uint256)` [external]
- `offset(uint256,address[],uint256[])` [external]
- `getDepositorGains(address) returns (address[], uint256[])` [external]
- `getVC() returns (uint256)` [external]
- `getTotalYUSDDeposits() returns (uint256)` [external]
- `getDepositorYETIGain(address) returns (uint256)` [external]
- `getFrontEndYETIGain(address) returns (uint256)` [external]
- `getCompoundedYUSDDeposit(address) returns (uint256)` [external]
- `getCompoundedFrontEndStake(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]
- `getDepositSnapshotS(address,address) returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]

---


# Project Summary

## Contract: DefaultPoolTester
**Inheritance (C3 Linearized):** DefaultPool -> YetiCustomBase -> BaseMath -> IDefaultPool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `string public NAME` constant
- `address internal troveManagerAddress` 
- `address internal activePoolAddress` 
- `address internal whitelistAddress` 
- `address internal yetiFinanceTreasury` 
- `YetiCustomBase.newColls internal poolColl` 
- `uint256 internal YUSDDebt` 

### Public/External Functions
- `setAddresses(address,address,address,address)` [external]
- `getCollateral(address) returns (uint256)` [public]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `sendCollsToActivePool(address[],uint256[],address)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]
- `sendCollsToActivePool(address[],uint256[],address)` [external]
- `addCollateralType(address)` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `unprotectedIncreaseYUSDDebt(uint256)` [external]
- `unprotectedPayable()` [external]
- `getEthAmount() returns (uint256)` [external]
- `getCollateralVCC(address) returns (uint256)` [external]

---


# Project Summary

## Contract: BorrowerOperationsTester
**Inheritance (C3 Linearized):** BorrowerOperations -> ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `ITroveManager internal troveManager` 
- `address internal stabilityPoolAddress` 
- `address internal gasPoolAddress` 
- `ICollSurplusPool internal collSurplusPool` 
- `ISYETI internal sYETI` 
- `address internal sYETIAddress` 
- `IYUSDToken internal yusdToken` 
- `uint256 internal BOOTSTRAP_PERIOD` constant
- `uint256 internal deploymentTime` 
- `ISortedTroves internal sortedTroves` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `getNewICRFromTroveChange(uint256,uint256,uint256,bool) returns (uint256)` [external]
- `getNewTCRFromTroveChange(uint256,bool,uint256,bool) returns (uint256)` [external]
- `getVC(address[],uint256[]) returns (uint256)` [external]
- `sumColls(address[],uint256[],address[],uint256[]) returns (address[], uint256[])` [external]
- `get_MIN_NET_DEBT() returns (uint256)` [external]
- `receive()` [external]

---


# Project Summary

## Contract: console
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal CONSOLE_ADDRESS` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: MockAggregator
**Inheritance (C3 Linearized):** AggregatorV3Interface

### State Variables & Constants
- `uint8 private decimalsVal` 
- `int256 private price` 
- `int256 private prevPrice` 
- `uint256 private updateTime` 
- `uint256 private prevUpdateTime` 
- `uint80 private latestRoundId` 
- `uint80 private prevRoundId` 
- `bool internal latestRevert` 
- `bool internal prevRevert` 
- `bool internal decimalsRevert` 

### Public/External Functions
- `decimals() returns (uint8)` [external]
- `description() returns (string)` [external]
- `version() returns (uint256)` [external]
- `getRoundData(uint80) returns (uint80, int256, uint256, uint256, uint80)` [external]
- `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)` [external]
- `setDecimals(uint8)` [external]
- `setPrice(int256)` [external]
- `setPrevPrice(int256)` [external]
- `setPrevUpdateTime(uint256)` [external]
- `setUpdateTime(uint256)` [external]
- `setLatestRevert()` [external]
- `setPrevRevert()` [external]
- `setDecimalsRevert()` [external]
- `setLatestRoundId(uint80)` [external]
- `setPrevRoundId(uint80)` [external]
- `decimals() returns (uint8)` [external]
- `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)` [external]
- `getRoundData(uint80) returns (uint80, int256, uint256, uint256, uint80)` [external]
- `description() returns (string)` [external]
- `version() returns (uint256)` [external]

---


# Project Summary

## Contract: LiquitySafeMath128Tester
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `add(uint128,uint128) returns (uint128)` [external]
- `sub(uint128,uint128) returns (uint128)` [external]

---


# Project Summary

## Contract: FunctionCaller
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `ITroveManager internal troveManager` 
- `address public troveManagerAddress` 
- `ISortedTroves internal sortedTroves` 
- `address public sortedTrovesAddress` 
- `IPriceFeed internal priceFeed` 
- `address public priceFeedAddress` 

### Public/External Functions
- `setTroveManagerAddress(address)` [external]
- `setSortedTrovesAddress(address)` [external]
- `setPriceFeedAddress(address)` [external]
- `troveManager_getCurrentICR(address) returns (uint256)` [external]
- `sortedTroves_findInsertPosition(uint256,address,address) returns (address, address)` [external]

---


# Project Summary

## Contract: PriceFeedTestnet
**Inheritance (C3 Linearized):** IPriceFeed

### State Variables & Constants
- `uint256 private _price` 

### Public/External Functions
- `fetchPrice_v() returns (uint256)` [external]
- `getPrice() returns (uint256)` [external]
- `fetchPrice_v() returns (uint256)` [external]
- `setPrice(uint256) returns (bool)` [external]

---


# Project Summary

## Contract: MockTellor
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool internal didRetrieve` 
- `uint256 private price` 
- `uint256 private updateTime` 
- `bool private revertRequest` 

### Public/External Functions
- `setPrice(uint256)` [external]
- `setDidRetrieve(bool)` [external]
- `setUpdateTime(uint256)` [external]
- `setRevertRequest()` [external]
- `getTimestampbyRequestIDandIndex(uint256,uint256) returns (uint256)` [external]
- `getNewValueCountbyRequestId(uint256) returns (uint256)` [external]
- `retrieveData(uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: Destructible
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `receive()` [external]
- `destruct(address)` [external]

---


# Project Summary

## Contract: CommunityIssuanceTester
**Inheritance (C3 Linearized):** CommunityIssuance -> BaseMath -> CheckContract -> Ownable -> ICommunityIssuance

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `bytes32 public NAME` constant
- `uint256 public SECONDS_IN_ONE_MINUTE` constant
- `uint256 public ISSUANCE_FACTOR` constant
- `uint256 public YETISupplyCap` constant
- `IYETIToken public yetiToken` 
- `address public stabilityPoolAddress` 
- `uint256 public totalYETIIssued` 
- `uint256 public deploymentTime` immutable

### Public/External Functions
- `setAddresses(address,address)` [external]
- `issueYETI() returns (uint256)` [external]
- `sendYETI(address,uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address,address)` [external]
- `issueYETI() returns (uint256)` [external]
- `sendYETI(address,uint256)` [external]
- `obtainYETI(uint256)` [external]
- `getCumulativeIssuanceFraction() returns (uint256)` [external]
- `unprotectedIssueYETI() returns (uint256)` [external]

---


# Project Summary

## Contract: EchidnaProxy
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `TroveManager internal troveManager` 
- `BorrowerOperations internal borrowerOperations` 
- `StabilityPool internal stabilityPool` 
- `YUSDToken internal yusdToken` 

### Public/External Functions
- `receive()` [external]
- `liquidatePrx(address)` [external]
- `liquidateTrovesPrx(uint256)` [external]
- `batchLiquidateTrovesPrx(address[])` [external]
- `redeemCollateralPrx(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `openTrovePrx(uint256,uint256,address,address,address[],uint256[])` [external]
- `addCollPrx(address[],uint256[],address,address,uint256)` [external]
- `withdrawCollPrx(address[],uint256[],address,address)` [external]
- `withdrawYUSDPrx(uint256,address,address,uint256)` [external]
- `repayYUSDPrx(uint256,address,address)` [external]
- `closeTrovePrx()` [external]
- `adjustTrovePrx(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `provideToSPPrx(uint256,address)` [external]
- `withdrawFromSPPrx(uint256)` [external]
- `transferPrx(address,uint256) returns (bool)` [external]
- `approvePrx(address,uint256) returns (bool)` [external]
- `transferFromPrx(address,address,uint256) returns (bool)` [external]
- `increaseAllowancePrx(address,uint256) returns (bool)` [external]
- `decreaseAllowancePrx(address,uint256) returns (bool)` [external]

---

## Contract: EchidnaTester
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 private NUMBER_OF_ACTORS` constant
- `uint256 private INITIAL_BALANCE` constant
- `uint256 private MCR` 
- `uint256 private CCR` 
- `uint256 private YUSD_GAS_COMPENSATION` 
- `TroveManager public troveManager` 
- `TroveManagerLiquidations public troveManagerLiquidations` 
- `TroveManagerRedemptions public troveManagerRedemptions` 
- `BorrowerOperations public borrowerOperations` 
- `ActivePool public activePool` 
- `DefaultPool public defaultPool` 
- `StabilityPool public stabilityPool` 
- `GasPool public gasPool` 
- `CollSurplusPool public collSurplusPool` 
- `YUSDToken public yusdToken` 
- `PriceFeedTestnet internal priceFeedTestnet` 
- `SortedTroves internal sortedTroves` 
- `Whitelist internal whitelist` 
- `EchidnaProxy[100] public echidnaProxies` 
- `uint256 private numberOfTroves` 

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary

## Contract: YUSDTokenTester
**Inheritance (C3 Linearized):** YUSDToken -> IYUSDToken -> IERC2612 -> IERC20 -> CheckContract

### State Variables & Constants
- `string internal _NAME` constant
- `string internal _SYMBOL` constant
- `string internal _VERSION` constant
- `uint8 internal _DECIMALS` constant
- `address internal troveManagerAddress` immutable
- `address internal troveManagerLiquidationsAddress` immutable
- `address internal troveManagerRedemptionsAddress` immutable
- `address internal stabilityPoolAddress` immutable
- `address internal borrowerOperationsAddress` immutable
- `bytes32 private _PERMIT_TYPEHASH` immutable

### Public/External Functions
- `mint(address,uint256)` [external]
- `burn(address,uint256)` [external]
- `sendToPool(address,address,uint256)` [external]
- `returnFromPool(address,address,uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `domainSeparator() returns (bytes32)` [public]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `mint(address,uint256)` [external]
- `burn(address,uint256)` [external]
- `sendToPool(address,address,uint256)` [external]
- `returnFromPool(address,address,uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `unprotectedMint(address,uint256)` [external]
- `unprotectedBurn(address,uint256)` [external]
- `unprotectedSendToPool(address,address,uint256)` [external]
- `unprotectedReturnFromPool(address,address,uint256)` [external]
- `callInternalApprove(address,address,uint256) returns (bool)` [external]
- `getChainId() returns (uint256)` [external]
- `getDigest(address,address,uint256,uint256,uint256) returns (bytes32)` [external]
- `recoverAddress(bytes32,uint8,bytes32,bytes32) returns (address)` [external]

---


# Project Summary

## Contract: NonPayable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool internal isPayable` 

### Public/External Functions
- `setPayable(bool)` [external]
- `forward(address,bytes)` [external]
- `receive()` [external]

---


# Project Summary

## Contract: LiquityBaseTester
**Inheritance (C3 Linearized):** LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 

### Public/External Functions
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `setAddresses(address,address,address)` [external]
- `createCollExample() returns (address[], uint256[])` [external]
- `sumCollsTwoColls(address[],uint256[],address[],uint256[]) returns (address[], uint256[])` [external]
- `sumCollsOneCollsOneSplit(address[],uint256[],address[],uint256[]) returns (address[], uint256[])` [external]
- `sumCollsTwoSplit(address[],uint256[],address[],uint256[]) returns (address[], uint256[])` [external]
- `leftSumColls(address[],uint256[],address[],uint256[])` [external]
- `leftSubColls(address[],uint256[],address[],uint256[])` [external]
- `subColls(address[],uint256[],address[],uint256[])` [external]

---


# Project Summary

## Contract: SortedTrovesTester
**Inheritance (C3 Linearized):** SortedTroves -> ISortedTroves -> CheckContract -> Ownable

### State Variables & Constants
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal troveManagerAddress` 
- `SortedTroves.Data public data` 

### Public/External Functions
- `setParams(uint256,address,address,address)` [external]
- `insert(address,uint256,address,address)` [external]
- `remove(address)` [external]
- `reInsert(address,uint256,address,address)` [external]
- `contains(address) returns (bool)` [public]
- `isFull() returns (bool)` [public]
- `isEmpty() returns (bool)` [public]
- `getSize() returns (uint256)` [external]
- `getMaxSize() returns (uint256)` [external]
- `getFirst() returns (address)` [external]
- `getLast() returns (address)` [external]
- `getNext(address) returns (address)` [external]
- `getPrev(address) returns (address)` [external]
- `getOldICR(address) returns (uint256)` [external]
- `validInsertPosition(uint256,address,address) returns (bool)` [external]
- `findInsertPosition(uint256,address,address) returns (address, address)` [external]
- `setParams(uint256,address,address,address)` [external]
- `insert(address,uint256,address,address)` [external]
- `remove(address)` [external]
- `reInsert(address,uint256,address,address)` [external]
- `contains(address) returns (bool)` [external]
- `isFull() returns (bool)` [external]
- `isEmpty() returns (bool)` [external]
- `getSize() returns (uint256)` [external]
- `getMaxSize() returns (uint256)` [external]
- `getFirst() returns (address)` [external]
- `getLast() returns (address)` [external]
- `getNext(address) returns (address)` [external]
- `getPrev(address) returns (address)` [external]
- `getOldICR(address) returns (uint256)` [external]
- `validInsertPosition(uint256,address,address) returns (bool)` [external]
- `findInsertPosition(uint256,address,address) returns (address, address)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `callInsert(address,uint256,address,address)` [external]
- `callRemove(address)` [external]
- `callReInsert(address,uint256,address,address)` [external]

---


# Project Summary

## Contract: TroveManagerTester
**Inheritance (C3 Linearized):** TroveManager -> ReentrancyGuard -> ITroveManager -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `address internal borrowerOperationsAddress` 
- `IStabilityPool internal stabilityPoolContract` 
- `ITroveManager internal troveManager` 
- `IYUSDToken internal yusdTokenContract` 
- `IYETIToken internal yetiTokenContract` 
- `ISYETI internal sYETIContract` 
- `ITroveManagerRedemptions internal troveManagerRedemptions` 
- `ITroveManagerLiquidations internal troveManagerLiquidations` 
- `address internal gasPoolAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal troveManagerLiquidationsAddress` 
- `ISortedTroves internal sortedTroves` 
- `ICollSurplusPool internal collSurplusPool` 
- `bytes32 public NAME` constant
- `uint256 internal SECONDS_IN_ONE_MINUTE` constant
- `uint256 public MINUTE_DECAY_FACTOR` constant
- `uint256 public MAX_BORROWING_FEE` constant
- `uint256 public BOOTSTRAP_PERIOD` constant
- `uint256 public baseRate` 
- `uint256 public lastFeeOperationTime` 
- `mapping(address => TroveManagerBase.Trove) internal Troves` 
- `mapping(address => uint256) public totalStakes` 
- `mapping(address => uint256) public totalStakesSnapshot` 
- `mapping(address => uint256) public totalCollateralSnapshot` 
- `mapping(address => uint256) public L_YUSDDebt` 
- `mapping(address => TroveManager.RewardSnapshot) internal rewardSnapshots` 
- `mapping(address => uint256) public lastCollError_Redistribution` 
- `mapping(address => uint256) public lastYUSDDebtError_Redistribution` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `getTroveOwnersCount() returns (uint256)` [external]
- `getTroveFromTroveOwnersArray(uint256) returns (address)` [external]
- `liquidate(address)` [external]
- `batchLiquidateTroves(address[],address)` [external]
- `collSurplusUpdate(address,address[],uint256[])` [external]
- `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` [external]
- `updateTroves(address[],address[],address[])` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `getCurrentICR(address) returns (uint256)` [external]
- `applyPendingRewards(address)` [external]
- `updateTroveRewardSnapshots(address)` [external]
- `getPendingCollRewards(address) returns (address[], uint256[])` [external]
- `getPendingYUSDDebtReward(address) returns (uint256)` [public]
- `hasPendingRewards(address) returns (bool)` [public]
- `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])` [public]
- `removeStake(address)` [external]
- `updateStakeAndTotalStakes(address)` [external]
- `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` [external]
- `closeTrove(address)` [external]
- `closeTroveLiquidation(address)` [external]
- `closeTroveRedemption(address)` [external]
- `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` [external]
- `addTroveOwnerToArray(address) returns (uint256)` [external]
- `getTCR() returns (uint256)` [external]
- `checkRecoveryMode() returns (bool)` [external]
- `updateBaseRate(uint256)` [external]
- `getRedemptionRate() returns (uint256)` [public]
- `getRedemptionRateWithDecay() returns (uint256)` [public]
- `getRedemptionFeeWithDecay(uint256) returns (uint256)` [external]
- `getBorrowingRate() returns (uint256)` [public]
- `getBorrowingRateWithDecay() returns (uint256)` [public]
- `getBorrowingFee(uint256) returns (uint256)` [external]
- `getBorrowingFeeWithDecay(uint256) returns (uint256)` [external]
- `decayBaseRateFromBorrowing()` [external]
- `calcDecayedBaseRate() returns (uint256)` [public]
- `getTroveStatus(address) returns (uint256)` [external]
- `isTroveActive(address) returns (bool)` [external]
- `getTroveStake(address,address) returns (uint256)` [external]
- `getTroveDebt(address) returns (uint256)` [external]
- `getTotalStake(address) returns (uint256)` [external]
- `getL_Coll(address) returns (uint256)` [external]
- `getL_YUSD(address) returns (uint256)` [external]
- `getRewardSnapshotColl(address,address) returns (uint256)` [external]
- `getRewardSnapshotYUSD(address,address) returns (uint256)` [external]
- `getTroveVC(address) returns (uint256)` [external]
- `getTroveColls(address) returns (address[], uint256[])` [external]
- `getCurrentTroveState(address) returns (address[], uint256[], uint256)` [external]
- `updateTroveDebt(address,uint256)` [external]
- `updateTroveCollTMR(address,address[],uint256[])` [external]
- `removeStakeTMR(address)` [external]
- `removeStakeTLR(address)` [external]
- `setTroveStatus(address,uint256)` [external]
- `updateTroveColl(address,address[],uint256[])` [external]
- `increaseTroveDebt(address,uint256) returns (uint256)` [external]
- `decreaseTroveDebt(address,uint256) returns (uint256)` [external]
- `stabilityPool() returns (IStabilityPool)` [external]
- `yusdToken() returns (IYUSDToken)` [external]
- `yetiToken() returns (IYETIToken)` [external]
- `sYETI() returns (ISYETI)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` [external]
- `stabilityPool() returns (IStabilityPool)` [external]
- `yusdToken() returns (IYUSDToken)` [external]
- `yetiToken() returns (IYETIToken)` [external]
- `sYETI() returns (ISYETI)` [external]
- `getTroveOwnersCount() returns (uint256)` [external]
- `getTroveFromTroveOwnersArray(uint256) returns (address)` [external]
- `getCurrentICR(address) returns (uint256)` [external]
- `liquidate(address)` [external]
- `batchLiquidateTroves(address[],address)` [external]
- `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` [external]
- `updateStakeAndTotalStakes(address)` [external]
- `updateTroveCollTMR(address,address[],uint256[])` [external]
- `updateTroveRewardSnapshots(address)` [external]
- `addTroveOwnerToArray(address) returns (uint256)` [external]
- `applyPendingRewards(address)` [external]
- `getPendingCollRewards(address) returns (address[], uint256[])` [external]
- `getPendingYUSDDebtReward(address) returns (uint256)` [external]
- `hasPendingRewards(address) returns (bool)` [external]
- `closeTrove(address)` [external]
- `removeStake(address)` [external]
- `removeStakeTMR(address)` [external]
- `updateTroveDebt(address,uint256)` [external]
- `getRedemptionRate() returns (uint256)` [external]
- `getRedemptionRateWithDecay() returns (uint256)` [external]
- `getRedemptionFeeWithDecay(uint256) returns (uint256)` [external]
- `getBorrowingRate() returns (uint256)` [external]
- `getBorrowingRateWithDecay() returns (uint256)` [external]
- `getBorrowingFee(uint256) returns (uint256)` [external]
- `getBorrowingFeeWithDecay(uint256) returns (uint256)` [external]
- `decayBaseRateFromBorrowing()` [external]
- `getTroveStatus(address) returns (uint256)` [external]
- `isTroveActive(address) returns (bool)` [external]
- `getTroveStake(address,address) returns (uint256)` [external]
- `getTotalStake(address) returns (uint256)` [external]
- `getTroveDebt(address) returns (uint256)` [external]
- `getL_Coll(address) returns (uint256)` [external]
- `getL_YUSD(address) returns (uint256)` [external]
- `getRewardSnapshotColl(address,address) returns (uint256)` [external]
- `getRewardSnapshotYUSD(address,address) returns (uint256)` [external]
- `getTroveVC(address) returns (uint256)` [external]
- `getTroveColls(address) returns (address[], uint256[])` [external]
- `getCurrentTroveState(address) returns (address[], uint256[], uint256)` [external]
- `setTroveStatus(address,uint256)` [external]
- `updateTroveColl(address,address[],uint256[])` [external]
- `increaseTroveDebt(address,uint256) returns (uint256)` [external]
- `decreaseTroveDebt(address,uint256) returns (uint256)` [external]
- `getTCR() returns (uint256)` [external]
- `checkRecoveryMode() returns (bool)` [external]
- `closeTroveRedemption(address)` [external]
- `closeTroveLiquidation(address)` [external]
- `removeStakeTLR(address)` [external]
- `updateBaseRate(uint256)` [external]
- `calcDecayedBaseRate() returns (uint256)` [external]
- `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` [external]
- `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` [external]
- `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])` [external]
- `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` [external]
- `collSurplusUpdate(address,address[],uint256[])` [external]
- `getEntireSystemDebt() returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `computeICR(address[],uint256[],uint256) returns (uint256)` [external]
- `getYUSDGasCompensation() returns (uint256)` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `unprotectedDecayBaseRateFromBorrowing() returns (uint256)` [external]
- `minutesPassedSinceLastFeeOp() returns (uint256)` [external]
- `setLastFeeOpTimeToNow()` [external]
- `setBaseRate(uint256)` [external]
- `callGetRedemptionFee(uint256) returns (uint256)` [external]
- `getActualDebtFromComposite(uint256) returns (uint256)` [external]
- `callInternalRemoveTroveOwner(address)` [external]
- `getTotalStakes(address) returns (uint256)` [external]
- `getTroveIndex(address) returns (uint256)` [external]
- `getEDC(address) returns (address[], uint256[], uint256)` [external]
- `getCollGasCompensation(address,uint256) returns (uint256)` [external]
- `getVC(address[],uint256[]) returns (uint256)` [external]
- `getUSD(address[],uint256[]) returns (uint256)` [external]

---


# Project Summary

## Contract: LiquityMathTester
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `callMax(uint256,uint256) returns (uint256)` [external]
- `callDecPowTx(uint256,uint256) returns (uint256)` [external]
- `callDecPow(uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ActivePoolTester
**Inheritance (C3 Linearized):** ActivePool -> YetiCustomBase -> BaseMath -> IActivePool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `bytes32 public NAME` constant
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerAddress` 
- `address internal stabilityPoolAddress` 
- `address internal defaultPoolAddress` 
- `address internal troveManagerLiquidationsAddress` 
- `address internal troveManagerRedemptionsAddress` 
- `address internal collSurplusPoolAddress` 
- `YetiCustomBase.newColls internal poolColl` 
- `uint256 internal YUSDDebt` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address)` [external]
- `getCollateral(address) returns (uint256)` [public]
- `getAllCollateral() returns (address[], uint256[])` [public]
- `getCollateralVC(address) returns (uint256)` [external]
- `getVC() returns (uint256)` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `sendCollaterals(address,address[],uint256[]) returns (bool)` [external]
- `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)` [external]
- `sendSingleCollateral(address,address,uint256) returns (bool)` [external]
- `sendSingleCollateralUnwrap(address,address,address,uint256) returns (bool)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `addCollateralType(address)` [external]
- `sendCollaterals(address,address[],uint256[]) returns (bool)` [external]
- `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)` [external]
- `sendSingleCollateral(address,address,uint256) returns (bool)` [external]
- `sendSingleCollateralUnwrap(address,address,address,uint256) returns (bool)` [external]
- `getCollateralVC(address) returns (uint256)` [external]
- `addCollateralType(address)` [external]
- `getVC() returns (uint256)` [external]
- `getCollateral(address) returns (uint256)` [external]
- `getAllCollateral() returns (address[], uint256[])` [external]
- `getYUSDDebt() returns (uint256)` [external]
- `increaseYUSDDebt(uint256)` [external]
- `decreaseYUSDDebt(uint256)` [external]
- `receiveCollateral(address[],uint256[])` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `unprotectedIncreaseYUSDDebt(uint256)` [external]
- `unprotectedPayable()` [external]

---


# Project Summary

## Contract: YETITokenTester
**Inheritance (C3 Linearized):** YETIToken -> IYETIToken -> IERC2612 -> IERC20

### State Variables & Constants
- `string internal _NAME` constant
- `string internal _SYMBOL` constant
- `string internal _VERSION` constant
- `uint8 internal _DECIMALS` constant
- `uint256 internal _1_MILLION` 
- `uint256 internal deploymentStartTime` immutable
- `address public sYETIAddress` immutable

### Public/External Functions
- `transfer(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `sendToSYETI(address,uint256)` [external]
- `domainSeparator() returns (bytes32)` [public]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `getDeploymentStartTime() returns (uint256)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `sendToSYETI(address,uint256)` [external]
- `getDeploymentStartTime() returns (uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `version() returns (string)` [external]
- `permitTypeHash() returns (bytes32)` [external]
- `domainSeparator() returns (bytes32)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `decreaseAllowance(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `unprotectedMint(address,uint256)` [external]
- `unprotectedSendToSYETI(address,uint256)` [external]
- `callInternalApprove(address,address,uint256) returns (bool)` [external]
- `callInternalTransfer(address,address,uint256) returns (bool)` [external]
- `getChainId() returns (uint256)` [external]

---


# Project Summary

## Contract: SortedTrovesBOTester
**Inheritance (C3 Linearized):** BorrowerOperations -> ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `IWhitelist internal whitelist` 
- `uint256 public _100pct` constant
- `uint256 public _110pct` constant
- `uint256 public MCR` constant
- `uint256 public CCR` constant
- `uint256 public YUSD_GAS_COMPENSATION` constant
- `uint256 public MIN_NET_DEBT` constant
- `uint256 public PERCENT_DIVISOR` constant
- `uint256 public BORROWING_FEE_FLOOR` constant
- `uint256 public REDEMPTION_FEE_FLOOR` constant
- `IActivePool internal activePool` 
- `IDefaultPool internal defaultPool` 
- `string public NAME` constant
- `ITroveManager internal troveManager` 
- `address internal stabilityPoolAddress` 
- `address internal gasPoolAddress` 
- `ICollSurplusPool internal collSurplusPool` 
- `ISYETI internal sYETI` 
- `address internal sYETIAddress` 
- `IYUSDToken internal yusdToken` 
- `uint256 internal BOOTSTRAP_PERIOD` constant
- `uint256 internal deploymentTime` 
- `ISortedTroves internal sortedTroves` 

### Public/External Functions
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `setAddresses(address,address,address,address,address,address,address,address,address,address)` [external]
- `openTrove(uint256,uint256,address,address,address[],uint256[])` [external]
- `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` [external]
- `closeTroveUnlever(address[],uint256[],uint256[])` [external]
- `closeTrove()` [external]
- `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` [external]
- `addColl(address[],uint256[],address,address,uint256)` [external]
- `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` [external]
- `withdrawColl(address[],uint256[],address,address)` [external]
- `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` [external]
- `withdrawYUSD(uint256,uint256,address,address)` [external]
- `repayYUSD(uint256,address,address)` [external]
- `claimCollateral()` [external]
- `getCompositeDebt(uint256) returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `getEntireSystemColl() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [public]
- `getEntireSystemDebt() returns (uint256)` [external]
- `resetSortedTroves(address)` [external]

---


# Project Summary

## Contract: PriceFeedTester
**Inheritance (C3 Linearized):** PriceFeed -> IPriceFeed -> BaseMath -> CheckContract -> Ownable

### State Variables & Constants
- `uint256 public DECIMAL_PRECISION` constant
- `bytes32 public NAME` constant
- `AggregatorV3Interface public priceAggregator` 
- `ITellorCaller public tellorCaller` 
- `address internal borrowerOperationsAddress` 
- `address internal troveManagerAddress` 
- `uint256 public ETHUSD_TELLOR_REQ_ID` constant
- `uint256 public TARGET_DIGITS` constant
- `uint256 public TELLOR_DIGITS` constant
- `uint256 public TIMEOUT` constant
- `uint256 public MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND` constant
- `uint256 public MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES` constant
- `uint256 public lastGoodPrice` 
- `PriceFeed.Status public status` 

### Public/External Functions
- `setAddresses(address,address)` [external]
- `fetchPrice() returns (uint256)` [external]
- `fetchPrice_v() returns (uint256)` [external]
- `fetchPrice_v() returns (uint256)` [external]
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setLastGoodPrice(uint256)` [external]
- `setStatus(PriceFeed.Status)` [external]

---


# Project Summary

## Contract: YUSDTokenCaller
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `IYUSDToken internal YUSD` 

### Public/External Functions
- `setYUSD(IYUSDToken)` [external]
- `yusdMint(address,uint256)` [external]
- `yusdBurn(address,uint256)` [external]
- `yusdSendToPool(address,address,uint256)` [external]
- `yusdReturnFromPool(address,address,uint256)` [external]

---


# Project Summary

## Contract: sYETITokenTester
**Inheritance (C3 Linearized):** sYETIToken -> BoringOwnable -> BoringOwnableData -> Domain -> IERC20

### State Variables & Constants
- `address public owner` 
- `address public pendingOwner` 
- `string public symbol` constant
- `string public name` constant
- `uint8 public decimals` constant
- `uint256 public totalSupply` 
- `uint256 public effectiveYetiTokenBalance` 
- `uint256 public lastBuybackTime` 
- `uint256 public lastBuybackPrice` 
- `uint256 public lastRebaseTime` 
- `uint256 public transferRatio` 
- `IYETIToken public yetiToken` 
- `IERC20 public yusdToken` 
- `mapping(address => bool) public validRouters` 
- `mapping(address => sYETIToken.User) public users` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `mapping(address => uint256) public nonces` 

### Public/External Functions
- `balanceOf(address) returns (uint256)` [public]
- `setAddresses(IYETIToken,IERC20)` [external]
- `transfer(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `mint(uint256) returns (bool)` [public]
- `burn(address,uint256) returns (bool)` [public]
- `burnFrom(address,address,uint256) returns (bool)` [public]
- `buyBack(address,uint256,uint256)` [external]
- `publicBuyBack(address)` [external]
- `rebase()` [external]
- `setTransferRatio(uint256)` [external]
- `addValidRouter(address)` [external]
- `removeValidRouter(address)` [external]
- `transferOwnership(address,bool,bool)` [public]
- `claimOwnership()` [public]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `increaseAllowance(address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `getUserInfo(address) returns (uint128, uint128)` [public]

---


# Project Summary

## Contract: ERC20Token
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `string public _symbol` 
- `string public _name` 
- `uint8 public _decimals` 
- `uint256 public _totalSupply` 
- `mapping(address => uint256) internal balances` 
- `mapping(address => mapping(address => uint256)) internal allowed` 

### Public/External Functions
- `decimals() returns (uint8)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `mint(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `allowance(address,address) returns (uint256)` [public]

---


# Project Summary

## Contract: ThreePieceWiseLinearPriceCurve
**Inheritance (C3 Linearized):** Ownable -> IPriceCurve

### State Variables & Constants
- `string internal name` 
- `uint256 internal m1` 
- `uint256 internal b1` 
- `uint256 internal cutoff1` 
- `uint256 internal m2` 
- `uint256 internal b2` 
- `bool internal b2Negative` 
- `uint256 internal cutoff2` 
- `uint256 internal m3` 
- `uint256 internal b3` 
- `bool internal b3Negative` 
- `uint256 internal decayTime` 
- `uint256 internal lastFeeTime` 
- `uint256 internal lastFeePercent` 
- `uint256 internal dollarCap` 
- `address internal whitelistAddress` 
- `bool private addressesSet` 

### Public/External Functions
- `owner() returns (address)` [public]
- `isOwner() returns (bool)` [public]
- `setAddresses(address)` [external]
- `setDecayTime(uint256)` [external]
- `getFee(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `setFeeCapAndTime(uint256,uint256)` [external]
- `getFeeCapAndTime() returns (uint256, uint256)` [external]
- `calculateDecayedFee() returns (uint256)` [external]
- `adjustParams(string,uint256,uint256,uint256,uint256,uint256,uint256,uint256)` [external]
- `setAddresses(address)` [external]
- `setDecayTime(uint256)` [external]
- `getFeeCapAndTime() returns (uint256, uint256)` [external]
- `setFeeCapAndTime(uint256,uint256)` [external]
- `getFee(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getFeeAndUpdate(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `calculateDecayedFee() returns (uint256)` [public]

---
