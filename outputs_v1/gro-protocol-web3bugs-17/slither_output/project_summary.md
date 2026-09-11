# Project Summary

## Contract: WithdrawHandler
**Inheritance (C3 Linearized):** IWithdrawHandler -> FixedVaults -> FixedStablecoins -> Constants -> Controllable -> Ownable -> Context

### State Variables & Constants
- `address public controller` 
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI` immutable
- `address public USDC` immutable
- `address public USDT` immutable
- `uint256 public DAI_DECIMALS` immutable
- `uint256 public USDC_DECIMALS` immutable
- `uint256 public USDT_DECIMALS` immutable
- `address public DAI_VAULT` immutable
- `address public USDC_VAULT` immutable
- `address public USDT_VAULT` immutable
- `IController public ctrl` 
- `ILifeGuard public lg` 
- `IBuoy public buoy` 
- `IInsurance public insurance` 
- `IEmergencyHandler public emergencyHandler` 

### Public/External Functions
- `withdrawByLPToken(bool,uint256,uint256[3])` [external]
- `withdrawByStablecoin(bool,uint256,uint256,uint256)` [external]
- `withdrawAllSingle(bool,uint256,uint256)` [external]
- `withdrawAllBalanced(bool,uint256[3])` [external]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `setDependencies()` [external]
- `withdrawByLPToken(bool,uint256,uint256[3])` [external]
- `withdrawByStablecoin(bool,uint256,uint256,uint256)` [external]
- `withdrawAllSingle(bool,uint256,uint256)` [external]
- `withdrawAllBalanced(bool,uint256[3])` [external]
- `getVaultDeltas(uint256) returns (uint256[3])` [external]
- `withdrawalFee(bool) returns (uint256)` [public]

---

## Contract: FixedGTokens
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `IToken public pwrd` immutable
- `IToken public gvt` immutable

### Public/External Functions
- *No public/external functions.*

---

## Contract: IBuoy
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `safetyCheck() returns (bool)` [external]
- `updateRatios() returns (bool)` [external]
- `updateRatiosWithTolerance(uint256) returns (bool)` [external]
- `lpToUsd(uint256) returns (uint256)` [external]
- `usdToLp(uint256) returns (uint256)` [external]
- `stableToUsd(uint256[3],bool) returns (uint256)` [external]
- `stableToLp(uint256[3],bool) returns (uint256)` [external]
- `singleStableFromLp(uint256,int128) returns (uint256)` [external]
- `curvePool() returns (ICurve3Pool)` [external]
- `getVirtualPrice() returns (uint256)` [external]
- `singleStableFromUsd(uint256,int128) returns (uint256)` [external]
- `singleStableToUsd(uint256,uint256) returns (uint256)` [external]

---

## Contract: IChainPrice
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getPriceFeed(uint256) returns (uint256)` [external]

---

## Contract: IController
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `stablecoins() returns (address[3])` [external]
- `vaults() returns (address[3])` [external]
- `underlyingVaults(uint256) returns (address)` [external]
- `curveVault() returns (address)` [external]
- `pnl() returns (address)` [external]
- `insurance() returns (address)` [external]
- `lifeGuard() returns (address)` [external]
- `buoy() returns (address)` [external]
- `reward() returns (address)` [external]
- `isValidBigFish(bool,bool,uint256) returns (bool)` [external]
- `withdrawHandler() returns (address)` [external]
- `emergencyHandler() returns (address)` [external]
- `depositHandler() returns (address)` [external]
- `totalAssets() returns (uint256)` [external]
- `gTokenTotalAssets() returns (uint256)` [external]
- `eoaOnly(address)` [external]
- `getSkimPercent() returns (uint256)` [external]
- `gToken(bool) returns (address)` [external]
- `emergencyState() returns (bool)` [external]
- `deadCoin() returns (uint256)` [external]
- `distributeStrategyGainLoss(uint256,uint256)` [external]
- `burnGToken(bool,bool,address,uint256,uint256)` [external]
- `mintGToken(bool,address,uint256)` [external]
- `getUserAssets(bool,address) returns (uint256)` [external]
- `referrals(address) returns (address)` [external]
- `addReferral(address,address)` [external]
- `getStrategiesTargetRatio() returns (uint256[])` [external]
- `withdrawalFee(bool) returns (uint256)` [external]
- `validGTokenDecrease(uint256) returns (bool)` [external]

