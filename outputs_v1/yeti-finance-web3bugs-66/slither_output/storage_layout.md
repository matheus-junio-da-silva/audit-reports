# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: YetiFinanceTreasury
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `teamWallet` | `address` | **0** | **0** | Storage | `YetiFinanceTreasury` |

---

## Contract: BorrowerOperations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **4** | **0** | Storage | `ReentrancyGuard` |
| `troveManager` | `ITroveManager` | **5** | **0** | Storage | `BorrowerOperations` |
| `stabilityPoolAddress` | `address` | **6** | **0** | Storage | `BorrowerOperations` |
| `gasPoolAddress` | `address` | **7** | **0** | Storage | `BorrowerOperations` |
| `collSurplusPool` | `ICollSurplusPool` | **8** | **0** | Storage | `BorrowerOperations` |
| `sYETI` | `ISYETI` | **9** | **0** | Storage | `BorrowerOperations` |
| `sYETIAddress` | `address` | **10** | **0** | Storage | `BorrowerOperations` |
| `yusdToken` | `IYUSDToken` | **11** | **0** | Storage | `BorrowerOperations` |
| `deploymentTime` | `uint256` | **12** | **0** | Storage | `BorrowerOperations` |
| `sortedTroves` | `ISortedTroves` | **13** | **0** | Storage | `BorrowerOperations` |

---

## Contract: TroveManager
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **4** | **0** | Storage | `ReentrancyGuard` |
| `borrowerOperationsAddress` | `address` | **5** | **0** | Storage | `TroveManager` |
| `stabilityPoolContract` | `IStabilityPool` | **6** | **0** | Storage | `TroveManager` |
| `troveManager` | `ITroveManager` | **7** | **0** | Storage | `TroveManager` |
| `yusdTokenContract` | `IYUSDToken` | **8** | **0** | Storage | `TroveManager` |
| `yetiTokenContract` | `IYETIToken` | **9** | **0** | Storage | `TroveManager` |
| `sYETIContract` | `ISYETI` | **10** | **0** | Storage | `TroveManager` |
| `troveManagerRedemptions` | `ITroveManagerRedemptions` | **11** | **0** | Storage | `TroveManager` |
| `troveManagerLiquidations` | `ITroveManagerLiquidations` | **12** | **0** | Storage | `TroveManager` |
| `gasPoolAddress` | `address` | **13** | **0** | Storage | `TroveManager` |
| `troveManagerRedemptionsAddress` | `address` | **14** | **0** | Storage | `TroveManager` |
| `troveManagerLiquidationsAddress` | `address` | **15** | **0** | Storage | `TroveManager` |
| `sortedTroves` | `ISortedTroves` | **16** | **0** | Storage | `TroveManager` |
| `collSurplusPool` | `ICollSurplusPool` | **17** | **0** | Storage | `TroveManager` |
| `baseRate` | `uint256` | **18** | **0** | Storage | `TroveManager` |
| `lastFeeOperationTime` | `uint256` | **19** | **0** | Storage | `TroveManager` |
| `Troves` | `mapping(address => TroveManagerBase.Trove)` | **20** | **0** | Storage | `TroveManager` |
| `totalStakes` | `mapping(address => uint256)` | **21** | **0** | Storage | `TroveManager` |
| `totalStakesSnapshot` | `mapping(address => uint256)` | **22** | **0** | Storage | `TroveManager` |
| `totalCollateralSnapshot` | `mapping(address => uint256)` | **23** | **0** | Storage | `TroveManager` |
| `L_Coll` | `mapping(address => uint256)` | **24** | **0** | Storage | `TroveManager` |
| `L_YUSDDebt` | `mapping(address => uint256)` | **25** | **0** | Storage | `TroveManager` |
| `rewardSnapshots` | `mapping(address => TroveManager.RewardSnapshot)` | **26** | **0** | Storage | `TroveManager` |
| `TroveOwners` | `address[]` | **27** | **0** | Storage | `TroveManager` |
| `lastCollError_Redistribution` | `mapping(address => uint256)` | **28** | **0** | Storage | `TroveManager` |
| `lastYUSDDebtError_Redistribution` | `mapping(address => uint256)` | **29** | **0** | Storage | `TroveManager` |

---

## Contract: DefaultPool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `IWhitelist` | **1** | **0** | Storage | `YetiCustomBase` |
| `troveManagerAddress` | `address` | **2** | **0** | Storage | `DefaultPool` |
| `activePoolAddress` | `address` | **3** | **0** | Storage | `DefaultPool` |
| `whitelistAddress` | `address` | **4** | **0** | Storage | `DefaultPool` |
| `yetiFinanceTreasury` | `address` | **5** | **0** | Storage | `DefaultPool` |
| `poolColl` | `YetiCustomBase.newColls` | **6** | **0** | Storage | `DefaultPool` |
| `YUSDDebt` | `uint256` | **8** | **0** | Storage | `DefaultPool` |

---

## Contract: YUSDToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_totalSupply` | `uint256` | **0** | **0** | Storage | `YUSDToken` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `YUSDToken` |
| `_balances` | `mapping(address => uint256)` | **2** | **0** | Storage | `YUSDToken` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **3** | **0** | Storage | `YUSDToken` |

---

## Contract: TroveManagerRedemptions
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `borrowerOperationsAddress` | `address` | **4** | **0** | Storage | `TroveManagerRedemptions` |
| `stabilityPoolContract` | `IStabilityPool` | **5** | **0** | Storage | `TroveManagerRedemptions` |
| `troveManager` | `ITroveManager` | **6** | **0** | Storage | `TroveManagerRedemptions` |
| `yusdTokenContract` | `IYUSDToken` | **7** | **0** | Storage | `TroveManagerRedemptions` |
| `yetiTokenContract` | `IYETIToken` | **8** | **0** | Storage | `TroveManagerRedemptions` |
| `sYETIContract` | `ISYETI` | **9** | **0** | Storage | `TroveManagerRedemptions` |
| `troveManagerRedemptions` | `ITroveManagerRedemptions` | **10** | **0** | Storage | `TroveManagerRedemptions` |
| `gasPoolAddress` | `address` | **11** | **0** | Storage | `TroveManagerRedemptions` |
| `sortedTroves` | `ISortedTroves` | **12** | **0** | Storage | `TroveManagerRedemptions` |
| `collSurplusPool` | `ICollSurplusPool` | **13** | **0** | Storage | `TroveManagerRedemptions` |

