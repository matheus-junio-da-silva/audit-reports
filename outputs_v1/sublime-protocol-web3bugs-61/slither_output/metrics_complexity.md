# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+---------------------+-----------------+-----------+------------+
| Contract            | State variables | Constants | Immutables |
+---------------------+-----------------+-----------+------------+
| Migrations          | 2               | 0         | 0          |
| FluxAggregator      | 5               | 0         | 0          |
| GovernanceTester    | 2               | 0         | 0          |
| SafeMathUpgradeable | 0               | 0         | 0          |
| AddressUpgradeable  | 0               | 0         | 0          |
| ECDSA               | 0               | 0         | 0          |
| SafeMath            | 0               | 0         | 0          |
| SafeERC20           | 0               | 0         | 0          |
| Address             | 0               | 0         | 0          |
| FullMath            | 0               | 0         | 0          |
| LowGasSafeMath      | 0               | 0         | 0          |
| TickMath            | 0               | 4         | 0          |
| OracleLibrary       | 0               | 0         | 0          |
| PoolAddress         | 0               | 1         | 0          |
| CreditLine          | 11              | 1         | 0          |
| Extension           | 3               | 0         | 0          |
| Pool                | 4               | 0         | 0          |
| PoolFactory         | 25              | 0         | 0          |
| Repayments          | 5               | 2         | 0          |
| PriceOracle         | 4               | 0         | 0          |
| SublimeProxy        | 0               | 0         | 0          |
| SavingsAccount      | 4               | 0         | 0          |
| SavingsAccountUtil  | 0               | 0         | 0          |
| Verification        | 5               | 0         | 0          |
| AdminVerifier       | 2               | 0         | 0          |
| Token               | 0               | 0         | 0          |
| Controller          | 9               | 1         | 0          |
| Strategy            | 4               | 0         | 0          |
| yVault              | 4               | 1         | 0          |
| AaveYield           | 5               | 0         | 0          |
| CompoundYield       | 2               | 0         | 0          |
| NoYield             | 1               | 0         | 0          |
| StrategyRegistry    | 3               | 0         | 0          |
| YearnYield          | 2               | 0         | 0          |
| TOTAL               | 102             | 10        | 0          |
+---------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+---------------------+--------+----------+----------+---------+
| Contract            | Public | External | Internal | Private |
+---------------------+--------+----------+----------+---------+
| Migrations          | 1      | 0        | 1        | 0       |
| FluxAggregator      | 1      | 2        | 1        | 0       |
| GovernanceTester    | 1      | 0        | 0        | 0       |
| SafeMathUpgradeable | 0      | 0        | 13       | 0       |
| AddressUpgradeable  | 0      | 0        | 8        | 1       |
| ECDSA               | 0      | 0        | 3        | 0       |
| SafeMath            | 0      | 0        | 13       | 0       |
| SafeERC20           | 0      | 0        | 5        | 1       |
| Address             | 0      | 0        | 10       | 1       |
| FullMath            | 0      | 0        | 2        | 0       |
| LowGasSafeMath      | 0      | 0        | 5        | 0       |
| TickMath            | 0      | 0        | 3        | 0       |
| OracleLibrary       | 0      | 0        | 2        | 0       |
| PoolAddress         | 0      | 0        | 3        | 0       |
| CreditLine          | 10     | 18       | 24       | 1       |
| Extension           | 0      | 11       | 3        | 1       |
| Pool                | 22     | 35       | 31       | 1       |
| PoolFactory         | 4      | 43       | 29       | 1       |
| Repayments          | 8      | 21       | 10       | 1       |
| PriceOracle         | 5      | 8        | 8        | 1       |
| SublimeProxy        | 0      | 7        | 8        | 2       |
| SavingsAccount      | 3      | 31       | 12       | 1       |
| SavingsAccountUtil  | 0      | 0        | 6        | 0       |
| Verification        | 3      | 14       | 8        | 1       |
| AdminVerifier       | 3      | 4        | 7        | 1       |
| Token               | 14     | 7        | 8        | 0       |
| Controller          | 17     | 1        | 2        | 0       |
| Strategy            | 2      | 5        | 1        | 0       |
| yVault              | 21     | 6        | 9        | 0       |
| AaveYield           | 5      | 16       | 12       | 1       |
| CompoundYield       | 4      | 15       | 11       | 1       |
| NoYield             | 3      | 15       | 8        | 1       |
| StrategyRegistry    | 3      | 11       | 7        | 1       |
| YearnYield          | 4      | 15       | 11       | 1       |
| TOTAL               | 134    | 285      | 284      | 19      |
+---------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+---------------------+----------+------+------+
| Contract            | Mutating | View | Pure |
+---------------------+----------+------+------+
| Migrations          | 2        | 0    | 0    |
| FluxAggregator      | 2        | 2    | 0    |
| GovernanceTester    | 1        | 0    | 0    |
| SafeMathUpgradeable | 0        | 0    | 13   |
| AddressUpgradeable  | 5        | 3    | 1    |
| ECDSA               | 0        | 0    | 3    |
| SafeMath            | 0        | 0    | 13   |
| SafeERC20           | 6        | 0    | 0    |
| Address             | 7        | 3    | 1    |
| FullMath            | 0        | 0    | 2    |
| LowGasSafeMath      | 0        | 0    | 5    |
| TickMath            | 1        | 0    | 2    |
| OracleLibrary       | 0        | 1    | 1    |
| PoolAddress         | 1        | 0    | 2    |
| CreditLine          | 45       | 7    | 1    |
| Extension           | 14       | 1    | 0    |
| Pool                | 60       | 29   | 0    |
| PoolFactory         | 54       | 22   | 1    |
| Repayments          | 20       | 20   | 0    |
| PriceOracle         | 10       | 11   | 1    |
| SublimeProxy        | 14       | 3    | 0    |
| SavingsAccount      | 42       | 5    | 0    |
| SavingsAccountUtil  | 6        | 0    | 0    |
| Verification        | 20       | 6    | 0    |
| AdminVerifier       | 11       | 4    | 0    |
| Token               | 17       | 12   | 0    |
| Controller          | 18       | 2    | 0    |
| Strategy            | 6        | 2    | 0    |
| yVault              | 25       | 11   | 0    |
| AaveYield           | 26       | 8    | 0    |
| CompoundYield       | 26       | 5    | 0    |
| NoYield             | 19       | 6    | 2    |
| StrategyRegistry    | 15       | 7    | 0    |
| YearnYield          | 24       | 7    | 0    |
| TOTAL               | 497      | 177  | 48   |
+---------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+---------------------+-------------------+----------------------+--------------+
| Contract            | External mutating | No auth or onlyOwner | No modifiers |
+---------------------+-------------------+----------------------+--------------+
| Migrations          | 1                 | 1                    | 0            |
| FluxAggregator      | 3                 | 3                    | 3            |
| GovernanceTester    | 1                 | 1                    | 0            |
| SafeMathUpgradeable | 0                 | 0                    | 0            |
| AddressUpgradeable  | 0                 | 0                    | 0            |
| ECDSA               | 0                 | 0                    | 0            |
| SafeMath            | 0                 | 0                    | 0            |
| SafeERC20           | 0                 | 0                    | 0            |
| Address             | 0                 | 0                    | 0            |
| FullMath            | 0                 | 0                    | 0            |
| LowGasSafeMath      | 0                 | 0                    | 0            |
| TickMath            | 0                 | 0                    | 0            |
| OracleLibrary       | 0                 | 0                    | 0            |
| PoolAddress         | 0                 | 0                    | 0            |
| CreditLine          | 24                | 24                   | 7            |
| Extension           | 11                | 11                   | 7            |
| Pool                | 43                | 43                   | 31           |
| PoolFactory         | 45                | 45                   | 16           |
| Repayments          | 21                | 21                   | 14           |
| PriceOracle         | 10                | 10                   | 4            |
| SublimeProxy        | 7                 | 7                    | 2            |
| SavingsAccount      | 33                | 33                   | 21           |
| SavingsAccountUtil  | 0                 | 0                    | 0            |
| Verification        | 16                | 16                   | 9            |
| AdminVerifier       | 6                 | 6                    | 0            |
| Token               | 14                | 14                   | 11           |
| Controller          | 17                | 17                   | 17           |
| Strategy            | 5                 | 5                    | 5            |
| yVault              | 18                | 18                   | 18           |
| AaveYield           | 18                | 18                   | 8            |
| CompoundYield       | 18                | 18                   | 9            |
| NoYield             | 17                | 17                   | 9            |
| StrategyRegistry    | 13                | 13                   | 6            |
| YearnYield          | 17                | 17                   | 8            |
| TOTAL               | 358               | 358                  | 205          |
+---------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+---------------------+-----------+-----+-----+-----+-----+
| Contract            | Ext calls | RFC | NOC | DIT | CBO |
+---------------------+-----------+-----+-----+-----+-----+
| Migrations          | 0         | 1   | 0   | 0   | 0   |
| FluxAggregator      | 0         | 3   | 0   | 0   | 0   |
| GovernanceTester    | 0         | 1   | 0   | 0   | 0   |
| SafeMathUpgradeable | 0         | 0   | 0   | 0   | 1   |
| AddressUpgradeable  | 0         | 0   | 0   | 0   | 14  |
| ECDSA               | 0         | 0   | 0   | 0   | 0   |
| SafeMath            | 0         | 0   | 0   | 0   | 13  |
| SafeERC20           | 6         | 6   | 0   | 0   | 14  |
| Address             | 0         | 0   | 0   | 0   | 2   |
| FullMath            | 0         | 0   | 0   | 0   | 1   |
| LowGasSafeMath      | 0         | 0   | 0   | 0   | 0   |
| TickMath            | 0         | 0   | 0   | 0   | 1   |
| OracleLibrary       | 7         | 3   | 0   | 0   | 4   |
| PoolAddress         | 0         | 0   | 0   | 0   | 0   |
| CreditLine          | 98        | 100 | 0   | 3   | 8   |
| Extension           | 13        | 24  | 0   | 1   | 5   |
| Pool                | 151       | 176 | 0   | 4   | 11  |
| PoolFactory         | 3         | 50  | 0   | 3   | 3   |
| Repayments          | 68        | 78  | 0   | 1   | 5   |
| PriceOracle         | 13        | 21  | 0   | 3   | 5   |
| SublimeProxy        | 2         | 9   | 0   | 3   | 1   |
| SavingsAccount      | 37        | 69  | 0   | 3   | 5   |
| SavingsAccountUtil  | 8         | 8   | 0   | 0   | 3   |
| Verification        | 1         | 18  | 0   | 3   | 1   |
| AdminVerifier       | 3         | 10  | 0   | 3   | 2   |
| Token               | 9         | 28  | 0   | 2   | 1   |
| Controller          | 31        | 41  | 0   | 0   | 6   |
| Strategy            | 9         | 16  | 0   | 0   | 3   |
| yVault              | 52        | 71  | 0   | 3   | 6   |
| AaveYield           | 39        | 55  | 0   | 3   | 9   |
| CompoundYield       | 28        | 43  | 0   | 3   | 6   |
| NoYield             | 5         | 23  | 0   | 3   | 3   |
| StrategyRegistry    | 3         | 17  | 0   | 3   | 2   |
| YearnYield          | 27        | 42  | 0   | 3   | 5   |
+---------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics
Error executing: encode_ir_for_halstead: REF_60 -> CODESIZE account

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+---------------------+------------+--------------+-------------+-----------------------------+
| Contract            | Dependents | Dependencies | Instability | Distance from main sequence |
+---------------------+------------+--------------+-------------+-----------------------------+
| Migrations          | 0          | 0            | 0.00        | 0.00                        |
| FluxAggregator      | 0          | 0            | 0.00        | 0.00                        |
| GovernanceTester    | 0          | 0            | 0.00        | 0.00                        |
| SafeMathUpgradeable | 1          | 0            | 0.00        | 0.00                        |
| AddressUpgradeable  | 14         | 0            | 0.00        | 0.00                        |
| ECDSA               | 0          | 0            | 0.00        | 0.00                        |
| SafeMath            | 13         | 0            | 0.00        | 0.00                        |
| SafeERC20           | 11         | 3            | 0.21        | 0.21                        |
| Address             | 2          | 0            | 0.00        | 0.00                        |
| FullMath            | 1          | 0            | 0.00        | 0.00                        |
| LowGasSafeMath      | 0          | 0            | 0.00        | 0.00                        |
| TickMath            | 1          | 0            | 0.00        | 0.00                        |
| OracleLibrary       | 1          | 3            | 0.75        | 0.75                        |
| PoolAddress         | 0          | 0            | 0.00        | 0.00                        |
| CreditLine          | 0          | 8            | 1.00        | 1.00                        |
| Extension           | 0          | 5            | 1.00        | 1.00                        |
| Pool                | 0          | 11           | 1.00        | 1.00                        |
| PoolFactory         | 0          | 3            | 1.00        | 1.00                        |
| Repayments          | 0          | 5            | 1.00        | 1.00                        |
| PriceOracle         | 0          | 5            | 1.00        | 1.00                        |
| SublimeProxy        | 0          | 1            | 1.00        | 1.00                        |
| SavingsAccount      | 0          | 5            | 1.00        | 1.00                        |
| SavingsAccountUtil  | 1          | 2            | 0.67        | 0.67                        |
| Verification        | 0          | 1            | 1.00        | 1.00                        |
| AdminVerifier       | 0          | 2            | 1.00        | 1.00                        |
| Token               | 0          | 1            | 1.00        | 1.00                        |
| Controller          | 0          | 6            | 1.00        | 1.00                        |
| Strategy            | 0          | 3            | 1.00        | 1.00                        |
| yVault              | 0          | 6            | 1.00        | 1.00                        |
| AaveYield           | 0          | 9            | 1.00        | 1.00                        |
| CompoundYield       | 0          | 6            | 1.00        | 1.00                        |
| NoYield             | 0          | 3            | 1.00        | 1.00                        |
| StrategyRegistry    | 0          | 2            | 1.00        | 1.00                        |
| YearnYield          | 0          | 5            | 1.00        | 1.00                        |
+---------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+-------+------+------+
|       | src   | dep  | test |
+-------+-------+------+------+
| loc   | 6911  | 3483 | 782  |
| sloc  | 3860  | 1334 | 597  |
| cloc  | 2117  | 1802 | 44   |
| Total | 12888 | 6619 | 1423 |
+-------+-------+------+------+
```

## Function Complexity & Standards Checks
### Contract: Migrations
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setCompleted` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: FluxAggregator
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setValue` | **1** | Low (Simple) |
| `getRoundData` | **1** | Low (Simple) |
| `latestRoundData` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: GovernanceTester
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |

---

### Contract: SafeMathUpgradeable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `tryAdd` | **2** | Low (Simple) |
| `trySub` | **2** | Low (Simple) |
| `tryMul` | **3** | Low (Simple) |
| `tryDiv` | **2** | Low (Simple) |
| `tryMod` | **2** | Low (Simple) |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |

---

### Contract: AddressUpgradeable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `isContract` | **1** | Low (Simple) |
| `sendValue` | **1** | Low (Simple) |
| `functionCall` | **1** | Low (Simple) |
| `functionCall` | **1** | Low (Simple) |
| `functionCallWithValue` | **1** | Low (Simple) |
| `functionCallWithValue` | **1** | Low (Simple) |
| `functionStaticCall` | **1** | Low (Simple) |
| `functionStaticCall` | **1** | Low (Simple) |
| `_verifyCallResult` | **3** | Low (Simple) |

---

### Contract: ECDSA
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `recover` | **2** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `toEthSignedMessageHash` | **1** | Low (Simple) |

---

### Contract: SafeMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `tryAdd` | **2** | Low (Simple) |
| `trySub` | **2** | Low (Simple) |
| `tryMul` | **3** | Low (Simple) |
| `tryDiv` | **2** | Low (Simple) |
| `tryMod` | **2** | Low (Simple) |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |

---

### Contract: SafeERC20
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `safeTransfer` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeApprove` | **1** | Low (Simple) |
| `safeIncreaseAllowance` | **1** | Low (Simple) |
| `safeDecreaseAllowance` | **1** | Low (Simple) |
| `_callOptionalReturn` | **2** | Low (Simple) |

