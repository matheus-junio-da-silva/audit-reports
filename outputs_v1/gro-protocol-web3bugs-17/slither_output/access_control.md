# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: WithdrawHandler
**Linearized C3 Inheritance Tree:** IWithdrawHandler -> FixedVaults -> FixedStablecoins -> Constants -> Controllable -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI`
- Privilege: `address USDC`
- Privilege: `address USDT`
- Privilege: `uint256 DAI_DECIMALS`
- Privilege: `uint256 USDC_DECIMALS`
- Privilege: `uint256 USDT_DECIMALS`
- Privilege: `address DAI_VAULT`
- Privilege: `address USDC_VAULT`
- Privilege: `address USDT_VAULT`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdrawByLPToken(bool,uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `withdrawByStablecoin(bool,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAllSingle(bool,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAllBalanced(bool,uint256[3])` | **external** | Yes | None | None direct | None |
| `getVault(uint256)` | **internal** | Yes | None | None direct | None |
| `vaults()` | **internal** | Yes | None | None direct | None |
| `underlyingTokens()` | **internal** | Yes | None | None direct | None |
| `getToken(uint256)` | **internal** | Yes | None | None direct | None |
| `decimals()` | **internal** | Yes | None | None direct | None |
| `getDecimal(uint256)` | **internal** | Yes | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `setDependencies()` | **external** | No (msg/tx) | onlyOwner | None direct | buoy, ctrl, emergencyHandler, insurance, lg |
| `withdrawByLPToken(bool,uint256,uint256[3])` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawByStablecoin(bool,uint256,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawAllSingle(bool,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawAllBalanced(bool,uint256[3])` | **external** | No (msg/tx) | None | None direct | None |
| `getVaultDeltas(uint256)` | **external** | Yes | None | None direct | None |
| `withdrawalFee(bool)` | **public** | Yes | None | None direct | None |
| `_withdrawAllSingleFromAccount(address,bool,uint256,uint256)` | **private** | No (msg/tx) | None | None direct | None |
| `_withdraw(WithdrawHandler.WithdrawParameter)` | **private** | No (msg/tx) | None | None direct | None |
| `_withdrawSingle(address,bool,uint256,uint256,uint256,uint256,bool)` | **private** | Yes | None | None direct | None |
| `_withdrawBalanced(address,bool,uint256,uint256[3],uint256)` | **private** | Yes | None | None direct | None |
| `_prepareForWithdrawalSingle(address,bool,uint256,uint256,uint256)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: FixedGTokens
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IToken pwrd`
- Privilege: `IToken gvt`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `gTokens(bool)` | **internal** | Yes | None | None direct | None |

---

## Contract: IBuoy
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `safetyCheck()` | **external** | Yes | None | None direct | None |
| `updateRatios()` | **external** | Yes | None | None direct | None |
| `updateRatiosWithTolerance(uint256)` | **external** | Yes | None | None direct | None |
| `lpToUsd(uint256)` | **external** | Yes | None | None direct | None |
| `usdToLp(uint256)` | **external** | Yes | None | None direct | None |
| `stableToUsd(uint256[3],bool)` | **external** | Yes | None | None direct | None |
| `stableToLp(uint256[3],bool)` | **external** | Yes | None | None direct | None |
| `singleStableFromLp(uint256,int128)` | **external** | Yes | None | None direct | None |
| `curvePool()` | **external** | Yes | None | None direct | None |
| `getVirtualPrice()` | **external** | Yes | None | None direct | None |
| `singleStableFromUsd(uint256,int128)` | **external** | Yes | None | None direct | None |
| `singleStableToUsd(uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IChainPrice
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getPriceFeed(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IController
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `stablecoins()` | **external** | Yes | None | None direct | None |
| `vaults()` | **external** | Yes | None | None direct | None |
| `underlyingVaults(uint256)` | **external** | Yes | None | None direct | None |
| `curveVault()` | **external** | Yes | None | None direct | None |
| `pnl()` | **external** | Yes | None | None direct | None |
| `insurance()` | **external** | Yes | None | None direct | None |
| `lifeGuard()` | **external** | Yes | None | None direct | None |
| `buoy()` | **external** | Yes | None | None direct | None |
| `reward()` | **external** | Yes | None | None direct | None |
| `isValidBigFish(bool,bool,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawHandler()` | **external** | Yes | None | None direct | None |
| `emergencyHandler()` | **external** | Yes | None | None direct | None |
| `depositHandler()` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `gTokenTotalAssets()` | **external** | Yes | None | None direct | None |
| `eoaOnly(address)` | **external** | Yes | None | None direct | None |
| `getSkimPercent()` | **external** | Yes | None | None direct | None |
| `gToken(bool)` | **external** | Yes | None | None direct | None |
| `emergencyState()` | **external** | Yes | None | None direct | None |
| `deadCoin()` | **external** | Yes | None | None direct | None |
| `distributeStrategyGainLoss(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnGToken(bool,bool,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `mintGToken(bool,address,uint256)` | **external** | Yes | None | None direct | None |
| `getUserAssets(bool,address)` | **external** | Yes | None | None direct | None |
| `referrals(address)` | **external** | Yes | None | None direct | None |
| `addReferral(address,address)` | **external** | Yes | None | None direct | None |
| `getStrategiesTargetRatio()` | **external** | Yes | None | None direct | None |
| `withdrawalFee(bool)` | **external** | Yes | None | None direct | None |
| `validGTokenDecrease(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurve3Pool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `coins(uint256)` | **external** | Yes | None | None direct | None |
| `get_virtual_price()` | **external** | Yes | None | None direct | None |
| `get_dy(int128,int128,uint256)` | **external** | Yes | None | None direct | None |
| `calc_withdraw_one_coin(uint256,int128)` | **external** | Yes | None | None direct | None |
| `calc_token_amount(uint256[3],bool)` | **external** | Yes | None | None direct | None |
| `balances(int128)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurve3Deposit
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `exchange(int128,int128,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `add_liquidity(uint256[3],uint256)` | **external** | Yes | None | None direct | None |
| `remove_liquidity(uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `remove_liquidity_imbalance(uint256[3],uint256)` | **external** | Yes | None | None direct | None |
| `remove_liquidity_one_coin(uint256,int128,uint256)` | **external** | Yes | None | None direct | None |
| `get_dy(int128,int128,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurveMetaPool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `coins(uint256)` | **external** | Yes | None | None direct | None |
| `get_virtual_price()` | **external** | Yes | None | None direct | None |
| `get_dy_underlying(int128,int128,uint256)` | **external** | Yes | None | None direct | None |
| `calc_withdraw_one_coin(uint256,int128)` | **external** | Yes | None | None direct | None |
| `calc_token_amount(uint256[2],bool)` | **external** | Yes | None | None direct | None |
| `exchange(int128,int128,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `add_liquidity(uint256[2],uint256)` | **external** | Yes | None | None direct | None |
| `remove_liquidity_one_coin(uint256,int128,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurveZap
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add_liquidity(uint256[4],uint256)` | **external** | Yes | None | None direct | None |
| `remove_liquidity(uint256,uint256[4])` | **external** | Yes | None | None direct | None |
| `remove_liquidity_imbalance(uint256[4],uint256)` | **external** | Yes | None | None direct | None |
| `remove_liquidity_one_coin(uint256,int128,uint256)` | **external** | Yes | None | None direct | None |
| `calc_withdraw_one_coin(uint256,int128)` | **external** | Yes | None | None direct | None |
| `calc_token_amount(uint256[4],bool)` | **external** | Yes | None | None direct | None |
| `pool()` | **external** | Yes | None | None direct | None |

---

## Contract: IEmergencyHandler
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `emergencyWithdrawal(address,bool,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `emergencyWithdrawAll(address,bool,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IInsurance
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calculateDepositDeltasOnAllVaults()` | **external** | Yes | None | None direct | None |
| `rebalanceTrigger()` | **external** | Yes | None | None direct | None |
| `rebalance()` | **external** | Yes | None | None direct | None |
| `calcSkim()` | **external** | Yes | None | None direct | None |
| `rebalanceForWithdraw(uint256,bool)` | **external** | Yes | None | None direct | None |
| `getDelta(uint256)` | **external** | Yes | None | None direct | None |
| `getVaultDeltaForDeposit(uint256)` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool)` | **external** | Yes | None | None direct | None |
| `getStrategiesTargetRatio(uint256)` | **external** | Yes | None | None direct | None |
| `setUnderlyingTokenPercent(uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILifeGuard
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `assets(uint256)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getAssets()` | **external** | Yes | None | None direct | None |
| `totalAssetsUsd()` | **external** | Yes | None | None direct | None |
| `availableUsd()` | **external** | Yes | None | None direct | None |
| `availableLP()` | **external** | Yes | None | None direct | None |
| `depositStable(bool)` | **external** | Yes | None | None direct | None |
| `investToCurveVault()` | **external** | Yes | None | None direct | None |
| `distributeCurveVault(uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `deposit()` | **external** | Yes | None | None direct | None |
| `withdrawSingleByLiquidity(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawSingleByExchange(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `invest(uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `getBuoy()` | **external** | Yes | None | None direct | None |
| `investSingle(uint256[3],uint256,uint256)` | **external** | Yes | None | None direct | None |
| `investToCurveVaultTrigger()` | **external** | Yes | None | None direct | None |

---

## Contract: IPausable
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `paused()` | **external** | Yes | None | None direct | None |

---

## Contract: IToken
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `factor()` | **external** | Yes | None | None direct | None |
| `factor(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnAll(address)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getPricePerShare()` | **external** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **external** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IVault
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawByStrategyOrder(uint256,address,bool)` | **external** | Yes | None | None direct | None |
| `withdrawByStrategyIndex(uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `deposit(uint256)` | **external** | Yes | None | None direct | None |
| `updateStrategyRatio(uint256[])` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getStrategiesLength()` | **external** | Yes | None | None direct | None |
| `strategyHarvestTrigger(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `strategyHarvest(uint256)` | **external** | Yes | None | None direct | None |
| `getStrategyAssets(uint256)` | **external** | Yes | None | None direct | None |
| `token()` | **external** | Yes | None | None direct | None |
| `vault()` | **external** | Yes | None | None direct | None |
| `investTrigger()` | **external** | Yes | None | None direct | None |
| `invest()` | **external** | Yes | None | None direct | None |

---

## Contract: AggregatorV3Interface
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `decimals()` | **external** | Yes | None | None direct | None |
| `description()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `getRoundData(uint80)` | **external** | Yes | None | None direct | None |
| `latestRoundData()` | **external** | Yes | None | None direct | None |

---

## Contract: SafeMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `tryAdd(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `trySub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryDiv(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `add(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |

---

## Contract: IERC20
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

---

## Contract: SafeERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `safeTransfer(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeTransferFrom(IERC20,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeApprove(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeIncreaseAllowance(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeDecreaseAllowance(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_callOptionalReturn(IERC20,bytes)` | **private** | Yes | None | None direct | None |

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

## Contract: DepositHandler
**Linearized C3 Inheritance Tree:** IDepositHandler -> FixedVaults -> FixedStablecoins -> Constants -> Controllable -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI`
- Privilege: `address USDC`
- Privilege: `address USDT`
- Privilege: `uint256 DAI_DECIMALS`
- Privilege: `uint256 USDC_DECIMALS`
- Privilege: `uint256 USDT_DECIMALS`
- Privilege: `address DAI_VAULT`
- Privilege: `address USDC_VAULT`
- Privilege: `address USDT_VAULT`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `depositGvt(uint256[3],uint256,address)` | **external** | Yes | None | None direct | None |
| `depositPwrd(uint256[3],uint256,address)` | **external** | Yes | None | None direct | None |
| `getVault(uint256)` | **internal** | Yes | None | None direct | None |
| `vaults()` | **internal** | Yes | None | None direct | None |
| `underlyingTokens()` | **internal** | Yes | None | None direct | None |
| `getToken(uint256)` | **internal** | Yes | None | None direct | None |
| `decimals()` | **internal** | Yes | None | None direct | None |
| `getDecimal(uint256)` | **internal** | Yes | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `setDependencies()` | **external** | No (msg/tx) | onlyOwner | None direct | buoy, ctrl, insurance, lg |
| `setFeeToken(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | feeToken |
| `depositPwrd(uint256[3],uint256,address)` | **external** | No (msg/tx) | whenNotPaused | None direct | None |
| `depositGvt(uint256[3],uint256,address)` | **external** | No (msg/tx) | whenNotPaused | None direct | None |
| `depositGToken(uint256[3],uint256,address,bool)` | **private** | No (msg/tx) | None | None direct | None |
| `_deposit(bool,uint256,uint256,uint256[3])` | **private** | No (msg/tx) | None | None direct | None |
| `_invest(uint256[3],uint256)` | **internal** | Yes | None | None direct | None |
| `roughUsd(uint256[3])` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: IERC20Detailed
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |

---

## Contract: Controller
**Linearized C3 Inheritance Tree:** IController -> FixedGTokens -> FixedStablecoins -> Constants -> Whitelist -> Ownable -> Pausable -> Context
**Pausable Safety (Unprotected Mutative Actions):** ⚠️ Warning: `eoaOnly`, `distributeStrategyGainLoss`, `burnGToken`, `mintGToken`, `addReferral`, `addToWhitelist`, `removeFromWhitelist`, `renounceOwnership`, `transferOwnership`, `pause`, `unpause`, `setWithdrawHandler`, `setDepositHandler`, `setVault`, `setCurveVault`, `setLifeGuard`, `setInsurance`, `setPnL`, `addSafeAddress`, `switchEoaOnly`, `setBigFishThreshold`, `setReward`, `addReferral`, `setWithdrawalFee`, `distributeCurveAssets`, `eoaOnly`, `emergency`, `distributeStrategyGainLoss`, `realizePriceChange`, `burnGToken`, `mintGToken`, `setUtilisationRatioLimitPwrd`, `setUtilisationRatioLimitGvt`

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI`
- Privilege: `address USDC`
- Privilege: `address USDT`
- Privilege: `uint256 DAI_DECIMALS`
- Privilege: `uint256 USDC_DECIMALS`
- Privilege: `uint256 USDT_DECIMALS`
- Privilege: `IToken pwrd`
- Privilege: `IToken gvt`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `stablecoins()` | **external** | Yes | None | None direct | None |
| `vaults()` | **external** | Yes | None | None direct | None |
| `underlyingVaults(uint256)` | **external** | Yes | None | None direct | None |
| `curveVault()` | **external** | Yes | None | None direct | None |
| `pnl()` | **external** | Yes | None | None direct | None |
| `insurance()` | **external** | Yes | None | None direct | None |
| `lifeGuard()` | **external** | Yes | None | None direct | None |
| `buoy()` | **external** | Yes | None | None direct | None |
| `reward()` | **external** | Yes | None | None direct | None |
| `isValidBigFish(bool,bool,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawHandler()` | **external** | Yes | None | None direct | None |
| `emergencyHandler()` | **external** | Yes | None | None direct | None |
| `depositHandler()` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `gTokenTotalAssets()` | **external** | Yes | None | None direct | None |
| `eoaOnly(address)` | **external** | Yes | None | None direct | None |
| `getSkimPercent()` | **external** | Yes | None | None direct | None |
| `gToken(bool)` | **external** | Yes | None | None direct | None |
| `emergencyState()` | **external** | Yes | None | None direct | None |
| `deadCoin()` | **external** | Yes | None | None direct | None |
| `distributeStrategyGainLoss(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnGToken(bool,bool,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `mintGToken(bool,address,uint256)` | **external** | Yes | None | None direct | None |
| `getUserAssets(bool,address)` | **external** | Yes | None | None direct | None |
| `referrals(address)` | **external** | Yes | None | None direct | None |
| `addReferral(address,address)` | **external** | Yes | None | None direct | None |
| `getStrategiesTargetRatio()` | **external** | Yes | None | None direct | None |
| `withdrawalFee(bool)` | **external** | Yes | None | None direct | None |
| `validGTokenDecrease(uint256)` | **external** | Yes | None | None direct | None |
| `gTokens(bool)` | **internal** | Yes | None | None direct | None |
| `underlyingTokens()` | **internal** | Yes | None | None direct | None |
| `getToken(uint256)` | **internal** | Yes | None | None direct | None |
| `decimals()` | **internal** | Yes | None | None direct | None |
| `getDecimal(uint256)` | **internal** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `paused()` | **public** | Yes | None | None direct | None |
| `_pause()` | **internal** | No (msg/tx) | whenNotPaused | None direct | _paused |
| `_unpause()` | **internal** | No (msg/tx) | whenPaused | None direct | _paused |
| `pause()` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `unpause()` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `setWithdrawHandler(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | emergencyHandler, withdrawHandler |
| `setDepositHandler(address)` | **external** | No (msg/tx) | onlyOwner | None direct | depositHandler |
| `stablecoins()` | **external** | Yes | None | None direct | None |
| `getSkimPercent()` | **external** | Yes | None | None direct | None |
| `vaults()` | **external** | Yes | None | None direct | None |
| `setVault(uint256,address)` | **external** | No (msg/tx) | onlyOwner | None direct | underlyingVaults, vaultIndexes |
| `setCurveVault(address)` | **external** | No (msg/tx) | onlyOwner | None direct | curveVault, vaultIndexes |
| `setLifeGuard(address)` | **external** | No (msg/tx) | onlyOwner | None direct | buoy, lifeGuard |
| `setInsurance(address)` | **external** | No (msg/tx) | onlyOwner | None direct | insurance |
| `setPnL(address)` | **external** | No (msg/tx) | onlyOwner | None direct | pnl |
| `addSafeAddress(address)` | **external** | No (msg/tx) | onlyOwner | None direct | safeAddresses |
| `switchEoaOnly(bool)` | **external** | No (msg/tx) | onlyOwner | None direct | preventSmartContracts |
| `setBigFishThreshold(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | bigFishAbsoluteThreshold, bigFishThreshold |
| `setReward(address)` | **external** | No (msg/tx) | onlyOwner | None direct | reward |
| `addReferral(address,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == depositHandler,!depositHandler)` | referrals |
| `setWithdrawalFee(bool,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | withdrawalFee |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `gTokenTotalAssets()` | **public** | No (msg/tx) | None | None direct | None |
| `gToken(bool)` | **external** | Yes | None | None direct | None |
| `isValidBigFish(bool,bool,uint256)` | **external** | Yes | None | None direct | None |
| `distributeCurveAssets(uint256,uint256[3])` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `eoaOnly(address)` | **public** | No (msg/tx) | None | `require(bool,string)(sender == tx.origin,EOA only)` | None |
| `_totalAssets()` | **private** | Yes | None | None direct | None |
| `_totalAssetsEmergency()` | **private** | Yes | None | None direct | None |
| `emergency(uint256)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | deadCoin, emergencyState |
| `restart(uint256[])` | **external** | No (msg/tx) | onlyOwner, whenPaused | None direct | deadCoin, emergencyState |
| `distributeStrategyGainLoss(uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `realizePriceChange(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `burnGToken(bool,bool,address,uint256,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == withdrawHandler || msg.sender == emergencyHandler,burnGToken: !withdrawHandler)` | None |
| `mintGToken(bool,address,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == depositHandler,burnGToken: !depositHandler)` | None |
| `getUserAssets(bool,address)` | **external** | Yes | None | None direct | None |
| `validGTokenIncrease(uint256)` | **private** | Yes | None | None direct | None |
| `validGTokenDecrease(uint256)` | **public** | Yes | None | None direct | None |
| `setUtilisationRatioLimitPwrd(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | utilisationRatioLimitPwrd |
| `setUtilisationRatioLimitGvt(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | utilisationRatioLimitGvt |
| `getStrategiesTargetRatio()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | bigFishAbsoluteThreshold, bigFishThreshold, deadCoin, preventSmartContracts |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: FixedVaults
**Linearized C3 Inheritance Tree:** Constants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI_VAULT`
- Privilege: `address USDC_VAULT`
- Privilege: `address USDT_VAULT`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getVault(uint256)` | **internal** | Yes | None | None direct | None |
| `vaults()` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: IPnL
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcPnL()` | **external** | Yes | None | None direct | None |
| `increaseGTokenLastAmount(bool,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseGTokenLastAmount(bool,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `lastGvtAssets()` | **external** | Yes | None | None direct | None |
| `lastPwrdAssets()` | **external** | Yes | None | None direct | None |
| `utilisationRatio()` | **external** | Yes | None | None direct | None |
| `emergencyPnL()` | **external** | Yes | None | None direct | None |
| `recover()` | **external** | Yes | None | None direct | None |
| `distributeStrategyGainLoss(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `distributePriceChange(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IWithdrawHandler
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdrawByLPToken(bool,uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `withdrawByStablecoin(bool,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAllSingle(bool,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAllBalanced(bool,uint256[3])` | **external** | Yes | None | None direct | None |

---

## Contract: IHarvest
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deposit(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `getPricePerFullShare()` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAll()` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `underlying()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |

---

## Contract: IStake
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `lpToken()` | **external** | Yes | None | None direct | None |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `getReward()` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `exit()` | **external** | Yes | None | None direct | None |

---

## Contract: IExposure
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `getExactRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `getUnifiedAssets(address[3])` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3])` | **external** | Yes | None | None direct | None |
| `calcRoughDelta(uint256[3],address[3],uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IDepositHandler
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `depositGvt(uint256[3],uint256,address)` | **external** | Yes | None | None direct | None |
| `depositPwrd(uint256[3],uint256,address)` | **external** | Yes | None | None direct | None |

---

## Contract: IAllocation
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcSystemTargetDelta(SystemState,ExposureState)` | **external** | Yes | None | None direct | None |
| `calcVaultTargetDelta(SystemState,bool)` | **external** | Yes | None | None direct | None |
| `calcStrategyPercent(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: FixedStablecoins
**Linearized C3 Inheritance Tree:** Constants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI`
- Privilege: `address USDC`
- Privilege: `address USDT`
- Privilege: `uint256 DAI_DECIMALS`
- Privilege: `uint256 USDC_DECIMALS`
- Privilege: `uint256 USDT_DECIMALS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `underlyingTokens()` | **internal** | Yes | None | None direct | None |
| `getToken(uint256)` | **internal** | Yes | None | None direct | None |
| `decimals()` | **internal** | Yes | None | None direct | None |
| `getDecimal(uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: PnL
**Linearized C3 Inheritance Tree:** IPnL -> FixedGTokens -> Constants -> Controllable -> Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `IToken pwrd`
- Privilege: `IToken gvt`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcPnL()` | **external** | Yes | None | None direct | None |
| `increaseGTokenLastAmount(bool,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseGTokenLastAmount(bool,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `lastGvtAssets()` | **external** | Yes | None | None direct | None |
| `lastPwrdAssets()` | **external** | Yes | None | None direct | None |
| `utilisationRatio()` | **external** | Yes | None | None direct | None |
| `emergencyPnL()` | **external** | Yes | None | None direct | None |
| `recover()` | **external** | Yes | None | None direct | None |
| `distributeStrategyGainLoss(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `distributePriceChange(uint256)` | **external** | Yes | None | None direct | None |
| `gTokens(bool)` | **internal** | Yes | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `setRebase(bool)` | **external** | No (msg/tx) | onlyOwner | None direct | rebase |
| `setPerformanceFee(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | performanceFee |
| `increaseGTokenLastAmount(bool,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,increaseGTokenLastAmount: !controller)` | lastGvtAssets, lastPwrdAssets |
| `decreaseGTokenLastAmount(bool,uint256,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,decreaseGTokenLastAmount: !controller)` | lastGvtAssets, lastPwrdAssets |
| `calcPnL()` | **external** | Yes | None | None direct | None |
| `utilisationRatio()` | **external** | Yes | None | None direct | None |
| `emergencyPnL()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,emergencyPnL: !controller)` | None |
| `recover()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,recover: !controller)` | None |
| `handleInvestGain(uint256,uint256,uint256,address)` | **private** | Yes | None | None direct | None |
| `handleLoss(uint256,uint256,uint256)` | **private** | Yes | None | None direct | None |
| `forceDistribute()` | **private** | Yes | None | None direct | lastGvtAssets, lastPwrdAssets |
| `distributeStrategyGainLoss(uint256,uint256,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!Controller)` | lastGvtAssets, lastPwrdAssets |
| `distributePriceChange(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!Controller)` | lastGvtAssets, lastPwrdAssets |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | rebase |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: Whitelist
**Linearized C3 Inheritance Tree:** Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |

---

## Contract: Controllable
**Linearized C3 Inheritance Tree:** Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |

---

## Contract: Constants
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: IYearnV2Strategy
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `vault()` | **external** | Yes | None | None direct | None |
| `setVault(address)` | **external** | Yes | None | None direct | None |
| `keeper()` | **external** | Yes | None | None direct | None |
| `setKeeper(address)` | **external** | Yes | None | None direct | None |
| `harvestTrigger(uint256)` | **external** | Yes | None | None direct | None |
| `harvest()` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `estimatedTotalAssets()` | **external** | Yes | None | None direct | None |

---

## Contract: IYearnV2Vault
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `strategies(address)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `pricePerShare()` | **external** | Yes | None | None direct | None |
| `deposit(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawByStrategy(address[20],uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `depositLimit()` | **external** | Yes | None | None direct | None |
| `debtOutstanding(address)` | **external** | Yes | None | None direct | None |
| `totalDebt()` | **external** | Yes | None | None direct | None |
| `updateStrategyDebtRatio(address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawalQueue(uint256)` | **external** | Yes | None | None direct | None |
| `report(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: GERC20
**Linearized C3 Inheritance Tree:** IERC20 -> Context
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
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupplyBase()` | **public** | Yes | None | None direct | None |
| `balanceOfBase(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_decreaseApproved(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: NonRebasingGToken
**Linearized C3 Inheritance Tree:** GToken -> IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `uint256 BASE`
- Privilege: `uint256 INIT_BASE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | ctrl |
| `factor()` | **public** | Yes | None | None direct | None |
| `applyFactor(uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `factor(uint256)` | **public** | Yes | None | None direct | None |
| `totalAssets()` | **public** | Yes | None | None direct | None |
| `getInitialBase()` | **internal** | Yes | None | None direct | None |
| `factor()` | **external** | Yes | None | None direct | None |
| `factor(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnAll(address)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getPricePerShare()` | **external** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **external** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupplyBase()` | **public** | Yes | None | None direct | None |
| `balanceOfBase(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_decreaseApproved(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getPricePerShare()` | **public** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **public** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |
| `getInitialBase()` | **internal** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `burn(address,uint256,uint256)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `burnAll(address)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BASE, CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, INIT_BASE, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: RebasingGToken
**Linearized C3 Inheritance Tree:** GToken -> IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `uint256 BASE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | ctrl |
| `factor()` | **public** | Yes | None | None direct | None |
| `applyFactor(uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `factor(uint256)` | **public** | Yes | None | None direct | None |
| `totalAssets()` | **public** | Yes | None | None direct | None |
| `getInitialBase()` | **internal** | Yes | None | None direct | None |
| `factor()` | **external** | Yes | None | None direct | None |
| `factor(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnAll(address)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getPricePerShare()` | **external** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **external** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupplyBase()` | **public** | Yes | None | None direct | None |
| `balanceOfBase(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_decreaseApproved(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getPricePerShare()` | **external** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **external** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `burn(address,uint256,uint256)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `burnAll(address)` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BASE, CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: GToken
**Linearized C3 Inheritance Tree:** IToken -> Whitelist -> Ownable -> Constants -> GERC20 -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `uint256 BASE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `factor()` | **external** | Yes | None | None direct | None |
| `factor(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `burnAll(address)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getPricePerShare()` | **external** | Yes | None | None direct | None |
| `getShareAssets(uint256)` | **external** | Yes | None | None direct | None |
| `getAssets(address)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupplyBase()` | **public** | Yes | None | None direct | None |
| `balanceOfBase(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_decreaseApproved(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | ctrl |
| `factor()` | **public** | Yes | None | None direct | None |
| `applyFactor(uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `factor(uint256)` | **public** | Yes | None | None direct | None |
| `totalAssets()` | **public** | Yes | None | None direct | None |
| `getInitialBase()` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BASE, CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: LifeGuard3Pool
**Linearized C3 Inheritance Tree:** FixedStablecoins -> Constants -> Whitelist -> Controllable -> Ownable -> Context -> ILifeGuard
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`
- Privilege: `address DAI`
- Privilege: `address USDC`
- Privilege: `address USDT`
- Privilege: `uint256 DAI_DECIMALS`
- Privilege: `uint256 USDC_DECIMALS`
- Privilege: `uint256 USDT_DECIMALS`
- Privilege: `ICurve3Deposit crv3pool`
- Privilege: `IERC20 lpToken`
- Privilege: `IBuoy buoy`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `underlyingTokens()` | **internal** | Yes | None | None direct | None |
| `getToken(uint256)` | **internal** | Yes | None | None direct | None |
| `decimals()` | **internal** | Yes | None | None direct | None |
| `getDecimal(uint256)` | **internal** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `assets(uint256)` | **external** | Yes | None | None direct | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `getAssets()` | **external** | Yes | None | None direct | None |
| `totalAssetsUsd()` | **external** | Yes | None | None direct | None |
| `availableUsd()` | **external** | Yes | None | None direct | None |
| `availableLP()` | **external** | Yes | None | None direct | None |
| `depositStable(bool)` | **external** | Yes | None | None direct | None |
| `investToCurveVault()` | **external** | Yes | None | None direct | None |
| `distributeCurveVault(uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `deposit()` | **external** | Yes | None | None direct | None |
| `withdrawSingleByLiquidity(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawSingleByExchange(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `invest(uint256,uint256[3])` | **external** | Yes | None | None direct | None |
| `getBuoy()` | **external** | Yes | None | None direct | None |
| `investSingle(uint256[3],uint256,uint256)` | **external** | Yes | None | None direct | None |
| `investToCurveVaultTrigger()` | **external** | Yes | None | None direct | None |
| `setDependencies()` | **external** | No (msg/tx) | onlyOwner | None direct | depositHandler, insurance, withdrawHandler |
| `getAssets()` | **external** | Yes | None | None direct | None |
| `approveVaults(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `setInvestToCurveThreshold(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | investToCurveThreshold |
| `investToCurveVault()` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | assets |
| `investToCurveVaultTrigger()` | **external** | Yes | None | None direct | None |
| `distributeCurveVault(uint256,uint256[3])` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,distributeCurveVault: !controller)` | None |
| `depositStable(bool)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == withdrawHandler || msg.sender == insurance,depositStable: !depositHandler)` | assets |
| `skim(uint256,uint256)` | **internal** | Yes | None | None direct | assets |
| `deposit()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == depositHandler,depositStable: !depositHandler)` | None |
| `withdrawSingleByLiquidity(uint256,uint256,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == withdrawHandler,withdrawSingleByLiquidity: !withdrawHandler)` | None |
| `withdrawSingleByExchange(uint256,uint256,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == withdrawHandler,withdrawSingleByExchange: !withdrawHandler)` | None |
| `getBuoy()` | **external** | Yes | None | None direct | None |
| `invest(uint256,uint256[3])` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == insurance || msg.sender == depositHandler,depositStable: !depositHandler)` | None |
| `investSingle(uint256[3],uint256,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == depositHandler,!investSingle: !depositHandler)` | None |
| `totalAssets()` | **external** | Yes | None | None direct | None |
| `availableLP()` | **external** | Yes | None | None direct | None |
| `totalAssetsUsd()` | **external** | Yes | None | None direct | None |
| `availableUsd()` | **external** | Yes | None | None direct | None |
| `_exchange(uint256,int128,int128)` | **private** | Yes | None | None direct | None |
| `_withdrawUnbalanced(uint256,uint256[3])` | **private** | Yes | None | None direct | None |
| `_totalAssets()` | **private** | Yes | None | None direct | None |
| `_investToVault(uint256,bool)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: ERC20
**Linearized C3 Inheritance Tree:** IERC20 -> Context
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
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
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
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: Insurance
**Linearized C3 Inheritance Tree:** IInsurance -> Whitelist -> Controllable -> Ownable -> Context -> Constants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calculateDepositDeltasOnAllVaults()` | **external** | Yes | None | None direct | None |
| `rebalanceTrigger()` | **external** | Yes | None | None direct | None |
| `rebalance()` | **external** | Yes | None | None direct | None |
| `calcSkim()` | **external** | Yes | None | None direct | None |
| `rebalanceForWithdraw(uint256,bool)` | **external** | Yes | None | None direct | None |
| `getDelta(uint256)` | **external** | Yes | None | None direct | None |
| `getVaultDeltaForDeposit(uint256)` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool)` | **external** | Yes | None | None direct | None |
| `getStrategiesTargetRatio(uint256)` | **external** | Yes | None | None direct | None |
| `setUnderlyingTokenPercent(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `setAllocation(address)` | **external** | No (msg/tx) | onlyOwner | None direct | allocation |
| `setExposure(address)` | **external** | No (msg/tx) | onlyOwner | None direct | exposure |
| `setUnderlyingTokenPercent(uint256,uint256)` | **external** | No (msg/tx) | onlyValidIndex | `require(bool,string)(msg.sender == controller || msg.sender == owner(),setUnderlyingTokenPercent: !authorized)` | underlyingTokensPercents |
| `setCurveVaultPercent(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | curveVaultPercent |
| `setExposureBufferRebalance(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | exposureBufferRebalance |
| `setWhaleThresholdWithdraw(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | maxPercentForWithdraw |
| `setWhaleThresholdDeposit(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | maxPercentForDeposit |
| `calculateDepositDeltasOnAllVaults()` | **public** | Yes | None | None direct | None |
| `getVaultDeltaForDeposit(uint256)` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool)` | **external** | Yes | None | None direct | None |
| `rebalanceTrigger()` | **external** | Yes | None | None direct | None |
| `rebalance()` | **external** | No (msg/tx) | onlyWhitelist | `[Internal Call: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)`<br>`[Modifier: onlyWhitelist] require(bool,string)(whitelist[msg.sender],only whitelist)` | None |
| `rebalanceForWithdraw(uint256,bool)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == _controller().withdrawHandler(),rebalanceForWithdraw: !withdrawHandler)` | None |
| `calcSkim()` | **external** | Yes | None | None direct | None |
| `getStrategiesTargetRatio(uint256)` | **external** | Yes | None | None direct | None |
| `prepareCalculation()` | **public** | Yes | None | None direct | None |
| `withdraw(uint256,bool)` | **private** | Yes | None | None direct | None |
| `calculateWithdrawalAmountsOnPartVaults(uint256,address[3])` | **private** | Yes | None | None direct | None |
| `getDelta(uint256)` | **external** | Yes | None | None direct | None |
| `calculateWithdrawalAmountsOnAllVaults(uint256,address[3])` | **private** | Yes | None | None direct | None |
| `calculateVaultSwapData(uint256)` | **private** | Yes | None | None direct | None |
| `getLifeGuard()` | **private** | Yes | None | None direct | None |
| `_rebalance(AllocationState)` | **private** | Yes | None | None direct | None |
| `moveAssetsFromVaultsToLifeguard(address[3],uint256[3],ILifeGuard,uint256,uint256[])` | **private** | Yes | None | None direct | None |
| `getStablePercents()` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: Allocation
**Linearized C3 Inheritance Tree:** IAllocation -> Whitelist -> Controllable -> Ownable -> Context -> Constants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcSystemTargetDelta(SystemState,ExposureState)` | **external** | Yes | None | None direct | None |
| `calcVaultTargetDelta(SystemState,bool)` | **external** | Yes | None | None direct | None |
| `calcStrategyPercent(uint256)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `setSwapThreshold(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | swapThreshold |
| `setCurvePercentThreshold(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | curvePercentThreshold |
| `calcSystemTargetDelta(SystemState,ExposureState)` | **public** | Yes | None | None direct | None |
| `calcVaultTargetDelta(SystemState,bool)` | **public** | Yes | None | None direct | None |
| `calcProtocolWithdraw(AllocationState,uint256)` | **private** | Yes | None | None direct | None |
| `_calcVaultTargetDelta(SystemState,bool,bool)` | **private** | Yes | None | None direct | None |
| `calcStrategyPercent(uint256)` | **public** | Yes | None | None direct | None |
| `calcProtocolExposureDelta(uint256[],SystemState)` | **private** | Yes | None | None direct | None |
| `invalidDelta(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `needCurveVault(SystemState)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---

## Contract: Exposure
**Linearized C3 Inheritance Tree:** IExposure -> Whitelist -> Controllable -> Ownable -> Context -> Constants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 N_COINS`
- Privilege: `uint8 DEFAULT_DECIMALS`
- Privilege: `uint256 DEFAULT_DECIMALS_FACTOR`
- Privilege: `uint8 CHAINLINK_PRICE_DECIMALS`
- Privilege: `uint256 CHAINLINK_PRICE_DECIMAL_FACTOR`
- Privilege: `uint8 PERCENTAGE_DECIMALS`
- Privilege: `uint256 PERCENTAGE_DECIMAL_FACTOR`
- Privilege: `uint256 CURVE_RATIO_DECIMALS`
- Privilege: `uint256 CURVE_RATIO_DECIMALS_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calcRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `getExactRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `getUnifiedAssets(address[3])` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3])` | **external** | Yes | None | None direct | None |
| `calcRoughDelta(uint256[3],address[3],uint256)` | **external** | Yes | None | None direct | None |
| `addToWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `removeFromWhitelist(address)` | **external** | No (msg/tx) | onlyOwner | None direct | whitelist |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `ctrlPaused()` | **public** | Yes | None | None direct | None |
| `setController(address)` | **external** | No (msg/tx) | onlyOwner | None direct | controller |
| `_controller()` | **internal** | Yes | None | None direct | None |
| `_pausable()` | **internal** | Yes | None | None direct | None |
| `setProtocolCount(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | protocolCount |
| `setMakerUSDCExposure(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | makerUSDCExposure |
| `getExactRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `calcRiskExposure(SystemState)` | **external** | Yes | None | None direct | None |
| `getUnifiedAssets(address[3])` | **public** | Yes | None | None direct | None |
| `calcRoughDelta(uint256[3],address[3],uint256)` | **external** | Yes | None | None direct | None |
| `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3])` | **external** | Yes | None | None direct | None |
| `calculatePercentOfSystem(address,uint256,uint256,uint256)` | **private** | Yes | None | None direct | None |
| `calculateStableCoinExposure(uint256[3],uint256)` | **private** | Yes | None | None direct | None |
| `isExposed(uint256,uint256[3],uint256[],uint256)` | **private** | Yes | None | None direct | None |
| `_calcRiskExposure(SystemState,bool)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CHAINLINK_PRICE_DECIMALS, CHAINLINK_PRICE_DECIMAL_FACTOR, CURVE_RATIO_DECIMALS, CURVE_RATIO_DECIMALS_FACTOR, DEFAULT_DECIMALS, DEFAULT_DECIMALS_FACTOR, N_COINS, PERCENTAGE_DECIMALS, PERCENTAGE_DECIMAL_FACTOR |

---
