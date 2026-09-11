# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: WithdrawHandler
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `ctrl` | `IController` | **2** | **0** | Storage | `WithdrawHandler` |
| `lg` | `ILifeGuard` | **3** | **0** | Storage | `WithdrawHandler` |
| `buoy` | `IBuoy` | **4** | **0** | Storage | `WithdrawHandler` |
| `insurance` | `IInsurance` | **5** | **0** | Storage | `WithdrawHandler` |
| `emergencyHandler` | `IEmergencyHandler` | **6** | **0** | Storage | `WithdrawHandler` |

---

## Contract: DepositHandler
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `ctrl` | `IController` | **2** | **0** | Storage | `DepositHandler` |
| `lg` | `ILifeGuard` | **3** | **0** | Storage | `DepositHandler` |
| `buoy` | `IBuoy` | **4** | **0** | Storage | `DepositHandler` |
| `insurance` | `IInsurance` | **5** | **0** | Storage | `DepositHandler` |
| `feeToken` | `mapping(uint256 => bool)` | **6** | **0** | Storage | `DepositHandler` |

---

## Contract: Controller
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_paused` | `bool` | **0** | **0** | Storage | `Pausable` |
| `_owner` | `address` | **0** | **1** | Storage | `Ownable` |
| `whitelist` | `mapping(address => bool)` | **1** | **0** | Storage | `Whitelist` |
| `curveVault` | `address` | **2** | **0** | Storage | `Controller` |
| `preventSmartContracts` | `bool` | **2** | **20** | Storage | `Controller` |
| `insurance` | `address` | **3** | **0** | Storage | `Controller` |
| `pnl` | `address` | **4** | **0** | Storage | `Controller` |
| `lifeGuard` | `address` | **5** | **0** | Storage | `Controller` |
| `buoy` | `address` | **6** | **0** | Storage | `Controller` |
| `depositHandler` | `address` | **7** | **0** | Storage | `Controller` |
| `withdrawHandler` | `address` | **8** | **0** | Storage | `Controller` |
| `emergencyHandler` | `address` | **9** | **0** | Storage | `Controller` |
| `deadCoin` | `uint256` | **10** | **0** | Storage | `Controller` |
| `emergencyState` | `bool` | **11** | **0** | Storage | `Controller` |
| `utilisationRatioLimitGvt` | `uint256` | **12** | **0** | Storage | `Controller` |
| `utilisationRatioLimitPwrd` | `uint256` | **13** | **0** | Storage | `Controller` |
| `bigFishThreshold` | `uint256` | **14** | **0** | Storage | `Controller` |
| `bigFishAbsoluteThreshold` | `uint256` | **15** | **0** | Storage | `Controller` |
| `reward` | `address` | **16** | **0** | Storage | `Controller` |
| `safeAddresses` | `mapping(address => bool)` | **17** | **0** | Storage | `Controller` |
| `underlyingVaults` | `mapping(uint256 => address)` | **18** | **0** | Storage | `Controller` |
| `vaultIndexes` | `mapping(address => uint256)` | **19** | **0** | Storage | `Controller` |
| `referrals` | `mapping(address => address)` | **20** | **0** | Storage | `Controller` |
| `withdrawalFee` | `mapping(bool => uint256)` | **21** | **0** | Storage | `Controller` |

---

## Contract: PnL
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `lastGvtAssets` | `uint256` | **2** | **0** | Storage | `PnL` |
| `lastPwrdAssets` | `uint256` | **3** | **0** | Storage | `PnL` |
| `rebase` | `bool` | **4** | **0** | Storage | `PnL` |
| `performanceFee` | `uint256` | **5** | **0** | Storage | `PnL` |

---

## Contract: Whitelist
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `whitelist` | `mapping(address => bool)` | **1** | **0** | Storage | `Whitelist` |

---

## Contract: Controllable
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |

---

## Contract: GERC20
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `GERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `GERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `GERC20` |
| `_name` | `string` | **3** | **0** | Storage | `GERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `GERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `GERC20` |

---

## Contract: NonRebasingGToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `GERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `GERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `GERC20` |
| `_name` | `string` | **3** | **0** | Storage | `GERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `GERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `GERC20` |
| `_owner` | `address` | **5** | **1** | Storage | `Ownable` |
| `whitelist` | `mapping(address => bool)` | **6** | **0** | Storage | `Whitelist` |
| `ctrl` | `IController` | **7** | **0** | Storage | `GToken` |

---

## Contract: RebasingGToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `GERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `GERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `GERC20` |
| `_name` | `string` | **3** | **0** | Storage | `GERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `GERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `GERC20` |
| `_owner` | `address` | **5** | **1** | Storage | `Ownable` |
| `whitelist` | `mapping(address => bool)` | **6** | **0** | Storage | `Whitelist` |
| `ctrl` | `IController` | **7** | **0** | Storage | `GToken` |

---

## Contract: GToken
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `GERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `GERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `GERC20` |
| `_name` | `string` | **3** | **0** | Storage | `GERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `GERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `GERC20` |
| `_owner` | `address` | **5** | **1** | Storage | `Ownable` |
| `whitelist` | `mapping(address => bool)` | **6** | **0** | Storage | `Whitelist` |
| `ctrl` | `IController` | **7** | **0** | Storage | `GToken` |

---

## Contract: LifeGuard3Pool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `whitelist` | `mapping(address => bool)` | **2** | **0** | Storage | `Whitelist` |
| `insurance` | `address` | **3** | **0** | Storage | `LifeGuard3Pool` |
| `depositHandler` | `address` | **4** | **0** | Storage | `LifeGuard3Pool` |
| `withdrawHandler` | `address` | **5** | **0** | Storage | `LifeGuard3Pool` |
| `investToCurveThreshold` | `uint256` | **6** | **0** | Storage | `LifeGuard3Pool` |
| `assets` | `mapping(uint256 => uint256)` | **7** | **0** | Storage | `LifeGuard3Pool` |

---

## Contract: ERC20
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `ERC20` |

---

## Contract: Insurance
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `whitelist` | `mapping(address => bool)` | **2** | **0** | Storage | `Whitelist` |
| `allocation` | `IAllocation` | **3** | **0** | Storage | `Insurance` |
| `exposure` | `IExposure` | **4** | **0** | Storage | `Insurance` |
| `underlyingTokensPercents` | `mapping(uint256 => uint256)` | **5** | **0** | Storage | `Insurance` |
| `curveVaultPercent` | `uint256` | **6** | **0** | Storage | `Insurance` |
| `exposureBufferRebalance` | `uint256` | **7** | **0** | Storage | `Insurance` |
| `maxPercentForWithdraw` | `uint256` | **8** | **0** | Storage | `Insurance` |
| `maxPercentForDeposit` | `uint256` | **9** | **0** | Storage | `Insurance` |

---

## Contract: Allocation
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `whitelist` | `mapping(address => bool)` | **2** | **0** | Storage | `Whitelist` |
| `swapThreshold` | `uint256` | **3** | **0** | Storage | `Allocation` |
| `curvePercentThreshold` | `uint256` | **4** | **0** | Storage | `Allocation` |

---

## Contract: Exposure
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_owner` | `address` | **0** | **0** | Storage | `Ownable` |
| `controller` | `address` | **1** | **0** | Storage | `Controllable` |
| `whitelist` | `mapping(address => bool)` | **2** | **0** | Storage | `Whitelist` |
| `protocolCount` | `uint256` | **3** | **0** | Storage | `Exposure` |
| `makerUSDCExposure` | `uint256` | **4** | **0** | Storage | `Exposure` |

---