---

### Contract: Address
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `isContract` | **1** | Low (Simple) |
| `sendValue` | **1** | Low (Simple) |
| `functionCall` | **1** | Low (Simple) |
| `functionCall` | **1** | Low (Simple) |
| `functionCallWithValue` | **1** | Low (Simple) |
| `functionCallWithValue` | **1** | Low (Simple) |
| `functionStaticCall` | **1** | Low (Simple) |
| `functionStaticCall` | **1** | Low (Simple) |
| `functionDelegateCall` | **1** | Low (Simple) |
| `functionDelegateCall` | **1** | Low (Simple) |
| `_verifyCallResult` | **3** | Low (Simple) |

---

### Contract: FullMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mulDiv` | **2** | Low (Simple) |
| `mulDivRoundingUp` | **2** | Low (Simple) |

---

### Contract: LowGasSafeMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `mul` | **1** | Low (Simple) |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: TickMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getSqrtRatioAtTick` | **24** | ⚠️ High (Refactor recommended) |
| `getTickAtSqrtRatio` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: OracleLibrary
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `consult` | **2** | Low (Simple) |
| `getQuoteAtTick` | **4** | Low (Simple) |

---

### Contract: PoolAddress
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getPoolKey` | **2** | Low (Simple) |
| `computeAddress` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: CreditLine
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateDefaultStrategy` | **1** | Low (Simple) |
| `_updateDefaultStrategy` | **1** | Low (Simple) |
| `updatePriceOracle` | **1** | Low (Simple) |
| `_updatePriceOracle` | **1** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `updateProtocolFeeFraction` | **1** | Low (Simple) |
| `_updateProtocolFeeFraction` | **1** | Low (Simple) |
| `updateProtocolFeeCollector` | **1** | Low (Simple) |
| `_updateProtocolFeeCollector` | **1** | Low (Simple) |
| `updateStrategyRegistry` | **1** | Low (Simple) |
| `_updateStrategyRegistry` | **1** | Low (Simple) |
| `updateLiquidatorRewardFraction` | **1** | Low (Simple) |
| `_updateLiquidatorRewardFraction` | **1** | Low (Simple) |
| `calculateInterest` | **1** | Low (Simple) |
| `calculateInterestAccrued` | **2** | Low (Simple) |
| `calculateCurrentDebt` | **1** | Low (Simple) |
| `calculateBorrowableAmount` | **3** | Low (Simple) |
| `updateinterestAccruedTillLastPrincipalUpdate` | **1** | Low (Simple) |
| `_depositCollateralFromSavingsAccount` | **5** | Moderate (Complex) |
| `request` | **2** | Low (Simple) |
| `_createRequest` | **1** | Low (Simple) |
| `accept` | **1** | Low (Simple) |
| `depositCollateral` | **1** | Low (Simple) |
| `_depositCollateral` | **3** | Low (Simple) |
| `_withdrawBorrowAmount` | **6** | Moderate (Complex) |
| `borrow` | **3** | Low (Simple) |
| `_repayFromSavingsAccount` | **6** | Moderate (Complex) |
| `_repay` | **4** | Low (Simple) |
| `repay` | **4** | Low (Simple) |
| `_resetCreditLine` | **1** | Low (Simple) |
| `close` | **1** | Low (Simple) |
| `calculateCurrentCollateralRatio` | **1** | Low (Simple) |
| `calculateTotalCollateralTokens` | **3** | Low (Simple) |
| `withdrawCollateral` | **1** | Low (Simple) |
| `withdrawableCollateral` | **2** | Low (Simple) |
| `_transferCollateral` | **6** | Moderate (Complex) |
| `liquidate` | **4** | Low (Simple) |
| `borrowTokensToLiquidate` | **1** | Low (Simple) |
| `_borrowTokensToLiquidate` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Extension
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `initializePoolExtension` | **1** | Low (Simple) |
| `closePoolExtension` | **1** | Low (Simple) |
| `removeVotes` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `initializePoolExtension` | **1** | Low (Simple) |
| `requestExtension` | **1** | Low (Simple) |
| `removeVotes` | **5** | Moderate (Complex) |
| `voteOnExtension` | **2** | Low (Simple) |
| `grantExtension` | **1** | Low (Simple) |
| `closePoolExtension` | **1** | Low (Simple) |
| `updateVotingPassRatio` | **1** | Low (Simple) |
| `_updateVotingPassRatio` | **1** | Low (Simple) |
| `updatePoolFactory` | **1** | Low (Simple) |
| `_updatePoolFactory` | **1** | Low (Simple) |