---

## Contract: CollSurplusPool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `IWhitelist` | **1** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **2** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **3** | **0** | Storage | `LiquityBase` |
| `borrowerOperationsAddress` | `address` | **4** | **0** | Storage | `CollSurplusPool` |
| `troveManagerAddress` | `address` | **5** | **0** | Storage | `CollSurplusPool` |
| `troveManagerRedemptionsAddress` | `address` | **6** | **0** | Storage | `CollSurplusPool` |
| `activePoolAddress` | `address` | **7** | **0** | Storage | `CollSurplusPool` |
| `poolColl` | `YetiCustomBase.newColls` | **8** | **0** | Storage | `CollSurplusPool` |
| `balances` | `mapping(address => YetiCustomBase.newColls)` | **10** | **0** | Storage | `CollSurplusPool` |

---

## Contract: TroveManagerLiquidations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `borrowerOperationsAddress` | `address` | **4** | **0** | Storage | `TroveManagerLiquidations` |
| `stabilityPoolContract` | `IStabilityPool` | **5** | **0** | Storage | `TroveManagerLiquidations` |
| `troveManager` | `ITroveManager` | **6** | **0** | Storage | `TroveManagerLiquidations` |
| `yusdTokenContract` | `IYUSDToken` | **7** | **0** | Storage | `TroveManagerLiquidations` |
| `yetiTokenContract` | `IYETIToken` | **8** | **0** | Storage | `TroveManagerLiquidations` |
| `sYETIContract` | `ISYETI` | **9** | **0** | Storage | `TroveManagerLiquidations` |
| `troveManagerLiquidations` | `ITroveManagerLiquidations` | **10** | **0** | Storage | `TroveManagerLiquidations` |
| `gasPoolAddress` | `address` | **11** | **0** | Storage | `TroveManagerLiquidations` |
| `troveManagerAddress` | `address` | **12** | **0** | Storage | `TroveManagerLiquidations` |
| `sortedTroves` | `ISortedTroves` | **13** | **0** | Storage | `TroveManagerLiquidations` |
| `collSurplusPool` | `ICollSurplusPool` | **14** | **0** | Storage | `TroveManagerLiquidations` |
| `yetiFinanceTreasury` | `address` | **15** | **0** | Storage | `TroveManagerLiquidations` |

---

## Contract: SortedTroves
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `borrowerOperationsAddress` | `address` | **1** | **0** | Storage | `SortedTroves` |
| `troveManagerRedemptionsAddress` | `address` | **2** | **0** | Storage | `SortedTroves` |
| `troveManagerAddress` | `address` | **3** | **0** | Storage | `SortedTroves` |
| `data` | `SortedTroves.Data` | **4** | **0** | Storage | `SortedTroves` |

---

## Contract: PriceFeed
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `priceAggregator` | `AggregatorV3Interface` | **1** | **0** | Storage | `PriceFeed` |
| `tellorCaller` | `ITellorCaller` | **2** | **0** | Storage | `PriceFeed` |
| `borrowerOperationsAddress` | `address` | **3** | **0** | Storage | `PriceFeed` |
| `troveManagerAddress` | `address` | **4** | **0** | Storage | `PriceFeed` |
| `lastGoodPrice` | `uint256` | **5** | **0** | Storage | `PriceFeed` |
| `status` | `PriceFeed.Status` | **6** | **0** | Storage | `PriceFeed` |

---

## Contract: TeamAllocation
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `YETI` | `IERC20` | **0** | **0** | Storage | `TeamAllocation` |
| `teamWallet` | `address` | **1** | **0** | Storage | `TeamAllocation` |
| `team` | `address[7]` | **2** | **0** | Storage | `TeamAllocation` |
| `allocations` | `uint256[7]` | **7** | **0** | Storage | `TeamAllocation` |
| `allocationClaimed` | `bool` | **14** | **0** | Storage | `TeamAllocation` |
| `yetiSet` | `bool` | **14** | **1** | Storage | `TeamAllocation` |
| `_94_5_thousand` | `uint256` | **15** | **0** | Storage | `TeamAllocation` |

---

## Contract: Whitelist
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `Whitelist` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `Whitelist` |
| `stabilityPool` | `IStabilityPool` | **3** | **0** | Storage | `Whitelist` |
| `collSurplusPool` | `ICollSurplusPool` | **4** | **0** | Storage | `Whitelist` |
| `borrowerOperationsAddress` | `address` | **5** | **0** | Storage | `Whitelist` |
| `addressesSet` | `bool` | **5** | **20** | Storage | `Whitelist` |
| `collateralParams` | `mapping(address => Whitelist.CollateralParams)` | **6** | **0** | Storage | `Whitelist` |
| `validRouter` | `mapping(address => bool)` | **7** | **0** | Storage | `Whitelist` |
| `validCollateral` | `address[]` | **8** | **0** | Storage | `Whitelist` |

---

## Contract: MultiTroveGetter
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `troveManager` | `TroveManager` | **0** | **0** | Storage | `MultiTroveGetter` |
| `sortedTroves` | `ISortedTroves` | **1** | **0** | Storage | `MultiTroveGetter` |
| `whitelist` | `IWhitelist` | **2** | **0** | Storage | `MultiTroveGetter` |

---

## Contract: Migrations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Migrations` |
| `last_completed_migration` | `uint256` | **1** | **0** | Storage | `Migrations` |

---

