# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: Attack
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `Attack` |
| `VADER` | `address` | **0** | **1** | Storage | `Attack` |
| `USDV` | `address` | **1** | **0** | Storage | `Attack` |

---

## Contract: DAO
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `DAO` |
| `proposalCount` | `uint256` | **1** | **0** | Storage | `DAO` |
| `VADER` | `address` | **2** | **0** | Storage | `DAO` |
| `USDV` | `address` | **3** | **0** | Storage | `DAO` |
| `VAULT` | `address` | **4** | **0** | Storage | `DAO` |
| `coolOffPeriod` | `uint256` | **5** | **0** | Storage | `DAO` |
| `mapPID_grant` | `mapping(uint256 => DAO.GrantDetails)` | **6** | **0** | Storage | `DAO` |
| `mapPID_address` | `mapping(uint256 => address)` | **7** | **0** | Storage | `DAO` |
| `mapPID_type` | `mapping(uint256 => string)` | **8** | **0** | Storage | `DAO` |
| `mapPID_votes` | `mapping(uint256 => uint256)` | **9** | **0** | Storage | `DAO` |
| `mapPID_timeStart` | `mapping(uint256 => uint256)` | **10** | **0** | Storage | `DAO` |
| `mapPID_finalising` | `mapping(uint256 => bool)` | **11** | **0** | Storage | `DAO` |
| `mapPID_finalised` | `mapping(uint256 => bool)` | **12** | **0** | Storage | `DAO` |
| `mapPIDMember_votes` | `mapping(uint256 => mapping(address => uint256))` | **13** | **0** | Storage | `DAO` |

---

## Contract: Factory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `Factory` |
| `VADER` | `address` | **0** | **1** | Storage | `Factory` |
| `USDV` | `address` | **1** | **0** | Storage | `Factory` |
| `POOLS` | `address` | **2** | **0** | Storage | `Factory` |
| `arraySynths` | `address[]` | **3** | **0** | Storage | `Factory` |
| `getSynth` | `mapping(address => address)` | **4** | **0** | Storage | `Factory` |
| `isSynth` | `mapping(address => bool)` | **5** | **0** | Storage | `Factory` |

---

## Contract: Pools
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `Pools` |
| `pooledVADER` | `uint256` | **1** | **0** | Storage | `Pools` |
| `pooledUSDV` | `uint256` | **2** | **0** | Storage | `Pools` |
| `VADER` | `address` | **3** | **0** | Storage | `Pools` |
| `USDV` | `address` | **4** | **0** | Storage | `Pools` |
| `ROUTER` | `address` | **5** | **0** | Storage | `Pools` |
| `FACTORY` | `address` | **6** | **0** | Storage | `Pools` |
| `_isMember` | `mapping(address => bool)` | **7** | **0** | Storage | `Pools` |
| `_isAsset` | `mapping(address => bool)` | **8** | **0** | Storage | `Pools` |
| `_isAnchor` | `mapping(address => bool)` | **9** | **0** | Storage | `Pools` |
| `mapToken_Units` | `mapping(address => uint256)` | **10** | **0** | Storage | `Pools` |
| `mapTokenMember_Units` | `mapping(address => mapping(address => uint256))` | **11** | **0** | Storage | `Pools` |
| `mapToken_baseAmount` | `mapping(address => uint256)` | **12** | **0** | Storage | `Pools` |
| `mapToken_tokenAmount` | `mapping(address => uint256)` | **13** | **0** | Storage | `Pools` |

---