---

### Contract: Pool
**Auto-Detected Standards/Inherited Protocols:** ERC20, Pausable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getLoanStatus` | **1** | Low (Simple) |
| `depositCollateral` | **1** | Low (Simple) |
| `addCollateralInMarginCall` | **1** | Low (Simple) |
| `withdrawBorrowedAmount` | **1** | Low (Simple) |
| `borrower` | **1** | Low (Simple) |
| `getMarginCallEndTime` | **1** | Low (Simple) |
| `getBalanceDetails` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `closeLoan` | **1** | Low (Simple) |
| `__ERC20Pausable_init` | **1** | Low (Simple) |
| `__ERC20Pausable_init_unchained` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `__Pausable_init` | **1** | Low (Simple) |
| `__Pausable_init_unchained` | **1** | Low (Simple) |
| `paused` | **1** | Low (Simple) |
| `_pause` | **1** | Low (Simple) |
| `_unpause` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `__ERC20_init` | **1** | Low (Simple) |
| `__ERC20_init_unchained` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `initialize` | **2** | Low (Simple) |
| `depositCollateral` | **1** | Low (Simple) |
| `_initialDeposit` | **1** | Low (Simple) |
| `_depositCollateral` | **1** | Low (Simple) |
| `_deposit` | **2** | Low (Simple) |
| `addCollateralInMarginCall` | **2** | Low (Simple) |
| `withdrawBorrowedAmount` | **1** | Low (Simple) |
| `_withdrawAllCollateral` | **3** | Low (Simple) |
| `lend` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **6** | Moderate (Complex) |
| `_calculatePenaltyTime` | **3** | Low (Simple) |
| `cancelPool` | **3** | Low (Simple) |
| `_cancelPool` | **1** | Low (Simple) |
| `liquidateCancelPenalty` | **1** | Low (Simple) |
| `terminatePool` | **1** | Low (Simple) |
| `closeLoan` | **1** | Low (Simple) |
| `withdrawLiquidity` | **5** | Moderate (Complex) |
| `requestMarginCall` | **1** | Low (Simple) |
| `interestToPay` | **2** | Low (Simple) |
| `calculateCollateralRatio` | **1** | Low (Simple) |
| `getCurrentCollateralRatio` | **1** | Low (Simple) |
| `getCurrentCollateralRatio` | **1** | Low (Simple) |
| `liquidatePool` | **1** | Low (Simple) |
| `_withdraw` | **1** | Low (Simple) |
| `_canLenderBeLiquidated` | **1** | Low (Simple) |
| `_updateLenderSharesDuringLiquidation` | **1** | Low (Simple) |
| `_liquidateForLender` | **1** | Low (Simple) |
| `liquidateForLender` | **1** | Low (Simple) |
| `correspondingBorrowTokens` | **1** | Low (Simple) |
| `interestPerSecond` | **1** | Low (Simple) |
| `interestPerPeriod` | **1** | Low (Simple) |
| `calculateCurrentPeriod` | **1** | Low (Simple) |
| `calculateRepaymentWithdrawable` | **1** | Low (Simple) |
| `withdrawRepayment` | **1** | Low (Simple) |
| `_withdrawRepayment` | **2** | Low (Simple) |
| `getMarginCallEndTime` | **2** | Low (Simple) |
| `getBalanceDetails` | **1** | Low (Simple) |
| `getLoanStatus` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |
| `getEquivalentTokens` | **1** | Low (Simple) |
| `borrower` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |

---

### Contract: PoolFactory
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `savingsAccount` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `poolRegistry` | **1** | Low (Simple) |
| `priceOracle` | **1** | Low (Simple) |
| `extension` | **1** | Low (Simple) |
| `repaymentImpl` | **1** | Low (Simple) |
| `userRegistry` | **1** | Low (Simple) |
| `collectionPeriod` | **1** | Low (Simple) |
| `loanWithdrawalDuration` | **1** | Low (Simple) |
| `marginCallDuration` | **1** | Low (Simple) |
| `minBorrowFraction` | **1** | Low (Simple) |
| `liquidatorRewardFraction` | **1** | Low (Simple) |
| `poolCancelPenaltyMultiple` | **1** | Low (Simple) |
| `getProtocolFeeData` | **1** | Low (Simple) |
| `noStrategyAddress` | **1** | Low (Simple) |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `setImplementations` | **1** | Low (Simple) |
| `createPool` | **2** | Low (Simple) |
| `_createPool` | **2** | Low (Simple) |
| `_encodePoolInitCall` | **1** | Low (Simple) |
| `_deploy` | **1** | Low (Simple) |
| `isWithinLimits` | **4** | Low (Simple) |
| `updateSupportedBorrowTokens` | **1** | Low (Simple) |
| `_updateSupportedBorrowTokens` | **1** | Low (Simple) |
| `updateSupportedCollateralTokens` | **1** | Low (Simple) |
| `_updateSupportedCollateralTokens` | **1** | Low (Simple) |
| `updatepoolInitFuncSelector` | **1** | Low (Simple) |
| `_updatepoolInitFuncSelector` | **1** | Low (Simple) |
| `updatePoolLogic` | **1** | Low (Simple) |
| `_updatePoolLogic` | **1** | Low (Simple) |
| `updateUserRegistry` | **1** | Low (Simple) |
| `_updateUserRegistry` | **1** | Low (Simple) |
| `updateStrategyRegistry` | **1** | Low (Simple) |
| `_updateStrategyRegistry` | **1** | Low (Simple) |
| `updateRepaymentImpl` | **1** | Low (Simple) |
| `_updateRepaymentImpl` | **1** | Low (Simple) |
| `updateNoStrategy` | **1** | Low (Simple) |
| `_updateNoStrategy` | **1** | Low (Simple) |
| `updatePriceoracle` | **1** | Low (Simple) |
| `_updatePriceoracle` | **1** | Low (Simple) |
| `updatedExtension` | **1** | Low (Simple) |
| `_updatedExtension` | **1** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `updateCollectionPeriod` | **1** | Low (Simple) |
| `_updateCollectionPeriod` | **1** | Low (Simple) |
| `updateLoanWithdrawalDuration` | **1** | Low (Simple) |
| `_updateLoanWithdrawalDuration` | **1** | Low (Simple) |
| `updateMarginCallDuration` | **1** | Low (Simple) |
| `_updateMarginCallDuration` | **1** | Low (Simple) |
| `updateMinBorrowFraction` | **1** | Low (Simple) |
| `_updateMinBorrowFraction` | **1** | Low (Simple) |
| `updateLiquidatorRewardFraction` | **1** | Low (Simple) |
| `_updateLiquidatorRewardFraction` | **1** | Low (Simple) |
| `updatePoolCancelPenaltyMultiple` | **1** | Low (Simple) |
| `_updatePoolCancelPenaltyMultiple` | **1** | Low (Simple) |
| `updateProtocolFeeFraction` | **1** | Low (Simple) |
| `_updateProtocolFeeFraction` | **1** | Low (Simple) |
| `updateProtocolFeeCollector` | **1** | Low (Simple) |
| `_updateProtocolFeeCollector` | **1** | Low (Simple) |
| `updatePoolSizeLimit` | **1** | Low (Simple) |
| `updateidealCollateralRatioLimit` | **1** | Low (Simple) |
| `updateBorrowRateLimit` | **1** | Low (Simple) |
| `updateRepaymentIntervalLimit` | **1** | Low (Simple) |
| `updateNoOfRepaymentIntervalsLimit` | **1** | Low (Simple) |
| `getProtocolFeeData` | **1** | Low (Simple) |

---

### Contract: Repayments
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `initializeRepayment` | **1** | Low (Simple) |
| `getTotalRepaidAmount` | **1** | Low (Simple) |
| `getInterestCalculationVars` | **1** | Low (Simple) |
| `getCurrentLoanInterval` | **1** | Low (Simple) |
| `instalmentDeadlineExtended` | **1** | Low (Simple) |
| `didBorrowerDefault` | **1** | Low (Simple) |
| `getGracePeriodFraction` | **1** | Low (Simple) |
| `getNextInstalmentDeadline` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updatePoolFactory` | **1** | Low (Simple) |
| `_updatePoolFactory` | **1** | Low (Simple) |
| `updateGracePeriodFraction` | **1** | Low (Simple) |
| `_updateGracePeriodFraction` | **1** | Low (Simple) |
| `updateGracePenaltyRate` | **1** | Low (Simple) |
| `_updateGracePenaltyRate` | **1** | Low (Simple) |
| `initializeRepayment` | **1** | Low (Simple) |
| `getInterestPerSecond` | **1** | Low (Simple) |
| `getInstalmentsCompleted` | **1** | Low (Simple) |
| `getInterestDueTillInstalmentDeadline` | **1** | Low (Simple) |
| `getNextInstalmentDeadline` | **3** | Low (Simple) |
| `getCurrentInstalmentInterval` | **1** | Low (Simple) |
| `getCurrentLoanInterval` | **1** | Low (Simple) |
| `isGracePenaltyApplicable` | **2** | Low (Simple) |
| `didBorrowerDefault` | **2** | Low (Simple) |
| `getInterestLeft` | **1** | Low (Simple) |
| `getInterestOverdue` | **1** | Low (Simple) |
| `repay` | **1** | Low (Simple) |
| `_repayExtension` | **2** | Low (Simple) |
| `_repayGracePenalty` | **2** | Low (Simple) |
| `_repayInterest` | **2** | Low (Simple) |
| `_updateRepaidAmount` | **1** | Low (Simple) |
| `_repay` | **1** | Low (Simple) |
| `repayPrincipal` | **1** | Low (Simple) |
| `getTotalRepaidAmount` | **1** | Low (Simple) |
| `instalmentDeadlineExtended` | **1** | Low (Simple) |
| `getInterestCalculationVars` | **1** | Low (Simple) |
| `getGracePeriodFraction` | **1** | Low (Simple) |
| `_transferTokens` | **3** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: PriceOracle
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getLatestPrice` | **1** | Low (Simple) |
| `doesFeedExist` | **1** | Low (Simple) |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `getChainlinkLatestPrice` | **4** | Low (Simple) |
| `getDecimals` | **3** | Low (Simple) |
| `getUniswapLatestPrice` | **2** | Low (Simple) |
| `getUniswapPoolTokenId` | **2** | Low (Simple) |
| `getLatestPrice` | **3** | Low (Simple) |
| `doesFeedExist` | **3** | Low (Simple) |
| `setChainlinkFeedAddress` | **1** | Low (Simple) |
| `setUniswapFeedAddress` | **1** | Low (Simple) |
| `setUniswapPriceAveragingPeriod` | **1** | Low (Simple) |

---

### Contract: SublimeProxy
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `admin` | **1** | Low (Simple) |
| `implementation` | **1** | Low (Simple) |
| `changeAdmin` | **1** | Low (Simple) |
| `upgradeTo` | **1** | Low (Simple) |
| `upgradeToAndCall` | **1** | Low (Simple) |
| `_admin` | **1** | Low (Simple) |
| `_setAdmin` | **1** | Low (Simple) |
| `_beforeFallback` | **1** | Low (Simple) |
| `_implementation` | **1** | Low (Simple) |
| `_upgradeTo` | **1** | Low (Simple) |
| `_setImplementation` | **1** | Low (Simple) |
| `_delegate` | **2** | Low (Simple) |
| `_implementation` | **1** | Low (Simple) |
| `_fallback` | **1** | Low (Simple) |
| `fallback` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |
| `_beforeFallback` | **1** | Low (Simple) |

---

### Contract: SavingsAccount
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `switchStrategy` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawAll` | **1** | Low (Simple) |
| `withdrawAll` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `balanceInShares` | **1** | Low (Simple) |
| `increaseAllowanceToCreditLine` | **1** | Low (Simple) |
| `withdrawFrom` | **1** | Low (Simple) |
| `getTotalTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateCreditLine` | **1** | Low (Simple) |
| `_updateCreditLine` | **1** | Low (Simple) |
| `updateStrategyRegistry` | **1** | Low (Simple) |
| `_updateStrategyRegistry` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `_deposit` | **1** | Low (Simple) |
| `_depositToYield` | **2** | Low (Simple) |
| `switchStrategy` | **2** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawFrom` | **1** | Low (Simple) |
| `_withdraw` | **2** | Low (Simple) |
| `_transfer` | **2** | Low (Simple) |
| `withdrawAll` | **4** | Low (Simple) |
| `withdrawAll` | **2** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `increaseAllowanceToCreditLine` | **1** | Low (Simple) |
| `transfer` | **2** | Low (Simple) |
| `transferFrom` | **2** | Low (Simple) |
| `getTotalTokens` | **4** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---

### Contract: SavingsAccountUtil
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `depositFromSavingsAccount` | **2** | Low (Simple) |
| `directDeposit` | **2** | Low (Simple) |
| `directSavingsAccountDeposit` | **3** | Low (Simple) |
| `savingsAccountTransfer` | **2** | Low (Simple) |
| `withdrawFromSavingsAccount` | **2** | Low (Simple) |
| `transferTokens` | **6** | Moderate (Complex) |

---

### Contract: Verification
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `isUser` | **1** | Low (Simple) |
| `registerMasterAddress` | **1** | Low (Simple) |
| `unregisterMasterAddress` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateActivationDelay` | **1** | Low (Simple) |
| `_updateActivationDelay` | **1** | Low (Simple) |
| `addVerifier` | **1** | Low (Simple) |
| `removeVerifier` | **1** | Low (Simple) |
| `registerMasterAddress` | **2** | Low (Simple) |
| `unregisterMasterAddress` | **2** | Low (Simple) |
| `_linkAddress` | **1** | Low (Simple) |
| `requestAddressLinking` | **1** | Low (Simple) |
| `cancelAddressLinkingRequest` | **1** | Low (Simple) |
| `linkAddress` | **1** | Low (Simple) |
| `unlinkAddress` | **1** | Low (Simple) |
| `isUser` | **2** | Low (Simple) |