## Contract: ActivePool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `IWhitelist` | **1** | **0** | Storage | `YetiCustomBase` |
| `borrowerOperationsAddress` | `address` | **2** | **0** | Storage | `ActivePool` |
| `troveManagerAddress` | `address` | **3** | **0** | Storage | `ActivePool` |
| `stabilityPoolAddress` | `address` | **4** | **0** | Storage | `ActivePool` |
| `defaultPoolAddress` | `address` | **5** | **0** | Storage | `ActivePool` |
| `troveManagerLiquidationsAddress` | `address` | **6** | **0** | Storage | `ActivePool` |
| `troveManagerRedemptionsAddress` | `address` | **7** | **0** | Storage | `ActivePool` |
| `collSurplusPoolAddress` | `address` | **8** | **0** | Storage | `ActivePool` |
| `poolColl` | `YetiCustomBase.newColls` | **9** | **0** | Storage | `ActivePool` |
| `YUSDDebt` | `uint256` | **11** | **0** | Storage | `ActivePool` |

---

## Contract: HintHelpers
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `sortedTroves` | `ISortedTroves` | **4** | **0** | Storage | `HintHelpers` |
| `troveManager` | `ITroveManager` | **5** | **0** | Storage | `HintHelpers` |

---

## Contract: StabilityPool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `troveManagerLiquidationsAddress` | `address` | **4** | **0** | Storage | `StabilityPool` |
| `whitelistAddress` | `address` | **5** | **0** | Storage | `StabilityPool` |
| `borrowerOperations` | `IBorrowerOperations` | **6** | **0** | Storage | `StabilityPool` |
| `troveManager` | `ITroveManager` | **7** | **0** | Storage | `StabilityPool` |
| `yusdToken` | `IYUSDToken` | **8** | **0** | Storage | `StabilityPool` |
| `communityIssuance` | `ICommunityIssuance` | **9** | **0** | Storage | `StabilityPool` |
| `sortedTroves` | `ISortedTroves` | **10** | **0** | Storage | `StabilityPool` |
| `totalYUSDDeposits` | `uint256` | **11** | **0** | Storage | `StabilityPool` |
| `totalColl` | `YetiCustomBase.newColls` | **12** | **0** | Storage | `StabilityPool` |
| `deposits` | `mapping(address => StabilityPool.Deposit)` | **14** | **0** | Storage | `StabilityPool` |
| `depositSnapshots` | `mapping(address => StabilityPool.Snapshots)` | **15** | **0** | Storage | `StabilityPool` |
| `frontEnds` | `mapping(address => StabilityPool.FrontEnd)` | **16** | **0** | Storage | `StabilityPool` |
| `frontEndStakes` | `mapping(address => uint256)` | **17** | **0** | Storage | `StabilityPool` |
| `frontEndSnapshots` | `mapping(address => StabilityPool.Snapshots)` | **18** | **0** | Storage | `StabilityPool` |
| `P` | `uint256` | **19** | **0** | Storage | `StabilityPool` |
| `currentScale` | `uint128` | **20** | **0** | Storage | `StabilityPool` |
| `currentEpoch` | `uint128` | **20** | **16** | Storage | `StabilityPool` |
| `epochToScaleToSum` | `mapping(address => mapping(uint128 => mapping(uint128 => uint256)))` | **21** | **0** | Storage | `StabilityPool` |
| `epochToScaleToG` | `mapping(uint128 => mapping(uint128 => uint256))` | **22** | **0** | Storage | `StabilityPool` |
| `lastYETIError` | `uint256` | **23** | **0** | Storage | `StabilityPool` |
| `lastAssetError_Offset` | `uint256[]` | **24** | **0** | Storage | `StabilityPool` |
| `lastYUSDLossError_Offset` | `uint256` | **25** | **0** | Storage | `StabilityPool` |

---

## Contract: ShortLockupContract
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `unlockTime` | `uint256` | **0** | **0** | Storage | `ShortLockupContract` |

---

## Contract: YETIToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `YETIToken` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `YETIToken` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `YETIToken` |
| `_nonces` | `mapping(address => uint256)` | **3** | **0** | Storage | `YETIToken` |
| `_1_MILLION` | `uint256` | **4** | **0** | Storage | `YETIToken` |

---

## Contract: TeamLockup
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `multisig` | `address` | **0** | **0** | Storage | `TeamLockup` |
| `YETI` | `IERC20` | **1** | **0** | Storage | `TeamLockup` |
| `totalClaimed` | `uint256` | **2** | **0** | Storage | `TeamLockup` |

---

## Contract: LockupContract
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `unlockTime` | `uint256` | **0** | **0** | Storage | `LockupContract` |

---

## Contract: LockupContractFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `yetiTokenAddress` | `address` | **1** | **0** | Storage | `LockupContractFactory` |
| `lockupContractToDeployer` | `mapping(address => address)` | **2** | **0** | Storage | `LockupContractFactory` |

---

## Contract: ERC20Data
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `balanceOf` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20Data` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20Data` |
| `nonces` | `mapping(address => uint256)` | **2** | **0** | Storage | `ERC20Data` |

---