## Contract: Router
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `Router` |
| `one` | `uint256` | **1** | **0** | Storage | `Router` |
| `rewardReductionFactor` | `uint256` | **2** | **0** | Storage | `Router` |
| `timeForFullProtection` | `uint256` | **3** | **0** | Storage | `Router` |
| `curatedPoolLimit` | `uint256` | **4** | **0** | Storage | `Router` |
| `curatedPoolCount` | `uint256` | **5** | **0** | Storage | `Router` |
| `_isCurated` | `mapping(address => bool)` | **6** | **0** | Storage | `Router` |
| `VADER` | `address` | **7** | **0** | Storage | `Router` |
| `USDV` | `address` | **8** | **0** | Storage | `Router` |
| `POOLS` | `address` | **9** | **0** | Storage | `Router` |
| `anchorLimit` | `uint256` | **10** | **0** | Storage | `Router` |
| `insidePriceLimit` | `uint256` | **11** | **0** | Storage | `Router` |
| `outsidePriceLimit` | `uint256` | **12** | **0** | Storage | `Router` |
| `arrayAnchors` | `address[]` | **13** | **0** | Storage | `Router` |
| `arrayPrices` | `uint256[]` | **14** | **0** | Storage | `Router` |
| `repayDelay` | `uint256` | **15** | **0** | Storage | `Router` |
| `mapMemberToken_depositBase` | `mapping(address => mapping(address => uint256))` | **16** | **0** | Storage | `Router` |
| `mapMemberToken_depositToken` | `mapping(address => mapping(address => uint256))` | **17** | **0** | Storage | `Router` |
| `mapMemberToken_lastDeposited` | `mapping(address => mapping(address => uint256))` | **18** | **0** | Storage | `Router` |
| `mapMember_Collateral` | `mapping(address => Router.CollateralDetails)` | **19** | **0** | Storage | `Router` |
| `mapCollateralDebt_Collateral` | `mapping(address => mapping(address => uint256))` | **20** | **0** | Storage | `Router` |
| `mapCollateralDebt_Debt` | `mapping(address => mapping(address => uint256))` | **21** | **0** | Storage | `Router` |
| `mapCollateralDebt_interestPaid` | `mapping(address => mapping(address => uint256))` | **22** | **0** | Storage | `Router` |
| `mapCollateralAsset_NextEra` | `mapping(address => mapping(address => uint256))` | **23** | **0** | Storage | `Router` |

---

## Contract: Synth
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `FACTORY` | `address` | **0** | **0** | Storage | `Synth` |
| `TOKEN` | `address` | **1** | **0** | Storage | `Synth` |
| `name` | `string` | **2** | **0** | Storage | `Synth` |
| `symbol` | `string` | **3** | **0** | Storage | `Synth` |
| `decimals` | `uint256` | **4** | **0** | Storage | `Synth` |
| `totalSupply` | `uint256` | **5** | **0** | Storage | `Synth` |
| `_balances` | `mapping(address => uint256)` | **6** | **0** | Storage | `Synth` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **7** | **0** | Storage | `Synth` |

---

## Contract: Token1
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `name` | `string` | **0** | **0** | Storage | `Token1` |
| `symbol` | `string` | **1** | **0** | Storage | `Token1` |
| `decimals` | `uint256` | **2** | **0** | Storage | `Token1` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `Token1` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `Token1` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `Token1` |

---

## Contract: Token2
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `name` | `string` | **0** | **0** | Storage | `Token2` |
| `symbol` | `string` | **1** | **0** | Storage | `Token2` |
| `decimals` | `uint256` | **2** | **0** | Storage | `Token2` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `Token2` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `Token2` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `Token2` |

---

## Contract: USDV
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `name` | `string` | **0** | **0** | Storage | `USDV` |
| `symbol` | `string` | **1** | **0** | Storage | `USDV` |
| `decimals` | `uint256` | **2** | **0** | Storage | `USDV` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `USDV` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `USDV` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `USDV` |
| `inited` | `bool` | **6** | **0** | Storage | `USDV` |
| `nextEraTime` | `uint256` | **7** | **0** | Storage | `USDV` |
| `blockDelay` | `uint256` | **8** | **0** | Storage | `USDV` |
| `VADER` | `address` | **9** | **0** | Storage | `USDV` |
| `VAULT` | `address` | **10** | **0** | Storage | `USDV` |
| `ROUTER` | `address` | **11** | **0** | Storage | `USDV` |
| `lastBlock` | `mapping(address => uint256)` | **12** | **0** | Storage | `USDV` |

---

