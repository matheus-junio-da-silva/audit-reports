# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: Migrations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Migrations` |
| `last_completed_migration` | `uint256` | **1** | **0** | Storage | `Migrations` |

---

## Contract: VaderRouter
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `reserve` | `IVaderReserve` | **1** | **0** | Storage | `VaderRouter` |

---

## Contract: SwapQueue
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `queue` | `mapping(uint256 => ISwapQueue.Queue)` | **0** | **0** | Storage | `SwapQueue` |

---

## Contract: BasePool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_name` | `string` | **0** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **1** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **2** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **3** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **4** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **5** | **0** | Storage | `ERC721` |
| `_owner` | `address` | **6** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **7** | **0** | Storage | `ReentrancyGuard` |
| `priceNativeCumulativeLast` | `uint256` | **8** | **0** | Storage | `BasePool` |
| `priceForeignCumulativeLast` | `uint256` | **9** | **0** | Storage | `BasePool` |
| `positions` | `mapping(uint256 => IBasePool.Position)` | **10** | **0** | Storage | `BasePool` |
| `positionId` | `uint256` | **11** | **0** | Storage | `BasePool` |
| `totalSupply` | `uint256` | **12** | **0** | Storage | `BasePool` |
| `_name` | `string` | **13** | **0** | Storage | `BasePool` |
| `_reserveNative` | `uint112` | **14** | **0** | Storage | `BasePool` |
| `_reserveForeign` | `uint112` | **14** | **14** | Storage | `BasePool` |
| `_blockTimestampLast` | `uint32` | **14** | **28** | Storage | `BasePool` |

---

## Contract: VaderPool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_name` | `string` | **0** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **1** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **2** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **3** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **4** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **5** | **0** | Storage | `ERC721` |
| `_owner` | `address` | **6** | **0** | Storage | `Ownable` |
| `_status` | `uint256` | **7** | **0** | Storage | `ReentrancyGuard` |
| `priceNativeCumulativeLast` | `uint256` | **8** | **0** | Storage | `BasePool` |
| `priceForeignCumulativeLast` | `uint256` | **9** | **0** | Storage | `BasePool` |
| `positions` | `mapping(uint256 => IBasePool.Position)` | **10** | **0** | Storage | `BasePool` |
| `positionId` | `uint256` | **11** | **0** | Storage | `BasePool` |
| `totalSupply` | `uint256` | **12** | **0** | Storage | `BasePool` |
| `_name` | `string` | **13** | **0** | Storage | `BasePool` |
| `_reserveNative` | `uint112` | **14** | **0** | Storage | `BasePool` |
| `_reserveForeign` | `uint112` | **14** | **14** | Storage | `BasePool` |
| `_blockTimestampLast` | `uint32` | **14** | **28** | Storage | `BasePool` |
| `queueActive` | `bool` | **15** | **0** | Storage | `VaderPool` |

---

## Contract: VaderPoolFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `queueActive` | `bool` | **0** | **20** | Storage | `VaderPoolFactory` |
| `nativeAsset` | `address` | **1** | **0** | Storage | `VaderPoolFactory` |
| `getPool` | `mapping(address => mapping(address => IVaderPool))` | **2** | **0** | Storage | `VaderPoolFactory` |
| `allPools` | `IVaderPool[]` | **3** | **0** | Storage | `VaderPoolFactory` |

---

## Contract: GovernorAlpha
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `timelock` | `ITimelock` | **0** | **0** | Storage | `GovernorAlpha` |
| `guardian` | `address` | **1** | **0** | Storage | `GovernorAlpha` |
| `proposalCount` | `uint256` | **2** | **0** | Storage | `GovernorAlpha` |
| `feeReceiver` | `address` | **3** | **0** | Storage | `GovernorAlpha` |
| `feeAmount` | `uint256` | **4** | **0** | Storage | `GovernorAlpha` |
| `council` | `address` | **5** | **0** | Storage | `GovernorAlpha` |
| `proposals` | `mapping(uint256 => GovernorAlpha.Proposal)` | **6** | **0** | Storage | `GovernorAlpha` |
| `latestProposalIds` | `mapping(address => uint256)` | **7** | **0** | Storage | `GovernorAlpha` |

---

## Contract: Timelock
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `admin` | `address` | **0** | **0** | Storage | `Timelock` |
| `pendingAdmin` | `address` | **1** | **0** | Storage | `Timelock` |
| `delay` | `uint256` | **2** | **0** | Storage | `Timelock` |
| `queuedTransactions` | `mapping(bytes32 => bool)` | **3** | **0** | Storage | `Timelock` |

---