## Contract: ERC20WithSupply
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `balanceOf` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `nonces` | `mapping(address => uint256)` | **2** | **0** | Storage | `ERC20` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20WithSupply` |

---

## Contract: sYETIToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `BoringOwnableData` |
| `pendingOwner` | `address` | **1** | **0** | Storage | `BoringOwnableData` |
| `totalSupply` | `uint256` | **2** | **0** | Storage | `sYETIToken` |
| `effectiveYetiTokenBalance` | `uint256` | **3** | **0** | Storage | `sYETIToken` |
| `lastBuybackTime` | `uint256` | **4** | **0** | Storage | `sYETIToken` |
| `lastBuybackPrice` | `uint256` | **5** | **0** | Storage | `sYETIToken` |
| `lastRebaseTime` | `uint256` | **6** | **0** | Storage | `sYETIToken` |
| `transferRatio` | `uint256` | **7** | **0** | Storage | `sYETIToken` |
| `yetiToken` | `IYETIToken` | **8** | **0** | Storage | `sYETIToken` |
| `yusdToken` | `IERC20` | **9** | **0** | Storage | `sYETIToken` |
| `addressesSet` | `bool` | **9** | **20** | Storage | `sYETIToken` |
| `validRouters` | `mapping(address => bool)` | **10** | **0** | Storage | `sYETIToken` |
| `users` | `mapping(address => sYETIToken.User)` | **11** | **0** | Storage | `sYETIToken` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **12** | **0** | Storage | `sYETIToken` |
| `nonces` | `mapping(address => uint256)` | **13** | **0** | Storage | `sYETIToken` |

---

## Contract: CommunityIssuance
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `yetiToken` | `IYETIToken` | **1** | **0** | Storage | `CommunityIssuance` |
| `stabilityPoolAddress` | `address` | **2** | **0** | Storage | `CommunityIssuance` |
| `totalYETIIssued` | `uint256` | **3** | **0** | Storage | `CommunityIssuance` |

---

## Contract: dummyUniV2Router
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `BoringOwnableData` |
| `pendingOwner` | `address` | **1** | **0** | Storage | `BoringOwnableData` |
| `JOERouter` | `IRouter` | **2** | **0** | Storage | `dummyUniV2Router` |
| `JOERouterAddress` | `address` | **3** | **0** | Storage | `dummyUniV2Router` |
| `path` | `address[]` | **4** | **0** | Storage | `dummyUniV2Router` |
| `yusdToken` | `IERC20` | **5** | **0** | Storage | `dummyUniV2Router` |
| `yetiToken` | `IERC20` | **6** | **0** | Storage | `dummyUniV2Router` |

---

## Contract: BoringOwnable
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `BoringOwnableData` |
| `pendingOwner` | `address` | **1** | **0** | Storage | `BoringOwnableData` |

---

## Contract: YetiCustomBase
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |

---

## Contract: TroveManagerBase
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |

---

## Contract: ReentrancyGuard
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_status` | `uint256` | **0** | **0** | Storage | `ReentrancyGuard` |

---

## Contract: Ownable
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |

---

## Contract: LiquityBase
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |

---

## Contract: TellorCaller
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `tellor` | `ITellor` | **0** | **0** | Storage | `TellorCaller` |

---

## Contract: WJLP
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_symbol` | `string` | **0** | **0** | Storage | `ERC20_8` |
| `_name` | `string` | **1** | **0** | Storage | `ERC20_8` |
| `_decimals` | `uint8` | **2** | **0** | Storage | `ERC20_8` |
| `_totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20_8` |
| `balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC20_8` |
| `allowed` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `ERC20_8` |
| `_poolPid` | `uint256` | **6** | **0** | Storage | `WJLP` |
| `activePool` | `address` | **7** | **0** | Storage | `WJLP` |
| `TML` | `address` | **8** | **0** | Storage | `WJLP` |
| `TMR` | `address` | **9** | **0** | Storage | `WJLP` |
| `defaultPool` | `address` | **10** | **0** | Storage | `WJLP` |
| `stabilityPool` | `address` | **11** | **0** | Storage | `WJLP` |
| `YetiFinanceTreasury` | `address` | **12** | **0** | Storage | `WJLP` |
| `borrowerOperations` | `address` | **13** | **0** | Storage | `WJLP` |
| `collSurplusPool` | `address` | **14** | **0** | Storage | `WJLP` |
| `addressesSet` | `bool` | **14** | **20** | Storage | `WJLP` |
| `userInfo` | `mapping(address => WJLP.UserInfo)` | **15** | **0** | Storage | `WJLP` |

---

## Contract: WBQI
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_symbol` | `string` | **0** | **0** | Storage | `ERC20_8` |
| `_name` | `string` | **1** | **0** | Storage | `ERC20_8` |
| `_decimals` | `uint8` | **2** | **0** | Storage | `ERC20_8` |
| `_totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20_8` |
| `balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC20_8` |
| `allowed` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `ERC20_8` |
| `Qtoken` | `IERC20` | **6** | **0** | Storage | `WBQI` |
| `QI` | `IERC20` | **7** | **0** | Storage | `WBQI` |
| `qiTokens` | `address[]` | **8** | **0** | Storage | `WBQI` |
| `_Comptroller` | `IComptroller` | **9** | **0** | Storage | `WBQI` |
| `lock` | `bool` | **9** | **20** | Storage | `WBQI` |
| `activePool` | `address` | **10** | **0** | Storage | `WBQI` |
| `TML` | `address` | **11** | **0** | Storage | `WBQI` |
| `TMR` | `address` | **12** | **0** | Storage | `WBQI` |
| `defaultPool` | `address` | **13** | **0** | Storage | `WBQI` |
| `stabilityPool` | `address` | **14** | **0** | Storage | `WBQI` |
| `YetiFinanceTreasury` | `address` | **15** | **0** | Storage | `WBQI` |
| `SHAREOFFSET` | `uint256` | **16** | **0** | Storage | `WBQI` |
| `addressesSet` | `bool` | **17** | **0** | Storage | `WBQI` |
| `userInfo` | `mapping(address => WBQI.UserInfo)` | **18** | **0** | Storage | `WBQI` |
| `globalAVAXRewardPending` | `uint256` | **19** | **0** | Storage | `WBQI` |
| `globalQIRewardPending` | `uint256` | **20** | **0** | Storage | `WBQI` |

---

## Contract: WAAVE
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_symbol` | `string` | **0** | **0** | Storage | `ERC20_8` |
| `_name` | `string` | **1** | **0** | Storage | `ERC20_8` |
| `_decimals` | `uint8` | **2** | **0** | Storage | `ERC20_8` |
| `_totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20_8` |
| `balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC20_8` |
| `allowed` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `ERC20_8` |
| `aToken` | `IERC20` | **6** | **0** | Storage | `WAAVE` |
| `activePool` | `address` | **7** | **0** | Storage | `WAAVE` |
| `TML` | `address` | **8** | **0** | Storage | `WAAVE` |
| `TMR` | `address` | **9** | **0** | Storage | `WAAVE` |
| `defaultPool` | `address` | **10** | **0** | Storage | `WAAVE` |
| `stabilityPool` | `address` | **11** | **0** | Storage | `WAAVE` |
| `YetiFinanceTreasury` | `address` | **12** | **0** | Storage | `WAAVE` |
| `SHAREOFFSET` | `uint256` | **13** | **0** | Storage | `WAAVE` |
| `addressesSet` | `bool` | **14** | **0** | Storage | `WAAVE` |
| `userInfo` | `mapping(address => WAAVE.UserInfo)` | **15** | **0** | Storage | `WAAVE` |

---

## Contract: ERC20_8
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_symbol` | `string` | **0** | **0** | Storage | `ERC20_8` |
| `_name` | `string` | **1** | **0** | Storage | `ERC20_8` |
| `_decimals` | `uint8` | **2** | **0** | Storage | `ERC20_8` |
| `_totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20_8` |
| `balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC20_8` |
| `allowed` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `ERC20_8` |