---

## Contract: ICurve3Pool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `coins(uint256) returns (address)` [external]
- `get_virtual_price() returns (uint256)` [external]
- `get_dy(int128,int128,uint256) returns (uint256)` [external]
- `calc_withdraw_one_coin(uint256,int128) returns (uint256)` [external]
- `calc_token_amount(uint256[3],bool) returns (uint256)` [external]
- `balances(int128) returns (uint256)` [external]

---

## Contract: ICurve3Deposit
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `exchange(int128,int128,uint256,uint256)` [external]
- `add_liquidity(uint256[3],uint256)` [external]
- `remove_liquidity(uint256,uint256[3])` [external]
- `remove_liquidity_imbalance(uint256[3],uint256)` [external]
- `remove_liquidity_one_coin(uint256,int128,uint256)` [external]
- `get_dy(int128,int128,uint256) returns (uint256)` [external]

---

## Contract: ICurveMetaPool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `coins(uint256) returns (address)` [external]
- `get_virtual_price() returns (uint256)` [external]
- `get_dy_underlying(int128,int128,uint256) returns (uint256)` [external]
- `calc_withdraw_one_coin(uint256,int128) returns (uint256)` [external]
- `calc_token_amount(uint256[2],bool) returns (uint256)` [external]
- `exchange(int128,int128,uint256,uint256)` [external]
- `add_liquidity(uint256[2],uint256)` [external]
- `remove_liquidity_one_coin(uint256,int128,uint256)` [external]

---

## Contract: ICurveZap
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `add_liquidity(uint256[4],uint256)` [external]
- `remove_liquidity(uint256,uint256[4])` [external]
- `remove_liquidity_imbalance(uint256[4],uint256)` [external]
- `remove_liquidity_one_coin(uint256,int128,uint256)` [external]
- `calc_withdraw_one_coin(uint256,int128) returns (uint256)` [external]
- `calc_token_amount(uint256[4],bool) returns (uint256)` [external]
- `pool() returns (address)` [external]

---

## Contract: IEmergencyHandler
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `emergencyWithdrawal(address,bool,uint256,uint256)` [external]
- `emergencyWithdrawAll(address,bool,uint256)` [external]

---

## Contract: IInsurance
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `calculateDepositDeltasOnAllVaults() returns (uint256[3])` [external]
- `rebalanceTrigger() returns (bool)` [external]
- `rebalance()` [external]
- `calcSkim() returns (uint256)` [external]
- `rebalanceForWithdraw(uint256,bool) returns (bool)` [external]
- `getDelta(uint256) returns (uint256[3])` [external]
- `getVaultDeltaForDeposit(uint256) returns (uint256[3], uint256[3], uint256)` [external]
- `sortVaultsByDelta(bool) returns (uint256[3])` [external]
- `getStrategiesTargetRatio(uint256) returns (uint256[])` [external]
- `setUnderlyingTokenPercent(uint256,uint256)` [external]

---

## Contract: ILifeGuard
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `assets(uint256) returns (uint256)` [external]
- `totalAssets() returns (uint256)` [external]
- `getAssets() returns (uint256[3])` [external]
- `totalAssetsUsd() returns (uint256)` [external]
- `availableUsd() returns (uint256)` [external]
- `availableLP() returns (uint256)` [external]
- `depositStable(bool) returns (uint256)` [external]
- `investToCurveVault()` [external]
- `distributeCurveVault(uint256,uint256[3]) returns (uint256[3])` [external]
- `deposit() returns (uint256)` [external]
- `withdrawSingleByLiquidity(uint256,uint256,address) returns (uint256, uint256)` [external]
- `withdrawSingleByExchange(uint256,uint256,address) returns (uint256, uint256)` [external]
- `invest(uint256,uint256[3]) returns (uint256)` [external]
- `getBuoy() returns (address)` [external]
- `investSingle(uint256[3],uint256,uint256) returns (uint256)` [external]
- `investToCurveVaultTrigger() returns (bool)` [external]

---

## Contract: IPausable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `paused() returns (bool)` [external]

---