## Contract: TwapOracle
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `VADER` | `address` | **1** | **0** | Storage | `TwapOracle` |
| `USDV` | `address` | **2** | **0** | Storage | `TwapOracle` |
| `_usdvEnabled` | `bool` | **2** | **20** | Storage | `TwapOracle` |
| `_aggregators` | `mapping(address => address)` | **3** | **0** | Storage | `TwapOracle` |
| `_vaderPool` | `IVaderPoolV2` | **4** | **0** | Storage | `TwapOracle` |
| `_updatePeriod` | `uint256` | **5** | **0** | Storage | `TwapOracle` |
| `_pairs` | `TwapOracle.PairData[]` | **6** | **0** | Storage | `TwapOracle` |
| `_pairExists` | `mapping(bytes32 => bool)` | **7** | **0** | Storage | `TwapOracle` |

---

## Contract: Vader
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_owner` | `address` | **5** | **0** | Storage | `Ownable` |
| `converter` | `IConverter` | **6** | **0** | Storage | `Vader` |
| `vest` | `ILinearVesting` | **7** | **0** | Storage | `Vader` |
| `usdv` | `IUSDV` | **8** | **0** | Storage | `Vader` |
| `emissionCurve` | `uint256` | **9** | **0** | Storage | `Vader` |
| `lastEmission` | `uint256` | **10** | **0** | Storage | `Vader` |
| `maxSupply` | `uint256` | **11** | **0** | Storage | `Vader` |
| `untaxed` | `mapping(address => bool)` | **12** | **0** | Storage | `Vader` |

---

## Contract: USDV
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_owner` | `address` | **5** | **0** | Storage | `Ownable` |

---

## Contract: LinearVesting
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `start` | `uint256` | **1** | **0** | Storage | `LinearVesting` |
| `end` | `uint256` | **2** | **0** | Storage | `LinearVesting` |
| `vest` | `mapping(address => ILinearVesting.Vester)` | **3** | **0** | Storage | `LinearVesting` |

---

## Contract: Converter
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `claimed` | `mapping(bytes32 => bool)` | **0** | **0** | Storage | `Converter` |

---

## Contract: VaderReserve
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `router` | `address` | **1** | **0** | Storage | `VaderReserve` |
| `lastGrant` | `uint256` | **2** | **0** | Storage | `VaderReserve` |

---

## Contract: StakingRewards
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Owned` |
| `nominatedOwner` | `address` | **1** | **0** | Storage | `Owned` |
| `rewardsDistribution` | `address` | **2** | **0** | Storage | `RewardsDistributionRecipient` |
| `_status` | `uint256` | **3** | **0** | Storage | `ReentrancyGuard` |
| `lastPauseTime` | `uint256` | **4** | **0** | Storage | `Pausable` |
| `paused` | `bool` | **5** | **0** | Storage | `Pausable` |
| `periodFinish` | `uint256` | **6** | **0** | Storage | `StakingRewards` |
| `rewardRate` | `uint256` | **7** | **0** | Storage | `StakingRewards` |
| `rewardsDuration` | `uint256` | **8** | **0** | Storage | `StakingRewards` |
| `lastUpdateTime` | `uint256` | **9** | **0** | Storage | `StakingRewards` |
| `rewardPerTokenStored` | `uint256` | **10** | **0** | Storage | `StakingRewards` |
| `userRewardPerTokenPaid` | `mapping(address => uint256)` | **11** | **0** | Storage | `StakingRewards` |
| `rewards` | `mapping(address => uint256)` | **12** | **0** | Storage | `StakingRewards` |
| `_totalSupply` | `uint256` | **13** | **0** | Storage | `StakingRewards` |
| `_balances` | `mapping(address => uint256)` | **14** | **0** | Storage | `StakingRewards` |

---

## Contract: Owned
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Owned` |
| `nominatedOwner` | `address` | **1** | **0** | Storage | `Owned` |

---

## Contract: RewardsDistributionRecipient
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Owned` |
| `nominatedOwner` | `address` | **1** | **0** | Storage | `Owned` |
| `rewardsDistribution` | `address` | **2** | **0** | Storage | `RewardsDistributionRecipient` |

---

## Contract: Pausable
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Owned` |
| `nominatedOwner` | `address` | **1** | **0** | Storage | `Owned` |
| `lastPauseTime` | `uint256` | **2** | **0** | Storage | `Pausable` |
| `paused` | `bool` | **3** | **0** | Storage | `Pausable` |

---

