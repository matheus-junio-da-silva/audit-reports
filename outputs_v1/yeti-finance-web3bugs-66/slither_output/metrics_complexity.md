# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+--------------------------------+-----------------+-----------+------------+
| Contract                       | State variables | Constants | Immutables |
+--------------------------------+-----------------+-----------+------------+
| Address                        | 0               | 0         | 0          |
| SafeERC20                      | 0               | 0         | 0          |
| YetiFinanceTreasury            | 1               | 0         | 0          |
| BorrowerOperations             | 12              | 12        | 0          |
| LiquityMath                    | 0               | 2         | 0          |
| SafeMath                       | 0               | 0         | 0          |
| TroveManager                   | 28              | 15        | 0          |
| DefaultPool                    | 7               | 2         | 0          |
| YUSDToken                      | 4               | 6         | 9          |
| TroveManagerRedemptions        | 13              | 13        | 0          |
| CollSurplusPool                | 9               | 11        | 0          |
| TroveManagerLiquidations       | 15              | 11        | 0          |
| SortedTroves                   | 4               | 1         | 0          |
| PriceFeed                      | 6               | 8         | 0          |
| TeamAllocation                 | 7               | 0         | 0          |
| Whitelist                      | 9               | 0         | 0          |
| MultiTroveGetter               | 3               | 0         | 0          |
| Migrations                     | 2               | 0         | 0          |
| ActivePool                     | 10              | 2         | 0          |
| HintHelpers                    | 5               | 11        | 0          |
| LiquitySafeMath128             | 0               | 0         | 0          |
| StabilityPool                  | 25              | 12        | 0          |
| ShortLockupContract            | 1               | 2         | 2          |
| YETIToken                      | 5               | 5         | 7          |
| TeamLockup                     | 3               | 0         | 3          |
| LockupContract                 | 1               | 2         | 2          |
| LockupContractFactory          | 2               | 2         | 0          |
| BoringERC20                    | 0               | 6         | 0          |
| BoringMath                     | 0               | 0         | 0          |
| BoringMath128                  | 0               | 0         | 0          |
| BoringMath64                   | 0               | 0         | 0          |
| BoringMath32                   | 0               | 0         | 0          |
| ERC20Data                      | 3               | 0         | 0          |
| ERC20WithSupply                | 4               | 0         | 0          |
| sYETIToken                     | 15              | 5         | 0          |
| CommunityIssuance              | 3               | 5         | 1          |
| dummyUniV2Router               | 7               | 0         | 0          |
| Domain                         | 0               | 2         | 2          |
| BoringBatchable                | 0               | 0         | 0          |
| BoringOwnable                  | 2               | 0         | 0          |
| YetiCustomBase                 | 1               | 1         | 0          |
| BaseMath                       | 0               | 1         | 0          |
| TroveManagerBase               | 3               | 10        | 0          |
| ReentrancyGuard                | 1               | 2         | 0          |
| CheckContract                  | 0               | 0         | 0          |
| HomoraMath                     | 0               | 0         | 0          |
| Ownable                        | 1               | 0         | 0          |
| LiquityBase                    | 3               | 10        | 0          |
| TellorCaller                   | 1               | 0         | 0          |
| TokenScript                    | 0               | 1         | 1          |
| BorrowerOperationsScript       | 0               | 0         | 1          |
| ETHTransferScript              | 0               | 0         | 0          |
| SYETIScript                    | 0               | 0         | 1          |
| TroveManagerScript             | 0               | 1         | 1          |
| BorrowerWrappersScript         | 0               | 1         | 7          |
| StabilityPoolScript            | 0               | 1         | 1          |
| WJLP                           | 17              | 0         | 3          |
| WBQI                           | 22              | 0         | 0          |
| WAAVE                          | 16              | 0         | 0          |
| ERC20_8                        | 6               | 0         | 0          |
| UniswapV2LPTokenPriceFeed      | 2               | 0         | 0          |
| BQIOracle                      | 3               | 0         | 0          |
| AAVEOracle                     | 3               | 0         | 0          |
| ERC20Router                    | 4               | 0         | 0          |
| WJLPRouter                     | 6               | 0         | 0          |
| Unipool                        | 9               | 1         | 0          |
| Pool2Unipool                   | 9               | 1         | 0          |
| ERC20Mock                      | 0               | 0         | 0          |
| StabilityPoolTester            | 25              | 12        | 0          |
| DefaultPoolTester              | 7               | 2         | 0          |
| BorrowerOperationsTester       | 12              | 12        | 0          |
| console                        | 0               | 1         | 0          |
| MockAggregator                 | 10              | 0         | 0          |
| LiquitySafeMath128Tester       | 0               | 0         | 0          |
| FunctionCaller                 | 6               | 0         | 0          |
| PriceFeedTestnet               | 1               | 0         | 0          |
| MockTellor                     | 4               | 0         | 0          |
| Destructible                   | 0               | 0         | 0          |
| CommunityIssuanceTester        | 3               | 5         | 1          |
| EchidnaProxy                   | 4               | 0         | 0          |
| EchidnaTester                  | 18              | 2         | 0          |
| YUSDTokenTester                | 0               | 4         | 6          |
| NonPayable                     | 1               | 0         | 0          |
| LiquityBaseTester              | 3               | 10        | 0          |
| SortedTrovesTester             | 4               | 1         | 0          |
| TroveManagerTester             | 26              | 15        | 0          |
| LiquityMathTester              | 0               | 0         | 0          |
| ActivePoolTester               | 10              | 2         | 0          |
| YETITokenTester                | 1               | 4         | 2          |
| SortedTrovesBOTester           | 12              | 12        | 0          |
| PriceFeedTester                | 6               | 8         | 0          |
| YUSDTokenCaller                | 1               | 0         | 0          |
| sYETITokenTester               | 14              | 3         | 0          |
| ERC20Token                     | 6               | 0         | 0          |
| ThreePieceWiseLinearPriceCurve | 17              | 0         | 0          |
| TOTAL                          | 504             | 258       | 50         |
+--------------------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+--------------------------------+--------+----------+----------+---------+
| Contract                       | Public | External | Internal | Private |
+--------------------------------+--------+----------+----------+---------+
| Address                        | 0      | 0        | 10       | 1       |
| SafeERC20                      | 0      | 0        | 5        | 1       |
| YetiFinanceTreasury            | 0      | 3        | 0        | 0       |
| BorrowerOperations             | 4      | 29       | 61       | 0       |
| LiquityMath                    | 0      | 0        | 7        | 0       |
| SafeMath                       | 0      | 0        | 8        | 0       |
| TroveManager                   | 12     | 112      | 47       | 0       |
| DefaultPool                    | 3      | 20       | 15       | 0       |
| YUSDToken                      | 1      | 39       | 11       | 2       |
| TroveManagerRedemptions        | 4      | 5        | 36       | 0       |
| CollSurplusPool                | 4      | 19       | 27       | 0       |
| TroveManagerLiquidations       | 4      | 4        | 33       | 0       |
| SortedTroves                   | 5      | 29       | 12       | 0       |
| PriceFeed                      | 2      | 4        | 20       | 0       |
| TeamAllocation                 | 0      | 5        | 1        | 0       |
| Whitelist                      | 3      | 39       | 3        | 0       |
| MultiTroveGetter               | 0      | 1        | 3        | 0       |
| Migrations                     | 2      | 0        | 0        | 0       |
| ActivePool                     | 4      | 25       | 19       | 0       |
| HintHelpers                    | 4      | 4        | 22       | 0       |
| LiquitySafeMath128             | 0      | 0        | 2        | 0       |
| StabilityPool                  | 9      | 30       | 51       | 0       |
| ShortLockupContract            | 0      | 1        | 4        | 0       |
| YETIToken                      | 1      | 35       | 7        | 2       |
| TeamLockup                     | 0      | 2        | 1        | 0       |
| LockupContract                 | 0      | 1        | 4        | 0       |
| LockupContractFactory          | 3      | 5        | 4        | 0       |
| BoringERC20                    | 0      | 0        | 8        | 0       |
| BoringMath                     | 0      | 0        | 6        | 0       |
| BoringMath128                  | 0      | 0        | 2        | 0       |
| BoringMath64                   | 0      | 0        | 2        | 0       |
| BoringMath32                   | 0      | 0        | 2        | 0       |
| ERC20Data                      | 0      | 0        | 0        | 0       |
| ERC20WithSupply                | 4      | 8        | 4        | 1       |
| sYETIToken                     | 10     | 15       | 9        | 1       |
| CommunityIssuance              | 2      | 6        | 5        | 0       |
| dummyUniV2Router               | 2      | 3        | 0        | 0       |
| Domain                         | 0      | 0        | 3        | 1       |
| BoringBatchable                | 1      | 1        | 1        | 0       |
| BoringOwnable                  | 2      | 0        | 0        | 0       |
| YetiCustomBase                 | 0      | 0        | 8        | 0       |
| BaseMath                       | 0      | 0        | 1        | 0       |
| TroveManagerBase               | 4      | 1        | 21       | 0       |
| ReentrancyGuard                | 0      | 0        | 1        | 0       |
| CheckContract                  | 0      | 0        | 1        | 0       |
| HomoraMath                     | 0      | 0        | 4        | 0       |
| Ownable                        | 2      | 0        | 1        | 0       |
| LiquityBase                    | 2      | 1        | 19       | 0       |
| TellorCaller                   | 0      | 2        | 0        | 0       |
| TokenScript                    | 0      | 6        | 2        | 0       |
| BorrowerOperationsScript       | 0      | 8        | 1        | 0       |
| ETHTransferScript              | 0      | 1        | 0        | 0       |
| SYETIScript                    | 0      | 1        | 1        | 0       |
| TroveManagerScript             | 0      | 1        | 2        | 0       |
| BorrowerWrappersScript         | 0      | 10       | 3        | 0       |
| StabilityPoolScript            | 0      | 2        | 2        | 0       |
| WJLP                           | 10     | 27       | 13       | 1       |
| WBQI                           | 8      | 28       | 12       | 0       |
| WAAVE                          | 9      | 28       | 9        | 0       |
| ERC20_8                        | 8      | 10       | 4        | 0       |
| UniswapV2LPTokenPriceFeed      | 2      | 3        | 1        | 0       |
| BQIOracle                      | 2      | 3        | 1        | 0       |
| AAVEOracle                     | 2      | 3        | 1        | 0       |
| ERC20Router                    | 1      | 3        | 0        | 0       |
| WJLPRouter                     | 1      | 3        | 3        | 0       |
| Unipool                        | 12     | 12       | 8        | 0       |
| Pool2Unipool                   | 12     | 13       | 8        | 0       |
| ERC20Mock                      | 15     | 6        | 8        | 0       |
| StabilityPoolTester            | 9      | 30       | 51       | 0       |
| DefaultPoolTester              | 3      | 24       | 15       | 0       |
| BorrowerOperationsTester       | 4      | 35       | 61       | 0       |
| console                        | 0      | 0        | 380      | 1       |
| MockAggregator                 | 0      | 20       | 1        | 0       |
| LiquitySafeMath128Tester       | 0      | 2        | 0        | 0       |
| FunctionCaller                 | 0      | 5        | 0        | 0       |
| PriceFeedTestnet               | 0      | 4        | 1        | 0       |
| MockTellor                     | 0      | 7        | 1        | 0       |
| Destructible                   | 0      | 2        | 0        | 0       |
| CommunityIssuanceTester        | 2      | 9        | 5        | 0       |
| EchidnaProxy                   | 0      | 19       | 0        | 0       |
| EchidnaTester                  | 0      | 0        | 2        | 0       |
| YUSDTokenTester                | 1      | 47       | 12       | 2       |
| NonPayable                     | 0      | 3        | 0        | 0       |
| LiquityBaseTester              | 2      | 9        | 20       | 0       |
| SortedTrovesTester             | 5      | 32       | 12       | 0       |
| TroveManagerTester             | 12     | 128      | 48       | 0       |
| LiquityMathTester              | 0      | 3        | 0        | 0       |
| ActivePoolTester               | 4      | 27       | 19       | 0       |
| YETITokenTester                | 1      | 40       | 7        | 2       |
| SortedTrovesBOTester           | 4      | 30       | 61       | 0       |
| PriceFeedTester                | 2      | 6        | 20       | 0       |
| YUSDTokenCaller                | 0      | 5        | 0        | 0       |
| sYETITokenTester               | 11     | 15       | 9        | 1       |
| ERC20Token                     | 10     | 0        | 0        | 0       |
| ThreePieceWiseLinearPriceCurve | 3      | 14       | 4        | 0       |
| TOTAL                          | 249    | 1133     | 1319     | 16      |
+--------------------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+--------------------------------+----------+------+------+
| Contract                       | Mutating | View | Pure |
+--------------------------------+----------+------+------+
| Address                        | 7        | 3    | 1    |
| SafeERC20                      | 6        | 0    | 0    |
| YetiFinanceTreasury            | 2        | 1    | 0    |
| BorrowerOperations             | 43       | 27   | 24   |
| LiquityMath                    | 1        | 0    | 6    |
| SafeMath                       | 0        | 0    | 8    |
| TroveManager                   | 65       | 96   | 10   |
| DefaultPool                    | 14       | 23   | 1    |
| YUSDToken                      | 25       | 27   | 1    |
| TroveManagerRedemptions        | 9        | 24   | 12   |
| CollSurplusPool                | 13       | 31   | 6    |
| TroveManagerLiquidations       | 11       | 22   | 8    |
| SortedTroves                   | 12       | 34   | 0    |
| PriceFeed                      | 8        | 14   | 4    |
| TeamAllocation                 | 5        | 1    | 0    |
| Whitelist                      | 13       | 32   | 0    |
| MultiTroveGetter               | 0        | 4    | 0    |
| Migrations                     | 2        | 0    | 0    |
| ActivePool                     | 20       | 27   | 1    |
| HintHelpers                    | 3        | 21   | 6    |
| LiquitySafeMath128             | 0        | 0    | 2    |
| StabilityPool                  | 31       | 50   | 9    |
| ShortLockupContract            | 2        | 3    | 0    |
| YETIToken                      | 19       | 25   | 1    |
| TeamLockup                     | 2        | 0    | 1    |
| LockupContract                 | 2        | 3    | 0    |
| LockupContractFactory          | 6        | 5    | 1    |
| BoringERC20                    | 3        | 4    | 1    |
| BoringMath                     | 0        | 0    | 6    |
| BoringMath128                  | 0        | 0    | 2    |
| BoringMath64                   | 0        | 0    | 2    |
| BoringMath32                   | 0        | 0    | 2    |
| ERC20Data                      | 0        | 0    | 0    |
| ERC20WithSupply                | 10       | 7    | 0    |
| sYETIToken                     | 25       | 9    | 1    |
| CommunityIssuance              | 8        | 5    | 0    |
| dummyUniV2Router               | 5        | 0    | 0    |
| Domain                         | 1        | 3    | 0    |
| BoringBatchable                | 2        | 0    | 1    |
| BoringOwnable                  | 2        | 0    | 0    |
| YetiCustomBase                 | 1        | 6    | 1    |
| BaseMath                       | 1        | 0    | 0    |
| TroveManagerBase               | 2        | 18   | 6    |
| ReentrancyGuard                | 1        | 0    | 0    |
| CheckContract                  | 0        | 1    | 0    |
| HomoraMath                     | 0        | 0    | 4    |
| Ownable                        | 1        | 2    | 0    |
| LiquityBase                    | 1        | 15   | 6    |
| TellorCaller                   | 0        | 2    | 0    |
| TokenScript                    | 6        | 2    | 0    |
| BorrowerOperationsScript       | 8        | 1    | 0    |
| ETHTransferScript              | 1        | 0    | 0    |
| SYETIScript                    | 1        | 1    | 0    |
| TroveManagerScript             | 2        | 1    | 0    |
| BorrowerWrappersScript         | 11       | 2    | 0    |
| StabilityPoolScript            | 3        | 1    | 0    |
| WJLP                           | 33       | 18   | 0    |
| WBQI                           | 32       | 16   | 0    |
| WAAVE                          | 29       | 17   | 0    |
| ERC20_8                        | 13       | 9    | 0    |
| UniswapV2LPTokenPriceFeed      | 2        | 4    | 0    |
| BQIOracle                      | 4        | 2    | 0    |
| AAVEOracle                     | 4        | 2    | 0    |
| ERC20Router                    | 4        | 0    | 0    |
| WJLPRouter                     | 7        | 0    | 0    |
| Unipool                        | 19       | 13   | 0    |
| Pool2Unipool                   | 20       | 13   | 0    |
| ERC20Mock                      | 18       | 11   | 0    |
| StabilityPoolTester            | 31       | 50   | 9    |
| DefaultPoolTester              | 16       | 25   | 1    |
| BorrowerOperationsTester       | 44       | 30   | 26   |
| console                        | 1        | 380  | 0    |
| MockAggregator                 | 11       | 10   | 0    |
| LiquitySafeMath128Tester       | 0        | 0    | 2    |
| FunctionCaller                 | 3        | 2    | 0    |
| PriceFeedTestnet               | 2        | 3    | 0    |
| MockTellor                     | 5        | 3    | 0    |
| Destructible                   | 2        | 0    | 0    |
| CommunityIssuanceTester        | 10       | 6    | 0    |
| EchidnaProxy                   | 19       | 0    | 0    |
| EchidnaTester                  | 1        | 1    | 0    |
| YUSDTokenTester                | 31       | 28   | 3    |
| NonPayable                     | 3        | 0    | 0    |
| LiquityBaseTester              | 8        | 15   | 8    |
| SortedTrovesTester             | 15       | 34   | 0    |
| TroveManagerTester             | 69       | 104  | 15   |
| LiquityMathTester              | 0        | 0    | 3    |
| ActivePoolTester               | 22       | 27   | 1    |
| YETITokenTester                | 23       | 25   | 2    |
| SortedTrovesBOTester           | 44       | 27   | 24   |
| PriceFeedTester                | 10       | 14   | 4    |
| YUSDTokenCaller                | 5        | 0    | 0    |
| sYETITokenTester               | 25       | 10   | 1    |
| ERC20Token                     | 4        | 6    | 0    |
| ThreePieceWiseLinearPriceCurve | 10       | 9    | 2    |
| TOTAL                          | 1015     | 1467 | 235  |
+--------------------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+--------------------------------+-------------------+----------------------+--------------+
| Contract                       | External mutating | No auth or onlyOwner | No modifiers |
+--------------------------------+-------------------+----------------------+--------------+
| Address                        | 0                 | 0                    | 0            |
| SafeERC20                      | 0                 | 0                    | 0            |
| YetiFinanceTreasury            | 3                 | 3                    | 1            |
| BorrowerOperations             | 29                | 29                   | 17           |
| LiquityMath                    | 0                 | 0                    | 0            |
| SafeMath                       | 0                 | 0                    | 0            |
| TroveManager                   | 112               | 112                  | 108          |
| DefaultPool                    | 20                | 20                   | 19           |
| YUSDToken                      | 39                | 39                   | 39           |
| TroveManagerRedemptions        | 5                 | 5                    | 4            |
| CollSurplusPool                | 19                | 19                   | 18           |
| TroveManagerLiquidations       | 4                 | 4                    | 3            |
| SortedTroves                   | 29                | 29                   | 28           |
| PriceFeed                      | 4                 | 4                    | 3            |
| TeamAllocation                 | 5                 | 5                    | 2            |
| Whitelist                      | 39                | 39                   | 20           |
| MultiTroveGetter               | 1                 | 1                    | 1            |
| Migrations                     | 2                 | 2                    | 0            |
| ActivePool                     | 25                | 25                   | 24           |
| HintHelpers                    | 4                 | 4                    | 3            |
| LiquitySafeMath128             | 0                 | 0                    | 0            |
| StabilityPool                  | 30                | 30                   | 29           |
| ShortLockupContract            | 1                 | 1                    | 1            |
| YETIToken                      | 35                | 35                   | 35           |
| TeamLockup                     | 2                 | 2                    | 0            |
| LockupContract                 | 1                 | 1                    | 1            |
| LockupContractFactory          | 5                 | 5                    | 4            |
| BoringERC20                    | 0                 | 0                    | 0            |
| BoringMath                     | 0                 | 0                    | 0            |
| BoringMath128                  | 0                 | 0                    | 0            |
| BoringMath64                   | 0                 | 0                    | 0            |
| BoringMath32                   | 0                 | 0                    | 0            |
| ERC20Data                      | 0                 | 0                    | 0            |
| ERC20WithSupply                | 12                | 12                   | 12           |
| sYETIToken                     | 24                | 24                   | 18           |
| CommunityIssuance              | 6                 | 6                    | 5            |
| dummyUniV2Router               | 5                 | 5                    | 3            |
| Domain                         | 0                 | 0                    | 0            |
| BoringBatchable                | 2                 | 2                    | 2            |
| BoringOwnable                  | 2                 | 2                    | 1            |
| YetiCustomBase                 | 0                 | 0                    | 0            |
| BaseMath                       | 0                 | 0                    | 0            |
| TroveManagerBase               | 1                 | 1                    | 1            |
| ReentrancyGuard                | 0                 | 0                    | 0            |
| CheckContract                  | 0                 | 0                    | 0            |
| HomoraMath                     | 0                 | 0                    | 0            |
| Ownable                        | 0                 | 0                    | 0            |
| LiquityBase                    | 1                 | 1                    | 1            |
| TellorCaller                   | 2                 | 2                    | 2            |
| TokenScript                    | 6                 | 6                    | 6            |
| BorrowerOperationsScript       | 8                 | 8                    | 8            |
| ETHTransferScript              | 1                 | 1                    | 1            |
| SYETIScript                    | 1                 | 1                    | 1            |
| TroveManagerScript             | 1                 | 1                    | 1            |
| BorrowerWrappersScript         | 10                | 10                   | 10           |
| StabilityPoolScript            | 2                 | 2                    | 2            |
| WJLP                           | 31                | 31                   | 31           |
| WBQI                           | 30                | 30                   | 30           |
| WAAVE                          | 30                | 30                   | 30           |
| ERC20_8                        | 12                | 12                   | 12           |
| UniswapV2LPTokenPriceFeed      | 3                 | 3                    | 2            |
| BQIOracle                      | 3                 | 3                    | 2            |
| AAVEOracle                     | 3                 | 3                    | 2            |
| ERC20Router                    | 4                 | 4                    | 4            |
| WJLPRouter                     | 4                 | 4                    | 4            |
| Unipool                        | 17                | 17                   | 16           |
| Pool2Unipool                   | 18                | 18                   | 16           |
| ERC20Mock                      | 15                | 15                   | 15           |
| StabilityPoolTester            | 30                | 30                   | 29           |
| DefaultPoolTester              | 24                | 24                   | 23           |
| BorrowerOperationsTester       | 35                | 35                   | 23           |
| console                        | 0                 | 0                    | 0            |
| MockAggregator                 | 20                | 20                   | 20           |
| LiquitySafeMath128Tester       | 2                 | 2                    | 2            |
| FunctionCaller                 | 5                 | 5                    | 5            |
| PriceFeedTestnet               | 4                 | 4                    | 4            |
| MockTellor                     | 7                 | 7                    | 7            |
| Destructible                   | 2                 | 2                    | 2            |
| CommunityIssuanceTester        | 9                 | 9                    | 8            |
| EchidnaProxy                   | 19                | 19                   | 19           |
| EchidnaTester                  | 0                 | 0                    | 0            |
| YUSDTokenTester                | 47                | 47                   | 47           |
| NonPayable                     | 3                 | 3                    | 3            |
| LiquityBaseTester              | 9                 | 9                    | 9            |
| SortedTrovesTester             | 32                | 32                   | 31           |
| TroveManagerTester             | 128               | 128                  | 124          |
| LiquityMathTester              | 3                 | 3                    | 3            |
| ActivePoolTester               | 27                | 27                   | 26           |
| YETITokenTester                | 40                | 40                   | 40           |
| SortedTrovesBOTester           | 30                | 30                   | 18           |
| PriceFeedTester                | 6                 | 6                    | 5            |
| YUSDTokenCaller                | 5                 | 5                    | 5            |
| sYETITokenTester               | 24                | 24                   | 18           |
| ERC20Token                     | 4                 | 4                    | 4            |
| ThreePieceWiseLinearPriceCurve | 14                | 14                   | 11           |
| TOTAL                          | 1197              | 1197                 | 1084         |
+--------------------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+--------------------------------+-----------+-----+-----+-----+-----+
| Contract                       | Ext calls | RFC | NOC | DIT | CBO |
+--------------------------------+-----------+-----+-----+-----+-----+
| Address                        | 0         | 0   | 0   | 0   | 1   |
| SafeERC20                      | 4         | 4   | 0   | 0   | 17  |
| YetiFinanceTreasury            | 1         | 4   | 0   | 0   | 1   |
| BorrowerOperations             | 151       | 159 | 2   | 3   | 14  |
| LiquityMath                    | 10        | 8   | 0   | 0   | 22  |
| SafeMath                       | 0         | 0   | 0   | 0   | 44  |
| TroveManager                   | 104       | 214 | 1   | 4   | 13  |
| DefaultPool                    | 25        | 46  | 1   | 3   | 6   |
| YUSDToken                      | 7         | 47  | 1   | 2   | 2   |
| TroveManagerRedemptions        | 118       | 109 | 0   | 4   | 12  |
| CollSurplusPool                | 36        | 57  | 0   | 3   | 8   |
| TroveManagerLiquidations       | 102       | 74  | 0   | 4   | 9   |
| SortedTroves                   | 2         | 36  | 1   | 1   | 2   |
| PriceFeed                      | 19        | 25  | 1   | 1   | 4   |
| TeamAllocation                 | 2         | 7   | 0   | 0   | 1   |
| Whitelist                      | 14        | 55  | 0   | 1   | 8   |
| MultiTroveGetter               | 13        | 12  | 0   | 0   | 3   |
| Migrations                     | 1         | 3   | 0   | 0   | 2   |
| ActivePool                     | 26        | 53  | 1   | 3   | 6   |
| HintHelpers                    | 58        | 55  | 0   | 3   | 7   |
| LiquitySafeMath128             | 0         | 0   | 0   | 0   | 3   |
| StabilityPool                  | 117       | 124 | 1   | 3   | 14  |
| ShortLockupContract            | 4         | 5   | 0   | 0   | 3   |
| YETIToken                      | 7         | 42  | 1   | 2   | 1   |
| TeamLockup                     | 6         | 7   | 0   | 0   | 2   |
| LockupContract                 | 4         | 5   | 0   | 0   | 2   |
| LockupContractFactory          | 0         | 8   | 0   | 1   | 0   |
| BoringERC20                    | 0         | 0   | 0   | 0   | 0   |
| BoringMath                     | 0         | 0   | 0   | 0   | 2   |
| BoringMath128                  | 0         | 0   | 0   | 0   | 2   |
| BoringMath64                   | 0         | 0   | 0   | 0   | 0   |
| BoringMath32                   | 0         | 0   | 0   | 0   | 0   |
| ERC20Data                      | 0         | 0   | 0   | 0   | 0   |
| ERC20WithSupply                | 0         | 12  | 0   | 2   | 0   |
| sYETIToken                     | 23        | 47  | 1   | 2   | 5   |
| CommunityIssuance              | 9         | 16  | 1   | 1   | 4   |
| dummyUniV2Router               | 3         | 8   | 0   | 2   | 2   |
| Domain                         | 0         | 0   | 3   | 0   | 0   |
| BoringBatchable                | 1         | 3   | 0   | 1   | 1   |
| BoringOwnable                  | 0         | 2   | 3   | 1   | 0   |
| YetiCustomBase                 | 12        | 10  | 18  | 1   | 2   |
| BaseMath                       | 0         | 0   | 23  | 0   | 0   |
| TroveManagerBase               | 31        | 34  | 4   | 3   | 5   |
| ReentrancyGuard                | 0         | 0   | 5   | 0   | 0   |
| CheckContract                  | 0         | 0   | 34  | 0   | 0   |
| HomoraMath                     | 4         | 4   | 0   | 0   | 2   |
| Ownable                        | 0         | 2   | 30  | 0   | 0   |
| LiquityBase                    | 31        | 32  | 13  | 2   | 5   |
| TellorCaller                   | 4         | 6   | 0   | 1   | 2   |
| TokenScript                    | 6         | 12  | 0   | 1   | 1   |
| BorrowerOperationsScript       | 8         | 16  | 1   | 1   | 1   |
| ETHTransferScript              | 0         | 1   | 1   | 0   | 0   |
| SYETIScript                    | 1         | 2   | 1   | 1   | 1   |
| TroveManagerScript             | 1         | 2   | 0   | 1   | 1   |
| BorrowerWrappersScript         | 10        | 20  | 0   | 2   | 3   |
| StabilityPoolScript            | 2         | 4   | 0   | 1   | 1   |
| WJLP                           | 14        | 50  | 0   | 2   | 3   |
| WBQI                           | 10        | 43  | 0   | 2   | 2   |
| WAAVE                          | 4         | 41  | 0   | 2   | 1   |
| ERC20_8                        | 0         | 18  | 3   | 1   | 0   |
| UniswapV2LPTokenPriceFeed      | 16        | 14  | 0   | 1   | 4   |
| BQIOracle                      | 4         | 9   | 0   | 1   | 2   |
| AAVEOracle                     | 4         | 9   | 0   | 1   | 2   |
| ERC20Router                    | 6         | 10  | 0   | 1   | 2   |
| WJLPRouter                     | 7         | 10  | 0   | 1   | 4   |
| Unipool                        | 23        | 44  | 0   | 2   | 4   |
| Pool2Unipool                   | 24        | 45  | 0   | 2   | 4   |
| ERC20Mock                      | 9         | 28  | 0   | 2   | 1   |
| StabilityPoolTester            | 117       | 124 | 0   | 4   | 12  |
| DefaultPoolTester              | 27        | 52  | 0   | 4   | 5   |
| BorrowerOperationsTester       | 151       | 165 | 0   | 4   | 12  |
| console                        | 0         | 0   | 0   | 0   | 0   |
| MockAggregator                 | 0         | 20  | 0   | 1   | 0   |
| LiquitySafeMath128Tester       | 2         | 4   | 0   | 0   | 1   |
| FunctionCaller                 | 2         | 7   | 0   | 0   | 2   |
| PriceFeedTestnet               | 0         | 4   | 0   | 1   | 1   |
| MockTellor                     | 0         | 7   | 0   | 0   | 0   |
| Destructible                   | 0         | 2   | 0   | 0   | 0   |
| CommunityIssuanceTester        | 13        | 23  | 0   | 2   | 4   |
| EchidnaProxy                   | 18        | 37  | 0   | 0   | 4   |
| EchidnaTester                  | 2         | 2   | 0   | 0   | 10  |
| YUSDTokenTester                | 7         | 55  | 0   | 3   | 1   |
| NonPayable                     | 0         | 3   | 0   | 0   | 0   |
| LiquityBaseTester              | 31        | 40  | 0   | 3   | 5   |
| SortedTrovesTester             | 2         | 39  | 0   | 2   | 1   |
| TroveManagerTester             | 107       | 233 | 0   | 5   | 10  |
| LiquityMathTester              | 3         | 6   | 0   | 0   | 1   |
| ActivePoolTester               | 27        | 56  | 0   | 4   | 5   |
| YETITokenTester                | 7         | 47  | 0   | 3   | 1   |
| SortedTrovesBOTester           | 151       | 160 | 0   | 4   | 12  |
| PriceFeedTester                | 19        | 27  | 0   | 2   | 4   |
| YUSDTokenCaller                | 4         | 9   | 0   | 0   | 1   |
| sYETITokenTester               | 23        | 48  | 0   | 3   | 5   |
| ERC20Token                     | 6         | 15  | 0   | 0   | 1   |
| ThreePieceWiseLinearPriceCurve | 43        | 32  | 0   | 1   | 1   |
+--------------------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics
Error executing: encode_ir_for_halstead: REF_0 -> CODESIZE account

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+--------------------------------+------------+--------------+-------------+-----------------------------+
| Contract                       | Dependents | Dependencies | Instability | Distance from main sequence |
+--------------------------------+------------+--------------+-------------+-----------------------------+
| Address                        | 1          | 0            | 0.00        | 0.00                        |
| SafeERC20                      | 15         | 2            | 0.12        | 0.12                        |
| YetiFinanceTreasury            | 0          | 1            | 1.00        | 1.00                        |
| BorrowerOperations             | 2          | 12           | 0.86        | 0.86                        |
| LiquityMath                    | 21         | 1            | 0.05        | 0.05                        |
| SafeMath                       | 44         | 0            | 0.00        | 0.00                        |
| TroveManager                   | 3          | 10           | 0.77        | 0.77                        |
| DefaultPool                    | 1          | 5            | 0.83        | 0.83                        |
| YUSDToken                      | 1          | 1            | 0.50        | 0.50                        |
| TroveManagerRedemptions        | 0          | 12           | 1.00        | 1.00                        |
| CollSurplusPool                | 1          | 7            | 0.88        | 0.88                        |
| TroveManagerLiquidations       | 0          | 9            | 1.00        | 1.00                        |
| SortedTroves                   | 1          | 1            | 0.50        | 0.50                        |
| PriceFeed                      | 0          | 4            | 1.00        | 1.00                        |
| TeamAllocation                 | 0          | 1            | 1.00        | 1.00                        |
| Whitelist                      | 1          | 7            | 0.88        | 0.88                        |
| MultiTroveGetter               | 0          | 3            | 1.00        | 1.00                        |
| Migrations                     | 1          | 1            | 0.50        | 0.50                        |
| ActivePool                     | 1          | 5            | 0.83        | 0.83                        |
| HintHelpers                    | 0          | 7            | 1.00        | 1.00                        |
| LiquitySafeMath128             | 3          | 0            | 0.00        | 0.00                        |
| StabilityPool                  | 2          | 12           | 0.86        | 0.86                        |
| ShortLockupContract            | 0          | 3            | 1.00        | 1.00                        |
| YETIToken                      | 0          | 1            | 1.00        | 1.00                        |
| TeamLockup                     | 0          | 2            | 1.00        | 1.00                        |
| LockupContract                 | 0          | 2            | 1.00        | 1.00                        |
| LockupContractFactory          | 0          | 0            | 0.00        | 0.00                        |
| BoringERC20                    | 0          | 0            | 0.00        | 0.00                        |
| BoringMath                     | 2          | 0            | 0.00        | 0.00                        |
| BoringMath128                  | 2          | 0            | 0.00        | 0.00                        |
| BoringMath64                   | 0          | 0            | 0.00        | 0.00                        |
| BoringMath32                   | 0          | 0            | 0.00        | 0.00                        |
| ERC20Data                      | 0          | 0            | 0.00        | 0.00                        |
| ERC20WithSupply                | 0          | 0            | 0.00        | 0.00                        |
| sYETIToken                     | 0          | 5            | 1.00        | 1.00                        |
| CommunityIssuance              | 0          | 4            | 1.00        | 1.00                        |
| dummyUniV2Router               | 0          | 2            | 1.00        | 1.00                        |
| Domain                         | 0          | 0            | 0.00        | 0.00                        |
| BoringBatchable                | 0          | 1            | 1.00        | 1.00                        |
| BoringOwnable                  | 0          | 0            | 0.00        | 0.00                        |
| YetiCustomBase                 | 0          | 2            | 1.00        | 1.00                        |
| BaseMath                       | 0          | 0            | 0.00        | 0.00                        |
| TroveManagerBase               | 0          | 5            | 1.00        | 1.00                        |
| ReentrancyGuard                | 0          | 0            | 0.00        | 0.00                        |
| CheckContract                  | 0          | 0            | 0.00        | 0.00                        |
| HomoraMath                     | 1          | 1            | 0.50        | 0.50                        |
| Ownable                        | 0          | 0            | 0.00        | 0.00                        |
| LiquityBase                    | 0          | 5            | 1.00        | 1.00                        |
| TellorCaller                   | 0          | 2            | 1.00        | 1.00                        |
| TokenScript                    | 0          | 1            | 1.00        | 1.00                        |
| BorrowerOperationsScript       | 0          | 1            | 1.00        | 1.00                        |
| ETHTransferScript              | 0          | 0            | 0.00        | 0.00                        |
| SYETIScript                    | 0          | 1            | 1.00        | 1.00                        |
| TroveManagerScript             | 0          | 1            | 1.00        | 1.00                        |
| BorrowerWrappersScript         | 0          | 3            | 1.00        | 1.00                        |
| StabilityPoolScript            | 0          | 1            | 1.00        | 1.00                        |
| WJLP                           | 0          | 3            | 1.00        | 1.00                        |
| WBQI                           | 0          | 2            | 1.00        | 1.00                        |
| WAAVE                          | 0          | 1            | 1.00        | 1.00                        |
| ERC20_8                        | 0          | 0            | 0.00        | 0.00                        |
| UniswapV2LPTokenPriceFeed      | 0          | 4            | 1.00        | 1.00                        |
| BQIOracle                      | 0          | 2            | 1.00        | 1.00                        |
| AAVEOracle                     | 0          | 2            | 1.00        | 1.00                        |
| ERC20Router                    | 0          | 2            | 1.00        | 1.00                        |
| WJLPRouter                     | 0          | 4            | 1.00        | 1.00                        |
| Unipool                        | 0          | 4            | 1.00        | 1.00                        |
| Pool2Unipool                   | 0          | 4            | 1.00        | 1.00                        |
| ERC20Mock                      | 0          | 1            | 1.00        | 1.00                        |
| StabilityPoolTester            | 0          | 12           | 1.00        | 1.00                        |
| DefaultPoolTester              | 0          | 5            | 1.00        | 1.00                        |
| BorrowerOperationsTester       | 0          | 12           | 1.00        | 1.00                        |
| console                        | 0          | 0            | 0.00        | 0.00                        |
| MockAggregator                 | 0          | 0            | 0.00        | 0.00                        |
| LiquitySafeMath128Tester       | 0          | 1            | 1.00        | 1.00                        |
| FunctionCaller                 | 0          | 2            | 1.00        | 1.00                        |
| PriceFeedTestnet               | 1          | 0            | 0.00        | 0.00                        |
| MockTellor                     | 0          | 0            | 0.00        | 0.00                        |
| Destructible                   | 0          | 0            | 0.00        | 0.00                        |
| CommunityIssuanceTester        | 0          | 4            | 1.00        | 1.00                        |
| EchidnaProxy                   | 0          | 4            | 1.00        | 1.00                        |
| EchidnaTester                  | 0          | 10           | 1.00        | 1.00                        |
| YUSDTokenTester                | 0          | 1            | 1.00        | 1.00                        |
| NonPayable                     | 0          | 0            | 0.00        | 0.00                        |
| LiquityBaseTester              | 0          | 5            | 1.00        | 1.00                        |
| SortedTrovesTester             | 0          | 1            | 1.00        | 1.00                        |
| TroveManagerTester             | 0          | 10           | 1.00        | 1.00                        |
| LiquityMathTester              | 0          | 1            | 1.00        | 1.00                        |
| ActivePoolTester               | 0          | 5            | 1.00        | 1.00                        |
| YETITokenTester                | 0          | 1            | 1.00        | 1.00                        |
| SortedTrovesBOTester           | 0          | 12           | 1.00        | 1.00                        |
| PriceFeedTester                | 0          | 4            | 1.00        | 1.00                        |
| YUSDTokenCaller                | 0          | 1            | 1.00        | 1.00                        |
| sYETITokenTester               | 0          | 5            | 1.00        | 1.00                        |
| ERC20Token                     | 0          | 1            | 1.00        | 1.00                        |
| ThreePieceWiseLinearPriceCurve | 0          | 1            | 1.00        | 1.00                        |
+--------------------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 415 | 0   | 0    |
| sloc  | 157 | 0   | 0    |
| cloc  | 209 | 0   | 0    |
| Total | 781 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3226 | 0   | 0    |
| sloc  | 1879 | 0   | 0    |
| cloc  | 784  | 0   | 0    |
| Total | 5889 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2741 | 0   | 0    |
| sloc  | 1453 | 0   | 0    |
| cloc  | 735  | 0   | 0    |
| Total | 4929 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1189 | 0   | 0    |
| sloc  | 584  | 0   | 0    |
| cloc  | 429  | 0   | 0    |
| Total | 2202 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 675  | 0   | 0    |
| sloc  | 312  | 0   | 0    |
| cloc  | 256  | 0   | 0    |
| Total | 1243 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2776 | 0   | 0    |
| sloc  | 1457 | 0   | 0    |
| cloc  | 815  | 0   | 0    |
| Total | 5048 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1215 | 0   | 0    |
| sloc  | 641  | 0   | 0    |
| cloc  | 336  | 0   | 0    |
| Total | 2192 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2621 | 0   | 0    |
| sloc  | 1492 | 0   | 0    |
| cloc  | 636  | 0   | 0    |
| Total | 4749 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 743  | 0   | 0    |
| sloc  | 322  | 0   | 0    |
| cloc  | 313  | 0   | 0    |
| Total | 1378 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1203 | 0   | 0    |
| sloc  | 591  | 0   | 0    |
| cloc  | 407  | 0   | 0    |
| Total | 2201 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 470 | 0   | 0    |
| sloc  | 196 | 0   | 0    |
| cloc  | 209 | 0   | 0    |
| Total | 875 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3747 | 0   | 0    |
| sloc  | 2070 | 0   | 0    |
| cloc  | 969  | 0   | 0    |
| Total | 6786 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 18  | 0   | 0    |
| sloc  | 3   | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 33  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 25  | 0   | 0    |
| sloc  | 18  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 44  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1255 | 0   | 0    |
| sloc  | 639  | 0   | 0    |
| cloc  | 430  | 0   | 0    |
| Total | 2324 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1749 | 0   | 0    |
| sloc  | 826  | 0   | 0    |
| cloc  | 561  | 0   | 0    |
| Total | 3136 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3188 | 0   | 0    |
| sloc  | 1583 | 0   | 0    |
| cloc  | 1033 | 0   | 0    |
| Total | 5804 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 9   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 16  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 686  | 0   | 0    |
| sloc  | 231  | 0   | 0    |
| cloc  | 373  | 0   | 0    |
| Total | 1290 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 593  | 0   | 0    |
| sloc  | 237  | 0   | 0    |
| cloc  | 257  | 0   | 0    |
| Total | 1087 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 311 | 0   | 0    |
| sloc  | 100 | 0   | 0    |
| cloc  | 170 | 0   | 0    |
| Total | 581 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 577  | 0   | 0    |
| sloc  | 194  | 0   | 0    |
| cloc  | 291  | 0   | 0    |
| Total | 1062 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 400 | 0   | 0    |
| sloc  | 117 | 0   | 0    |
| cloc  | 229 | 0   | 0    |
| Total | 746 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 807  | 0   | 0    |
| sloc  | 524  | 0   | 0    |
| cloc  | 176  | 0   | 0    |
| Total | 1507 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 945  | 0   | 0    |
| sloc  | 345  | 0   | 0    |
| cloc  | 466  | 0   | 0    |
| Total | 1756 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 149 | 0   | 0    |
| sloc  | 97  | 0   | 0    |
| cloc  | 26  | 0   | 0    |
| Total | 272 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 53  | 0   | 0    |
| sloc  | 34  | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 99  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 66  | 0   | 0    |
| sloc  | 48  | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 120 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 234 | 0   | 0    |
| sloc  | 152 | 0   | 0    |
| cloc  | 51  | 0   | 0    |
| Total | 437 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 91  | 0   | 0    |
| sloc  | 53  | 0   | 0    |
| cloc  | 24  | 0   | 0    |
| Total | 168 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 124 | 0   | 0    |
| sloc  | 80  | 0   | 0    |
| cloc  | 28  | 0   | 0    |
| Total | 232 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 64  | 0   | 0    |
| sloc  | 37  | 0   | 0    |
| cloc  | 17  | 0   | 0    |
| Total | 118 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 28  | 0   | 0    |
| sloc  | 19  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 49  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 486 | 0   | 0    |
| sloc  | 239 | 0   | 0    |
| cloc  | 185 | 0   | 0    |
| Total | 910 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 7   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 12  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1707 | 0   | 0    |
| sloc  | 813  | 0   | 0    |
| cloc  | 538  | 0   | 0    |
| Total | 3058 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 372 | 0   | 0    |
| sloc  | 130 | 0   | 0    |
| cloc  | 204 | 0   | 0    |
| Total | 706 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 161 | 0   | 0    |
| sloc  | 39  | 0   | 0    |
| cloc  | 108 | 0   | 0    |
| Total | 308 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 63  | 0   | 0    |
| sloc  | 15  | 0   | 0    |
| cloc  | 39  | 0   | 0    |
| Total | 117 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1450 | 0   | 0    |
| sloc  | 748  | 0   | 0    |
| cloc  | 460  | 0   | 0    |
| Total | 2658 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 19  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 34  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 229 | 0   | 0    |
| sloc  | 94  | 0   | 0    |
| cloc  | 111 | 0   | 0    |
| Total | 434 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 66  | 0   | 0    |
| sloc  | 23  | 0   | 0    |
| cloc  | 35  | 0   | 0    |
| Total | 124 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 851  | 0   | 0    |
| sloc  | 437  | 0   | 0    |
| cloc  | 250  | 0   | 0    |
| Total | 1538 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 21  | 0   | 0    |
| sloc  | 13  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 36  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 189 | 0   | 0    |
| sloc  | 58  | 0   | 0    |
| cloc  | 113 | 0   | 0    |
| Total | 360 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 766  | 0   | 0    |
| sloc  | 257  | 0   | 0    |
| cloc  | 435  | 0   | 0    |
| Total | 1458 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 36  | 0   | 0    |
| sloc  | 26  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 67  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 255 | 0   | 0    |
| sloc  | 86  | 0   | 0    |
| cloc  | 138 | 0   | 0    |
| Total | 479 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 147 | 0   | 0    |
| sloc  | 54  | 0   | 0    |
| cloc  | 67  | 0   | 0    |
| Total | 268 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 189 | 0   | 0    |
| sloc  | 141 | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 342 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 11  | 0   | 0    |
| sloc  | 7   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 19  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 122 | 0   | 0    |
| sloc  | 40  | 0   | 0    |
| cloc  | 61  | 0   | 0    |
| Total | 223 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 832  | 0   | 0    |
| sloc  | 333  | 0   | 0    |
| cloc  | 314  | 0   | 0    |
| Total | 1479 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1404 | 0   | 0    |
| sloc  | 590  | 0   | 0    |
| cloc  | 550  | 0   | 0    |
| Total | 2544 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 252 | 0   | 0    |
| sloc  | 85  | 0   | 0    |
| cloc  | 122 | 0   | 0    |
| Total | 459 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 403 | 0   | 0    |
| sloc  | 155 | 0   | 0    |
| cloc  | 211 | 0   | 0    |
| Total | 769 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 971  | 0   | 0    |
| sloc  | 471  | 0   | 0    |
| cloc  | 350  | 0   | 0    |
| Total | 1792 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 551 | 0   | 0    |
| sloc  | 286 | 0   | 0    |
| cloc  | 153 | 0   | 0    |
| Total | 990 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 222 | 0   | 0    |
| sloc  | 81  | 0   | 0    |
| cloc  | 123 | 0   | 0    |
| Total | 426 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 456 | 0   | 0    |
| sloc  | 211 | 0   | 0    |
| cloc  | 142 | 0   | 0    |
| Total | 809 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 227 | 0   | 0    |
| sloc  | 89  | 0   | 0    |
| cloc  | 98  | 0   | 0    |
| Total | 414 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 94  | 0   | 0    |
| sloc  | 23  | 0   | 0    |
| cloc  | 58  | 0   | 0    |
| Total | 175 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 24  | 0   | 0    |
| sloc  | 11  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 37  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 118 | 0   | 0    |
| sloc  | 37  | 0   | 0    |
| cloc  | 62  | 0   | 0    |
| Total | 217 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 20  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 36  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 461 | 0   | 0    |
| sloc  | 220 | 0   | 0    |
| cloc  | 161 | 0   | 0    |
| Total | 842 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 272 | 0   | 0    |
| sloc  | 91  | 0   | 0    |
| cloc  | 147 | 0   | 0    |
| Total | 510 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 271 | 0   | 0    |
| sloc  | 90  | 0   | 0    |
| cloc  | 147 | 0   | 0    |
| Total | 508 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 32  | 0   | 0    |
| sloc  | 25  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 58  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 14  | 0   | 0    |
| sloc  | 5   | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 23  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 22  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 34  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 83  | 0   | 0    |
| sloc  | 18  | 0   | 0    |
| cloc  | 54  | 0   | 0    |
| Total | 155 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 72  | 0   | 0    |
| sloc  | 40  | 0   | 0    |
| cloc  | 8   | 0   | 0    |
| Total | 120 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 100 | 0   | 0    |
| sloc  | 67  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 169 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 171 | 0   | 0    |
| sloc  | 38  | 0   | 0    |
| cloc  | 108 | 0   | 0    |
| Total | 317 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 13  | 0   | 0    |
| sloc  | 5   | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 20  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 207 | 0   | 0    |
| sloc  | 59  | 0   | 0    |
| cloc  | 115 | 0   | 0    |
| Total | 381 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 20  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 32  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 773  | 0   | 0    |
| sloc  | 294  | 0   | 0    |
| cloc  | 305  | 0   | 0    |
| Total | 1372 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 8   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 13  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 42  | 0   | 0    |
| sloc  | 22  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 69  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 19  | 0   | 0    |
| sloc  | 8   | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 30  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 545  | 0   | 0    |
| sloc  | 186  | 0   | 0    |
| cloc  | 306  | 0   | 0    |
| Total | 1037 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 35  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 16  | 0   | 0    |
| Total | 61  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 58  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 45  | 0   | 0    |
| Total | 112 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 106 | 0   | 0    |
| sloc  | 82  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 192 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 12  | 0   | 0    |
| sloc  | 5   | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 21  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 25  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 40  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 19  | 0   | 0    |
| sloc  | 5   | 0   | 0    |
| cloc  | 10  | 0   | 0    |
| Total | 34  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 7   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 12  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 18  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 34  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 48  | 0   | 0    |
| sloc  | 23  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 75  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 10  | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 17  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 158 | 0   | 0    |
| sloc  | 32  | 0   | 0    |
| cloc  | 106 | 0   | 0    |
| Total | 296 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 7   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 12  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 536 | 0   | 0    |
| sloc  | 267 | 0   | 0    |
| cloc  | 189 | 0   | 0    |
| Total | 992 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 86  | 0   | 0    |
| sloc  | 16  | 0   | 0    |
| cloc  | 60  | 0   | 0    |
| Total | 162 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 7   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 12  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 41  | 0   | 0    |
| sloc  | 27  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 71  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 60  | 0   | 0    |
| sloc  | 32  | 0   | 0    |
| cloc  | 8   | 0   | 0    |
| Total | 100 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 801  | 0   | 0    |
| sloc  | 407  | 0   | 0    |
| cloc  | 272  | 0   | 0    |
| Total | 1480 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 413 | 0   | 0    |
| sloc  | 149 | 0   | 0    |
| cloc  | 209 | 0   | 0    |
| Total | 771 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1007 | 0   | 0    |
| sloc  | 397  | 0   | 0    |
| cloc  | 469  | 0   | 0    |
| Total | 1873 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1024 | 0   | 0    |
| sloc  | 404  | 0   | 0    |
| cloc  | 478  | 0   | 0    |
| Total | 1906 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 487 | 0   | 0    |
| sloc  | 139 | 0   | 0    |
| cloc  | 299 | 0   | 0    |
| Total | 925 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 165 | 0   | 0    |
| sloc  | 50  | 0   | 0    |
| cloc  | 100 | 0   | 0    |
| Total | 315 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 11  | 0   | 0    |
| sloc  | 7   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 19  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 14  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 25  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 601  | 0   | 0    |
| sloc  | 173  | 0   | 0    |
| cloc  | 362  | 0   | 0    |
| Total | 1136 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3201 | 0   | 0    |
| sloc  | 1587 | 0   | 0    |
| cloc  | 1037 | 0   | 0    |
| Total | 5825 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1214 | 0   | 0    |
| sloc  | 599  | 0   | 0    |
| cloc  | 432  | 0   | 0    |
| Total | 2245 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3284 | 0   | 0    |
| sloc  | 1922 | 0   | 0    |
| cloc  | 788  | 0   | 0    |
| Total | 5994 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1682 | 0   | 0    |
| sloc  | 1259 | 0   | 0    |
| cloc  | 10   | 0   | 0    |
| Total | 2951 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 40  | 0   | 0    |
| sloc  | 24  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 68  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1125 | 0   | 0    |
| sloc  | 434  | 0   | 0    |
| cloc  | 452  | 0   | 0    |
| Total | 2011 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 52  | 0   | 0    |
| sloc  | 20  | 0   | 0    |
| cloc  | 18  | 0   | 0    |
| Total | 90  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 51  | 0   | 0    |
| sloc  | 29  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 84  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 12  | 0   | 0    |
| sloc  | 7   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 20  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 970  | 0   | 0    |
| sloc  | 361  | 0   | 0    |
| cloc  | 468  | 0   | 0    |
| Total | 1799 | 0   | 0    |
+-------+------+-----+------+