## Contract: IToken
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `factor() returns (uint256)` [external]
- `factor(uint256) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]
- `totalAssets() returns (uint256)` [external]
- `getPricePerShare() returns (uint256)` [external]
- `getShareAssets(uint256) returns (uint256)` [external]
- `getAssets(address) returns (uint256)` [external]

---

## Contract: IVault
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `withdraw(uint256)` [external]
- `withdraw(uint256,address)` [external]
- `withdrawByStrategyOrder(uint256,address,bool)` [external]
- `withdrawByStrategyIndex(uint256,address,uint256)` [external]
- `deposit(uint256)` [external]
- `updateStrategyRatio(uint256[])` [external]
- `totalAssets() returns (uint256)` [external]
- `getStrategiesLength() returns (uint256)` [external]
- `strategyHarvestTrigger(uint256,uint256) returns (bool)` [external]
- `strategyHarvest(uint256) returns (bool)` [external]
- `getStrategyAssets(uint256) returns (uint256)` [external]
- `token() returns (address)` [external]
- `vault() returns (address)` [external]
- `investTrigger() returns (bool)` [external]
- `invest()` [external]

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

## Contract: SafeMath
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
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

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


# Project Summary

## Contract: DepositHandler
**Inheritance (C3 Linearized):** IDepositHandler -> FixedVaults -> FixedStablecoins -> Constants -> Controllable -> Ownable -> Context

### State Variables & Constants
- `address public controller` 
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI` immutable
- `address public USDC` immutable
- `address public USDT` immutable
- `uint256 public DAI_DECIMALS` immutable
- `uint256 public USDC_DECIMALS` immutable
- `uint256 public USDT_DECIMALS` immutable
- `address public DAI_VAULT` immutable
- `address public USDC_VAULT` immutable
- `address public USDT_VAULT` immutable
- `IController public ctrl` 
- `ILifeGuard public lg` 
- `IBuoy public buoy` 
- `IInsurance public insurance` 
- `mapping(uint256 => bool) public feeToken` 

### Public/External Functions
- `depositGvt(uint256[3],uint256,address)` [external]
- `depositPwrd(uint256[3],uint256,address)` [external]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `setDependencies()` [external]
- `setFeeToken(uint256)` [external]
- `depositPwrd(uint256[3],uint256,address)` [external]
- `depositGvt(uint256[3],uint256,address)` [external]

---

## Contract: IERC20Detailed
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]

---


# Project Summary

## Contract: Controller
**Inheritance (C3 Linearized):** IController -> FixedGTokens -> FixedStablecoins -> Constants -> Whitelist -> Ownable -> Pausable -> Context