---

### Contract: AdminVerifier
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `registerUser` | **1** | Low (Simple) |
| `unregisterUser` | **1** | Low (Simple) |
| `updateVerification` | **1** | Low (Simple) |
| `_updateVerification` | **1** | Low (Simple) |

---

### Contract: Token
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |

---

### Contract: Controller
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setRewards` | **1** | Low (Simple) |
| `setStrategist` | **1** | Low (Simple) |
| `setSplit` | **1** | Low (Simple) |
| `setOneSplit` | **1** | Low (Simple) |
| `setGovernance` | **1** | Low (Simple) |
| `setVault` | **1** | Low (Simple) |
| `approveStrategy` | **1** | Low (Simple) |
| `revokeStrategy` | **1** | Low (Simple) |
| `setConverter` | **1** | Low (Simple) |
| `setStrategy` | **2** | Low (Simple) |
| `earn` | **2** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `withdrawAll` | **1** | Low (Simple) |
| `inCaseTokensGetStuck` | **1** | Low (Simple) |
| `inCaseStrategyTokenGetStuck` | **1** | Low (Simple) |
| `getExpectedReturn` | **1** | Low (Simple) |
| `yearn` | **3** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Strategy
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_approveAll` | **1** | Low (Simple) |
| `deposit` | **2** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawAll` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `setGovernance` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |

---

### Contract: yVault
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_burnFrom` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `balance` | **1** | Low (Simple) |
| `setMin` | **1** | Low (Simple) |
| `setGovernance` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `available` | **1** | Low (Simple) |
| `earn` | **1** | Low (Simple) |
| `depositAll` | **1** | Low (Simple) |
| `deposit` | **2** | Low (Simple) |
| `depositETH` | **2** | Low (Simple) |
| `withdrawAll` | **1** | Low (Simple) |
| `withdrawAllETH` | **1** | Low (Simple) |
| `harvest` | **1** | Low (Simple) |
| `withdraw` | **3** | Low (Simple) |
| `withdrawETH` | **3** | Low (Simple) |
| `getPricePerFullShare` | **1** | Low (Simple) |
| `receive` | **2** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: AaveYield
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `liquidityToken` | **1** | Low (Simple) |
| `lockTokens` | **1** | Low (Simple) |
| `unlockTokens` | **1** | Low (Simple) |
| `unlockShares` | **1** | Low (Simple) |
| `getTokensForShares` | **1** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `liquidityToken` | **2** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `updateAaveAddresses` | **1** | Low (Simple) |
| `_updateAaveAddresses` | **1** | Low (Simple) |
| `updateReferralCode` | **1** | Low (Simple) |
| `emergencyWithdraw` | **2** | Low (Simple) |
| `lockTokens` | **2** | Low (Simple) |
| `unlockTokens` | **2** | Low (Simple) |
| `unlockShares` | **2** | Low (Simple) |
| `getTokensForShares` | **2** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `_depositETH` | **1** | Low (Simple) |
| `_depositERC20` | **1** | Low (Simple) |
| `_withdrawETH` | **1** | Low (Simple) |
| `_withdrawERC` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---

