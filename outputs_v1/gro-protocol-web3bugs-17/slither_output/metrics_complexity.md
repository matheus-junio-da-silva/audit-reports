# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+-------------------+-----------------+-----------+------------+
| Contract          | State variables | Constants | Immutables |
+-------------------+-----------------+-----------+------------+
| WithdrawHandler   | 6               | 9         | 9          |
| FixedGTokens      | 0               | 0         | 2          |
| SafeMath          | 0               | 0         | 0          |
| SafeERC20         | 0               | 0         | 0          |
| Address           | 0               | 0         | 0          |
| DepositHandler    | 6               | 9         | 9          |
| Controller        | 22              | 9         | 8          |
| FixedVaults       | 0               | 9         | 3          |
| FixedStablecoins  | 0               | 9         | 6          |
| PnL               | 5               | 9         | 2          |
| Whitelist         | 1               | 0         | 0          |
| Controllable      | 1               | 0         | 0          |
| Constants         | 0               | 9         | 0          |
| GERC20            | 6               | 0         | 0          |
| NonRebasingGToken | 2               | 11        | 0          |
| RebasingGToken    | 2               | 10        | 0          |
| GToken            | 2               | 10        | 0          |
| LifeGuard3Pool    | 7               | 9         | 9          |
| ERC20             | 6               | 0         | 0          |
| Insurance         | 9               | 9         | 0          |
| Allocation        | 4               | 9         | 0          |
| Exposure          | 4               | 9         | 0          |
| TOTAL             | 83              | 130       | 48         |
+-------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+-------------------+--------+----------+----------+---------+
| Contract          | Public | External | Internal | Private |
+-------------------+--------+----------+----------+---------+
| WithdrawHandler   | 5      | 11       | 11       | 5       |
| FixedGTokens      | 0      | 0        | 1        | 0       |
| SafeMath          | 0      | 0        | 13       | 0       |
| SafeERC20         | 0      | 0        | 5        | 1       |
| Address           | 0      | 0        | 10       | 1       |
| DepositHandler    | 4      | 7        | 12       | 3       |
| Controller        | 7      | 63       | 11       | 3       |
| FixedVaults       | 0      | 0        | 3        | 0       |
| FixedStablecoins  | 0      | 0        | 5        | 0       |
| PnL               | 4      | 21       | 7        | 3       |
| Whitelist         | 3      | 2        | 2        | 0       |
| Controllable      | 4      | 1        | 4        | 0       |
| Constants         | 0      | 0        | 1        | 0       |
| GERC20            | 11     | 6        | 9        | 0       |
| NonRebasingGToken | 22     | 22       | 13       | 0       |
| RebasingGToken    | 21     | 24       | 12       | 0       |
| GToken            | 17     | 18       | 12       | 0       |
| LifeGuard3Pool    | 4      | 37       | 10       | 4       |
| ERC20             | 11     | 6        | 8        | 0       |
| Insurance         | 6      | 28       | 5        | 8       |
| Allocation        | 7      | 8        | 5        | 5       |
| Exposure          | 5      | 14       | 5        | 4       |
| TOTAL             | 131    | 268      | 164      | 37      |
+-------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+-------------------+----------+------+------+
| Contract          | Mutating | View | Pure |
+-------------------+----------+------+------+
| WithdrawHandler   | 18       | 14   | 0    |
| FixedGTokens      | 0        | 1    | 0    |
| SafeMath          | 0        | 0    | 13   |
| SafeERC20         | 6        | 0    | 0    |
| Address           | 7        | 3    | 1    |
| DepositHandler    | 13       | 13   | 0    |
| Controller        | 38       | 46   | 0    |
| FixedVaults       | 1        | 2    | 0    |
| FixedStablecoins  | 1        | 4    | 0    |
| PnL               | 20       | 14   | 1    |
| Whitelist         | 4        | 3    | 0    |
| Controllable      | 3        | 6    | 0    |
| Constants         | 1        | 0    | 0    |
| GERC20            | 15       | 11   | 0    |
| NonRebasingGToken | 28       | 26   | 3    |
| RebasingGToken    | 29       | 26   | 2    |
| GToken            | 24       | 21   | 2    |
| LifeGuard3Pool    | 29       | 26   | 0    |
| ERC20             | 14       | 11   | 0    |
| Insurance         | 21       | 26   | 0    |
| Allocation        | 8        | 13   | 4    |
| Exposure          | 8        | 17   | 3    |
| TOTAL             | 288      | 283  | 29   |
+-------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+-------------------+-------------------+----------------------+--------------+
| Contract          | External mutating | No auth or onlyOwner | No modifiers |
+-------------------+-------------------+----------------------+--------------+
| WithdrawHandler   | 13                | 13                   | 9            |
| FixedGTokens      | 0                 | 0                    | 0            |
| SafeMath          | 0                 | 0                    | 0            |
| SafeERC20         | 0                 | 0                    | 0            |
| Address           | 0                 | 0                    | 0            |
| DepositHandler    | 9                 | 9                    | 2            |
| Controller        | 66                | 66                   | 42           |
| FixedVaults       | 0                 | 0                    | 0            |
| FixedStablecoins  | 0                 | 0                    | 0            |
| PnL               | 23                | 23                   | 18           |
| Whitelist         | 4                 | 4                    | 0            |
| Controllable      | 3                 | 3                    | 0            |
| Constants         | 0                 | 0                    | 0            |
| GERC20            | 11                | 11                   | 11           |
| NonRebasingGToken | 30                | 30                   | 22           |
| RebasingGToken    | 33                | 33                   | 25           |
| GToken            | 25                | 25                   | 20           |
| LifeGuard3Pool    | 39                | 39                   | 30           |
| ERC20             | 11                | 11                   | 11           |
| Insurance         | 30                | 30                   | 17           |
| Allocation        | 10                | 10                   | 3            |
| Exposure          | 16                | 16                   | 9            |
| TOTAL             | 323               | 323                  | 219          |
+-------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+-------------------+-----------+-----+-----+-----+-----+
| Contract          | Ext calls | RFC | NOC | DIT | CBO |
+-------------------+-----------+-----+-----+-----+-----+
| WithdrawHandler   | 51        | 56  | 0   | 3   | 8   |
| FixedGTokens      | 0         | 0   | 2   | 0   | 0   |
| SafeMath          | 0         | 0   | 0   | 0   | 14  |
| SafeERC20         | 6         | 6   | 0   | 0   | 5   |
| Address           | 0         | 0   | 0   | 0   | 1   |
| DepositHandler    | 31        | 35  | 0   | 3   | 8   |
| Controller        | 61        | 121 | 0   | 3   | 9   |
| FixedVaults       | 0         | 0   | 2   | 1   | 0   |
| FixedStablecoins  | 0         | 0   | 4   | 1   | 0   |
| PnL               | 51        | 46  | 0   | 3   | 4   |
| Whitelist         | 0         | 5   | 8   | 2   | 0   |
| Controllable      | 1         | 6   | 7   | 2   | 1   |
| Constants         | 0         | 0   | 13  | 0   | 0   |
| GERC20            | 10        | 25  | 3   | 1   | 1   |
| NonRebasingGToken | 20        | 58  | 0   | 4   | 2   |
| RebasingGToken    | 20        | 59  | 0   | 4   | 2   |
| GToken            | 20        | 49  | 2   | 3   | 2   |
| LifeGuard3Pool    | 76        | 100 | 0   | 3   | 9   |
| ERC20             | 9         | 24  | 0   | 1   | 1   |
| Insurance         | 89        | 114 | 0   | 3   | 10  |
| Allocation        | 43        | 43  | 0   | 3   | 6   |
| Exposure          | 40        | 49  | 0   | 3   | 7   |
+-------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics
Error executing: encode_ir_for_halstead: REF_155 -> CODESIZE account

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.09
+-------------------+------------+--------------+-------------+-----------------------------+
| Contract          | Dependents | Dependencies | Instability | Distance from main sequence |
+-------------------+------------+--------------+-------------+-----------------------------+
| WithdrawHandler   | 0          | 8            | 1.00        | 0.91                        |
| FixedGTokens      | 0          | 0            | 0.00        | 0.00                        |
| SafeMath          | 14         | 0            | 0.00        | 0.09                        |
| SafeERC20         | 2          | 3            | 0.60        | 0.51                        |
| Address           | 1          | 0            | 0.00        | 0.09                        |
| DepositHandler    | 0          | 8            | 1.00        | 0.91                        |
| Controller        | 0          | 9            | 1.00        | 0.91                        |
| FixedVaults       | 0          | 0            | 0.00        | 0.00                        |
| FixedStablecoins  | 0          | 0            | 0.00        | 0.00                        |
| PnL               | 0          | 4            | 1.00        | 0.91                        |
| Whitelist         | 0          | 0            | 0.00        | 0.00                        |
| Controllable      | 0          | 1            | 1.00        | 0.91                        |
| Constants         | 0          | 0            | 0.00        | 0.00                        |
| GERC20            | 0          | 1            | 1.00        | 0.91                        |
| NonRebasingGToken | 0          | 2            | 1.00        | 0.91                        |
| RebasingGToken    | 0          | 2            | 1.00        | 0.91                        |
| GToken            | 0          | 2            | 1.00        | 0.91                        |
| LifeGuard3Pool    | 0          | 9            | 1.00        | 0.91                        |
| ERC20             | 0          | 1            | 1.00        | 0.91                        |
| Insurance         | 0          | 10           | 1.00        | 0.91                        |
| Allocation        | 0          | 6            | 1.00        | 0.91                        |
| Exposure          | 0          | 7            | 1.00        | 0.91                        |
+-------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1624 | 0   | 0    |
| sloc  | 893  | 0   | 0    |
| cloc  | 488  | 0   | 0    |
| Total | 3005 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1458 | 0   | 0    |
| sloc  | 751  | 0   | 0    |
| cloc  | 472  | 0   | 0    |
| Total | 2681 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1795 | 0   | 0    |
| sloc  | 977  | 0   | 0    |
| cloc  | 530  | 0   | 0    |
| Total | 3302 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 25  | 0   | 0    |
| sloc  | 20  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 46  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 76  | 0   | 0    |
| sloc  | 46  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 123 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 30  | 0   | 0    |
| sloc  | 20  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 51  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 40  | 0   | 0    |
| sloc  | 22  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 63  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 98  | 0   | 0    |
| sloc  | 70  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 169 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 32  | 0   | 0    |
| sloc  | 21  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 54  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 6   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 11  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 49  | 0   | 0    |
| sloc  | 31  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 82  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 71  | 0   | 0    |
| sloc  | 59  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 132 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 16  | 0   | 0    |
| sloc  | 13  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 30  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 170 | 0   | 0    |
| sloc  | 118 | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 294 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 31  | 0   | 0    |
| sloc  | 20  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 52  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 61  | 0   | 0    |
| sloc  | 51  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 114 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 42  | 0   | 0    |
| sloc  | 26  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 69  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 17  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 32  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 41  | 0   | 0    |
| sloc  | 31  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 76  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 10  | 0   | 0    |
| sloc  | 6   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 17  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1309 | 0   | 0    |
| sloc  | 672  | 0   | 0    |
| cloc  | 459  | 0   | 0    |
| Total | 2440 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 120 | 0   | 0    |
| sloc  | 58  | 0   | 0    |
| cloc  | 45  | 0   | 0    |
| Total | 223 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 780  | 0   | 0    |
| sloc  | 285  | 0   | 0    |
| cloc  | 394  | 0   | 0    |
| Total | 1459 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 14  | 0   | 0    |
| sloc  | 12  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 27  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 189 | 0   | 0    |
| sloc  | 145 | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 338 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 20  | 0   | 0    |
| sloc  | 11  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 32  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 61  | 0   | 0    |
| sloc  | 47  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 109 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 867  | 0   | 0    |
| sloc  | 280  | 0   | 0    |
| cloc  | 508  | 0   | 0    |
| Total | 1655 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1355 | 0   | 0    |
| sloc  | 561  | 0   | 0    |
| cloc  | 621  | 0   | 0    |
| Total | 2537 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1375 | 0   | 0    |
| sloc  | 570  | 0   | 0    |
| cloc  | 633  | 0   | 0    |
| Total | 2578 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1249 | 0   | 0    |
| sloc  | 501  | 0   | 0    |
| cloc  | 590  | 0   | 0    |
| Total | 2340 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1958 | 0   | 0    |
| sloc  | 1006 | 0   | 0    |
| cloc  | 673  | 0   | 0    |
| Total | 3637 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1780 | 0   | 0    |
| sloc  | 954  | 0   | 0    |
| cloc  | 557  | 0   | 0    |
| Total | 3291 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1476 | 0   | 0    |
| sloc  | 738  | 0   | 0    |
| cloc  | 523  | 0   | 0    |
| Total | 2737 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1482 | 0   | 0    |
| sloc  | 772  | 0   | 0    |
| cloc  | 493  | 0   | 0    |
| Total | 2747 | 0   | 0    |
+-------+------+-----+------+
```

## Function Complexity & Standards Checks
### Contract: WithdrawHandler
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `withdrawByLPToken` | **1** | Low (Simple) |
| `withdrawByStablecoin` | **1** | Low (Simple) |
| `withdrawAllSingle` | **1** | Low (Simple) |
| `withdrawAllBalanced` | **1** | Low (Simple) |
| `getVault` | **3** | Low (Simple) |
| `vaults` | **1** | Low (Simple) |
| `underlyingTokens` | **1** | Low (Simple) |
| `getToken` | **3** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `getDecimal` | **3** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `setDependencies` | **1** | Low (Simple) |
| `withdrawByLPToken` | **1** | Low (Simple) |
| `withdrawByStablecoin` | **2** | Low (Simple) |
| `withdrawAllSingle` | **2** | Low (Simple) |
| `withdrawAllBalanced` | **1** | Low (Simple) |
| `getVaultDeltas` | **3** | Low (Simple) |
| `withdrawalFee` | **1** | Low (Simple) |
| `_withdrawAllSingleFromAccount` | **1** | Low (Simple) |
| `_withdraw` | **3** | Low (Simple) |
| `_withdrawSingle` | **2** | Low (Simple) |
| `_withdrawBalanced` | **3** | Low (Simple) |
| `_prepareForWithdrawalSingle` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: FixedGTokens
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `gTokens` | **2** | Low (Simple) |

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

### Contract: DepositHandler
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `depositGvt` | **1** | Low (Simple) |
| `depositPwrd` | **1** | Low (Simple) |
| `getVault` | **3** | Low (Simple) |
| `vaults` | **1** | Low (Simple) |
| `underlyingTokens` | **1** | Low (Simple) |
| `getToken` | **3** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `getDecimal` | **3** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `setDependencies` | **1** | Low (Simple) |
| `setFeeToken` | **1** | Low (Simple) |
| `depositPwrd` | **1** | Low (Simple) |
| `depositGvt` | **1** | Low (Simple) |
| `depositGToken` | **1** | Low (Simple) |
| `_deposit` | **8** | Moderate (Complex) |
| `_invest` | **2** | Low (Simple) |
| `roughUsd` | **3** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Controller
**Auto-Detected Standards/Inherited Protocols:** Ownable, Pausable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `stablecoins` | **1** | Low (Simple) |
| `vaults` | **1** | Low (Simple) |
| `underlyingVaults` | **1** | Low (Simple) |
| `curveVault` | **1** | Low (Simple) |
| `pnl` | **1** | Low (Simple) |
| `insurance` | **1** | Low (Simple) |
| `lifeGuard` | **1** | Low (Simple) |
| `buoy` | **1** | Low (Simple) |
| `reward` | **1** | Low (Simple) |
| `isValidBigFish` | **1** | Low (Simple) |
| `withdrawHandler` | **1** | Low (Simple) |
| `emergencyHandler` | **1** | Low (Simple) |
| `depositHandler` | **1** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `gTokenTotalAssets` | **1** | Low (Simple) |
| `eoaOnly` | **1** | Low (Simple) |
| `getSkimPercent` | **1** | Low (Simple) |
| `gToken` | **1** | Low (Simple) |
| `emergencyState` | **1** | Low (Simple) |
| `deadCoin` | **1** | Low (Simple) |
| `distributeStrategyGainLoss` | **1** | Low (Simple) |
| `burnGToken` | **1** | Low (Simple) |
| `mintGToken` | **1** | Low (Simple) |
| `getUserAssets` | **1** | Low (Simple) |
| `referrals` | **1** | Low (Simple) |
| `addReferral` | **1** | Low (Simple) |
| `getStrategiesTargetRatio` | **1** | Low (Simple) |
| `withdrawalFee` | **1** | Low (Simple) |
| `validGTokenDecrease` | **1** | Low (Simple) |
| `gTokens` | **2** | Low (Simple) |
| `underlyingTokens` | **1** | Low (Simple) |
| `getToken` | **3** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `getDecimal` | **3** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `paused` | **1** | Low (Simple) |
| `_pause` | **1** | Low (Simple) |
| `_unpause` | **1** | Low (Simple) |
| `pause` | **1** | Low (Simple) |
| `unpause` | **1** | Low (Simple) |
| `setWithdrawHandler` | **1** | Low (Simple) |
| `setDepositHandler` | **1** | Low (Simple) |
| `stablecoins` | **1** | Low (Simple) |
| `getSkimPercent` | **1** | Low (Simple) |
| `vaults` | **2** | Low (Simple) |
| `setVault` | **1** | Low (Simple) |
| `setCurveVault` | **1** | Low (Simple) |
| `setLifeGuard` | **1** | Low (Simple) |
| `setInsurance` | **1** | Low (Simple) |
| `setPnL` | **1** | Low (Simple) |
| `addSafeAddress` | **1** | Low (Simple) |
| `switchEoaOnly` | **1** | Low (Simple) |
| `setBigFishThreshold` | **1** | Low (Simple) |
| `setReward` | **1** | Low (Simple) |
| `addReferral` | **2** | Low (Simple) |
| `setWithdrawalFee` | **1** | Low (Simple) |
| `totalAssets` | **2** | Low (Simple) |
| `gTokenTotalAssets` | **3** | Low (Simple) |
| `gToken` | **2** | Low (Simple) |
| `isValidBigFish` | **5** | Moderate (Complex) |
| `distributeCurveAssets` | **1** | Low (Simple) |
| `eoaOnly` | **2** | Low (Simple) |
| `_totalAssets` | **2** | Low (Simple) |
| `_totalAssetsEmergency` | **3** | Low (Simple) |
| `emergency` | **4** | Low (Simple) |
| `restart` | **2** | Low (Simple) |
| `distributeStrategyGainLoss` | **7** | Moderate (Complex) |
| `realizePriceChange` | **3** | Low (Simple) |
| `burnGToken` | **2** | Low (Simple) |
| `mintGToken` | **1** | Low (Simple) |
| `getUserAssets` | **1** | Low (Simple) |
| `validGTokenIncrease` | **1** | Low (Simple) |
| `validGTokenDecrease` | **1** | Low (Simple) |
| `setUtilisationRatioLimitPwrd` | **1** | Low (Simple) |
| `setUtilisationRatioLimitGvt` | **1** | Low (Simple) |
| `getStrategiesTargetRatio` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: FixedVaults
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getVault` | **3** | Low (Simple) |
| `vaults` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: FixedStablecoins
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `underlyingTokens` | **1** | Low (Simple) |
| `getToken` | **3** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `getDecimal` | **3** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: PnL
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `calcPnL` | **1** | Low (Simple) |
| `increaseGTokenLastAmount` | **1** | Low (Simple) |
| `decreaseGTokenLastAmount` | **1** | Low (Simple) |
| `lastGvtAssets` | **1** | Low (Simple) |
| `lastPwrdAssets` | **1** | Low (Simple) |
| `utilisationRatio` | **1** | Low (Simple) |
| `emergencyPnL` | **1** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `distributeStrategyGainLoss` | **1** | Low (Simple) |
| `distributePriceChange` | **1** | Low (Simple) |
| `gTokens` | **2** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `setRebase` | **1** | Low (Simple) |
| `setPerformanceFee` | **1** | Low (Simple) |
| `increaseGTokenLastAmount` | **2** | Low (Simple) |
| `decreaseGTokenLastAmount` | **6** | Moderate (Complex) |
| `calcPnL` | **1** | Low (Simple) |
| `utilisationRatio` | **2** | Low (Simple) |
| `emergencyPnL` | **1** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `handleInvestGain` | **5** | Moderate (Complex) |
| `handleLoss` | **2** | Low (Simple) |
| `forceDistribute` | **2** | Low (Simple) |
| `distributeStrategyGainLoss` | **4** | Low (Simple) |
| `distributePriceChange` | **3** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Whitelist
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |

---

### Contract: Controllable
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |

---

### Contract: Constants
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: GERC20
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupplyBase` | **1** | Low (Simple) |
| `balanceOfBase` | **1** | Low (Simple) |
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
| `_decreaseApproved` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |

---

### Contract: NonRebasingGToken
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setController` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `applyFactor` | **3** | Low (Simple) |
| `factor` | **3** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getInitialBase` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnAll` | **1** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getPricePerShare` | **1** | Low (Simple) |
| `getShareAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupplyBase` | **1** | Low (Simple) |
| `balanceOfBase` | **1** | Low (Simple) |
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
| `_decreaseApproved` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `getPricePerShare` | **2** | Low (Simple) |
| `getShareAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `getInitialBase` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnAll` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: RebasingGToken
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setController` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `applyFactor` | **3** | Low (Simple) |
| `factor` | **3** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getInitialBase` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnAll` | **1** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getPricePerShare` | **1** | Low (Simple) |
| `getShareAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupplyBase` | **1** | Low (Simple) |
| `balanceOfBase` | **1** | Low (Simple) |
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
| `_decreaseApproved` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `totalSupply` | **2** | Low (Simple) |
| `balanceOf` | **2** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `getPricePerShare` | **1** | Low (Simple) |
| `getShareAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnAll` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: GToken
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `factor` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnAll` | **1** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getPricePerShare` | **1** | Low (Simple) |
| `getShareAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupplyBase` | **1** | Low (Simple) |
| `balanceOfBase` | **1** | Low (Simple) |
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
| `_decreaseApproved` | **1** | Low (Simple) |
| `_setupDecimals` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `factor` | **1** | Low (Simple) |
| `applyFactor` | **3** | Low (Simple) |
| `factor` | **3** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getInitialBase` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LifeGuard3Pool
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `underlyingTokens` | **1** | Low (Simple) |
| `getToken` | **3** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `getDecimal` | **3** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `assets` | **1** | Low (Simple) |
| `totalAssets` | **1** | Low (Simple) |
| `getAssets` | **1** | Low (Simple) |
| `totalAssetsUsd` | **1** | Low (Simple) |
| `availableUsd` | **1** | Low (Simple) |
| `availableLP` | **1** | Low (Simple) |
| `depositStable` | **1** | Low (Simple) |
| `investToCurveVault` | **1** | Low (Simple) |
| `distributeCurveVault` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `withdrawSingleByLiquidity` | **1** | Low (Simple) |
| `withdrawSingleByExchange` | **1** | Low (Simple) |
| `invest` | **1** | Low (Simple) |
| `getBuoy` | **1** | Low (Simple) |
| `investSingle` | **1** | Low (Simple) |
| `investToCurveVaultTrigger` | **1** | Low (Simple) |
| `setDependencies` | **4** | Low (Simple) |
| `getAssets` | **2** | Low (Simple) |
| `approveVaults` | **2** | Low (Simple) |
| `setInvestToCurveThreshold` | **1** | Low (Simple) |
| `investToCurveVault` | **2** | Low (Simple) |
| `investToCurveVaultTrigger` | **1** | Low (Simple) |
| `distributeCurveVault` | **2** | Low (Simple) |
| `depositStable` | **5** | Moderate (Complex) |
| `skim` | **1** | Low (Simple) |
| `deposit` | **2** | Low (Simple) |
| `withdrawSingleByLiquidity` | **1** | Low (Simple) |
| `withdrawSingleByExchange` | **6** | Moderate (Complex) |
| `getBuoy` | **1** | Low (Simple) |
| `invest` | **3** | Low (Simple) |
| `investSingle` | **6** | Moderate (Complex) |
| `totalAssets` | **1** | Low (Simple) |
| `availableLP` | **2** | Low (Simple) |
| `totalAssetsUsd` | **1** | Low (Simple) |
| `availableUsd` | **1** | Low (Simple) |
| `_exchange` | **1** | Low (Simple) |
| `_withdrawUnbalanced` | **4** | Low (Simple) |
| `_totalAssets` | **2** | Low (Simple) |
| `_investToVault` | **5** | Moderate (Complex) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: ERC20
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
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