### State Variables & Constants
- `mapping(address => bool) public whitelist` 
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI` immutable
- `address public USDC` immutable
- `address public USDT` immutable
- `uint256 public DAI_DECIMALS` immutable
- `uint256 public USDC_DECIMALS` immutable
- `uint256 public USDT_DECIMALS` immutable
- `IToken public pwrd` immutable
- `IToken public gvt` immutable
- `address public curveVault` 
- `bool public preventSmartContracts` 
- `address public insurance` 
- `address public pnl` 
- `address public lifeGuard` 
- `address public buoy` 
- `address public depositHandler` 
- `address public withdrawHandler` 
- `address public emergencyHandler` 
- `uint256 public deadCoin` 
- `bool public emergencyState` 
- `uint256 public utilisationRatioLimitGvt` 
- `uint256 public utilisationRatioLimitPwrd` 
- `uint256 public bigFishThreshold` 
- `uint256 public bigFishAbsoluteThreshold` 
- `address public reward` 
- `mapping(address => bool) public safeAddresses` 
- `mapping(uint256 => address) public underlyingVaults` 
- `mapping(address => uint256) public vaultIndexes` 
- `mapping(address => address) public referrals` 
- `mapping(bool => uint256) public withdrawalFee` 

### Public/External Functions
- `stablecoins() returns (address[3])` [external]
- `vaults() returns (address[3])` [external]
- `underlyingVaults(uint256) returns (address)` [external]
- `curveVault() returns (address)` [external]
- `pnl() returns (address)` [external]
- `insurance() returns (address)` [external]
- `lifeGuard() returns (address)` [external]
- `buoy() returns (address)` [external]
- `reward() returns (address)` [external]
- `isValidBigFish(bool,bool,uint256) returns (bool)` [external]
- `withdrawHandler() returns (address)` [external]
- `emergencyHandler() returns (address)` [external]
- `depositHandler() returns (address)` [external]
- `totalAssets() returns (uint256)` [external]
- `gTokenTotalAssets() returns (uint256)` [external]
- `eoaOnly(address)` [external]
- `getSkimPercent() returns (uint256)` [external]
- `gToken(bool) returns (address)` [external]
- `emergencyState() returns (bool)` [external]
- `deadCoin() returns (uint256)` [external]
- `distributeStrategyGainLoss(uint256,uint256)` [external]
- `burnGToken(bool,bool,address,uint256,uint256)` [external]
- `mintGToken(bool,address,uint256)` [external]
- `getUserAssets(bool,address) returns (uint256)` [external]
- `referrals(address) returns (address)` [external]
- `addReferral(address,address)` [external]
- `getStrategiesTargetRatio() returns (uint256[])` [external]
- `withdrawalFee(bool) returns (uint256)` [external]
- `validGTokenDecrease(uint256) returns (bool)` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `paused() returns (bool)` [public]
- `pause()` [external]
- `unpause()` [external]
- `setWithdrawHandler(address,address)` [external]
- `setDepositHandler(address)` [external]
- `stablecoins() returns (address[3])` [external]
- `getSkimPercent() returns (uint256)` [external]
- `vaults() returns (address[3])` [external]
- `setVault(uint256,address)` [external]
- `setCurveVault(address)` [external]
- `setLifeGuard(address)` [external]
- `setInsurance(address)` [external]
- `setPnL(address)` [external]
- `addSafeAddress(address)` [external]
- `switchEoaOnly(bool)` [external]
- `setBigFishThreshold(uint256,uint256)` [external]
- `setReward(address)` [external]
- `addReferral(address,address)` [external]
- `setWithdrawalFee(bool,uint256)` [external]
- `totalAssets() returns (uint256)` [external]
- `gTokenTotalAssets() returns (uint256)` [public]
- `gToken(bool) returns (address)` [external]
- `isValidBigFish(bool,bool,uint256) returns (bool)` [external]
- `distributeCurveAssets(uint256,uint256[3])` [external]
- `eoaOnly(address)` [public]
- `emergency(uint256)` [external]
- `restart(uint256[])` [external]
- `distributeStrategyGainLoss(uint256,uint256)` [external]
- `realizePriceChange(uint256)` [external]
- `burnGToken(bool,bool,address,uint256,uint256)` [external]
- `mintGToken(bool,address,uint256)` [external]
- `getUserAssets(bool,address) returns (uint256)` [external]
- `validGTokenDecrease(uint256) returns (bool)` [public]
- `setUtilisationRatioLimitPwrd(uint256)` [external]
- `setUtilisationRatioLimitGvt(uint256)` [external]
- `getStrategiesTargetRatio() returns (uint256[])` [external]

---

## Contract: FixedVaults
**Inheritance (C3 Linearized):** Constants

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI_VAULT` immutable
- `address public USDC_VAULT` immutable
- `address public USDT_VAULT` immutable

### Public/External Functions
- *No public/external functions.*

---

## Contract: IPnL
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `calcPnL() returns (uint256, uint256)` [external]
- `increaseGTokenLastAmount(bool,uint256)` [external]
- `decreaseGTokenLastAmount(bool,uint256,uint256)` [external]
- `lastGvtAssets() returns (uint256)` [external]
- `lastPwrdAssets() returns (uint256)` [external]
- `utilisationRatio() returns (uint256)` [external]
- `emergencyPnL()` [external]
- `recover()` [external]
- `distributeStrategyGainLoss(uint256,uint256,address)` [external]
- `distributePriceChange(uint256)` [external]

---


# Project Summary

## Contract: IWithdrawHandler
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `withdrawByLPToken(bool,uint256,uint256[3])` [external]
- `withdrawByStablecoin(bool,uint256,uint256,uint256)` [external]
- `withdrawAllSingle(bool,uint256,uint256)` [external]
- `withdrawAllBalanced(bool,uint256[3])` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: IHarvest
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `deposit(uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `getPricePerFullShare() returns (uint256)` [external]
- `transfer(address,uint256)` [external]
- `withdraw(uint256)` [external]
- `withdrawAll()` [external]
- `approve(address,uint256)` [external]
- `underlying() returns (address)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]

