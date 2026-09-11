# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: Migrations
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `owner` | `address` | **0** | **0** | Storage | `Migrations` |
| `last_completed_migration` | `uint256` | **1** | **0** | Storage | `Migrations` |

---

## Contract: FluxAggregator
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `version` | `uint256` | **0** | **0** | Storage | `FluxAggregator` |
| `decimals` | `uint8` | **1** | **0** | Storage | `FluxAggregator` |
| `description` | `string` | **2** | **0** | Storage | `FluxAggregator` |
| `value` | `int256` | **3** | **0** | Storage | `FluxAggregator` |
| `latestRoundId` | `uint80` | **4** | **0** | Storage | `FluxAggregator` |

---

## Contract: GovernanceTester
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `gov` | `address` | **0** | **0** | Storage | `GovernanceTester` |
| `value` | `uint256` | **1** | **0** | Storage | `GovernanceTester` |

---

## Contract: CreditLine
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_status` | `uint256` | **0** | **0** | Storage | `ReentrancyGuard` |
| `_initialized` | `bool` | **1** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **1** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **2** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **53** | **0** | Storage | `OwnableUpgradeable` |
| `creditLineCounter` | `uint256` | **102** | **0** | Storage | `CreditLine` |
| `collateralShareInStrategy` | `mapping(uint256 => mapping(address => uint256))` | **103** | **0** | Storage | `CreditLine` |
| `creditLineVariables` | `mapping(uint256 => CreditLine.CreditLineVariables)` | **104** | **0** | Storage | `CreditLine` |
| `creditLineConstants` | `mapping(uint256 => CreditLine.CreditLineConstants)` | **105** | **0** | Storage | `CreditLine` |
| `savingsAccount` | `address` | **106** | **0** | Storage | `CreditLine` |
| `priceOracle` | `address` | **107** | **0** | Storage | `CreditLine` |
| `strategyRegistry` | `address` | **108** | **0** | Storage | `CreditLine` |
| `defaultStrategy` | `address` | **109** | **0** | Storage | `CreditLine` |
| `protocolFeeFraction` | `uint256` | **110** | **0** | Storage | `CreditLine` |
| `protocolFeeCollector` | `address` | **111** | **0** | Storage | `CreditLine` |
| `liquidatorRewardFraction` | `uint256` | **112** | **0** | Storage | `CreditLine` |

---

## Contract: Extension
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `extensions` | `mapping(address => Extension.ExtensionVariables)` | **1** | **0** | Storage | `Extension` |
| `poolFactory` | `IPoolFactory` | **2** | **0** | Storage | `Extension` |
| `votingPassRatio` | `uint256` | **3** | **0** | Storage | `Extension` |

---

## Contract: Pool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_balances` | `mapping(address => uint256)` | **51** | **0** | Storage | `ERC20Upgradeable` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **52** | **0** | Storage | `ERC20Upgradeable` |
| `_totalSupply` | `uint256` | **53** | **0** | Storage | `ERC20Upgradeable` |
| `_name` | `string` | **54** | **0** | Storage | `ERC20Upgradeable` |
| `_symbol` | `string` | **55** | **0** | Storage | `ERC20Upgradeable` |
| `_decimals` | `uint8` | **56** | **0** | Storage | `ERC20Upgradeable` |
| `__gap` | `uint256[44]` | **57** | **0** | Storage | `ERC20Upgradeable` |
| `_paused` | `bool` | **101** | **0** | Storage | `PausableUpgradeable` |
| `__gap` | `uint256[49]` | **102** | **0** | Storage | `PausableUpgradeable` |
| `__gap` | `uint256[50]` | **151** | **0** | Storage | `ERC20PausableUpgradeable` |
| `_status` | `uint256` | **201** | **0** | Storage | `ReentrancyGuard` |
| `poolFactory` | `address` | **202** | **0** | Storage | `Pool` |
| `lenders` | `mapping(address => Pool.LendingDetails)` | **203** | **0** | Storage | `Pool` |
| `poolConstants` | `Pool.PoolConstants` | **204** | **0** | Storage | `Pool` |
| `poolVariables` | `Pool.PoolVariables` | **216** | **0** | Storage | `Pool` |

---