+-------+-------+-----+------+
|       | src   | dep | test |
+-------+-------+-----+------+
| loc   | 10076 | 0   | 0    |
| sloc  | 6015  | 0   | 0    |
| cloc  | 2456  | 0   | 0    |
| Total | 18547 | 0   | 0    |
+-------+-------+-----+------+

+-------+-------+-----+------+
|       | src   | dep | test |
+-------+-------+-----+------+
| loc   | 6283  | 0   | 0    |
| sloc  | 3703  | 0   | 0    |
| cloc  | 1502  | 0   | 0    |
| Total | 11488 | 0   | 0    |
+-------+-------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 745  | 0   | 0    |
| sloc  | 359  | 0   | 0    |
| cloc  | 262  | 0   | 0    |
| Total | 1366 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 23  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 39  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 933  | 0   | 0    |
| sloc  | 497  | 0   | 0    |
| cloc  | 259  | 0   | 0    |
| Total | 1689 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 773  | 0   | 0    |
| sloc  | 339  | 0   | 0    |
| cloc  | 317  | 0   | 0    |
| Total | 1429 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2864 | 0   | 0    |
| sloc  | 1530 | 0   | 0    |
| cloc  | 753  | 0   | 0    |
| Total | 5147 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 279 | 0   | 0    |
| sloc  | 99  | 0   | 0    |
| cloc  | 142 | 0   | 0    |
| Total | 520 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1272 | 0   | 0    |
| sloc  | 648  | 0   | 0    |
| cloc  | 433  | 0   | 0    |
| Total | 2353 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 640  | 0   | 0    |
| sloc  | 272  | 0   | 0    |
| cloc  | 260  | 0   | 0    |
| Total | 1172 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3240 | 0   | 0    |
| sloc  | 1886 | 0   | 0    |
| cloc  | 787  | 0   | 0    |
| Total | 5913 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1219 | 0   | 0    |
| sloc  | 601  | 0   | 0    |
| cloc  | 408  | 0   | 0    |
| Total | 2228 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 200 | 0   | 0    |
| sloc  | 58  | 0   | 0    |
| cloc  | 109 | 0   | 0    |
| Total | 367 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 819  | 0   | 0    |
| sloc  | 532  | 0   | 0    |
| cloc  | 177  | 0   | 0    |
| Total | 1528 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 288 | 0   | 0    |
| sloc  | 100 | 0   | 0    |
| cloc  | 147 | 0   | 0    |
| Total | 535 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 457 | 0   | 0    |
| sloc  | 202 | 0   | 0    |
| cloc  | 201 | 0   | 0    |
| Total | 860 | 0   | 0    |
+-------+-----+-----+------+
```

## Function Complexity & Standards Checks
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

### Contract: YetiFinanceTreasury
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `sendToken` | **1** | Low (Simple) |
| `updateTeamWallet` | **1** | Low (Simple) |
| `getTeamWallet` | **1** | Low (Simple) |

---

### Contract: BorrowerOperations
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **1** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **3** | Low (Simple) |
| `_singleLeverUp` | **1** | Low (Simple) |
| `_openTroveInternal` | **3** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **3** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `_adjustTrove` | **9** | Moderate (Complex) |
| `_singleUnleverUp` | **1** | Low (Simple) |
| `_unleverColls` | **3** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `_closeTrove` | **3** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `_getTotalVariableDepositFee` | **4** | Low (Simple) |
| `_transferCollateralsIntoActivePool` | **2** | Low (Simple) |
| `_singleTransferCollateralIntoActivePool` | **2** | Low (Simple) |
| `_triggerBorrowingFee` | **1** | Low (Simple) |
| `_triggerDepositFee` | **1** | Low (Simple) |
| `_updateTroveFromAdjustment` | **3** | Low (Simple) |
| `_getNewPortfolio` | **1** | Low (Simple) |
| `_moveYUSD` | **2** | Low (Simple) |
| `_withdrawYUSD` | **1** | Low (Simple) |
| `_repayYUSD` | **1** | Low (Simple) |
| `_requireValidDepositCollateral` | **2** | Low (Simple) |
| `_requireNonZeroAdjustment` | **1** | Low (Simple) |
| `_arrayIsNonzero` | **3** | Low (Simple) |
| `_isBeforeFeeBootstrapPeriod` | **1** | Low (Simple) |
| `_requireTroveisActive` | **1** | Low (Simple) |
| `_requireTroveisNotActive` | **1** | Low (Simple) |
| `_requireNonZeroDebtChange` | **1** | Low (Simple) |
| `_requireNoOverlapColls` | **3** | Low (Simple) |
| `_requireNoDuplicateColls` | **3** | Low (Simple) |
| `_requireNotInRecoveryMode` | **1** | Low (Simple) |
| `_requireNoCollWithdrawal` | **1** | Low (Simple) |
| `_requireLengthNonzero` | **1** | Low (Simple) |
| `_requireLengthsEqual` | **1** | Low (Simple) |
| `_requireValidAdjustmentInCurrentMode` | **3** | Low (Simple) |
| `_requireICRisAboveMCR` | **1** | Low (Simple) |
| `_requireICRisAboveCCR` | **1** | Low (Simple) |
| `_requireNewICRisAboveOldICR` | **1** | Low (Simple) |
| `_requireNewTCRisAboveCCR` | **1** | Low (Simple) |
| `_requireAtLeastMinNetDebt` | **1** | Low (Simple) |
| `_requireValidYUSDRepayment` | **1** | Low (Simple) |
| `_requireSufficientYUSDBalance` | **1** | Low (Simple) |
| `_requireValidMaxFeePercentage` | **2** | Low (Simple) |
| `_getNewICRFromTroveChange` | **2** | Low (Simple) |
| `_getNewTCRFromTroveChange` | **3** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LiquityMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_min` | **2** | Low (Simple) |
| `_max` | **2** | Low (Simple) |
| `decMul` | **1** | Low (Simple) |
| `_decPow` | **5** | Moderate (Complex) |
| `_getAbsoluteDifference` | **2** | Low (Simple) |
| `_computeCR` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SafeMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |

---

### Contract: TroveManager
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `stabilityPool` | **1** | Low (Simple) |
| `yusdToken` | **1** | Low (Simple) |
| `yetiToken` | **1** | Low (Simple) |
| `sYETI` | **1** | Low (Simple) |
| `getTroveOwnersCount` | **1** | Low (Simple) |
| `getTroveFromTroveOwnersArray` | **1** | Low (Simple) |
| `getCurrentICR` | **1** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `batchLiquidateTroves` | **1** | Low (Simple) |
| `redeemCollateral` | **1** | Low (Simple) |
| `updateStakeAndTotalStakes` | **1** | Low (Simple) |
| `updateTroveCollTMR` | **1** | Low (Simple) |
| `updateTroveRewardSnapshots` | **1** | Low (Simple) |
| `addTroveOwnerToArray` | **1** | Low (Simple) |
| `applyPendingRewards` | **1** | Low (Simple) |
| `getPendingCollRewards` | **1** | Low (Simple) |
| `getPendingYUSDDebtReward` | **1** | Low (Simple) |
| `hasPendingRewards` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `removeStake` | **1** | Low (Simple) |
| `removeStakeTMR` | **1** | Low (Simple) |
| `updateTroveDebt` | **1** | Low (Simple) |
| `getRedemptionRate` | **1** | Low (Simple) |
| `getRedemptionRateWithDecay` | **1** | Low (Simple) |
| `getRedemptionFeeWithDecay` | **1** | Low (Simple) |
| `getBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingRateWithDecay` | **1** | Low (Simple) |
| `getBorrowingFee` | **1** | Low (Simple) |
| `getBorrowingFeeWithDecay` | **1** | Low (Simple) |
| `decayBaseRateFromBorrowing` | **1** | Low (Simple) |
| `getTroveStatus` | **1** | Low (Simple) |
| `isTroveActive` | **1** | Low (Simple) |
| `getTroveStake` | **1** | Low (Simple) |
| `getTotalStake` | **1** | Low (Simple) |
| `getTroveDebt` | **1** | Low (Simple) |
| `getL_Coll` | **1** | Low (Simple) |
| `getL_YUSD` | **1** | Low (Simple) |
| `getRewardSnapshotColl` | **1** | Low (Simple) |
| `getRewardSnapshotYUSD` | **1** | Low (Simple) |
| `getTroveVC` | **1** | Low (Simple) |
| `getTroveColls` | **1** | Low (Simple) |
| `getCurrentTroveState` | **1** | Low (Simple) |
| `setTroveStatus` | **1** | Low (Simple) |
| `updateTroveColl` | **1** | Low (Simple) |
| `increaseTroveDebt` | **1** | Low (Simple) |
| `decreaseTroveDebt` | **1** | Low (Simple) |
| `getTCR` | **1** | Low (Simple) |
| `checkRecoveryMode` | **1** | Low (Simple) |
| `closeTroveRedemption` | **1** | Low (Simple) |
| `closeTroveLiquidation` | **1** | Low (Simple) |
| `removeStakeTLR` | **1** | Low (Simple) |
| `updateBaseRate` | **1** | Low (Simple) |
| `calcDecayedBaseRate` | **1** | Low (Simple) |
| `redistributeDebtAndColl` | **1** | Low (Simple) |
| `updateSystemSnapshots_excludeCollRemainder` | **1** | Low (Simple) |
| `getEntireDebtAndColls` | **1** | Low (Simple) |
| `movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `collSurplusUpdate` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getTroveOwnersCount` | **1** | Low (Simple) |
| `getTroveFromTroveOwnersArray` | **1** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `batchLiquidateTroves` | **1** | Low (Simple) |
| `collSurplusUpdate` | **1** | Low (Simple) |
| `movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `_movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `_updateTrove` | **1** | Low (Simple) |
| `updateTroves` | **2** | Low (Simple) |
| `redeemCollateral` | **1** | Low (Simple) |
| `getCurrentICR` | **1** | Low (Simple) |
| `_getCurrentTroveState` | **1** | Low (Simple) |
| `applyPendingRewards` | **1** | Low (Simple) |
| `_applyPendingRewards` | **2** | Low (Simple) |
| `updateTroveRewardSnapshots` | **1** | Low (Simple) |
| `_updateTroveRewardSnapshots` | **2** | Low (Simple) |
| `getPendingCollRewards` | **1** | Low (Simple) |
| `_getPendingCollRewards` | **4** | Low (Simple) |
| `getPendingYUSDDebtReward` | **4** | Low (Simple) |
| `hasPendingRewards` | **4** | Low (Simple) |
| `getEntireDebtAndColls` | **1** | Low (Simple) |
| `removeStake` | **1** | Low (Simple) |
| `_removeStake` | **2** | Low (Simple) |
| `updateStakeAndTotalStakes` | **1** | Low (Simple) |
| `_updateStakeAndTotalStakes` | **2** | Low (Simple) |
| `_computeNewStake` | **2** | Low (Simple) |
| `redistributeDebtAndColl` | **4** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `closeTroveLiquidation` | **1** | Low (Simple) |
| `closeTroveRedemption` | **1** | Low (Simple) |
| `_closeTrove` | **2** | Low (Simple) |
| `updateSystemSnapshots_excludeCollRemainder` | **2** | Low (Simple) |
| `addTroveOwnerToArray` | **1** | Low (Simple) |
| `_addTroveOwnerToArray` | **1** | Low (Simple) |
| `_removeTroveOwner` | **1** | Low (Simple) |
| `getTCR` | **1** | Low (Simple) |
| `checkRecoveryMode` | **1** | Low (Simple) |
| `updateBaseRate` | **1** | Low (Simple) |
| `getRedemptionRate` | **1** | Low (Simple) |
| `getRedemptionRateWithDecay` | **1** | Low (Simple) |
| `_calcRedemptionRate` | **1** | Low (Simple) |
| `_getRedemptionFee` | **1** | Low (Simple) |
| `getRedemptionFeeWithDecay` | **1** | Low (Simple) |
| `_calcRedemptionFee` | **1** | Low (Simple) |
| `getBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingRateWithDecay` | **1** | Low (Simple) |
| `_calcBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingFee` | **1** | Low (Simple) |
| `getBorrowingFeeWithDecay` | **1** | Low (Simple) |
| `_calcBorrowingFee` | **1** | Low (Simple) |
| `decayBaseRateFromBorrowing` | **1** | Low (Simple) |
| `_updateLastFeeOpTime` | **2** | Low (Simple) |
| `calcDecayedBaseRate` | **1** | Low (Simple) |
| `_minutesPassedSinceLastFeeOp` | **1** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **2** | Low (Simple) |
| `_requireCallerIsBOorTMR` | **2** | Low (Simple) |
| `_requireCallerIsTMR` | **2** | Low (Simple) |
| `_requireCallerIsTML` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `_requireTroveIsActive` | **1** | Low (Simple) |
| `_requireMoreThanOneTroveInSystem` | **1** | Low (Simple) |
| `getTroveStatus` | **1** | Low (Simple) |
| `isTroveActive` | **1** | Low (Simple) |
| `getTroveStake` | **1** | Low (Simple) |
| `getTroveDebt` | **1** | Low (Simple) |
| `getTotalStake` | **1** | Low (Simple) |
| `getL_Coll` | **1** | Low (Simple) |
| `getL_YUSD` | **1** | Low (Simple) |
| `getRewardSnapshotColl` | **1** | Low (Simple) |
| `getRewardSnapshotYUSD` | **1** | Low (Simple) |
| `getTroveVC` | **1** | Low (Simple) |
| `getTroveColls` | **1** | Low (Simple) |
| `getCurrentTroveState` | **1** | Low (Simple) |
| `updateTroveDebt` | **1** | Low (Simple) |
| `updateTroveCollTMR` | **1** | Low (Simple) |
| `removeStakeTMR` | **1** | Low (Simple) |
| `removeStakeTLR` | **1** | Low (Simple) |
| `setTroveStatus` | **1** | Low (Simple) |
| `updateTroveColl` | **1** | Low (Simple) |
| `increaseTroveDebt` | **1** | Low (Simple) |
| `decreaseTroveDebt` | **1** | Low (Simple) |
| `stabilityPool` | **1** | Low (Simple) |
| `yusdToken` | **1** | Low (Simple) |
| `yetiToken` | **1** | Low (Simple) |
| `sYETI` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: DefaultPool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `sendCollsToActivePool` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **2** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `_sendCollateral` | **1** | Low (Simple) |
| `sendCollsToActivePool` | **4** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `_requireCallerIsActivePool` | **2** | Low (Simple) |
| `_requireCallerIsTroveManager` | **2** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: YUSDToken
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `sendToPool` | **1** | Low (Simple) |
| `returnFromPool` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `domainSeparator` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `sendToPool` | **1** | Low (Simple) |
| `returnFromPool` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `domainSeparator` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `_chainID` | **1** | Low (Simple) |
| `_buildDomainSeparator` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_requireValidRecipient` | **1** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **1** | Low (Simple) |
| `_requireCallerIsBOorTroveMorSP` | **1** | Low (Simple) |
| `_requireCallerIsStabilityPool` | **1** | Low (Simple) |
| `_requireCallerIsTMLorSP` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TroveManagerRedemptions
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `redeemCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `redeemCollateral` | **7** | Moderate (Complex) |
| `redeemCollateralSingle` | **5** | Moderate (Complex) |
| `_redeemCollateralFromTrove` | **6** | Moderate (Complex) |
| `_redeemCloseTrove` | **1** | Low (Simple) |
| `_updateBaseRateFromRedemption` | **1** | Low (Simple) |
| `_isValidFirstRedemptionHint` | **2** | Low (Simple) |
| `_requireUserAcceptsFeeRedemption` | **1** | Low (Simple) |
| `_requireValidMaxFee` | **1** | Low (Simple) |
| `_requireAfterBootstrapPeriod` | **1** | Low (Simple) |
| `_requireTCRoverMCR` | **1** | Low (Simple) |
| `_requireAmountGreaterThanZero` | **1** | Low (Simple) |
| `_requireYUSDBalanceCoversRedemption` | **1** | Low (Simple) |
| `isNonzero` | **3** | Low (Simple) |
| `_requireCallerisTroveManager` | **1** | Low (Simple) |
| `_getRedemptionFee` | **1** | Low (Simple) |
| `_calcRedemptionFee` | **1** | Low (Simple) |
| `_calcRedemptionRate` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: CollSurplusPool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getCollVC` | **1** | Low (Simple) |
| `getAmountClaimable` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `accountSurplus` | **1** | Low (Simple) |
| `claimColl` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getCollVC` | **1** | Low (Simple) |
| `getAmountClaimable` | **2** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `accountSurplus` | **1** | Low (Simple) |
| `claimColl` | **1** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **2** | Low (Simple) |
| `_requireCallerIsTroveManager` | **2** | Low (Simple) |
| `_requireCallerIsActivePool` | **2** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `_sendColl` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TroveManagerLiquidations
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `batchLiquidateTroves` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `batchLiquidateTroves` | **3** | Low (Simple) |
| `_getTotalFromBatchLiquidate_RecoveryMode` | **6** | Moderate (Complex) |
| `_getTotalsFromBatchLiquidate_NormalMode` | **3** | Low (Simple) |
| `_liquidateNormalMode` | **3** | Low (Simple) |
| `_liquidateRecoveryMode` | **7** | Moderate (Complex) |
| `_updateSingleLiquidation` | **1** | Low (Simple) |
| `_getOffsetAndRedistributionVals` | **4** | Low (Simple) |
| `_addLiquidationValuesToTotals` | **1** | Low (Simple) |
| `_getCappedOffsetVals` | **2** | Low (Simple) |
| `_sendGasCompensation` | **2** | Low (Simple) |
| `_updateWAssetsRewardOwner` | **3** | Low (Simple) |
| `_requireCallerisTroveManager` | **1** | Low (Simple) |
| `_getCollGasCompensation` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SortedTroves
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setParams` | **1** | Low (Simple) |
| `insert` | **1** | Low (Simple) |
| `remove` | **1** | Low (Simple) |
| `reInsert` | **1** | Low (Simple) |
| `contains` | **1** | Low (Simple) |
| `isFull` | **1** | Low (Simple) |
| `isEmpty` | **1** | Low (Simple) |
| `getSize` | **1** | Low (Simple) |
| `getMaxSize` | **1** | Low (Simple) |
| `getFirst` | **1** | Low (Simple) |
| `getLast` | **1** | Low (Simple) |
| `getNext` | **1** | Low (Simple) |
| `getPrev` | **1** | Low (Simple) |
| `getOldICR` | **1** | Low (Simple) |
| `validInsertPosition` | **1** | Low (Simple) |
| `findInsertPosition` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `insert` | **1** | Low (Simple) |
| `_insert` | **5** | Moderate (Complex) |
| `remove` | **1** | Low (Simple) |
| `_remove` | **4** | Low (Simple) |
| `reInsert` | **1** | Low (Simple) |
| `contains` | **1** | Low (Simple) |
| `isFull` | **1** | Low (Simple) |
| `isEmpty` | **1** | Low (Simple) |
| `getSize` | **1** | Low (Simple) |
| `getMaxSize` | **1** | Low (Simple) |
| `getFirst` | **1** | Low (Simple) |
| `getLast` | **1** | Low (Simple) |
| `getNext` | **1** | Low (Simple) |
| `getPrev` | **1** | Low (Simple) |
| `getOldICR` | **1** | Low (Simple) |
| `validInsertPosition` | **1** | Low (Simple) |
| `_validInsertPosition` | **4** | Low (Simple) |
| `_descendList` | **3** | Low (Simple) |
| `_ascendList` | **3** | Low (Simple) |
| `findInsertPosition` | **1** | Low (Simple) |
| `_findInsertPosition` | **8** | Moderate (Complex) |
| `_requireCallerIsTroveManager` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveM` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: PriceFeed
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `fetchPrice_v` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `fetchPrice` | **34** | ⚠️ High (Refactor recommended) |
| `fetchPrice_v` | **33** | ⚠️ High (Refactor recommended) |
| `_chainlinkIsBroken` | **1** | Low (Simple) |
| `_badChainlinkResponse` | **5** | Moderate (Complex) |
| `_chainlinkIsFrozen` | **1** | Low (Simple) |
| `_chainlinkPriceChangeAboveMax` | **1** | Low (Simple) |
| `_tellorIsBroken` | **4** | Low (Simple) |
| `_tellorIsFrozen` | **1** | Low (Simple) |
| `_bothOraclesLiveAndUnbrokenAndSimilarPrice` | **2** | Low (Simple) |
| `_bothOraclesSimilarPrice` | **1** | Low (Simple) |
| `_scaleChainlinkPriceByDigits` | **3** | Low (Simple) |
| `_scaleTellorPriceByDigits` | **1** | Low (Simple) |
| `_changeStatus` | **1** | Low (Simple) |
| `_storePrice` | **1** | Low (Simple) |
| `_storeTellorPrice` | **1** | Low (Simple) |
| `_storeChainlinkPrice` | **1** | Low (Simple) |
| `_getCurrentTellorResponse` | **2** | Low (Simple) |
| `_getCurrentChainlinkResponse` | **3** | Low (Simple) |
| `_getPrevChainlinkResponse` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TeamAllocation
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setYetiAddress` | **1** | Low (Simple) |
| `sendAllocatedYETI` | **2** | Low (Simple) |
| `sendUnallocatedYETI` | **1** | Low (Simple) |
| `updateTeamAddress` | **1** | Low (Simple) |
| `getTeamWallet` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Whitelist
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getValidCollateral` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `isValidRouter` | **1** | Low (Simple) |
| `getOracle` | **1** | Low (Simple) |
| `getRatio` | **1** | Low (Simple) |
| `getIsActive` | **1** | Low (Simple) |
| `getPriceCurve` | **1** | Low (Simple) |
| `getDecimals` | **1** | Low (Simple) |
| `getFee` | **1** | Low (Simple) |
| `getFeeAndUpdate` | **1** | Low (Simple) |
| `getIndex` | **1** | Low (Simple) |
| `isWrapped` | **1** | Low (Simple) |
| `setDefaultRouter` | **1** | Low (Simple) |
| `getValueVC` | **1** | Low (Simple) |
| `getValueUSD` | **1** | Low (Simple) |
| `getDefaultRouterAddress` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_exists` | **2** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `addCollateral` | **2** | Low (Simple) |
| `deprecateCollateral` | **1** | Low (Simple) |
| `undeprecateCollateral` | **1** | Low (Simple) |
| `changeOracle` | **1** | Low (Simple) |
| `changePriceCurve` | **1** | Low (Simple) |
| `changeRatio` | **1** | Low (Simple) |
| `setDefaultRouter` | **1** | Low (Simple) |
| `getDefaultRouterAddress` | **1** | Low (Simple) |
| `isValidRouter` | **1** | Low (Simple) |
| `isWrapped` | **1** | Low (Simple) |
| `getValidCollateral` | **1** | Low (Simple) |
| `getRatio` | **1** | Low (Simple) |
| `getOracle` | **1** | Low (Simple) |
| `getPriceCurve` | **1** | Low (Simple) |
| `getIsActive` | **1** | Low (Simple) |
| `getDecimals` | **1** | Low (Simple) |
| `getIndex` | **1** | Low (Simple) |
| `getFee` | **1** | Low (Simple) |
| `getFeeAndUpdate` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getValueUSD` | **1** | Low (Simple) |
| `getValueVC` | **1** | Low (Simple) |