---

## Contract: IStake
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `balanceOf(address) returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `lpToken() returns (address)` [external]
- `stake(uint256)` [external]
- `getReward()` [external]
- `withdraw(uint256)` [external]
- `exit()` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: IExposure
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `calcRiskExposure(SystemState) returns (ExposureState)` [external]
- `getExactRiskExposure(SystemState) returns (ExposureState)` [external]
- `getUnifiedAssets(address[3]) returns (uint256, uint256[3])` [external]
- `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3]) returns (uint256[3])` [external]
- `calcRoughDelta(uint256[3],address[3],uint256) returns (uint256[3])` [external]

---


# Project Summary

## Contract: IDepositHandler
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `depositGvt(uint256[3],uint256,address)` [external]
- `depositPwrd(uint256[3],uint256,address)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: IAllocation
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `calcSystemTargetDelta(SystemState,ExposureState) returns (AllocationState)` [external]
- `calcVaultTargetDelta(SystemState,bool) returns (StablecoinAllocationState)` [external]
- `calcStrategyPercent(uint256) returns (uint256[])` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: FixedStablecoins
**Inheritance (C3 Linearized):** Constants

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI` immutable
- `address public USDC` immutable
- `address public USDT` immutable
- `uint256 public DAI_DECIMALS` immutable
- `uint256 public USDC_DECIMALS` immutable
- `uint256 public USDT_DECIMALS` immutable

### Public/External Functions
- *No public/external functions.*

---

## Contract: PnL
**Inheritance (C3 Linearized):** IPnL -> FixedGTokens -> Constants -> Controllable -> Ownable -> Context

### State Variables & Constants
- `address public controller` 
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `IToken public pwrd` immutable
- `IToken public gvt` immutable
- `uint256 public lastGvtAssets` 
- `uint256 public lastPwrdAssets` 
- `bool public rebase` 
- `uint256 public performanceFee` 

### Public/External Functions
- `calcPnL() returns (uint256, uint256)` [external]
- `increaseGTokenLastAmount(bool,uint256)` [external]
- `decreaseGTokenLastAmount(bool,uint256,uint256)` [external]
- `lastGvtAssets() returns (uint256)` [external]
- `lastPwrdAssets() returns (uint256)` [external]
- `utilisationRatio() returns (uint256)` [external]
- `emergencyPnL()` [external]
- `recover()` [external]
- `distributeStrategyGainLoss(uint256,uint256,address)` [external]
- `distributePriceChange(uint256)` [external]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `setRebase(bool)` [external]
- `setPerformanceFee(uint256)` [external]
- `increaseGTokenLastAmount(bool,uint256)` [external]
- `decreaseGTokenLastAmount(bool,uint256,uint256)` [external]
- `calcPnL() returns (uint256, uint256)` [external]
- `utilisationRatio() returns (uint256)` [external]
- `emergencyPnL()` [external]
- `recover()` [external]
- `distributeStrategyGainLoss(uint256,uint256,address)` [external]
- `distributePriceChange(uint256)` [external]

---


# Project Summary

## Contract: Whitelist
**Inheritance (C3 Linearized):** Ownable -> Context

### State Variables & Constants
- `mapping(address => bool) public whitelist` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]

---


# Project Summary

## Contract: Controllable
**Inheritance (C3 Linearized):** Ownable -> Context

### State Variables & Constants
- `address public controller` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]

---


# Project Summary

## Contract: Constants
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary

## Contract: IYearnV2Strategy
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `vault() returns (address)` [external]
- `setVault(address)` [external]
- `keeper() returns (address)` [external]
- `setKeeper(address)` [external]
- `harvestTrigger(uint256) returns (bool)` [external]
- `harvest()` [external]
- `withdraw(uint256)` [external]
- `estimatedTotalAssets() returns (uint256)` [external]

---


# Project Summary

## Contract: IYearnV2Vault
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `strategies(address) returns (StrategyParams)` [external]
- `totalAssets() returns (uint256)` [external]
- `pricePerShare() returns (uint256)` [external]
- `deposit(uint256,address)` [external]
- `withdraw(uint256,address,uint256) returns (uint256, uint256, uint256, uint256)` [external]
- `withdrawByStrategy(address[20],uint256,address,uint256) returns (uint256)` [external]
- `depositLimit() returns (uint256)` [external]
- `debtOutstanding(address) returns (uint256)` [external]
- `totalDebt() returns (uint256)` [external]
- `updateStrategyDebtRatio(address,uint256)` [external]
- `withdrawalQueue(uint256) returns (address)` [external]
- `report(uint256,uint256,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: GERC20
**Inheritance (C3 Linearized):** IERC20 -> Context

### State Variables & Constants
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `uint256 private _totalSupply` 
- `string private _name` 
- `string private _symbol` 
- `uint8 private _decimals` 

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupplyBase() returns (uint256)` [public]
- `balanceOfBase(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `decreaseAllowance(address,uint256) returns (bool)` [public]

---


# Project Summary

## Contract: NonRebasingGToken
**Inheritance (C3 Linearized):** GToken -> IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `mapping(address => bool) public whitelist` 
- `uint256 public BASE` constant
- `IController public ctrl` 
- `uint256 public INIT_BASE` constant

### Public/External Functions
- `setController(address)` [external]
- `factor() returns (uint256)` [public]
- `factor(uint256) returns (uint256)` [public]
- `totalAssets() returns (uint256)` [public]
- `factor() returns (uint256)` [external]
- `factor(uint256) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]
- `totalAssets() returns (uint256)` [external]
- `getPricePerShare() returns (uint256)` [external]
- `getShareAssets(uint256) returns (uint256)` [external]
- `getAssets(address) returns (uint256)` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupplyBase() returns (uint256)` [public]
- `balanceOfBase(address) returns (uint256)` [public]
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
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `getPricePerShare() returns (uint256)` [public]
- `getShareAssets(uint256) returns (uint256)` [public]
- `getAssets(address) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]

---


# Project Summary

## Contract: RebasingGToken
**Inheritance (C3 Linearized):** GToken -> IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `mapping(address => bool) public whitelist` 
- `uint256 public BASE` constant
- `IController public ctrl` 

### Public/External Functions
- `setController(address)` [external]
- `factor() returns (uint256)` [public]
- `factor(uint256) returns (uint256)` [public]
- `totalAssets() returns (uint256)` [public]
- `factor() returns (uint256)` [external]
- `factor(uint256) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]
- `totalAssets() returns (uint256)` [external]
- `getPricePerShare() returns (uint256)` [external]
- `getShareAssets(uint256) returns (uint256)` [external]
- `getAssets(address) returns (uint256)` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupplyBase() returns (uint256)` [public]
- `balanceOfBase(address) returns (uint256)` [public]
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
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `getPricePerShare() returns (uint256)` [external]
- `getShareAssets(uint256) returns (uint256)` [external]
- `getAssets(address) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [public]

---


# Project Summary

## Contract: GToken
**Inheritance (C3 Linearized):** IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `mapping(address => bool) public whitelist` 
- `uint256 public BASE` constant
- `IController public ctrl` 

### Public/External Functions
- `factor() returns (uint256)` [external]
- `factor(uint256) returns (uint256)` [external]
- `mint(address,uint256,uint256)` [external]
- `burn(address,uint256,uint256)` [external]
- `burnAll(address)` [external]
- `totalAssets() returns (uint256)` [external]
- `getPricePerShare() returns (uint256)` [external]
- `getShareAssets(uint256) returns (uint256)` [external]
- `getAssets(address) returns (uint256)` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupplyBase() returns (uint256)` [public]
- `balanceOfBase(address) returns (uint256)` [public]
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
- `setController(address)` [external]
- `factor() returns (uint256)` [public]
- `factor(uint256) returns (uint256)` [public]
- `totalAssets() returns (uint256)` [public]

---


# Project Summary

## Contract: LifeGuard3Pool
**Inheritance (C3 Linearized):** FixedStablecoins -> Constants -> Whitelist -> Controllable -> Ownable -> Context -> ILifeGuard

### State Variables & Constants
- `address public controller` 
- `mapping(address => bool) public whitelist` 
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public DAI` immutable
- `address public USDC` immutable
- `address public USDT` immutable
- `uint256 public DAI_DECIMALS` immutable
- `uint256 public USDC_DECIMALS` immutable
- `uint256 public USDT_DECIMALS` immutable
- `ICurve3Deposit public crv3pool` immutable
- `IERC20 public lpToken` immutable
- `IBuoy public buoy` immutable
- `address public insurance` 
- `address public depositHandler` 
- `address public withdrawHandler` 
- `uint256 public investToCurveThreshold` 
- `mapping(uint256 => uint256) public assets` 

### Public/External Functions
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `assets(uint256) returns (uint256)` [external]
- `totalAssets() returns (uint256)` [external]
- `getAssets() returns (uint256[3])` [external]
- `totalAssetsUsd() returns (uint256)` [external]
- `availableUsd() returns (uint256)` [external]
- `availableLP() returns (uint256)` [external]
- `depositStable(bool) returns (uint256)` [external]
- `investToCurveVault()` [external]
- `distributeCurveVault(uint256,uint256[3]) returns (uint256[3])` [external]
- `deposit() returns (uint256)` [external]
- `withdrawSingleByLiquidity(uint256,uint256,address) returns (uint256, uint256)` [external]
- `withdrawSingleByExchange(uint256,uint256,address) returns (uint256, uint256)` [external]
- `invest(uint256,uint256[3]) returns (uint256)` [external]
- `getBuoy() returns (address)` [external]
- `investSingle(uint256[3],uint256,uint256) returns (uint256)` [external]
- `investToCurveVaultTrigger() returns (bool)` [external]
- `setDependencies()` [external]
- `getAssets() returns (uint256[3])` [external]
- `approveVaults(uint256)` [external]
- `setInvestToCurveThreshold(uint256)` [external]
- `investToCurveVault()` [external]
- `investToCurveVaultTrigger() returns (bool)` [external]
- `distributeCurveVault(uint256,uint256[3]) returns (uint256[3])` [external]
- `depositStable(bool) returns (uint256)` [external]
- `deposit() returns (uint256)` [external]
- `withdrawSingleByLiquidity(uint256,uint256,address) returns (uint256, uint256)` [external]
- `withdrawSingleByExchange(uint256,uint256,address) returns (uint256, uint256)` [external]
- `getBuoy() returns (address)` [external]
- `invest(uint256,uint256[3]) returns (uint256)` [external]
- `investSingle(uint256[3],uint256,uint256) returns (uint256)` [external]
- `totalAssets() returns (uint256)` [external]
- `availableLP() returns (uint256)` [external]
- `totalAssetsUsd() returns (uint256)` [external]
- `availableUsd() returns (uint256)` [external]

---

## Contract: ERC20
**Inheritance (C3 Linearized):** IERC20 -> Context

### State Variables & Constants
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `uint256 private _totalSupply` 
- `string private _name` 
- `string private _symbol` 
- `uint8 private _decimals` 

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
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

---


# Project Summary

## Contract: Insurance
**Inheritance (C3 Linearized):** IInsurance -> Whitelist -> Controllable -> Ownable -> Context -> Constants

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public controller` 
- `mapping(address => bool) public whitelist` 
- `IAllocation public allocation` 
- `IExposure public exposure` 
- `mapping(uint256 => uint256) public underlyingTokensPercents` 
- `uint256 public curveVaultPercent` 
- `uint256 public exposureBufferRebalance` 
- `uint256 public maxPercentForWithdraw` 
- `uint256 public maxPercentForDeposit` 

### Public/External Functions
- `calculateDepositDeltasOnAllVaults() returns (uint256[3])` [external]
- `rebalanceTrigger() returns (bool)` [external]
- `rebalance()` [external]
- `calcSkim() returns (uint256)` [external]
- `rebalanceForWithdraw(uint256,bool) returns (bool)` [external]
- `getDelta(uint256) returns (uint256[3])` [external]
- `getVaultDeltaForDeposit(uint256) returns (uint256[3], uint256[3], uint256)` [external]
- `sortVaultsByDelta(bool) returns (uint256[3])` [external]
- `getStrategiesTargetRatio(uint256) returns (uint256[])` [external]
- `setUnderlyingTokenPercent(uint256,uint256)` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `setAllocation(address)` [external]
- `setExposure(address)` [external]
- `setUnderlyingTokenPercent(uint256,uint256)` [external]
- `setCurveVaultPercent(uint256)` [external]
- `setExposureBufferRebalance(uint256)` [external]
- `setWhaleThresholdWithdraw(uint256)` [external]
- `setWhaleThresholdDeposit(uint256)` [external]
- `calculateDepositDeltasOnAllVaults() returns (uint256[3])` [public]
- `getVaultDeltaForDeposit(uint256) returns (uint256[3], uint256[3], uint256)` [external]
- `sortVaultsByDelta(bool) returns (uint256[3])` [external]
- `rebalanceTrigger() returns (bool)` [external]
- `rebalance()` [external]
- `rebalanceForWithdraw(uint256,bool) returns (bool)` [external]
- `calcSkim() returns (uint256)` [external]
- `getStrategiesTargetRatio(uint256) returns (uint256[])` [external]
- `prepareCalculation() returns (SystemState)` [public]
- `getDelta(uint256) returns (uint256[3])` [external]

---


# Project Summary

## Contract: Allocation
**Inheritance (C3 Linearized):** IAllocation -> Whitelist -> Controllable -> Ownable -> Context -> Constants

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public controller` 
- `mapping(address => bool) public whitelist` 
- `uint256 public swapThreshold` 
- `uint256 public curvePercentThreshold` 

### Public/External Functions
- `calcSystemTargetDelta(SystemState,ExposureState) returns (AllocationState)` [external]
- `calcVaultTargetDelta(SystemState,bool) returns (StablecoinAllocationState)` [external]
- `calcStrategyPercent(uint256) returns (uint256[])` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `setSwapThreshold(uint256)` [external]
- `setCurvePercentThreshold(uint256)` [external]
- `calcSystemTargetDelta(SystemState,ExposureState) returns (AllocationState)` [public]
- `calcVaultTargetDelta(SystemState,bool) returns (StablecoinAllocationState)` [public]
- `calcStrategyPercent(uint256) returns (uint256[])` [public]

---


# Project Summary

## Contract: Exposure
**Inheritance (C3 Linearized):** IExposure -> Whitelist -> Controllable -> Ownable -> Context -> Constants

### State Variables & Constants
- `uint8 public N_COINS` constant
- `uint8 public DEFAULT_DECIMALS` constant
- `uint256 public DEFAULT_DECIMALS_FACTOR` constant
- `uint8 public CHAINLINK_PRICE_DECIMALS` constant
- `uint256 public CHAINLINK_PRICE_DECIMAL_FACTOR` constant
- `uint8 public PERCENTAGE_DECIMALS` constant
- `uint256 public PERCENTAGE_DECIMAL_FACTOR` constant
- `uint256 public CURVE_RATIO_DECIMALS` constant
- `uint256 public CURVE_RATIO_DECIMALS_FACTOR` constant
- `address public controller` 
- `mapping(address => bool) public whitelist` 
- `uint256 public protocolCount` 
- `uint256 public makerUSDCExposure` 

### Public/External Functions
- `calcRiskExposure(SystemState) returns (ExposureState)` [external]
- `getExactRiskExposure(SystemState) returns (ExposureState)` [external]
- `getUnifiedAssets(address[3]) returns (uint256, uint256[3])` [external]
- `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3]) returns (uint256[3])` [external]
- `calcRoughDelta(uint256[3],address[3],uint256) returns (uint256[3])` [external]
- `addToWhitelist(address)` [external]
- `removeFromWhitelist(address)` [external]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `ctrlPaused() returns (bool)` [public]
- `setController(address)` [external]
- `setProtocolCount(uint256)` [external]
- `setMakerUSDCExposure(uint256)` [external]
- `getExactRiskExposure(SystemState) returns (ExposureState)` [external]
- `calcRiskExposure(SystemState) returns (ExposureState)` [external]
- `getUnifiedAssets(address[3]) returns (uint256, uint256[3])` [public]
- `calcRoughDelta(uint256[3],address[3],uint256) returns (uint256[3])` [external]
- `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3]) returns (uint256[3])` [external]

---