### Contract: CompoundYield
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `liquidityToken` | **1** | Low (Simple) |
| `lockTokens` | **1** | Low (Simple) |
| `unlockTokens` | **1** | Low (Simple) |
| `unlockShares` | **1** | Low (Simple) |
| `getTokensForShares` | **1** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `updateProtocolAddresses` | **1** | Low (Simple) |
| `emergencyWithdraw` | **2** | Low (Simple) |
| `lockTokens` | **2** | Low (Simple) |
| `unlockTokens` | **2** | Low (Simple) |
| `unlockShares` | **2** | Low (Simple) |
| `getTokensForShares` | **2** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `_depositETH` | **1** | Low (Simple) |
| `_depositERC20` | **1** | Low (Simple) |
| `_withdrawETH` | **1** | Low (Simple) |
| `_withdrawERC` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---

### Contract: NoYield
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `liquidityToken` | **1** | Low (Simple) |
| `lockTokens` | **1** | Low (Simple) |
| `unlockTokens` | **1** | Low (Simple) |
| `unlockShares` | **1** | Low (Simple) |
| `getTokensForShares` | **1** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `liquidityToken` | **1** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `emergencyWithdraw` | **1** | Low (Simple) |
| `lockTokens` | **2** | Low (Simple) |
| `unlockTokens` | **1** | Low (Simple) |
| `unlockShares` | **1** | Low (Simple) |
| `_unlockTokens` | **2** | Low (Simple) |
| `getTokensForShares` | **1** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |

---

### Contract: StrategyRegistry
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `registry` | **1** | Low (Simple) |
| `getStrategies` | **1** | Low (Simple) |
| `addStrategy` | **1** | Low (Simple) |
| `removeStrategy` | **1** | Low (Simple) |
| `updateStrategy` | **1** | Low (Simple) |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateMaxStrategies` | **1** | Low (Simple) |
| `_updateMaxStrategies` | **1** | Low (Simple) |
| `getStrategies` | **1** | Low (Simple) |
| `addStrategy` | **1** | Low (Simple) |
| `removeStrategy` | **1** | Low (Simple) |
| `updateStrategy` | **1** | Low (Simple) |

---

### Contract: YearnYield
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `__Ownable_init` | **1** | Low (Simple) |
| `__Ownable_init_unchained` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `__Context_init` | **1** | Low (Simple) |
| `__Context_init_unchained` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_isConstructor` | **1** | Low (Simple) |
| `liquidityToken` | **1** | Low (Simple) |
| `lockTokens` | **1** | Low (Simple) |
| `unlockTokens` | **1** | Low (Simple) |
| `unlockShares` | **1** | Low (Simple) |
| `getTokensForShares` | **1** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `updateSavingsAccount` | **1** | Low (Simple) |
| `_updateSavingsAccount` | **1** | Low (Simple) |
| `updateProtocolAddresses` | **1** | Low (Simple) |
| `emergencyWithdraw` | **2** | Low (Simple) |
| `lockTokens` | **2** | Low (Simple) |
| `unlockTokens` | **2** | Low (Simple) |
| `unlockShares` | **2** | Low (Simple) |
| `getTokensForShares` | **2** | Low (Simple) |
| `getSharesForTokens` | **1** | Low (Simple) |
| `_depositETH` | **1** | Low (Simple) |
| `_depositERC20` | **1** | Low (Simple) |
| `_withdrawETH` | **1** | Low (Simple) |
| `_withdrawERC` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---