---

### Contract: MultiTroveGetter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getMultipleSortedTroves` | **5** | Moderate (Complex) |
| `_getMultipleSortedTrovesFromHead` | **3** | Low (Simple) |
| `_getMultipleSortedTrovesFromTail` | **3** | Low (Simple) |
| `_getCombinedTroveData` | **2** | Low (Simple) |

---

### Contract: Migrations
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setCompleted` | **1** | Low (Simple) |
| `upgrade` | **1** | Low (Simple) |

---

### Contract: ActivePool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `sendCollaterals` | **1** | Low (Simple) |
| `sendCollateralsUnwrap` | **1** | Low (Simple) |
| `sendSingleCollateral` | **1** | Low (Simple) |
| `sendSingleCollateralUnwrap` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **2** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `_sendCollateral` | **1** | Low (Simple) |
| `sendCollaterals` | **4** | Low (Simple) |
| `sendCollateralsUnwrap` | **3** | Low (Simple) |
| `sendSingleCollateral` | **1** | Low (Simple) |
| `sendSingleCollateralUnwrap` | **2** | Low (Simple) |
| `_needsUpdateCollateral` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `_requireCallerIsBOorTroveMorTMLorSP` | **2** | Low (Simple) |
| `_requireCallerIsBorrowerOperationsOrDefaultPool` | **2** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveMorSP` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveM` | **2** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: HintHelpers
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getRedemptionHints` | **6** | Moderate (Complex) |
| `_calculateVCAfterRedemption` | **2** | Low (Simple) |
| `getApproxHint` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LiquitySafeMath128
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: StabilityPool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `provideToSP` | **1** | Low (Simple) |
| `withdrawFromSP` | **1** | Low (Simple) |
| `registerFrontEnd` | **1** | Low (Simple) |
| `offset` | **1** | Low (Simple) |
| `getDepositorGains` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getTotalYUSDDeposits` | **1** | Low (Simple) |
| `getDepositorYETIGain` | **1** | Low (Simple) |
| `getFrontEndYETIGain` | **1** | Low (Simple) |
| `getCompoundedYUSDDeposit` | **1** | Low (Simple) |
| `getCompoundedFrontEndStake` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getDepositSnapshotS` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getTotalYUSDDeposits` | **1** | Low (Simple) |
| `provideToSP` | **2** | Low (Simple) |
| `withdrawFromSP` | **2** | Low (Simple) |
| `_triggerYETIIssuance` | **1** | Low (Simple) |
| `_updateG` | **2** | Low (Simple) |
| `_computeYETIPerUnitStaked` | **1** | Low (Simple) |
| `offset` | **2** | Low (Simple) |
| `_computeRewardsPerUnitStaked` | **5** | Moderate (Complex) |
| `_updateRewardSumAndProduct` | **4** | Low (Simple) |
| `_moveOffsetCollAndDebt` | **1** | Low (Simple) |
| `_decreaseYUSD` | **1** | Low (Simple) |
| `getDepositorGains` | **2** | Low (Simple) |
| `_calculateGains` | **2** | Low (Simple) |
| `_getGainFromSnapshots` | **1** | Low (Simple) |
| `getDepositorYETIGain` | **3** | Low (Simple) |
| `getFrontEndYETIGain` | **2** | Low (Simple) |
| `_getYETIGainFromSnapshots` | **1** | Low (Simple) |
| `getCompoundedYUSDDeposit` | **2** | Low (Simple) |
| `getCompoundedFrontEndStake` | **2** | Low (Simple) |
| `_getCompoundedStakeFromSnapshots` | **5** | Moderate (Complex) |
| `_sendYUSDtoStabilityPool` | **1** | Low (Simple) |
| `_sendGainsToDepositor` | **3** | Low (Simple) |
| `_sendYUSDToDepositor` | **2** | Low (Simple) |
| `registerFrontEnd` | **1** | Low (Simple) |
| `_setFrontEndTag` | **1** | Low (Simple) |
| `_updateDepositAndSnapshots` | **4** | Low (Simple) |
| `_updateFrontEndStakeAndSnapshots` | **2** | Low (Simple) |
| `_payOutYETIGains` | **2** | Low (Simple) |
| `_requireNoUnderCollateralizedTroves` | **1** | Low (Simple) |
| `_requireUserHasDeposit` | **1** | Low (Simple) |
| `_requireUserHasNoDeposit` | **1** | Low (Simple) |
| `_requireNonZeroAmount` | **1** | Low (Simple) |
| `_requireFrontEndNotRegistered` | **1** | Low (Simple) |
| `_requireFrontEndIsRegisteredOrZero` | **1** | Low (Simple) |
| `_requireValidKickbackRate` | **1** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_requireCallerIsActivePool` | **2** | Low (Simple) |
| `_requireCallerIsTML` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getDepositSnapshotS` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: ShortLockupContract
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `withdrawYETI` | **1** | Low (Simple) |
| `_requireCallerIsBeneficiary` | **1** | Low (Simple) |
| `_requireLockupDurationHasPassed` | **1** | Low (Simple) |
| `_requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: YETIToken
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `sendToSYETI` | **1** | Low (Simple) |
| `getDeploymentStartTime` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `domainSeparator` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `sendToSYETI` | **1** | Low (Simple) |
| `domainSeparator` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `_chainID` | **1** | Low (Simple) |
| `_buildDomainSeparator` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_requireValidRecipient` | **1** | Low (Simple) |
| `_requireCallerIsSYETI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `getDeploymentStartTime` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TeamLockup
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `claimYeti` | **2** | Low (Simple) |
| `updateMultisig` | **1** | Low (Simple) |
| `_min` | **2** | Low (Simple) |