---

### Contract: Insurance
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `calculateDepositDeltasOnAllVaults` | **1** | Low (Simple) |
| `rebalanceTrigger` | **1** | Low (Simple) |
| `rebalance` | **1** | Low (Simple) |
| `calcSkim` | **1** | Low (Simple) |
| `rebalanceForWithdraw` | **1** | Low (Simple) |
| `getDelta` | **1** | Low (Simple) |
| `getVaultDeltaForDeposit` | **1** | Low (Simple) |
| `sortVaultsByDelta` | **1** | Low (Simple) |
| `getStrategiesTargetRatio` | **1** | Low (Simple) |
| `setUnderlyingTokenPercent` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `setAllocation` | **1** | Low (Simple) |
| `setExposure` | **1** | Low (Simple) |
| `setUnderlyingTokenPercent` | **1** | Low (Simple) |
| `setCurveVaultPercent` | **1** | Low (Simple) |
| `setExposureBufferRebalance` | **1** | Low (Simple) |
| `setWhaleThresholdWithdraw` | **1** | Low (Simple) |
| `setWhaleThresholdDeposit` | **1** | Low (Simple) |
| `calculateDepositDeltasOnAllVaults` | **1** | Low (Simple) |
| `getVaultDeltaForDeposit` | **2** | Low (Simple) |
| `sortVaultsByDelta` | **1** | Low (Simple) |
| `rebalanceTrigger` | **1** | Low (Simple) |
| `rebalance` | **2** | Low (Simple) |
| `rebalanceForWithdraw` | **1** | Low (Simple) |
| `calcSkim` | **2** | Low (Simple) |
| `getStrategiesTargetRatio` | **1** | Low (Simple) |
| `prepareCalculation` | **2** | Low (Simple) |
| `withdraw` | **7** | Moderate (Complex) |
| `calculateWithdrawalAmountsOnPartVaults` | **4** | Low (Simple) |
| `getDelta` | **1** | Low (Simple) |
| `calculateWithdrawalAmountsOnAllVaults` | **4** | Low (Simple) |
| `calculateVaultSwapData` | **1** | Low (Simple) |
| `getLifeGuard` | **1** | Low (Simple) |
| `_rebalance` | **10** | ⚠️ High (Refactor recommended) |
| `moveAssetsFromVaultsToLifeguard` | **3** | Low (Simple) |
| `getStablePercents` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Allocation
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `calcSystemTargetDelta` | **1** | Low (Simple) |
| `calcVaultTargetDelta` | **1** | Low (Simple) |
| `calcStrategyPercent` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `setSwapThreshold` | **1** | Low (Simple) |
| `setCurvePercentThreshold` | **1** | Low (Simple) |
| `calcSystemTargetDelta` | **2** | Low (Simple) |
| `calcVaultTargetDelta` | **1** | Low (Simple) |
| `calcProtocolWithdraw` | **5** | Moderate (Complex) |
| `_calcVaultTargetDelta` | **12** | ⚠️ High (Refactor recommended) |
| `calcStrategyPercent` | **1** | Low (Simple) |
| `calcProtocolExposureDelta` | **3** | Low (Simple) |
| `invalidDelta` | **1** | Low (Simple) |
| `needCurveVault` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Exposure
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `calcRiskExposure` | **1** | Low (Simple) |
| `getExactRiskExposure` | **1** | Low (Simple) |
| `getUnifiedAssets` | **1** | Low (Simple) |
| `sortVaultsByDelta` | **1** | Low (Simple) |
| `calcRoughDelta` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `removeFromWhitelist` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `ctrlPaused` | **1** | Low (Simple) |
| `setController` | **1** | Low (Simple) |
| `_controller` | **1** | Low (Simple) |
| `_pausable` | **1** | Low (Simple) |
| `setProtocolCount` | **1** | Low (Simple) |
| `setMakerUSDCExposure` | **1** | Low (Simple) |
| `getExactRiskExposure` | **2** | Low (Simple) |
| `calcRiskExposure` | **1** | Low (Simple) |
| `getUnifiedAssets` | **2** | Low (Simple) |
| `calcRoughDelta` | **5** | Moderate (Complex) |
| `sortVaultsByDelta` | **5** | Moderate (Complex) |
| `calculatePercentOfSystem` | **2** | Low (Simple) |
| `calculateStableCoinExposure` | **3** | Low (Simple) |
| `isExposed` | **6** | Moderate (Complex) |
| `_calcRiskExposure` | **5** | Moderate (Complex) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---