## Contract: Utils
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `one` | `uint256` | **0** | **0** | Storage | `Utils` |
| `_10k` | `uint256` | **1** | **0** | Storage | `Utils` |
| `_year` | `uint256` | **2** | **0** | Storage | `Utils` |
| `inited` | `bool` | **3** | **0** | Storage | `Utils` |
| `VADER` | `address` | **3** | **1** | Storage | `Utils` |
| `USDV` | `address` | **4** | **0** | Storage | `Utils` |
| `ROUTER` | `address` | **5** | **0** | Storage | `Utils` |
| `POOLS` | `address` | **6** | **0** | Storage | `Utils` |
| `FACTORY` | `address` | **7** | **0** | Storage | `Utils` |

---

## Contract: Vader
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `name` | `string` | **0** | **0** | Storage | `Vader` |
| `symbol` | `string` | **1** | **0** | Storage | `Vader` |
| `decimals` | `uint256` | **2** | **0** | Storage | `Vader` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `Vader` |
| `_balances` | `mapping(address => uint256)` | **4** | **0** | Storage | `Vader` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **5** | **0** | Storage | `Vader` |
| `inited` | `bool` | **6** | **0** | Storage | `Vader` |
| `emitting` | `bool` | **6** | **1** | Storage | `Vader` |
| `minting` | `bool` | **6** | **2** | Storage | `Vader` |
| `_1m` | `uint256` | **7** | **0** | Storage | `Vader` |
| `baseline` | `uint256` | **8** | **0** | Storage | `Vader` |
| `emissionCurve` | `uint256` | **9** | **0** | Storage | `Vader` |
| `maxSupply` | `uint256` | **10** | **0** | Storage | `Vader` |
| `secondsPerEra` | `uint256` | **11** | **0** | Storage | `Vader` |
| `currentEra` | `uint256` | **12** | **0** | Storage | `Vader` |
| `nextEraTime` | `uint256` | **13** | **0** | Storage | `Vader` |
| `feeOnTransfer` | `uint256` | **14** | **0** | Storage | `Vader` |
| `VETHER` | `address` | **15** | **0** | Storage | `Vader` |
| `USDV` | `address` | **16** | **0** | Storage | `Vader` |
| `UTILS` | `address` | **17** | **0** | Storage | `Vader` |
| `burnAddress` | `address` | **18** | **0** | Storage | `Vader` |
| `rewardAddress` | `address` | **19** | **0** | Storage | `Vader` |
| `DAO` | `address` | **20** | **0** | Storage | `Vader` |

---

## Contract: Vault
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `inited` | `bool` | **0** | **0** | Storage | `Vault` |
| `erasToEarn` | `uint256` | **1** | **0** | Storage | `Vault` |
| `minGrantTime` | `uint256` | **2** | **0** | Storage | `Vault` |
| `lastGranted` | `uint256` | **3** | **0** | Storage | `Vault` |
| `VADER` | `address` | **4** | **0** | Storage | `Vault` |
| `USDV` | `address` | **5** | **0** | Storage | `Vault` |
| `ROUTER` | `address` | **6** | **0** | Storage | `Vault` |
| `POOLS` | `address` | **7** | **0** | Storage | `Vault` |
| `FACTORY` | `address` | **8** | **0** | Storage | `Vault` |
| `minimumDepositTime` | `uint256` | **9** | **0** | Storage | `Vault` |
| `totalWeight` | `uint256` | **10** | **0** | Storage | `Vault` |
| `mapMember_weight` | `mapping(address => uint256)` | **11** | **0** | Storage | `Vault` |
| `mapMemberSynth_deposit` | `mapping(address => mapping(address => uint256))` | **12** | **0** | Storage | `Vault` |
| `mapMemberSynth_lastTime` | `mapping(address => mapping(address => uint256))` | **13** | **0** | Storage | `Vault` |

---

## Contract: Vether
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `name` | `string` | **0** | **0** | Storage | `Vether` |
| `symbol` | `string` | **1** | **0** | Storage | `Vether` |
| `decimals` | `uint256` | **2** | **0** | Storage | `Vether` |
| `totalSupply` | `uint256` | **3** | **0** | Storage | `Vether` |
| `totalFees` | `uint256` | **4** | **0** | Storage | `Vether` |
| `mapAddress_Excluded` | `mapping(address => bool)` | **5** | **0** | Storage | `Vether` |
| `_balances` | `mapping(address => uint256)` | **6** | **0** | Storage | `Vether` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **7** | **0** | Storage | `Vether` |

---