## Contract: PoolFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `poolInitFuncSelector` | `bytes4` | **101** | **0** | Storage | `PoolFactory` |
| `poolImpl` | `address` | **101** | **4** | Storage | `PoolFactory` |
| `userRegistry` | `address` | **102** | **0** | Storage | `PoolFactory` |
| `strategyRegistry` | `address` | **103** | **0** | Storage | `PoolFactory` |
| `extension` | `address` | **104** | **0** | Storage | `PoolFactory` |
| `repaymentImpl` | `address` | **105** | **0** | Storage | `PoolFactory` |
| `priceOracle` | `address` | **106** | **0** | Storage | `PoolFactory` |
| `savingsAccount` | `address` | **107** | **0** | Storage | `PoolFactory` |
| `collectionPeriod` | `uint256` | **108** | **0** | Storage | `PoolFactory` |
| `loanWithdrawalDuration` | `uint256` | **109** | **0** | Storage | `PoolFactory` |
| `marginCallDuration` | `uint256` | **110** | **0** | Storage | `PoolFactory` |
| `minBorrowFraction` | `uint256` | **111** | **0** | Storage | `PoolFactory` |
| `liquidatorRewardFraction` | `uint256` | **112** | **0** | Storage | `PoolFactory` |
| `poolCancelPenaltyMultiple` | `uint256` | **113** | **0** | Storage | `PoolFactory` |
| `noStrategyAddress` | `address` | **114** | **0** | Storage | `PoolFactory` |
| `protocolFeeFraction` | `uint256` | **115** | **0** | Storage | `PoolFactory` |
| `protocolFeeCollector` | `address` | **116** | **0** | Storage | `PoolFactory` |
| `isBorrowToken` | `mapping(address => bool)` | **117** | **0** | Storage | `PoolFactory` |
| `isCollateralToken` | `mapping(address => bool)` | **118** | **0** | Storage | `PoolFactory` |
| `poolRegistry` | `mapping(address => bool)` | **119** | **0** | Storage | `PoolFactory` |
| `poolSizeLimit` | `PoolFactory.Limits` | **120** | **0** | Storage | `PoolFactory` |
| `idealCollateralRatioLimit` | `PoolFactory.Limits` | **122** | **0** | Storage | `PoolFactory` |
| `borrowRateLimit` | `PoolFactory.Limits` | **124** | **0** | Storage | `PoolFactory` |
| `repaymentIntervalLimit` | `PoolFactory.Limits` | **126** | **0** | Storage | `PoolFactory` |
| `noOfRepaymentIntervalsLimit` | `PoolFactory.Limits` | **128** | **0** | Storage | `PoolFactory` |

---

## Contract: Repayments
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `_status` | `uint256` | **1** | **0** | Storage | `ReentrancyGuard` |
| `poolFactory` | `IPoolFactory` | **2** | **0** | Storage | `Repayments` |
| `gracePenaltyRate` | `uint256` | **3** | **0** | Storage | `Repayments` |
| `gracePeriodFraction` | `uint256` | **4** | **0** | Storage | `Repayments` |
| `repayVariables` | `mapping(address => Repayments.RepaymentVariables)` | **5** | **0** | Storage | `Repayments` |
| `repayConstants` | `mapping(address => Repayments.RepaymentConstants)` | **6** | **0** | Storage | `Repayments` |

---

## Contract: PriceOracle
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `uniswapPriceAveragingPeriod` | `uint32` | **101** | **0** | Storage | `PriceOracle` |
| `chainlinkFeedAddresses` | `mapping(address => PriceOracle.PriceData)` | **102** | **0** | Storage | `PriceOracle` |
| `decimals` | `mapping(address => uint256)` | **103** | **0** | Storage | `PriceOracle` |
| `uniswapPools` | `mapping(bytes32 => address)` | **104** | **0** | Storage | `PriceOracle` |

---

## Contract: SavingsAccount
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `_status` | `uint256` | **101** | **0** | Storage | `ReentrancyGuard` |
| `strategyRegistry` | `address` | **102** | **0** | Storage | `SavingsAccount` |
| `creditLine` | `address` | **103** | **0** | Storage | `SavingsAccount` |
| `balanceInShares` | `mapping(address => mapping(address => mapping(address => uint256)))` | **104** | **0** | Storage | `SavingsAccount` |
| `allowance` | `mapping(address => mapping(address => mapping(address => uint256)))` | **105** | **0** | Storage | `SavingsAccount` |

---