---

### Contract: LockupContract
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `withdrawYETI` | **1** | Low (Simple) |
| `_requireCallerIsBeneficiary` | **1** | Low (Simple) |
| `_requireLockupDurationHasPassed` | **1** | Low (Simple) |
| `_requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LockupContractFactory
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setYETITokenAddress` | **1** | Low (Simple) |
| `deployLockupContract` | **1** | Low (Simple) |
| `isRegisteredLockup` | **1** | Low (Simple) |
| `setYETITokenAddress` | **1** | Low (Simple) |
| `deployLockupContract` | **1** | Low (Simple) |
| `isRegisteredLockup` | **1** | Low (Simple) |
| `_requireYETIAddressIsSet` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BoringERC20
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `returnDataToString` | **5** | Moderate (Complex) |
| `safeSymbol` | **2** | Low (Simple) |
| `safeName` | **2** | Low (Simple) |
| `safeDecimals` | **2** | Low (Simple) |
| `safeBalanceOf` | **1** | Low (Simple) |
| `safeTransfer` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BoringMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `mul` | **1** | Low (Simple) |
| `to128` | **1** | Low (Simple) |
| `to64` | **1** | Low (Simple) |
| `to32` | **1** | Low (Simple) |

---

### Contract: BoringMath128
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: BoringMath64
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: BoringMath32
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: ERC20Data
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |

---

### Contract: ERC20WithSupply
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transfer` | **3** | Low (Simple) |
| `transferFrom` | **4** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `_calculateDomainSeparator` | **1** | Low (Simple) |
| `_domainSeparator` | **2** | Low (Simple) |
| `_getDigest` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |

---

### Contract: sYETIToken
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transferOwnership` | **2** | Low (Simple) |
| `claimOwnership` | **1** | Low (Simple) |
| `_calculateDomainSeparator` | **1** | Low (Simple) |
| `_domainSeparator` | **2** | Low (Simple) |
| `_getDigest` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `_transfer` | **3** | Low (Simple) |
| `_useAllowance` | **3** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `buyBack` | **1** | Low (Simple) |
| `publicBuyBack` | **1** | Low (Simple) |
| `_buyBack` | **1** | Low (Simple) |
| `rebase` | **2** | Low (Simple) |
| `_getValueOfContract` | **1** | Low (Simple) |
| `setTransferRatio` | **1** | Low (Simple) |
| `addValidRouter` | **1** | Low (Simple) |
| `removeValidRouter` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: CommunityIssuance
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `issueYETI` | **1** | Low (Simple) |
| `sendYETI` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `issueYETI` | **1** | Low (Simple) |
| `_getCumulativeIssuanceFraction` | **1** | Low (Simple) |
| `sendYETI` | **1** | Low (Simple) |
| `_requireCallerIsStabilityPool` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: dummyUniV2Router
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transferOwnership` | **2** | Low (Simple) |
| `claimOwnership` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `setup` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |

---

### Contract: Domain
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_calculateDomainSeparator` | **1** | Low (Simple) |
| `_domainSeparator` | **2** | Low (Simple) |
| `_getDigest` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BoringBatchable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_getRevertMsg` | **2** | Low (Simple) |
| `batch` | **3** | Low (Simple) |
| `permitToken` | **1** | Low (Simple) |

---

### Contract: BoringOwnable
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transferOwnership` | **2** | Low (Simple) |
| `claimOwnership` | **1** | Low (Simple) |

---

### Contract: YetiCustomBase
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BaseMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TroveManagerBase
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: ReentrancyGuard
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: CheckContract
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |

---

### Contract: HomoraMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `divCeil` | **1** | Low (Simple) |
| `fmul` | **1** | Low (Simple) |
| `fdiv` | **1** | Low (Simple) |
| `sqrt` | **10** | ⚠️ High (Refactor recommended) |

---

### Contract: Ownable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |

---

### Contract: LiquityBase
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TellorCaller
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getTellorCurrentValue` | **1** | Low (Simple) |
| `getTellorCurrentValue` | **2** | Low (Simple) |

---

### Contract: TokenScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BorrowerOperationsScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |

---

### Contract: ETHTransferScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transferETH` | **1** | Low (Simple) |

---

### Contract: SYETIScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |

---

### Contract: TroveManagerScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `redeemCollateral` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BorrowerWrappersScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `stake` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `transferETH` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `_requireUserHasTrove` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: StabilityPoolScript
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `checkContract` | **1** | Low (Simple) |
| `provideToSP` | **1** | Low (Simple) |
| `withdrawFromSP` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: WJLP
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `wrap` | **1** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `updateReward` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_transferFrom` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `wrap` | **3** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `transferFrom` | **2** | Low (Simple) |
| `transfer` | **3** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `updateReward` | **1** | Low (Simple) |
| `_updateReward` | **1** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `_sendJoeReward` | **1** | Low (Simple) |
| `_userUpdate` | **3** | Low (Simple) |
| `_safeJoeTransfer` | **2** | Low (Simple) |
| `_requireCallerIsPool` | **1** | Low (Simple) |
| `_requireCallerIsSPorDP` | **1** | Low (Simple) |
| `_requireCallerIsActivePool` | **1** | Low (Simple) |
| `_requireCallerIsLRDorBO` | **1** | Low (Simple) |
| `_requireCallerIsSP` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |

---

### Contract: WBQI
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `wrap` | **1** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `updateReward` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_transferFrom` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `wrap` | **1** | Low (Simple) |
| `accumulateRewards` | **3** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `updateReward` | **2** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `_sendReward` | **1** | Low (Simple) |
| `_safeRewardsTransfer` | **3** | Low (Simple) |
| `_requireCallerIsAPorSP` | **1** | Low (Simple) |
| `_requireCallerIsActivePool` | **1** | Low (Simple) |
| `_requireCallerIsLRD` | **1** | Low (Simple) |
| `_requireCallerIsSP` | **1** | Low (Simple) |
| `fallback` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: WAAVE
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `wrap` | **1** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `updateReward` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_transferFrom` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `wrap` | **1** | Low (Simple) |
| `aavePerShare` | **2** | Low (Simple) |
| `unwrap` | **1** | Low (Simple) |
| `unwrapFor` | **1** | Low (Simple) |
| `endTreasuryReward` | **1** | Low (Simple) |
| `updateReward` | **1** | Low (Simple) |
| `getPendingRewards` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `claimRewardTreasury` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `_requireCallerIsAPorSP` | **1** | Low (Simple) |
| `_requireCallerIsActivePool` | **1** | Low (Simple) |
| `_requireCallerIsLRD` | **1** | Low (Simple) |
| `_requireCallerIsSP` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: ERC20_8
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_transferFrom` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |

---

### Contract: UniswapV2LPTokenPriceFeed
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |
| `setParam` | **1** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |

---

### Contract: BQIOracle
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setParam` | **1** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |
| `fetchPrice` | **1** | Low (Simple) |

---

### Contract: AAVEOracle
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setParam` | **1** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |
| `fetchPrice` | **1** | Low (Simple) |

---

### Contract: ERC20Router
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `route` | **1** | Low (Simple) |
| `unRoute` | **1** | Low (Simple) |
| `route` | **1** | Low (Simple) |
| `unRoute` | **1** | Low (Simple) |

---

### Contract: WJLPRouter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `route` | **1** | Low (Simple) |
| `unRoute` | **1** | Low (Simple) |
| `route` | **2** | Low (Simple) |
| `unRoute` | **1** | Low (Simple) |
| `_wrapJLP` | **1** | Low (Simple) |
| `_zapInAvax` | **1** | Low (Simple) |
| `_zapInToken` | **1** | Low (Simple) |

---

### Contract: Unipool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setParams` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **1** | Low (Simple) |
| `rewardPerToken` | **1** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `withdrawAndClaim` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **1** | Low (Simple) |
| `rewardPerToken` | **2** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawAndClaim` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `_notifyRewardAmount` | **1** | Low (Simple) |
| `_updatePeriodFinish` | **2** | Low (Simple) |
| `_updateReward` | **1** | Low (Simple) |
| `_updateAccountReward` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Pool2Unipool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setParams` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **1** | Low (Simple) |
| `rewardPerToken` | **1** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `withdrawAndClaim` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `setReward` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **1** | Low (Simple) |
| `rewardPerToken` | **2** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawAndClaim` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |
| `_notifyRewardAmount` | **1** | Low (Simple) |
| `_updatePeriodFinish` | **2** | Low (Simple) |
| `_updateReward` | **1** | Low (Simple) |
| `_updateAccountReward` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: ERC20Mock
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
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `transferInternal` | **1** | Low (Simple) |
| `approveInternal` | **1** | Low (Simple) |

---

### Contract: StabilityPoolTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getTotalYUSDDeposits` | **1** | Low (Simple) |
| `provideToSP` | **2** | Low (Simple) |
| `withdrawFromSP` | **2** | Low (Simple) |
| `_triggerYETIIssuance` | **1** | Low (Simple) |
| `_updateG` | **2** | Low (Simple) |
| `_computeYETIPerUnitStaked` | **1** | Low (Simple) |
| `offset` | **2** | Low (Simple) |
| `_computeRewardsPerUnitStaked` | **5** | Moderate (Complex) |
| `_updateRewardSumAndProduct` | **4** | Low (Simple) |
| `_moveOffsetCollAndDebt` | **1** | Low (Simple) |
| `_decreaseYUSD` | **1** | Low (Simple) |
| `getDepositorGains` | **2** | Low (Simple) |
| `_calculateGains` | **2** | Low (Simple) |
| `_getGainFromSnapshots` | **1** | Low (Simple) |
| `getDepositorYETIGain` | **3** | Low (Simple) |
| `getFrontEndYETIGain` | **2** | Low (Simple) |
| `_getYETIGainFromSnapshots` | **1** | Low (Simple) |
| `getCompoundedYUSDDeposit` | **2** | Low (Simple) |
| `getCompoundedFrontEndStake` | **2** | Low (Simple) |
| `_getCompoundedStakeFromSnapshots` | **5** | Moderate (Complex) |
| `_sendYUSDtoStabilityPool` | **1** | Low (Simple) |
| `_sendGainsToDepositor` | **3** | Low (Simple) |
| `_sendYUSDToDepositor` | **2** | Low (Simple) |
| `registerFrontEnd` | **1** | Low (Simple) |
| `_setFrontEndTag` | **1** | Low (Simple) |
| `_updateDepositAndSnapshots` | **4** | Low (Simple) |
| `_updateFrontEndStakeAndSnapshots` | **2** | Low (Simple) |
| `_payOutYETIGains` | **2** | Low (Simple) |
| `_requireNoUnderCollateralizedTroves` | **1** | Low (Simple) |
| `_requireUserHasDeposit` | **1** | Low (Simple) |
| `_requireUserHasNoDeposit` | **1** | Low (Simple) |
| `_requireNonZeroAmount` | **1** | Low (Simple) |
| `_requireFrontEndNotRegistered` | **1** | Low (Simple) |
| `_requireFrontEndIsRegisteredOrZero` | **1** | Low (Simple) |
| `_requireValidKickbackRate` | **1** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_requireCallerIsActivePool` | **2** | Low (Simple) |
| `_requireCallerIsTML` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getDepositSnapshotS` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `provideToSP` | **1** | Low (Simple) |
| `withdrawFromSP` | **1** | Low (Simple) |
| `registerFrontEnd` | **1** | Low (Simple) |
| `offset` | **1** | Low (Simple) |
| `getDepositorGains` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getTotalYUSDDeposits` | **1** | Low (Simple) |
| `getDepositorYETIGain` | **1** | Low (Simple) |
| `getFrontEndYETIGain` | **1** | Low (Simple) |
| `getCompoundedYUSDDeposit` | **1** | Low (Simple) |
| `getCompoundedFrontEndStake` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getDepositSnapshotS` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: DefaultPoolTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **2** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `_sendCollateral` | **1** | Low (Simple) |
| `sendCollsToActivePool` | **4** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `_requireCallerIsActivePool` | **2** | Low (Simple) |
| `_requireCallerIsTroveManager` | **2** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `sendCollsToActivePool` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `unprotectedIncreaseYUSDDebt` | **1** | Low (Simple) |
| `unprotectedPayable` | **1** | Low (Simple) |
| `getEthAmount` | **1** | Low (Simple) |
| `getCollateralVCC` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BorrowerOperationsTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **3** | Low (Simple) |
| `_singleLeverUp` | **1** | Low (Simple) |
| `_openTroveInternal` | **3** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **3** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `_adjustTrove` | **9** | Moderate (Complex) |
| `_singleUnleverUp` | **1** | Low (Simple) |
| `_unleverColls` | **3** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `_closeTrove` | **3** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `_getTotalVariableDepositFee` | **4** | Low (Simple) |
| `_transferCollateralsIntoActivePool` | **2** | Low (Simple) |
| `_singleTransferCollateralIntoActivePool` | **2** | Low (Simple) |
| `_triggerBorrowingFee` | **1** | Low (Simple) |
| `_triggerDepositFee` | **1** | Low (Simple) |
| `_updateTroveFromAdjustment` | **3** | Low (Simple) |
| `_getNewPortfolio` | **1** | Low (Simple) |
| `_moveYUSD` | **2** | Low (Simple) |
| `_withdrawYUSD` | **1** | Low (Simple) |
| `_repayYUSD` | **1** | Low (Simple) |
| `_requireValidDepositCollateral` | **2** | Low (Simple) |
| `_requireNonZeroAdjustment` | **1** | Low (Simple) |
| `_arrayIsNonzero` | **3** | Low (Simple) |
| `_isBeforeFeeBootstrapPeriod` | **1** | Low (Simple) |
| `_requireTroveisActive` | **1** | Low (Simple) |
| `_requireTroveisNotActive` | **1** | Low (Simple) |
| `_requireNonZeroDebtChange` | **1** | Low (Simple) |
| `_requireNoOverlapColls` | **3** | Low (Simple) |
| `_requireNoDuplicateColls` | **3** | Low (Simple) |
| `_requireNotInRecoveryMode` | **1** | Low (Simple) |
| `_requireNoCollWithdrawal` | **1** | Low (Simple) |
| `_requireLengthNonzero` | **1** | Low (Simple) |
| `_requireLengthsEqual` | **1** | Low (Simple) |
| `_requireValidAdjustmentInCurrentMode` | **3** | Low (Simple) |
| `_requireICRisAboveMCR` | **1** | Low (Simple) |
| `_requireICRisAboveCCR` | **1** | Low (Simple) |
| `_requireNewICRisAboveOldICR` | **1** | Low (Simple) |
| `_requireNewTCRisAboveCCR` | **1** | Low (Simple) |
| `_requireAtLeastMinNetDebt` | **1** | Low (Simple) |
| `_requireValidYUSDRepayment` | **1** | Low (Simple) |
| `_requireSufficientYUSDBalance` | **1** | Low (Simple) |
| `_requireValidMaxFeePercentage` | **2** | Low (Simple) |
| `_getNewICRFromTroveChange` | **2** | Low (Simple) |
| `_getNewTCRFromTroveChange` | **3** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **1** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `getNewICRFromTroveChange` | **1** | Low (Simple) |
| `getNewTCRFromTroveChange` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `sumColls` | **1** | Low (Simple) |
| `get_MIN_NET_DEBT` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: console
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sendLogPayload` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `logInt` | **1** | Low (Simple) |
| `logUint` | **1** | Low (Simple) |
| `logString` | **1** | Low (Simple) |
| `logBool` | **1** | Low (Simple) |
| `logAddress` | **1** | Low (Simple) |
| `logBytes` | **1** | Low (Simple) |
| `logBytes1` | **1** | Low (Simple) |
| `logBytes2` | **1** | Low (Simple) |
| `logBytes3` | **1** | Low (Simple) |
| `logBytes4` | **1** | Low (Simple) |
| `logBytes5` | **1** | Low (Simple) |
| `logBytes6` | **1** | Low (Simple) |
| `logBytes7` | **1** | Low (Simple) |
| `logBytes8` | **1** | Low (Simple) |
| `logBytes9` | **1** | Low (Simple) |
| `logBytes10` | **1** | Low (Simple) |
| `logBytes11` | **1** | Low (Simple) |
| `logBytes12` | **1** | Low (Simple) |
| `logBytes13` | **1** | Low (Simple) |
| `logBytes14` | **1** | Low (Simple) |
| `logBytes15` | **1** | Low (Simple) |
| `logBytes16` | **1** | Low (Simple) |
| `logBytes17` | **1** | Low (Simple) |
| `logBytes18` | **1** | Low (Simple) |
| `logBytes19` | **1** | Low (Simple) |
| `logBytes20` | **1** | Low (Simple) |
| `logBytes21` | **1** | Low (Simple) |
| `logBytes22` | **1** | Low (Simple) |
| `logBytes23` | **1** | Low (Simple) |
| `logBytes24` | **1** | Low (Simple) |
| `logBytes25` | **1** | Low (Simple) |
| `logBytes26` | **1** | Low (Simple) |
| `logBytes27` | **1** | Low (Simple) |
| `logBytes28` | **1** | Low (Simple) |
| `logBytes29` | **1** | Low (Simple) |
| `logBytes30` | **1** | Low (Simple) |
| `logBytes31` | **1** | Low (Simple) |
| `logBytes32` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `log` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: MockAggregator
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `decimals` | **1** | Low (Simple) |
| `description` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `getRoundData` | **1** | Low (Simple) |
| `latestRoundData` | **1** | Low (Simple) |
| `setDecimals` | **1** | Low (Simple) |
| `setPrice` | **1** | Low (Simple) |
| `setPrevPrice` | **1** | Low (Simple) |
| `setPrevUpdateTime` | **1** | Low (Simple) |
| `setUpdateTime` | **1** | Low (Simple) |
| `setLatestRevert` | **1** | Low (Simple) |
| `setPrevRevert` | **1** | Low (Simple) |
| `setDecimalsRevert` | **1** | Low (Simple) |
| `setLatestRoundId` | **1** | Low (Simple) |
| `setPrevRoundId` | **1** | Low (Simple) |
| `decimals` | **2** | Low (Simple) |
| `latestRoundData` | **2** | Low (Simple) |
| `getRoundData` | **2** | Low (Simple) |
| `description` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: LiquitySafeMath128Tester
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `add` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |

---

### Contract: FunctionCaller
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setTroveManagerAddress` | **1** | Low (Simple) |
| `setSortedTrovesAddress` | **1** | Low (Simple) |
| `setPriceFeedAddress` | **1** | Low (Simple) |
| `troveManager_getCurrentICR` | **1** | Low (Simple) |
| `sortedTroves_findInsertPosition` | **1** | Low (Simple) |