---

## Contract: UniswapV2LPTokenPriceFeed
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `base` | `IBaseOracle` | **1** | **0** | Storage | `UniswapV2LPTokenPriceFeed` |
| `pair` | `address` | **2** | **0** | Storage | `UniswapV2LPTokenPriceFeed` |

---

## Contract: BQIOracle
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `base` | `IBaseOracle` | **1** | **0** | Storage | `BQIOracle` |
| `underlying` | `address` | **2** | **0** | Storage | `BQIOracle` |
| `BQI` | `IQIToken` | **3** | **0** | Storage | `BQIOracle` |

---

## Contract: AAVEOracle
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `base` | `IBaseOracle` | **1** | **0** | Storage | `AAVEOracle` |
| `underlying` | `address` | **2** | **0** | Storage | `AAVEOracle` |
| `WAAVE` | `IWAAVE` | **3** | **0** | Storage | `AAVEOracle` |

---

## Contract: ERC20Router
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `activePoolAddress` | `address` | **0** | **0** | Storage | `ERC20Router` |
| `traderJoeRouter` | `address` | **1** | **0** | Storage | `ERC20Router` |
| `yusdTokenAddress` | `address` | **2** | **0** | Storage | `ERC20Router` |
| `name` | `string` | **3** | **0** | Storage | `ERC20Router` |

---

## Contract: WJLPRouter
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `activePoolAddress` | `address` | **0** | **0** | Storage | `WJLPRouter` |
| `JLPAddress` | `address` | **1** | **0** | Storage | `WJLPRouter` |
| `WJLPAddress` | `address` | **2** | **0** | Storage | `WJLPRouter` |
| `joeZapper` | `IJoeZapper` | **3** | **0** | Storage | `WJLPRouter` |
| `WJLP` | `IWAsset` | **4** | **0** | Storage | `WJLPRouter` |
| `yusdTokenAddress` | `address` | **5** | **0** | Storage | `WJLPRouter` |

---

## Contract: Unipool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `uniToken` | `IERC20` | **0** | **0** | Storage | `LPTokenWrapper` |
| `_totalSupply` | `uint256` | **1** | **0** | Storage | `LPTokenWrapper` |
| `_balances` | `mapping(address => uint256)` | **2** | **0** | Storage | `LPTokenWrapper` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `duration` | `uint256` | **4** | **0** | Storage | `Unipool` |
| `yetiToken` | `IYETIToken` | **5** | **0** | Storage | `Unipool` |
| `periodFinish` | `uint256` | **6** | **0** | Storage | `Unipool` |
| `rewardRate` | `uint256` | **7** | **0** | Storage | `Unipool` |
| `lastUpdateTime` | `uint256` | **8** | **0** | Storage | `Unipool` |
| `rewardPerTokenStored` | `uint256` | **9** | **0** | Storage | `Unipool` |
| `userRewardPerTokenPaid` | `mapping(address => uint256)` | **10** | **0** | Storage | `Unipool` |
| `rewards` | `mapping(address => uint256)` | **11** | **0** | Storage | `Unipool` |

---

## Contract: Pool2Unipool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `uniToken` | `IERC20` | **0** | **0** | Storage | `LPTokenWrapper` |
| `_totalSupply` | `uint256` | **1** | **0** | Storage | `LPTokenWrapper` |
| `_balances` | `mapping(address => uint256)` | **2** | **0** | Storage | `LPTokenWrapper` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `duration` | `uint256` | **4** | **0** | Storage | `Pool2Unipool` |
| `yetiToken` | `IYETIToken` | **5** | **0** | Storage | `Pool2Unipool` |
| `periodFinish` | `uint256` | **6** | **0** | Storage | `Pool2Unipool` |
| `rewardRate` | `uint256` | **7** | **0** | Storage | `Pool2Unipool` |
| `lastUpdateTime` | `uint256` | **8** | **0** | Storage | `Pool2Unipool` |
| `rewardPerTokenStored` | `uint256` | **9** | **0** | Storage | `Pool2Unipool` |
| `userRewardPerTokenPaid` | `mapping(address => uint256)` | **10** | **0** | Storage | `Pool2Unipool` |
| `rewards` | `mapping(address => uint256)` | **11** | **0** | Storage | `Pool2Unipool` |

---

## Contract: ERC20Mock
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `ERC20` |

---