## Contract: Verification
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `activationDelay` | `uint256` | **101** | **0** | Storage | `Verification` |
| `verifiers` | `mapping(address => bool)` | **102** | **0** | Storage | `Verification` |
| `masterAddresses` | `mapping(address => mapping(address => uint256))` | **103** | **0** | Storage | `Verification` |
| `linkedAddresses` | `mapping(address => Verification.LinkedAddress)` | **104** | **0** | Storage | `Verification` |
| `pendingLinkAddresses` | `mapping(address => mapping(address => bool))` | **105** | **0** | Storage | `Verification` |

---

## Contract: AdminVerifier
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `verification` | `IVerification` | **101** | **0** | Storage | `AdminVerifier` |
| `userData` | `mapping(address => string)` | **102** | **0** | Storage | `AdminVerifier` |

---

## Contract: Token
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `ERC20` |
| `_owner` | `address` | **5** | **1** | Storage | `Ownable` |

---

## Contract: Controller
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `governance` | `address` | **0** | **0** | Storage | `Controller` |
| `strategist` | `address` | **1** | **0** | Storage | `Controller` |
| `onesplit` | `address` | **2** | **0** | Storage | `Controller` |
| `rewards` | `address` | **3** | **0** | Storage | `Controller` |
| `vaults` | `mapping(address => address)` | **4** | **0** | Storage | `Controller` |
| `strategies` | `mapping(address => address)` | **5** | **0** | Storage | `Controller` |
| `converters` | `mapping(address => mapping(address => address))` | **6** | **0** | Storage | `Controller` |
| `approvedStrategies` | `mapping(address => mapping(address => bool))` | **7** | **0** | Storage | `Controller` |
| `split` | `uint256` | **8** | **0** | Storage | `Controller` |

---

## Contract: Strategy
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `want` | `address` | **0** | **0** | Storage | `Strategy` |
| `governance` | `address` | **1** | **0** | Storage | `Strategy` |
| `controller` | `address` | **2** | **0** | Storage | `Strategy` |
| `strategist` | `address` | **3** | **0** | Storage | `Strategy` |

---

## Contract: yVault
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20Detailed` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20Detailed` |
| `_decimals` | `uint8` | **5** | **0** | Storage | `ERC20Detailed` |
| `token` | `ERC20` | **5** | **1** | Storage | `yVault` |
| `min` | `uint256` | **6** | **0** | Storage | `yVault` |
| `governance` | `address` | **7** | **0** | Storage | `yVault` |
| `controller` | `address` | **8** | **0** | Storage | `yVault` |

---

## Contract: AaveYield
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `_status` | `uint256` | **101** | **0** | Storage | `ReentrancyGuard` |
| `wethGateway` | `address` | **102** | **0** | Storage | `AaveYield` |
| `protocolDataProvider` | `address` | **103** | **0** | Storage | `AaveYield` |
| `lendingPoolAddressesProvider` | `address` | **104** | **0** | Storage | `AaveYield` |
| `savingsAccount` | `address` | **105** | **0** | Storage | `AaveYield` |
| `referralCode` | `uint16` | **105** | **20** | Storage | `AaveYield` |

---

## Contract: CompoundYield
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `_status` | `uint256` | **101** | **0** | Storage | `ReentrancyGuard` |
| `savingsAccount` | `address` | **102** | **0** | Storage | `CompoundYield` |
| `liquidityToken` | `mapping(address => address)` | **103** | **0** | Storage | `CompoundYield` |

---

## Contract: NoYield
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `_status` | `uint256` | **101** | **0** | Storage | `ReentrancyGuard` |
| `savingsAccount` | `address` | **102** | **0** | Storage | `NoYield` |

---

## Contract: StrategyRegistry
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `strategies` | `address[]` | **101** | **0** | Storage | `StrategyRegistry` |
| `maxStrategies` | `uint256` | **102** | **0** | Storage | `StrategyRegistry` |
| `registry` | `mapping(address => bool)` | **103** | **0** | Storage | `StrategyRegistry` |

---

## Contract: YearnYield
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `bool` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `__gap` | `uint256[50]` | **1** | **0** | Storage | `ContextUpgradeable` |
| `_owner` | `address` | **51** | **0** | Storage | `OwnableUpgradeable` |
| `__gap` | `uint256[49]` | **52** | **0** | Storage | `OwnableUpgradeable` |
| `_status` | `uint256` | **101** | **0** | Storage | `ReentrancyGuard` |
| `savingsAccount` | `address` | **102** | **0** | Storage | `YearnYield` |
| `liquidityToken` | `mapping(address => address)` | **103** | **0** | Storage | `YearnYield` |

---