---

### Contract: PriceFeedTestnet
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `fetchPrice_v` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |
| `setPrice` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: MockTellor
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setPrice` | **1** | Low (Simple) |
| `setDidRetrieve` | **1** | Low (Simple) |
| `setUpdateTime` | **1** | Low (Simple) |
| `setRevertRequest` | **1** | Low (Simple) |
| `getTimestampbyRequestIDandIndex` | **1** | Low (Simple) |
| `getNewValueCountbyRequestId` | **2** | Low (Simple) |
| `retrieveData` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Destructible
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `receive` | **1** | Low (Simple) |
| `destruct` | **1** | Low (Simple) |

---

### Contract: CommunityIssuanceTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `issueYETI` | **1** | Low (Simple) |
| `_getCumulativeIssuanceFraction` | **1** | Low (Simple) |
| `sendYETI` | **1** | Low (Simple) |
| `_requireCallerIsStabilityPool` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `issueYETI` | **1** | Low (Simple) |
| `sendYETI` | **1** | Low (Simple) |
| `obtainYETI` | **1** | Low (Simple) |
| `getCumulativeIssuanceFraction` | **1** | Low (Simple) |
| `unprotectedIssueYETI` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: EchidnaProxy
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `receive` | **1** | Low (Simple) |
| `liquidatePrx` | **1** | Low (Simple) |
| `liquidateTrovesPrx` | **1** | Low (Simple) |
| `batchLiquidateTrovesPrx` | **1** | Low (Simple) |
| `redeemCollateralPrx` | **1** | Low (Simple) |
| `openTrovePrx` | **1** | Low (Simple) |
| `addCollPrx` | **1** | Low (Simple) |
| `withdrawCollPrx` | **1** | Low (Simple) |
| `withdrawYUSDPrx` | **1** | Low (Simple) |
| `repayYUSDPrx` | **1** | Low (Simple) |
| `closeTrovePrx` | **1** | Low (Simple) |
| `adjustTrovePrx` | **1** | Low (Simple) |
| `provideToSPPrx` | **1** | Low (Simple) |
| `withdrawFromSPPrx` | **1** | Low (Simple) |
| `transferPrx` | **1** | Low (Simple) |
| `approvePrx` | **1** | Low (Simple) |
| `transferFromPrx` | **1** | Low (Simple) |
| `increaseAllowancePrx` | **1** | Low (Simple) |
| `decreaseAllowancePrx` | **1** | Low (Simple) |

---

### Contract: EchidnaTester
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_getVC` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: YUSDTokenTester
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `sendToPool` | **1** | Low (Simple) |
| `returnFromPool` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `domainSeparator` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `_chainID` | **1** | Low (Simple) |
| `_buildDomainSeparator` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_requireValidRecipient` | **1** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **1** | Low (Simple) |
| `_requireCallerIsBOorTroveMorSP` | **1** | Low (Simple) |
| `_requireCallerIsStabilityPool` | **1** | Low (Simple) |
| `_requireCallerIsTMLorSP` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `sendToPool` | **1** | Low (Simple) |
| `returnFromPool` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `domainSeparator` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `unprotectedMint` | **1** | Low (Simple) |
| `unprotectedBurn` | **1** | Low (Simple) |
| `unprotectedSendToPool` | **1** | Low (Simple) |
| `unprotectedReturnFromPool` | **1** | Low (Simple) |
| `callInternalApprove` | **1** | Low (Simple) |
| `getChainId` | **1** | Low (Simple) |
| `getDigest` | **1** | Low (Simple) |
| `recoverAddress` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: NonPayable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setPayable` | **1** | Low (Simple) |
| `forward` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---