## Contract: StabilityPoolTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `troveManagerLiquidationsAddress` | `address` | **4** | **0** | Storage | `StabilityPool` |
| `whitelistAddress` | `address` | **5** | **0** | Storage | `StabilityPool` |
| `borrowerOperations` | `IBorrowerOperations` | **6** | **0** | Storage | `StabilityPool` |
| `troveManager` | `ITroveManager` | **7** | **0** | Storage | `StabilityPool` |
| `yusdToken` | `IYUSDToken` | **8** | **0** | Storage | `StabilityPool` |
| `communityIssuance` | `ICommunityIssuance` | **9** | **0** | Storage | `StabilityPool` |
| `sortedTroves` | `ISortedTroves` | **10** | **0** | Storage | `StabilityPool` |
| `totalYUSDDeposits` | `uint256` | **11** | **0** | Storage | `StabilityPool` |
| `totalColl` | `YetiCustomBase.newColls` | **12** | **0** | Storage | `StabilityPool` |
| `deposits` | `mapping(address => StabilityPool.Deposit)` | **14** | **0** | Storage | `StabilityPool` |
| `depositSnapshots` | `mapping(address => StabilityPool.Snapshots)` | **15** | **0** | Storage | `StabilityPool` |
| `frontEnds` | `mapping(address => StabilityPool.FrontEnd)` | **16** | **0** | Storage | `StabilityPool` |
| `frontEndStakes` | `mapping(address => uint256)` | **17** | **0** | Storage | `StabilityPool` |
| `frontEndSnapshots` | `mapping(address => StabilityPool.Snapshots)` | **18** | **0** | Storage | `StabilityPool` |
| `P` | `uint256` | **19** | **0** | Storage | `StabilityPool` |
| `currentScale` | `uint128` | **20** | **0** | Storage | `StabilityPool` |
| `currentEpoch` | `uint128` | **20** | **16** | Storage | `StabilityPool` |
| `epochToScaleToSum` | `mapping(address => mapping(uint128 => mapping(uint128 => uint256)))` | **21** | **0** | Storage | `StabilityPool` |
| `epochToScaleToG` | `mapping(uint128 => mapping(uint128 => uint256))` | **22** | **0** | Storage | `StabilityPool` |
| `lastYETIError` | `uint256` | **23** | **0** | Storage | `StabilityPool` |
| `lastAssetError_Offset` | `uint256[]` | **24** | **0** | Storage | `StabilityPool` |
| `lastYUSDLossError_Offset` | `uint256` | **25** | **0** | Storage | `StabilityPool` |

---

## Contract: DefaultPoolTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `IWhitelist` | **1** | **0** | Storage | `YetiCustomBase` |
| `troveManagerAddress` | `address` | **2** | **0** | Storage | `DefaultPool` |
| `activePoolAddress` | `address` | **3** | **0** | Storage | `DefaultPool` |
| `whitelistAddress` | `address` | **4** | **0** | Storage | `DefaultPool` |
| `yetiFinanceTreasury` | `address` | **5** | **0** | Storage | `DefaultPool` |
| `poolColl` | `YetiCustomBase.newColls` | **6** | **0** | Storage | `DefaultPool` |
| `YUSDDebt` | `uint256` | **8** | **0** | Storage | `DefaultPool` |

---

## Contract: BorrowerOperationsTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **4** | **0** | Storage | `ReentrancyGuard` |
| `troveManager` | `ITroveManager` | **5** | **0** | Storage | `BorrowerOperations` |
| `stabilityPoolAddress` | `address` | **6** | **0** | Storage | `BorrowerOperations` |
| `gasPoolAddress` | `address` | **7** | **0** | Storage | `BorrowerOperations` |
| `collSurplusPool` | `ICollSurplusPool` | **8** | **0** | Storage | `BorrowerOperations` |
| `sYETI` | `ISYETI` | **9** | **0** | Storage | `BorrowerOperations` |
| `sYETIAddress` | `address` | **10** | **0** | Storage | `BorrowerOperations` |
| `yusdToken` | `IYUSDToken` | **11** | **0** | Storage | `BorrowerOperations` |
| `deploymentTime` | `uint256` | **12** | **0** | Storage | `BorrowerOperations` |
| `sortedTroves` | `ISortedTroves` | **13** | **0** | Storage | `BorrowerOperations` |

---

## Contract: MockAggregator
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `decimalsVal` | `uint8` | **0** | **0** | Storage | `MockAggregator` |
| `price` | `int256` | **1** | **0** | Storage | `MockAggregator` |
| `prevPrice` | `int256` | **2** | **0** | Storage | `MockAggregator` |
| `updateTime` | `uint256` | **3** | **0** | Storage | `MockAggregator` |
| `prevUpdateTime` | `uint256` | **4** | **0** | Storage | `MockAggregator` |
| `latestRoundId` | `uint80` | **5** | **0** | Storage | `MockAggregator` |
| `prevRoundId` | `uint80` | **5** | **10** | Storage | `MockAggregator` |
| `latestRevert` | `bool` | **5** | **20** | Storage | `MockAggregator` |
| `prevRevert` | `bool` | **5** | **21** | Storage | `MockAggregator` |
| `decimalsRevert` | `bool` | **5** | **22** | Storage | `MockAggregator` |

---

## Contract: FunctionCaller
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `troveManager` | `ITroveManager` | **0** | **0** | Storage | `FunctionCaller` |
| `troveManagerAddress` | `address` | **1** | **0** | Storage | `FunctionCaller` |
| `sortedTroves` | `ISortedTroves` | **2** | **0** | Storage | `FunctionCaller` |
| `sortedTrovesAddress` | `address` | **3** | **0** | Storage | `FunctionCaller` |
| `priceFeed` | `IPriceFeed` | **4** | **0** | Storage | `FunctionCaller` |
| `priceFeedAddress` | `address` | **5** | **0** | Storage | `FunctionCaller` |

---