## Contract: XVader
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_nameFallback` | `string` | **5** | **0** | Storage | `EIP712` |
| `_versionFallback` | `string` | **6** | **0** | Storage | `EIP712` |
| `_nonces` | `mapping(address => Counters.Counter)` | **7** | **0** | Storage | `ERC20Permit` |
| `_PERMIT_TYPEHASH_DEPRECATED_SLOT` | `bytes32` | **8** | **0** | Storage | `ERC20Permit` |
| `_delegates` | `mapping(address => address)` | **9** | **0** | Storage | `ERC20Votes` |
| `_checkpoints` | `mapping(address => ERC20Votes.Checkpoint[])` | **10** | **0** | Storage | `ERC20Votes` |
| `_totalSupplyCheckpoints` | `ERC20Votes.Checkpoint[]` | **11** | **0** | Storage | `ERC20Votes` |
| `_status` | `uint256` | **12** | **0** | Storage | `ReentrancyGuard` |

---

## Contract: UniswapV2Pair
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `totalSupply` | `uint256` | **0** | **0** | Storage | `UniswapV2ERC20` |
| `balanceOf` | `mapping(address => uint256)` | **1** | **0** | Storage | `UniswapV2ERC20` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **2** | **0** | Storage | `UniswapV2ERC20` |
| `DOMAIN_SEPARATOR` | `bytes32` | **3** | **0** | Storage | `UniswapV2ERC20` |
| `nonces` | `mapping(address => uint256)` | **4** | **0** | Storage | `UniswapV2ERC20` |
| `factory` | `address` | **5** | **0** | Storage | `UniswapV2Pair` |
| `token0` | `address` | **6** | **0** | Storage | `UniswapV2Pair` |
| `token1` | `address` | **7** | **0** | Storage | `UniswapV2Pair` |
| `reserve0` | `uint112` | **8** | **0** | Storage | `UniswapV2Pair` |
| `reserve1` | `uint112` | **8** | **14** | Storage | `UniswapV2Pair` |
| `blockTimestampLast` | `uint32` | **8** | **28** | Storage | `UniswapV2Pair` |
| `price0CumulativeLast` | `uint256` | **9** | **0** | Storage | `UniswapV2Pair` |
| `price1CumulativeLast` | `uint256` | **10** | **0** | Storage | `UniswapV2Pair` |
| `kLast` | `uint256` | **11** | **0** | Storage | `UniswapV2Pair` |
| `unlocked` | `uint256` | **12** | **0** | Storage | `UniswapV2Pair` |

---

## Contract: UniswapV2ERC20
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `totalSupply` | `uint256` | **0** | **0** | Storage | `UniswapV2ERC20` |
| `balanceOf` | `mapping(address => uint256)` | **1** | **0** | Storage | `UniswapV2ERC20` |
| `allowance` | `mapping(address => mapping(address => uint256))` | **2** | **0** | Storage | `UniswapV2ERC20` |
| `DOMAIN_SEPARATOR` | `bytes32` | **3** | **0** | Storage | `UniswapV2ERC20` |
| `nonces` | `mapping(address => uint256)` | **4** | **0** | Storage | `UniswapV2ERC20` |

---

## Contract: VaderRouterV2
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `reserve` | `IVaderReserve` | **1** | **0** | Storage | `VaderRouterV2` |

---

## Contract: LPToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_owner` | `address` | **5** | **0** | Storage | `Ownable` |

---

## Contract: LPWrapper
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `tokens` | `mapping(IERC20 => IERC20Extended)` | **1** | **0** | Storage | `LPWrapper` |

---

## Contract: BasePoolV2
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_name` | `string` | **0** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **1** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **2** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **3** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **4** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **5** | **0** | Storage | `ERC721` |
| `_status` | `uint256` | **6** | **0** | Storage | `ReentrancyGuard` |
| `supported` | `mapping(IERC20 => bool)` | **7** | **0** | Storage | `BasePoolV2` |
| `pairInfo` | `mapping(IERC20 => IBasePoolV2.PairInfo)` | **8** | **0** | Storage | `BasePoolV2` |
| `positions` | `mapping(uint256 => IBasePoolV2.Position)` | **9** | **0** | Storage | `BasePoolV2` |
| `positionId` | `uint256` | **10** | **0** | Storage | `BasePoolV2` |
| `router` | `address` | **11** | **0** | Storage | `BasePoolV2` |

---

## Contract: VaderPoolV2
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_name` | `string` | **0** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **1** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **2** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **3** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **4** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **5** | **0** | Storage | `ERC721` |
| `_status` | `uint256` | **6** | **0** | Storage | `ReentrancyGuard` |
| `supported` | `mapping(IERC20 => bool)` | **7** | **0** | Storage | `BasePoolV2` |
| `pairInfo` | `mapping(IERC20 => IBasePoolV2.PairInfo)` | **8** | **0** | Storage | `BasePoolV2` |
| `positions` | `mapping(uint256 => IBasePoolV2.Position)` | **9** | **0** | Storage | `BasePoolV2` |
| `positionId` | `uint256` | **10** | **0** | Storage | `BasePoolV2` |
| `router` | `address` | **11** | **0** | Storage | `BasePoolV2` |
| `_owner` | `address` | **12** | **0** | Storage | `Ownable` |
| `wrapper` | `ILPWrapper` | **13** | **0** | Storage | `VaderPoolV2` |
| `synthFactory` | `ISynthFactory` | **14** | **0** | Storage | `VaderPoolV2` |
| `queueActive` | `bool` | **14** | **20** | Storage | `VaderPoolV2` |

---

## Contract: Synth
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_owner` | `address` | **5** | **0** | Storage | `Ownable` |

---

## Contract: SynthFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `synths` | `mapping(IERC20 => ISynth)` | **1** | **0** | Storage | `SynthFactory` |

---