### Contract: LiquityBaseTester
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `_toColls` | **1** | Low (Simple) |
| `createCollExample` | **1** | Low (Simple) |
| `sumCollsTwoColls` | **1** | Low (Simple) |
| `sumCollsOneCollsOneSplit` | **1** | Low (Simple) |
| `sumCollsTwoSplit` | **1** | Low (Simple) |
| `leftSumColls` | **1** | Low (Simple) |
| `leftSubColls` | **1** | Low (Simple) |
| `subColls` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SortedTrovesTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setParams` | **1** | Low (Simple) |
| `insert` | **1** | Low (Simple) |
| `_insert` | **5** | Moderate (Complex) |
| `remove` | **1** | Low (Simple) |
| `_remove` | **4** | Low (Simple) |
| `reInsert` | **1** | Low (Simple) |
| `contains` | **1** | Low (Simple) |
| `isFull` | **1** | Low (Simple) |
| `isEmpty` | **1** | Low (Simple) |
| `getSize` | **1** | Low (Simple) |
| `getMaxSize` | **1** | Low (Simple) |
| `getFirst` | **1** | Low (Simple) |
| `getLast` | **1** | Low (Simple) |
| `getNext` | **1** | Low (Simple) |
| `getPrev` | **1** | Low (Simple) |
| `getOldICR` | **1** | Low (Simple) |
| `validInsertPosition` | **1** | Low (Simple) |
| `_validInsertPosition` | **4** | Low (Simple) |
| `_descendList` | **3** | Low (Simple) |
| `_ascendList` | **3** | Low (Simple) |
| `findInsertPosition` | **1** | Low (Simple) |
| `_findInsertPosition` | **8** | Moderate (Complex) |
| `_requireCallerIsTroveManager` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveM` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `insert` | **1** | Low (Simple) |
| `remove` | **1** | Low (Simple) |
| `reInsert` | **1** | Low (Simple) |
| `contains` | **1** | Low (Simple) |
| `isFull` | **1** | Low (Simple) |
| `isEmpty` | **1** | Low (Simple) |
| `getSize` | **1** | Low (Simple) |
| `getMaxSize` | **1** | Low (Simple) |
| `getFirst` | **1** | Low (Simple) |
| `getLast` | **1** | Low (Simple) |
| `getNext` | **1** | Low (Simple) |
| `getPrev` | **1** | Low (Simple) |
| `getOldICR` | **1** | Low (Simple) |
| `validInsertPosition` | **1** | Low (Simple) |
| `findInsertPosition` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `callInsert` | **1** | Low (Simple) |
| `callRemove` | **1** | Low (Simple) |
| `callReInsert` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: TroveManagerTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `getTroveOwnersCount` | **1** | Low (Simple) |
| `getTroveFromTroveOwnersArray` | **1** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `batchLiquidateTroves` | **1** | Low (Simple) |
| `collSurplusUpdate` | **1** | Low (Simple) |
| `movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `_movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `_updateTrove` | **1** | Low (Simple) |
| `updateTroves` | **2** | Low (Simple) |
| `redeemCollateral` | **1** | Low (Simple) |
| `getCurrentICR` | **1** | Low (Simple) |
| `_getCurrentTroveState` | **1** | Low (Simple) |
| `applyPendingRewards` | **1** | Low (Simple) |
| `_applyPendingRewards` | **2** | Low (Simple) |
| `updateTroveRewardSnapshots` | **1** | Low (Simple) |
| `_updateTroveRewardSnapshots` | **2** | Low (Simple) |
| `getPendingCollRewards` | **1** | Low (Simple) |
| `_getPendingCollRewards` | **4** | Low (Simple) |
| `getPendingYUSDDebtReward` | **4** | Low (Simple) |
| `hasPendingRewards` | **4** | Low (Simple) |
| `getEntireDebtAndColls` | **1** | Low (Simple) |
| `removeStake` | **1** | Low (Simple) |
| `_removeStake` | **2** | Low (Simple) |
| `updateStakeAndTotalStakes` | **1** | Low (Simple) |
| `_updateStakeAndTotalStakes` | **2** | Low (Simple) |
| `_computeNewStake` | **2** | Low (Simple) |
| `redistributeDebtAndColl` | **4** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `closeTroveLiquidation` | **1** | Low (Simple) |
| `closeTroveRedemption` | **1** | Low (Simple) |
| `_closeTrove` | **2** | Low (Simple) |
| `updateSystemSnapshots_excludeCollRemainder` | **2** | Low (Simple) |
| `addTroveOwnerToArray` | **1** | Low (Simple) |
| `_addTroveOwnerToArray` | **1** | Low (Simple) |
| `_removeTroveOwner` | **1** | Low (Simple) |
| `getTCR` | **1** | Low (Simple) |
| `checkRecoveryMode` | **1** | Low (Simple) |
| `updateBaseRate` | **1** | Low (Simple) |
| `getRedemptionRate` | **1** | Low (Simple) |
| `getRedemptionRateWithDecay` | **1** | Low (Simple) |
| `_calcRedemptionRate` | **1** | Low (Simple) |
| `_getRedemptionFee` | **1** | Low (Simple) |
| `getRedemptionFeeWithDecay` | **1** | Low (Simple) |
| `_calcRedemptionFee` | **1** | Low (Simple) |
| `getBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingRateWithDecay` | **1** | Low (Simple) |
| `_calcBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingFee` | **1** | Low (Simple) |
| `getBorrowingFeeWithDecay` | **1** | Low (Simple) |
| `_calcBorrowingFee` | **1** | Low (Simple) |
| `decayBaseRateFromBorrowing` | **1** | Low (Simple) |
| `_updateLastFeeOpTime` | **2** | Low (Simple) |
| `calcDecayedBaseRate` | **1** | Low (Simple) |
| `_minutesPassedSinceLastFeeOp` | **1** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **2** | Low (Simple) |
| `_requireCallerIsBOorTMR` | **2** | Low (Simple) |
| `_requireCallerIsTMR` | **2** | Low (Simple) |
| `_requireCallerIsTML` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `_requireTroveIsActive` | **1** | Low (Simple) |
| `_requireMoreThanOneTroveInSystem` | **1** | Low (Simple) |
| `getTroveStatus` | **1** | Low (Simple) |
| `isTroveActive` | **1** | Low (Simple) |
| `getTroveStake` | **1** | Low (Simple) |
| `getTroveDebt` | **1** | Low (Simple) |
| `getTotalStake` | **1** | Low (Simple) |
| `getL_Coll` | **1** | Low (Simple) |
| `getL_YUSD` | **1** | Low (Simple) |
| `getRewardSnapshotColl` | **1** | Low (Simple) |
| `getRewardSnapshotYUSD` | **1** | Low (Simple) |
| `getTroveVC` | **1** | Low (Simple) |
| `getTroveColls` | **1** | Low (Simple) |
| `getCurrentTroveState` | **1** | Low (Simple) |
| `updateTroveDebt` | **1** | Low (Simple) |
| `updateTroveCollTMR` | **1** | Low (Simple) |
| `removeStakeTMR` | **1** | Low (Simple) |
| `removeStakeTLR` | **1** | Low (Simple) |
| `setTroveStatus` | **1** | Low (Simple) |
| `updateTroveColl` | **1** | Low (Simple) |
| `increaseTroveDebt` | **1** | Low (Simple) |
| `decreaseTroveDebt` | **1** | Low (Simple) |
| `stabilityPool` | **1** | Low (Simple) |
| `yusdToken` | **1** | Low (Simple) |
| `yetiToken` | **1** | Low (Simple) |
| `sYETI` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `stabilityPool` | **1** | Low (Simple) |
| `yusdToken` | **1** | Low (Simple) |
| `yetiToken` | **1** | Low (Simple) |
| `sYETI` | **1** | Low (Simple) |
| `getTroveOwnersCount` | **1** | Low (Simple) |
| `getTroveFromTroveOwnersArray` | **1** | Low (Simple) |
| `getCurrentICR` | **1** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `batchLiquidateTroves` | **1** | Low (Simple) |
| `redeemCollateral` | **1** | Low (Simple) |
| `updateStakeAndTotalStakes` | **1** | Low (Simple) |
| `updateTroveCollTMR` | **1** | Low (Simple) |
| `updateTroveRewardSnapshots` | **1** | Low (Simple) |
| `addTroveOwnerToArray` | **1** | Low (Simple) |
| `applyPendingRewards` | **1** | Low (Simple) |
| `getPendingCollRewards` | **1** | Low (Simple) |
| `getPendingYUSDDebtReward` | **1** | Low (Simple) |
| `hasPendingRewards` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `removeStake` | **1** | Low (Simple) |
| `removeStakeTMR` | **1** | Low (Simple) |
| `updateTroveDebt` | **1** | Low (Simple) |
| `getRedemptionRate` | **1** | Low (Simple) |
| `getRedemptionRateWithDecay` | **1** | Low (Simple) |
| `getRedemptionFeeWithDecay` | **1** | Low (Simple) |
| `getBorrowingRate` | **1** | Low (Simple) |
| `getBorrowingRateWithDecay` | **1** | Low (Simple) |
| `getBorrowingFee` | **1** | Low (Simple) |
| `getBorrowingFeeWithDecay` | **1** | Low (Simple) |
| `decayBaseRateFromBorrowing` | **1** | Low (Simple) |
| `getTroveStatus` | **1** | Low (Simple) |
| `isTroveActive` | **1** | Low (Simple) |
| `getTroveStake` | **1** | Low (Simple) |
| `getTotalStake` | **1** | Low (Simple) |
| `getTroveDebt` | **1** | Low (Simple) |
| `getL_Coll` | **1** | Low (Simple) |
| `getL_YUSD` | **1** | Low (Simple) |
| `getRewardSnapshotColl` | **1** | Low (Simple) |
| `getRewardSnapshotYUSD` | **1** | Low (Simple) |
| `getTroveVC` | **1** | Low (Simple) |
| `getTroveColls` | **1** | Low (Simple) |
| `getCurrentTroveState` | **1** | Low (Simple) |
| `setTroveStatus` | **1** | Low (Simple) |
| `updateTroveColl` | **1** | Low (Simple) |
| `increaseTroveDebt` | **1** | Low (Simple) |
| `decreaseTroveDebt` | **1** | Low (Simple) |
| `getTCR` | **1** | Low (Simple) |
| `checkRecoveryMode` | **1** | Low (Simple) |
| `closeTroveRedemption` | **1** | Low (Simple) |
| `closeTroveLiquidation` | **1** | Low (Simple) |
| `removeStakeTLR` | **1** | Low (Simple) |
| `updateBaseRate` | **1** | Low (Simple) |
| `calcDecayedBaseRate` | **1** | Low (Simple) |
| `redistributeDebtAndColl` | **1** | Low (Simple) |
| `updateSystemSnapshots_excludeCollRemainder` | **1** | Low (Simple) |
| `getEntireDebtAndColls` | **1** | Low (Simple) |
| `movePendingTroveRewardsToActivePool` | **1** | Low (Simple) |
| `collSurplusUpdate` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `computeICR` | **2** | Low (Simple) |
| `getYUSDGasCompensation` | **1** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `unprotectedDecayBaseRateFromBorrowing` | **1** | Low (Simple) |
| `minutesPassedSinceLastFeeOp` | **1** | Low (Simple) |
| `setLastFeeOpTimeToNow` | **1** | Low (Simple) |
| `setBaseRate` | **1** | Low (Simple) |
| `callGetRedemptionFee` | **1** | Low (Simple) |
| `getActualDebtFromComposite` | **1** | Low (Simple) |
| `callInternalRemoveTroveOwner` | **1** | Low (Simple) |
| `getTotalStakes` | **1** | Low (Simple) |
| `getTroveIndex` | **1** | Low (Simple) |
| `getEDC` | **1** | Low (Simple) |
| `getCollGasCompensation` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getUSD` | **1** | Low (Simple) |
| `_getCollGasCompensation` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LiquityMathTester
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `callMax` | **1** | Low (Simple) |
| `callDecPowTx` | **1** | Low (Simple) |
| `callDecPow` | **1** | Low (Simple) |

---

### Contract: ActivePoolTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `getVC` | **2** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `_sendCollateral` | **1** | Low (Simple) |
| `sendCollaterals` | **4** | Low (Simple) |
| `sendCollateralsUnwrap` | **3** | Low (Simple) |
| `sendSingleCollateral` | **1** | Low (Simple) |
| `sendSingleCollateralUnwrap` | **2** | Low (Simple) |
| `_needsUpdateCollateral` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `_requireCallerIsBOorTroveMorTMLorSP` | **2** | Low (Simple) |
| `_requireCallerIsBorrowerOperationsOrDefaultPool` | **2** | Low (Simple) |
| `_requireCallerIsBorrowerOperations` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveMorSP` | **2** | Low (Simple) |
| `_requireCallerIsBOorTroveM` | **2** | Low (Simple) |
| `_requireCallerIsWhitelist` | **2** | Low (Simple) |
| `_revertWrongFuncCaller` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `sendCollaterals` | **1** | Low (Simple) |
| `sendCollateralsUnwrap` | **1** | Low (Simple) |
| `sendSingleCollateral` | **1** | Low (Simple) |
| `sendSingleCollateralUnwrap` | **1** | Low (Simple) |
| `getCollateralVC` | **1** | Low (Simple) |
| `addCollateralType` | **1** | Low (Simple) |
| `getVC` | **1** | Low (Simple) |
| `getCollateral` | **1** | Low (Simple) |
| `getAllCollateral` | **1** | Low (Simple) |
| `getYUSDDebt` | **1** | Low (Simple) |
| `increaseYUSDDebt` | **1** | Low (Simple) |
| `decreaseYUSDDebt` | **1** | Low (Simple) |
| `receiveCollateral` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `unprotectedIncreaseYUSDDebt` | **1** | Low (Simple) |
| `unprotectedPayable` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: YETITokenTester
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `sendToSYETI` | **1** | Low (Simple) |
| `domainSeparator` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `_chainID` | **1** | Low (Simple) |
| `_buildDomainSeparator` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_requireValidRecipient` | **1** | Low (Simple) |
| `_requireCallerIsSYETI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `getDeploymentStartTime` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `sendToSYETI` | **1** | Low (Simple) |
| `getDeploymentStartTime` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `version` | **1** | Low (Simple) |
| `permitTypeHash` | **1** | Low (Simple) |
| `domainSeparator` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `unprotectedMint` | **1** | Low (Simple) |
| `unprotectedSendToSYETI` | **1** | Low (Simple) |
| `callInternalApprove` | **1** | Low (Simple) |
| `callInternalTransfer` | **1** | Low (Simple) |
| `getChainId` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SortedTrovesBOTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **3** | Low (Simple) |
| `_singleLeverUp` | **1** | Low (Simple) |
| `_openTroveInternal` | **3** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **3** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `_adjustTrove` | **9** | Moderate (Complex) |
| `_singleUnleverUp` | **1** | Low (Simple) |
| `_unleverColls` | **3** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `_closeTrove` | **3** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `_getTotalVariableDepositFee` | **4** | Low (Simple) |
| `_transferCollateralsIntoActivePool` | **2** | Low (Simple) |
| `_singleTransferCollateralIntoActivePool` | **2** | Low (Simple) |
| `_triggerBorrowingFee` | **1** | Low (Simple) |
| `_triggerDepositFee` | **1** | Low (Simple) |
| `_updateTroveFromAdjustment` | **3** | Low (Simple) |
| `_getNewPortfolio` | **1** | Low (Simple) |
| `_moveYUSD` | **2** | Low (Simple) |
| `_withdrawYUSD` | **1** | Low (Simple) |
| `_repayYUSD` | **1** | Low (Simple) |
| `_requireValidDepositCollateral` | **2** | Low (Simple) |
| `_requireNonZeroAdjustment` | **1** | Low (Simple) |
| `_arrayIsNonzero` | **3** | Low (Simple) |
| `_isBeforeFeeBootstrapPeriod` | **1** | Low (Simple) |
| `_requireTroveisActive` | **1** | Low (Simple) |
| `_requireTroveisNotActive` | **1** | Low (Simple) |
| `_requireNonZeroDebtChange` | **1** | Low (Simple) |
| `_requireNoOverlapColls` | **3** | Low (Simple) |
| `_requireNoDuplicateColls` | **3** | Low (Simple) |
| `_requireNotInRecoveryMode` | **1** | Low (Simple) |
| `_requireNoCollWithdrawal` | **1** | Low (Simple) |
| `_requireLengthNonzero` | **1** | Low (Simple) |
| `_requireLengthsEqual` | **1** | Low (Simple) |
| `_requireValidAdjustmentInCurrentMode` | **3** | Low (Simple) |
| `_requireICRisAboveMCR` | **1** | Low (Simple) |
| `_requireICRisAboveCCR` | **1** | Low (Simple) |
| `_requireNewICRisAboveOldICR` | **1** | Low (Simple) |
| `_requireNewTCRisAboveCCR` | **1** | Low (Simple) |
| `_requireAtLeastMinNetDebt` | **1** | Low (Simple) |
| `_requireValidYUSDRepayment` | **1** | Low (Simple) |
| `_requireSufficientYUSDBalance` | **1** | Low (Simple) |
| `_requireValidMaxFeePercentage` | **2** | Low (Simple) |
| `_getNewICRFromTroveChange` | **2** | Low (Simple) |
| `_getNewTCRFromTroveChange` | **3** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `openTrove` | **1** | Low (Simple) |
| `openTroveLeverUp` | **1** | Low (Simple) |
| `closeTroveUnlever` | **1** | Low (Simple) |
| `closeTrove` | **1** | Low (Simple) |
| `adjustTrove` | **1** | Low (Simple) |
| `addColl` | **1** | Low (Simple) |
| `addCollLeverUp` | **1** | Low (Simple) |
| `withdrawColl` | **1** | Low (Simple) |
| `withdrawCollUnleverUp` | **1** | Low (Simple) |
| `withdrawYUSD` | **1** | Low (Simple) |
| `repayYUSD` | **1** | Low (Simple) |
| `claimCollateral` | **1** | Low (Simple) |
| `getCompositeDebt` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `_getCompositeDebt` | **1** | Low (Simple) |
| `_getNetDebt` | **1** | Low (Simple) |
| `getEntireSystemColl` | **1** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `_getICRColls` | **1** | Low (Simple) |
| `_getVC` | **2** | Low (Simple) |
| `_getVCColls` | **2** | Low (Simple) |
| `_getUSDColls` | **2** | Low (Simple) |
| `_getTCR` | **1** | Low (Simple) |
| `_checkRecoveryMode` | **1** | Low (Simple) |
| `_requireUserAcceptsFee` | **1** | Low (Simple) |
| `_CollsIsNonZero` | **3** | Low (Simple) |
| `_checkPotentialRecoveryMode` | **1** | Low (Simple) |
| `_sumColls` | **8** | Moderate (Complex) |
| `_sumColls` | **1** | Low (Simple) |
| `_sumColls` | **1** | Low (Simple) |
| `_leftSumColls` | **2** | Low (Simple) |
| `_leftSubColls` | **2** | Low (Simple) |
| `_subColls` | **8** | Moderate (Complex) |
| `_getArrayCopy` | **2** | Low (Simple) |
| `getEntireSystemDebt` | **1** | Low (Simple) |
| `resetSortedTroves` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: PriceFeedTester
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setAddresses` | **1** | Low (Simple) |
| `fetchPrice` | **34** | ⚠️ High (Refactor recommended) |
| `fetchPrice_v` | **33** | ⚠️ High (Refactor recommended) |
| `_chainlinkIsBroken` | **1** | Low (Simple) |
| `_badChainlinkResponse` | **5** | Moderate (Complex) |
| `_chainlinkIsFrozen` | **1** | Low (Simple) |
| `_chainlinkPriceChangeAboveMax` | **1** | Low (Simple) |
| `_tellorIsBroken` | **4** | Low (Simple) |
| `_tellorIsFrozen` | **1** | Low (Simple) |
| `_bothOraclesLiveAndUnbrokenAndSimilarPrice` | **2** | Low (Simple) |
| `_bothOraclesSimilarPrice` | **1** | Low (Simple) |
| `_scaleChainlinkPriceByDigits` | **3** | Low (Simple) |
| `_scaleTellorPriceByDigits` | **1** | Low (Simple) |
| `_changeStatus` | **1** | Low (Simple) |
| `_storePrice` | **1** | Low (Simple) |
| `_storeTellorPrice` | **1** | Low (Simple) |
| `_storeChainlinkPrice` | **1** | Low (Simple) |
| `_getCurrentTellorResponse` | **2** | Low (Simple) |
| `_getCurrentChainlinkResponse` | **3** | Low (Simple) |
| `_getPrevChainlinkResponse` | **2** | Low (Simple) |
| `fetchPrice_v` | **1** | Low (Simple) |
| `checkContract` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setLastGoodPrice` | **1** | Low (Simple) |
| `setStatus` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: YUSDTokenCaller
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setYUSD` | **1** | Low (Simple) |
| `yusdMint` | **1** | Low (Simple) |
| `yusdBurn` | **1** | Low (Simple) |
| `yusdSendToPool` | **1** | Low (Simple) |
| `yusdReturnFromPool` | **1** | Low (Simple) |

---

### Contract: sYETITokenTester
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `balanceOf` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `_transfer` | **3** | Low (Simple) |
| `_useAllowance` | **3** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `buyBack` | **1** | Low (Simple) |
| `publicBuyBack` | **1** | Low (Simple) |
| `_buyBack` | **1** | Low (Simple) |
| `rebase` | **2** | Low (Simple) |
| `_getValueOfContract` | **1** | Low (Simple) |
| `setTransferRatio` | **1** | Low (Simple) |
| `addValidRouter` | **1** | Low (Simple) |
| `removeValidRouter` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `transferOwnership` | **2** | Low (Simple) |
| `claimOwnership` | **1** | Low (Simple) |
| `_calculateDomainSeparator` | **1** | Low (Simple) |
| `_domainSeparator` | **2** | Low (Simple) |
| `_getDigest` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `getUserInfo` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: ERC20Token
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `decimals` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |

---

### Contract: ThreePieceWiseLinearPriceCurve
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `isOwner` | **1** | Low (Simple) |
| `_renounceOwnership` | **1** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `setDecayTime` | **1** | Low (Simple) |
| `getFee` | **1** | Low (Simple) |
| `getFeeAndUpdate` | **1** | Low (Simple) |
| `setFeeCapAndTime` | **1** | Low (Simple) |
| `getFeeCapAndTime` | **1** | Low (Simple) |
| `calculateDecayedFee` | **1** | Low (Simple) |
| `adjustParams` | **3** | Low (Simple) |
| `setAddresses` | **1** | Low (Simple) |
| `setDecayTime` | **1** | Low (Simple) |
| `getFeeCapAndTime` | **1** | Low (Simple) |
| `setFeeCapAndTime` | **1** | Low (Simple) |
| `getFee` | **2** | Low (Simple) |
| `getFeeAndUpdate` | **2** | Low (Simple) |
| `_getFeePoint` | **6** | Moderate (Complex) |
| `calculateDecayedFee` | **2** | Low (Simple) |
| `_min` | **2** | Low (Simple) |
| `_max` | **2** | Low (Simple) |

---