## Contract: PriceFeedTestnet
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_price` | `uint256` | **0** | **0** | Storage | `PriceFeedTestnet` |

---

## Contract: MockTellor
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `didRetrieve` | `bool` | **0** | **0** | Storage | `MockTellor` |
| `price` | `uint256` | **1** | **0** | Storage | `MockTellor` |
| `updateTime` | `uint256` | **2** | **0** | Storage | `MockTellor` |
| `revertRequest` | `bool` | **3** | **0** | Storage | `MockTellor` |

---

## Contract: CommunityIssuanceTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `yetiToken` | `IYETIToken` | **1** | **0** | Storage | `CommunityIssuance` |
| `stabilityPoolAddress` | `address` | **2** | **0** | Storage | `CommunityIssuance` |
| `totalYETIIssued` | `uint256` | **3** | **0** | Storage | `CommunityIssuance` |

---

## Contract: EchidnaProxy
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `troveManager` | `TroveManager` | **0** | **0** | Storage | `EchidnaProxy` |
| `borrowerOperations` | `BorrowerOperations` | **1** | **0** | Storage | `EchidnaProxy` |
| `stabilityPool` | `StabilityPool` | **2** | **0** | Storage | `EchidnaProxy` |
| `yusdToken` | `YUSDToken` | **3** | **0** | Storage | `EchidnaProxy` |

---

## Contract: EchidnaTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `MCR` | `uint256` | **0** | **0** | Storage | `EchidnaTester` |
| `CCR` | `uint256` | **1** | **0** | Storage | `EchidnaTester` |
| `YUSD_GAS_COMPENSATION` | `uint256` | **2** | **0** | Storage | `EchidnaTester` |
| `troveManager` | `TroveManager` | **3** | **0** | Storage | `EchidnaTester` |
| `troveManagerLiquidations` | `TroveManagerLiquidations` | **4** | **0** | Storage | `EchidnaTester` |
| `troveManagerRedemptions` | `TroveManagerRedemptions` | **5** | **0** | Storage | `EchidnaTester` |
| `borrowerOperations` | `BorrowerOperations` | **6** | **0** | Storage | `EchidnaTester` |
| `activePool` | `ActivePool` | **7** | **0** | Storage | `EchidnaTester` |
| `defaultPool` | `DefaultPool` | **8** | **0** | Storage | `EchidnaTester` |
| `stabilityPool` | `StabilityPool` | **9** | **0** | Storage | `EchidnaTester` |
| `gasPool` | `GasPool` | **10** | **0** | Storage | `EchidnaTester` |
| `collSurplusPool` | `CollSurplusPool` | **11** | **0** | Storage | `EchidnaTester` |
| `yusdToken` | `YUSDToken` | **12** | **0** | Storage | `EchidnaTester` |
| `priceFeedTestnet` | `PriceFeedTestnet` | **13** | **0** | Storage | `EchidnaTester` |
| `sortedTroves` | `SortedTroves` | **14** | **0** | Storage | `EchidnaTester` |
| `whitelist` | `Whitelist` | **15** | **0** | Storage | `EchidnaTester` |
| `echidnaProxies` | `EchidnaProxy[100]` | **16** | **0** | Storage | `EchidnaTester` |
| `numberOfTroves` | `uint256` | **79** | **0** | Storage | `EchidnaTester` |

---

## Contract: YUSDTokenTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_totalSupply` | `uint256` | **0** | **0** | Storage | `YUSDToken` |
| `_nonces` | `mapping(address => uint256)` | **1** | **0** | Storage | `YUSDToken` |
| `_balances` | `mapping(address => uint256)` | **2** | **0** | Storage | `YUSDToken` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **3** | **0** | Storage | `YUSDToken` |

---

## Contract: NonPayable
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `isPayable` | `bool` | **0** | **0** | Storage | `NonPayable` |

---

## Contract: LiquityBaseTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |

---

## Contract: SortedTrovesTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `borrowerOperationsAddress` | `address` | **1** | **0** | Storage | `SortedTroves` |
| `troveManagerRedemptionsAddress` | `address` | **2** | **0** | Storage | `SortedTroves` |
| `troveManagerAddress` | `address` | **3** | **0** | Storage | `SortedTroves` |
| `data` | `SortedTroves.Data` | **4** | **0** | Storage | `SortedTroves` |

---

## Contract: TroveManagerTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **4** | **0** | Storage | `ReentrancyGuard` |
| `borrowerOperationsAddress` | `address` | **5** | **0** | Storage | `TroveManager` |
| `stabilityPoolContract` | `IStabilityPool` | **6** | **0** | Storage | `TroveManager` |
| `troveManager` | `ITroveManager` | **7** | **0** | Storage | `TroveManager` |
| `yusdTokenContract` | `IYUSDToken` | **8** | **0** | Storage | `TroveManager` |
| `yetiTokenContract` | `IYETIToken` | **9** | **0** | Storage | `TroveManager` |
| `sYETIContract` | `ISYETI` | **10** | **0** | Storage | `TroveManager` |
| `troveManagerRedemptions` | `ITroveManagerRedemptions` | **11** | **0** | Storage | `TroveManager` |
| `troveManagerLiquidations` | `ITroveManagerLiquidations` | **12** | **0** | Storage | `TroveManager` |
| `gasPoolAddress` | `address` | **13** | **0** | Storage | `TroveManager` |
| `troveManagerRedemptionsAddress` | `address` | **14** | **0** | Storage | `TroveManager` |
| `troveManagerLiquidationsAddress` | `address` | **15** | **0** | Storage | `TroveManager` |
| `sortedTroves` | `ISortedTroves` | **16** | **0** | Storage | `TroveManager` |
| `collSurplusPool` | `ICollSurplusPool` | **17** | **0** | Storage | `TroveManager` |
| `baseRate` | `uint256` | **18** | **0** | Storage | `TroveManager` |
| `lastFeeOperationTime` | `uint256` | **19** | **0** | Storage | `TroveManager` |
| `Troves` | `mapping(address => TroveManagerBase.Trove)` | **20** | **0** | Storage | `TroveManager` |
| `totalStakes` | `mapping(address => uint256)` | **21** | **0** | Storage | `TroveManager` |
| `totalStakesSnapshot` | `mapping(address => uint256)` | **22** | **0** | Storage | `TroveManager` |
| `totalCollateralSnapshot` | `mapping(address => uint256)` | **23** | **0** | Storage | `TroveManager` |
| `L_Coll` | `mapping(address => uint256)` | **24** | **0** | Storage | `TroveManager` |
| `L_YUSDDebt` | `mapping(address => uint256)` | **25** | **0** | Storage | `TroveManager` |
| `rewardSnapshots` | `mapping(address => TroveManager.RewardSnapshot)` | **26** | **0** | Storage | `TroveManager` |
| `TroveOwners` | `address[]` | **27** | **0** | Storage | `TroveManager` |
| `lastCollError_Redistribution` | `mapping(address => uint256)` | **28** | **0** | Storage | `TroveManager` |
| `lastYUSDDebtError_Redistribution` | `mapping(address => uint256)` | **29** | **0** | Storage | `TroveManager` |

---

## Contract: ActivePoolTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `IWhitelist` | **1** | **0** | Storage | `YetiCustomBase` |
| `borrowerOperationsAddress` | `address` | **2** | **0** | Storage | `ActivePool` |
| `troveManagerAddress` | `address` | **3** | **0** | Storage | `ActivePool` |
| `stabilityPoolAddress` | `address` | **4** | **0** | Storage | `ActivePool` |
| `defaultPoolAddress` | `address` | **5** | **0** | Storage | `ActivePool` |
| `troveManagerLiquidationsAddress` | `address` | **6** | **0** | Storage | `ActivePool` |
| `troveManagerRedemptionsAddress` | `address` | **7** | **0** | Storage | `ActivePool` |
| `collSurplusPoolAddress` | `address` | **8** | **0** | Storage | `ActivePool` |
| `poolColl` | `YetiCustomBase.newColls` | **9** | **0** | Storage | `ActivePool` |
| `YUSDDebt` | `uint256` | **11** | **0** | Storage | `ActivePool` |

---

## Contract: YETITokenTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `YETIToken` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `YETIToken` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `YETIToken` |
| `_nonces` | `mapping(address => uint256)` | **3** | **0** | Storage | `YETIToken` |
| `_1_MILLION` | `uint256` | **4** | **0** | Storage | `YETIToken` |

---

## Contract: SortedTrovesBOTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `whitelist` | `IWhitelist` | **0** | **0** | Storage | `YetiCustomBase` |
| `activePool` | `IActivePool` | **1** | **0** | Storage | `LiquityBase` |
| `defaultPool` | `IDefaultPool` | **2** | **0** | Storage | `LiquityBase` |
| `_owner` | `address` | **3** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **4** | **0** | Storage | `ReentrancyGuard` |
| `troveManager` | `ITroveManager` | **5** | **0** | Storage | `BorrowerOperations` |
| `stabilityPoolAddress` | `address` | **6** | **0** | Storage | `BorrowerOperations` |
| `gasPoolAddress` | `address` | **7** | **0** | Storage | `BorrowerOperations` |
| `collSurplusPool` | `ICollSurplusPool` | **8** | **0** | Storage | `BorrowerOperations` |
| `sYETI` | `ISYETI` | **9** | **0** | Storage | `BorrowerOperations` |
| `sYETIAddress` | `address` | **10** | **0** | Storage | `BorrowerOperations` |
| `yusdToken` | `IYUSDToken` | **11** | **0** | Storage | `BorrowerOperations` |
| `deploymentTime` | `uint256` | **12** | **0** | Storage | `BorrowerOperations` |
| `sortedTroves` | `ISortedTroves` | **13** | **0** | Storage | `BorrowerOperations` |

---

## Contract: PriceFeedTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `priceAggregator` | `AggregatorV3Interface` | **1** | **0** | Storage | `PriceFeed` |
| `tellorCaller` | `ITellorCaller` | **2** | **0** | Storage | `PriceFeed` |
| `borrowerOperationsAddress` | `address` | **3** | **0** | Storage | `PriceFeed` |
| `troveManagerAddress` | `address` | **4** | **0** | Storage | `PriceFeed` |
| `lastGoodPrice` | `uint256` | **5** | **0** | Storage | `PriceFeed` |
| `status` | `PriceFeed.Status` | **6** | **0** | Storage | `PriceFeed` |

---

## Contract: YUSDTokenCaller
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `YUSD` | `IYUSDToken` | **0** | **0** | Storage | `YUSDTokenCaller` |

---

## Contract: sYETITokenTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `BoringOwnableData` |
| `pendingOwner` | `address` | **1** | **0** | Storage | `BoringOwnableData` |
| `totalSupply` | `uint256` | **2** | **0** | Storage | `sYETIToken` |
| `effectiveYetiTokenBalance` | `uint256` | **3** | **0** | Storage | `sYETIToken` |
| `lastBuybackTime` | `uint256` | **4** | **0** | Storage | `sYETIToken` |
| `lastBuybackPrice` | `uint256` | **5** | **0** | Storage | `sYETIToken` |
| `lastRebaseTime` | `uint256` | **6** | **0** | Storage | `sYETIToken` |
| `transferRatio` | `uint256` | **7** | **0** | Storage | `sYETIToken` |
| `yetiToken` | `IYETIToken` | **8** | **0** | Storage | `sYETIToken` |
| `yusdToken` | `IERC20` | **9** | **0** | Storage | `sYETIToken` |
| `addressesSet` | `bool` | **9** | **20** | Storage | `sYETIToken` |
| `validRouters` | `mapping(address => bool)` | **10** | **0** | Storage | `sYETIToken` |
| `users` | `mapping(address => sYETIToken.User)` | **11** | **0** | Storage | `sYETIToken` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **12** | **0** | Storage | `sYETIToken` |
| `nonces` | `mapping(address => uint256)` | **13** | **0** | Storage | `sYETIToken` |

---

## Contract: ERC20Token
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_symbol` | `string` | **0** | **0** | Storage | `ERC20Token` |
| `_name` | `string` | **1** | **0** | Storage | `ERC20Token` |
| `_decimals` | `uint8` | **2** | **0** | Storage | `ERC20Token` |
| `_totalSupply` | `uint256` | **3** | **0** | Storage | `ERC20Token` |
| `balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `ERC20Token` |
| `allowed` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `ERC20Token` |

---

## Contract: ThreePieceWiseLinearPriceCurve
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `name` | `string` | **1** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `m1` | `uint256` | **2** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `b1` | `uint256` | **3** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `cutoff1` | `uint256` | **4** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `m2` | `uint256` | **5** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `b2` | `uint256` | **6** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `b2Negative` | `bool` | **7** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `cutoff2` | `uint256` | **8** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `m3` | `uint256` | **9** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `b3` | `uint256` | **10** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `b3Negative` | `bool` | **11** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `decayTime` | `uint256` | **12** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `lastFeeTime` | `uint256` | **13** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `lastFeePercent` | `uint256` | **14** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `dollarCap` | `uint256` | **15** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `whitelistAddress` | `address` | **16** | **0** | Storage | `ThreePieceWiseLinearPriceCurve` |
| `addressesSet` | `bool` | **16** | **20** | Storage | `ThreePieceWiseLinearPriceCurve` |

---
