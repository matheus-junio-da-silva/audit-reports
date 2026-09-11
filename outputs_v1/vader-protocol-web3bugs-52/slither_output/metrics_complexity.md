# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+------------------------------+-----------------+-----------+------------+
| Contract                     | State variables | Constants | Immutables |
+------------------------------+-----------------+-----------+------------+
| Migrations                   | 2               | 0         | 0          |
| VaderMath                    | 0               | 1         | 0          |
| SafeERC20                    | 0               | 0         | 0          |
| Address                      | 0               | 0         | 0          |
| VaderRouter                  | 1               | 19        | 1          |
| SwapQueue                    | 1               | 19        | 0          |
| Strings                      | 0               | 2         | 0          |
| Math                         | 0               | 0         | 0          |
| SignedMath                   | 0               | 0         | 0          |
| BasePool                     | 9               | 19        | 2          |
| UQ112x112                    | 0               | 1         | 0          |
| VaderPool                    | 6               | 19        | 2          |
| VaderPoolFactory             | 4               | 19        | 0          |
| GasThrottle                  | 0               | 19        | 0          |
| GovernorAlpha                | 8               | 3         | 1          |
| Timelock                     | 4               | 0         | 0          |
| SafeMath                     | 0               | 0         | 0          |
| Babylonian                   | 0               | 0         | 0          |
| BitMath                      | 0               | 0         | 0          |
| FixedPoint                   | 0               | 4         | 0          |
| FullMath                     | 0               | 0         | 0          |
| UniswapV2Library             | 0               | 0         | 0          |
| UniswapV2OracleLibrary       | 0               | 0         | 0          |
| TwapOracle                   | 8               | 0         | 0          |
| ProtocolConstants            | 0               | 19        | 0          |
| Vader                        | 7               | 19        | 0          |
| USDV                         | 0               | 19        | 2          |
| LinearVesting                | 3               | 19        | 1          |
| MerkleProof                  | 0               | 0         | 0          |
| Converter                    | 1               | 19        | 4          |
| VaderReserve                 | 2               | 19        | 1          |
| StakingRewards               | 14              | 0         | 2          |
| Owned                        | 2               | 0         | 0          |
| RewardsDistributionRecipient | 3               | 0         | 0          |
| Pausable                     | 4               | 0         | 0          |
| Counters                     | 0               | 0         | 0          |
| ShortStrings                 | 0               | 1         | 0          |
| StorageSlot                  | 0               | 0         | 0          |
| ECDSA                        | 0               | 0         | 0          |
| SafeCast                     | 0               | 0         | 0          |
| XVader                       | 0               | 19        | 1          |
| UniswapV2Pair                | 15              | 6         | 0          |
| UniswapV2ERC20               | 5               | 4         | 0          |
| VaderRouterV2                | 1               | 19        | 2          |
| LPToken                      | 0               | 19        | 2          |
| LPWrapper                    | 1               | 19        | 0          |
| BasePoolV2                   | 5               | 19        | 1          |
| VaderPoolV2                  | 8               | 19        | 1          |
| Synth                        | 0               | 19        | 0          |
| SynthFactory                 | 1               | 19        | 0          |
| TOTAL                        | 115             | 402       | 23         |
+------------------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+------------------------------+--------+----------+----------+---------+
| Contract                     | Public | External | Internal | Private |
+------------------------------+--------+----------+----------+---------+
| Migrations                   | 1      | 0        | 1        | 0       |
| VaderMath                    | 8      | 0        | 1        | 0       |
| SafeERC20                    | 0      | 0        | 7        | 2       |
| Address                      | 0      | 0        | 12       | 1       |
| VaderRouter                  | 6      | 9        | 6        | 2       |
| SwapQueue                    | 0      | 1        | 3        | 0       |
| Strings                      | 0      | 0        | 7        | 0       |
| Math                         | 0      | 0        | 14       | 0       |
| SignedMath                   | 0      | 0        | 4        | 0       |
| BasePool                     | 20     | 19       | 25       | 3       |
| UQ112x112                    | 0      | 0        | 3        | 0       |
| VaderPool                    | 20     | 23       | 25       | 5       |
| VaderPoolFactory             | 3      | 6        | 6        | 1       |
| GasThrottle                  | 0      | 0        | 1        | 0       |
| GovernorAlpha                | 17     | 5        | 4        | 3       |
| Timelock                     | 9      | 8        | 1        | 0       |
| SafeMath                     | 0      | 0        | 13       | 0       |
| Babylonian                   | 0      | 0        | 1        | 0       |
| BitMath                      | 0      | 0        | 2        | 0       |
| FixedPoint                   | 0      | 0        | 12       | 0       |
| FullMath                     | 0      | 0        | 2        | 1       |
| UniswapV2Library             | 0      | 0        | 8        | 0       |
| UniswapV2OracleLibrary       | 0      | 0        | 2        | 0       |
| TwapOracle                   | 6      | 7        | 5        | 0       |
| ProtocolConstants            | 0      | 0        | 1        | 0       |
| Vader                        | 16     | 18       | 16       | 1       |
| USDV                         | 14     | 11       | 13       | 0       |
| LinearVesting                | 3      | 10       | 6        | 3       |
| MerkleProof                  | 0      | 0        | 8        | 2       |
| Converter                    | 0      | 2        | 1        | 0       |
| VaderReserve                 | 4      | 6        | 6        | 1       |
| StakingRewards               | 5      | 23       | 2        | 3       |
| Owned                        | 0      | 2        | 0        | 1       |
| RewardsDistributionRecipient | 0      | 4        | 0        | 1       |
| Pausable                     | 0      | 3        | 0        | 1       |
| Counters                     | 0      | 0        | 4        | 0       |
| ShortStrings                 | 0      | 0        | 7        | 0       |
| StorageSlot                  | 0      | 0        | 8        | 0       |
| ECDSA                        | 0      | 0        | 10       | 1       |
| SafeCast                     | 0      | 0        | 64       | 0       |
| XVader                       | 24     | 24       | 20       | 9       |
| UniswapV2Pair                | 1      | 37       | 4        | 5       |
| UniswapV2ERC20               | 0      | 17       | 3        | 2       |
| VaderRouterV2                | 5      | 7        | 6        | 1       |
| LPToken                      | 16     | 13       | 17       | 0       |
| LPWrapper                    | 3      | 3        | 6        | 0       |
| BasePoolV2                   | 15     | 27       | 23       | 5       |
| VaderPoolV2                  | 19     | 45       | 25       | 6       |
| Synth                        | 14     | 13       | 16       | 0       |
| SynthFactory                 | 3      | 3        | 6        | 0       |
| TOTAL                        | 232    | 346      | 437      | 60      |
+------------------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+------------------------------+----------+------+------+
| Contract                     | Mutating | View | Pure |
+------------------------------+----------+------+------+
| Migrations                   | 2        | 0    | 0    |
| VaderMath                    | 1        | 0    | 8    |
| SafeERC20                    | 9        | 0    | 0    |
| Address                      | 7        | 4    | 2    |
| VaderRouter                  | 16       | 7    | 0    |
| SwapQueue                    | 4        | 0    | 0    |
| Strings                      | 1        | 0    | 6    |
| Math                         | 0        | 0    | 14   |
| SignedMath                   | 0        | 0    | 4    |
| BasePool                     | 36       | 31   | 0    |
| UQ112x112                    | 1        | 0    | 2    |
| VaderPool                    | 40       | 32   | 1    |
| VaderPoolFactory             | 8        | 8    | 0    |
| GasThrottle                  | 1        | 0    | 0    |
| GovernorAlpha                | 18       | 8    | 3    |
| Timelock                     | 11       | 3    | 4    |
| SafeMath                     | 0        | 0    | 13   |
| Babylonian                   | 0        | 0    | 1    |
| BitMath                      | 0        | 0    | 2    |
| FixedPoint                   | 1        | 0    | 11   |
| FullMath                     | 0        | 0    | 3    |
| UniswapV2Library             | 0        | 3    | 5    |
| UniswapV2OracleLibrary       | 0        | 2    | 0    |
| TwapOracle                   | 8        | 10   | 0    |
| ProtocolConstants            | 1        | 0    | 0    |
| Vader                        | 26       | 25   | 0    |
| USDV                         | 21       | 17   | 0    |
| LinearVesting                | 12       | 10   | 0    |
| MerkleProof                  | 0        | 0    | 10   |
| Converter                    | 3        | 0    | 0    |
| VaderReserve                 | 9        | 7    | 1    |
| StakingRewards               | 19       | 14   | 0    |
| Owned                        | 2        | 1    | 0    |
| RewardsDistributionRecipient | 4        | 1    | 0    |
| Pausable                     | 3        | 1    | 0    |
| Counters                     | 3        | 1    | 0    |
| ShortStrings                 | 2        | 1    | 4    |
| StorageSlot                  | 0        | 0    | 8    |
| ECDSA                        | 0        | 0    | 11   |
| SafeCast                     | 0        | 0    | 64   |
| XVader                       | 33       | 41   | 3    |
| UniswapV2Pair                | 29       | 13   | 5    |
| UniswapV2ERC20               | 13       | 5    | 4    |
| VaderRouterV2                | 14       | 5    | 0    |
| LPToken                      | 23       | 21   | 2    |
| LPWrapper                    | 6        | 6    | 0    |
| BasePoolV2                   | 34       | 36   | 0    |
| VaderPoolV2                  | 54       | 40   | 1    |
| Synth                        | 23       | 19   | 1    |
| SynthFactory                 | 6        | 6    | 0    |
| TOTAL                        | 504      | 378  | 193  |
+------------------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+------------------------------+-------------------+----------------------+--------------+
| Contract                     | External mutating | No auth or onlyOwner | No modifiers |
+------------------------------+-------------------+----------------------+--------------+
| Migrations                   | 1                 | 1                    | 0            |
| VaderMath                    | 0                 | 0                    | 0            |
| SafeERC20                    | 0                 | 0                    | 0            |
| Address                      | 0                 | 0                    | 0            |
| VaderRouter                  | 13                | 13                   | 6            |
| SwapQueue                    | 1                 | 1                    | 1            |
| Strings                      | 0                 | 0                    | 0            |
| Math                         | 0                 | 0                    | 0            |
| SignedMath                   | 0                 | 0                    | 0            |
| BasePool                     | 27                | 27                   | 23           |
| UQ112x112                    | 0                 | 0                    | 0            |
| VaderPool                    | 31                | 31                   | 26           |
| VaderPoolFactory             | 8                 | 8                    | 4            |
| GasThrottle                  | 0                 | 0                    | 0            |
| GovernorAlpha                | 15                | 15                   | 5            |
| Timelock                     | 14                | 14                   | 14           |
| SafeMath                     | 0                 | 0                    | 0            |
| Babylonian                   | 0                 | 0                    | 0            |
| BitMath                      | 0                 | 0                    | 0            |
| FixedPoint                   | 0                 | 0                    | 0            |
| FullMath                     | 0                 | 0                    | 0            |
| UniswapV2Library             | 0                 | 0                    | 0            |
| UniswapV2OracleLibrary       | 0                 | 0                    | 0            |
| TwapOracle                   | 9                 | 9                    | 2            |
| ProtocolConstants            | 0                 | 0                    | 0            |
| Vader                        | 25                | 25                   | 19           |
| USDV                         | 18                | 18                   | 16           |
| LinearVesting                | 12                | 12                   | 7            |
| MerkleProof                  | 0                 | 0                    | 0            |
| Converter                    | 2                 | 2                    | 2            |
| VaderReserve                 | 8                 | 8                    | 4            |
| StakingRewards               | 25                | 25                   | 16           |
| Owned                        | 2                 | 2                    | 1            |
| RewardsDistributionRecipient | 4                 | 4                    | 2            |
| Pausable                     | 3                 | 3                    | 1            |
| Counters                     | 0                 | 0                    | 0            |
| ShortStrings                 | 0                 | 0                    | 0            |
| StorageSlot                  | 0                 | 0                    | 0            |
| ECDSA                        | 0                 | 0                    | 0            |
| SafeCast                     | 0                 | 0                    | 0            |
| XVader                       | 32                | 32                   | 30           |
| UniswapV2Pair                | 37                | 37                   | 32           |
| UniswapV2ERC20               | 17                | 17                   | 17           |
| VaderRouterV2                | 11                | 11                   | 5            |
| LPToken                      | 20                | 20                   | 16           |
| LPWrapper                    | 5                 | 5                    | 2            |
| BasePoolV2                   | 32                | 32                   | 29           |
| VaderPoolV2                  | 52                | 52                   | 38           |
| Synth                        | 20                | 20                   | 16           |
| SynthFactory                 | 5                 | 5                    | 2            |
| TOTAL                        | 449               | 449                  | 336          |
+------------------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+------------------------------+-----------+-----+-----+-----+-----+
| Contract                     | Ext calls | RFC | NOC | DIT | CBO |
+------------------------------+-----------+-----+-----+-----+-----+
| Migrations                   | 0         | 1   | 0   | 0   | 0   |
| VaderMath                    | 0         | 8   | 0   | 0   | 5   |
| SafeERC20                    | 8         | 7   | 0   | 0   | 13  |
| Address                      | 0         | 0   | 0   | 0   | 6   |
| VaderRouter                  | 43        | 36  | 0   | 2   | 5   |
| SwapQueue                    | 1         | 2   | 0   | 1   | 1   |
| Strings                      | 4         | 3   | 0   | 0   | 7   |
| Math                         | 0         | 0   | 0   | 0   | 3   |
| SignedMath                   | 0         | 0   | 0   | 0   | 1   |
| BasePool                     | 24        | 51  | 1   | 4   | 8   |
| UQ112x112                    | 0         | 0   | 0   | 0   | 5   |
| VaderPool                    | 25        | 56  | 0   | 5   | 8   |
| VaderPoolFactory             | 1         | 10  | 0   | 2   | 1   |
| GasThrottle                  | 0         | 0   | 4   | 1   | 0   |
| GovernorAlpha                | 12        | 34  | 0   | 0   | 2   |
| Timelock                     | 0         | 17  | 0   | 1   | 0   |
| SafeMath                     | 0         | 0   | 0   | 0   | 1   |
| Babylonian                   | 0         | 0   | 0   | 0   | 1   |
| BitMath                      | 0         | 0   | 0   | 0   | 1   |
| FixedPoint                   | 7         | 5   | 0   | 0   | 5   |
| FullMath                     | 0         | 0   | 0   | 0   | 1   |
| UniswapV2Library             | 11        | 7   | 0   | 0   | 2   |
| UniswapV2OracleLibrary       | 5         | 4   | 0   | 0   | 3   |
| TwapOracle                   | 12        | 25  | 0   | 2   | 7   |
| ProtocolConstants            | 0         | 0   | 19  | 0   | 0   |
| Vader                        | 1         | 35  | 0   | 3   | 1   |
| USDV                         | 2         | 27  | 0   | 3   | 1   |
| LinearVesting                | 3         | 16  | 0   | 2   | 1   |
| MerkleProof                  | 0         | 0   | 0   | 0   | 1   |
| Converter                    | 4         | 6   | 0   | 1   | 4   |
| VaderReserve                 | 3         | 13  | 0   | 2   | 2   |
| StakingRewards               | 5         | 33  | 0   | 2   | 2   |
| Owned                        | 0         | 2   | 3   | 0   | 0   |
| RewardsDistributionRecipient | 0         | 4   | 1   | 1   | 0   |
| Pausable                     | 0         | 3   | 1   | 1   | 0   |
| Counters                     | 0         | 0   | 0   | 0   | 1   |
| ShortStrings                 | 1         | 1   | 0   | 0   | 2   |
| StorageSlot                  | 0         | 0   | 0   | 0   | 1   |
| ECDSA                        | 1         | 1   | 0   | 0   | 2   |
| SafeCast                     | 0         | 0   | 0   | 0   | 1   |
| XVader                       | 19        | 65  | 0   | 5   | 6   |
| UniswapV2Pair                | 22        | 50  | 0   | 2   | 5   |
| UniswapV2ERC20               | 0         | 17  | 1   | 1   | 0   |
| VaderRouterV2                | 13        | 22  | 0   | 2   | 3   |
| LPToken                      | 3         | 32  | 0   | 3   | 2   |
| LPWrapper                    | 0         | 6   | 0   | 2   | 0   |
| BasePoolV2                   | 22        | 57  | 1   | 4   | 7   |
| VaderPoolV2                  | 44        | 99  | 0   | 5   | 11  |
| Synth                        | 2         | 29  | 0   | 3   | 2   |
| SynthFactory                 | 1         | 7   | 0   | 2   | 1   |
+------------------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics (Cognitive Volume)
```
Halstead complexity metrics (Core):
+------------------------------+-----------------+------------------+----------------+-----------------+
| Contract                     | Total Operators | Unique Operators | Total Operands | Unique Operands |
+------------------------------+-----------------+------------------+----------------+-----------------+
| Migrations                   | 3               | 2                | 5              | 5               |
| VaderMath                    | 98              | 12               | 125            | 53              |
| SafeERC20                    | 70              | 21               | 121            | 63              |
| Address                      | 59              | 21               | 96             | 62              |
| VaderRouter                  | 251             | 21               | 467            | 190             |
| SwapQueue                    | 29              | 5                | 48             | 40              |
| Strings                      | 69              | 28               | 84             | 35              |
| Math                         | 287             | 23               | 413            | 62              |
| SignedMath                   | 27              | 13               | 24             | 11              |
| BasePool                     | 427             | 44               | 664            | 249             |
| UQ112x112                    | 10              | 6                | 11             | 8               |
| VaderPool                    | 463             | 45               | 727            | 276             |
| VaderPoolFactory             | 101             | 19               | 153            | 75              |
| GasThrottle                  | 25              | 3                | 43             | 36              |
| GovernorAlpha                | 390             | 38               | 741            | 277             |
| Timelock                     | 91              | 21               | 132            | 59              |
| SafeMath                     | 53              | 14               | 69             | 33              |
| Babylonian                   | 66              | 10               | 102            | 18              |
| BitMath                      | 82              | 10               | 140            | 27              |
| FixedPoint                   | 205             | 27               | 251            | 87              |
| FullMath                     | 69              | 18               | 107            | 22              |
| UniswapV2Library             | 135             | 29               | 228            | 86              |
| UniswapV2OracleLibrary       | 32              | 17               | 42             | 16              |
| TwapOracle                   | 236             | 36               | 340            | 121             |
| ProtocolConstants            | 25              | 3                | 43             | 36              |
| Vader                        | 248             | 23               | 371            | 152             |
| USDV                         | 162             | 19               | 263            | 121             |
| LinearVesting                | 177             | 28               | 301            | 117             |
| MerkleProof                  | 171             | 17               | 282            | 90              |
| Converter                    | 62              | 16               | 106            | 61              |
| VaderReserve                 | 80              | 19               | 111            | 62              |
| StakingRewards               | 149             | 24               | 223            | 69              |
| Owned                        | 17              | 7                | 23             | 10              |
| RewardsDistributionRecipient | 19              | 7                | 26             | 12              |
| Pausable                     | 27              | 9                | 35             | 15              |
| Counters                     | 13              | 7                | 29             | 14              |
| ShortStrings                 | 55              | 23               | 51             | 24              |
| StorageSlot                  | 16              | 2                | 24             | 16              |
| ECDSA                        | 97              | 26               | 149            | 83              |
| SafeCast                     | 320             | 70               | 318            | 161             |
| XVader                       | 404             | 42               | 637            | 273             |
| UniswapV2Pair                | 357             | 44               | 529            | 174             |
| UniswapV2ERC20               | 79              | 20               | 147            | 69              |
| VaderRouterV2                | 165             | 22               | 281            | 123             |
| LPToken                      | 184             | 21               | 280            | 131             |
| LPWrapper                    | 63              | 14               | 81             | 52              |
| BasePoolV2                   | 455             | 43               | 811            | 288             |
| VaderPoolV2                  | 653             | 45               | 1185           | 397             |
| Synth                        | 167             | 21               | 264            | 122             |
| SynthFactory                 | 63              | 15               | 86             | 53              |
+------------------------------+-----------------+------------------+----------------+-----------------+


Halstead complexity metrics (Extended 1/2):
+------------------------------+------------+----------------+------------------+--------+
| Contract                     | Vocabulary | Program Length | Estimated Length | Volume |
+------------------------------+------------+----------------+------------------+--------+
| Migrations                   | 7          | 8              | 14               | 22     |
| VaderMath                    | 65         | 223            | 347              | 1343   |
| SafeERC20                    | 84         | 191            | 469              | 1221   |
| Address                      | 83         | 155            | 461              | 988    |
| VaderRouter                  | 211        | 718            | 1531             | 5544   |
| SwapQueue                    | 45         | 77             | 224              | 423    |
| Strings                      | 63         | 153            | 314              | 915    |
| Math                         | 85         | 700            | 473              | 4487   |
| SignedMath                   | 24         | 51             | 86               | 234    |
| BasePool                     | 293        | 1091           | 2222             | 8940   |
| UQ112x112                    | 14         | 21             | 40               | 80     |
| VaderPool                    | 321        | 1190           | 2485             | 9908   |
| VaderPoolFactory             | 94         | 254            | 548              | 1665   |
| GasThrottle                  | 39         | 68             | 191              | 359    |
| GovernorAlpha                | 315        | 1131           | 2447             | 9386   |
| Timelock                     | 80         | 223            | 439              | 1410   |
| SafeMath                     | 47         | 122            | 220              | 678    |
| Babylonian                   | 28         | 168            | 108              | 808    |
| BitMath                      | 37         | 222            | 162              | 1156   |
| FixedPoint                   | 114        | 456            | 689              | 3116   |
| FullMath                     | 40         | 176            | 173              | 937    |
| UniswapV2Library             | 115        | 363            | 694              | 2485   |
| UniswapV2OracleLibrary       | 33         | 74             | 133              | 373    |
| TwapOracle                   | 157        | 576            | 1023             | 4202   |
| ProtocolConstants            | 39         | 68             | 191              | 359    |
| Vader                        | 175        | 619            | 1206             | 4612   |
| USDV                         | 140        | 425            | 918              | 3030   |
| LinearVesting                | 145        | 478            | 938              | 3432   |
| MerkleProof                  | 107        | 453            | 654              | 3054   |
| Converter                    | 77         | 168            | 426              | 1053   |
| VaderReserve                 | 81         | 191            | 450              | 1211   |
| StakingRewards               | 93         | 372            | 532              | 2433   |
| Owned                        | 17         | 40             | 53               | 163    |
| RewardsDistributionRecipient | 19         | 45             | 63               | 191    |
| Pausable                     | 24         | 62             | 87               | 284    |
| Counters                     | 21         | 42             | 73               | 184    |
| ShortStrings                 | 47         | 106            | 214              | 589    |
| StorageSlot                  | 18         | 40             | 66               | 167    |
| ECDSA                        | 109        | 246            | 651              | 1665   |
| SafeCast                     | 231        | 638            | 1609             | 5009   |
| XVader                       | 315        | 1041           | 2436             | 8639   |
| UniswapV2Pair                | 218        | 886            | 1535             | 6883   |
| UniswapV2ERC20               | 89         | 226            | 508              | 1464   |
| VaderRouterV2                | 145        | 446            | 952              | 3202   |
| LPToken                      | 152        | 464            | 1014             | 3363   |
| LPWrapper                    | 66         | 144            | 350              | 870    |
| BasePoolV2                   | 331        | 1266           | 2586             | 10597  |
| VaderPoolV2                  | 442        | 1838           | 3674             | 16152  |
| Synth                        | 143        | 431            | 938              | 3086   |
| SynthFactory                 | 68         | 149            | 362              | 907    |
+------------------------------+------------+----------------+------------------+--------+


Halstead complexity metrics (Extended 2/2):
+------------------------------+------------+---------+-------+----------------+
| Contract                     | Difficulty | Effort  | Time  | Estimated Bugs |
+------------------------------+------------+---------+-------+----------------+
| Migrations                   | 1          | 22      | 1     | 0.003          |
| VaderMath                    | 14         | 19005   | 1056  | 0.237          |
| SafeERC20                    | 20         | 24622   | 1368  | 0.282          |
| Address                      | 16         | 16065   | 893   | 0.212          |
| VaderRouter                  | 26         | 143072  | 7948  | 0.912          |
| SwapQueue                    | 3          | 1269    | 70    | 0.039          |
| Strings                      | 34         | 30728   | 1707  | 0.327          |
| Math                         | 77         | 343693  | 19094 | 1.636          |
| SignedMath                   | 14         | 3316    | 184   | 0.074          |
| BasePool                     | 59         | 524508  | 29139 | 2.168          |
| UQ112x112                    | 4          | 330     | 18    | 0.016          |
| VaderPool                    | 59         | 587237  | 32624 | 2.338          |
| VaderPoolFactory             | 19         | 32265   | 1793  | 0.338          |
| GasThrottle                  | 2          | 644     | 36    | 0.025          |
| GovernorAlpha                | 51         | 477080  | 26504 | 2.035          |
| Timelock                     | 23         | 33118   | 1840  | 0.344          |
| SafeMath                     | 15         | 9918    | 551   | 0.154          |
| Babylonian                   | 28         | 22883   | 1271  | 0.269          |
| BitMath                      | 26         | 29983   | 1666  | 0.322          |
| FixedPoint                   | 39         | 121355  | 6742  | 0.817          |
| FullMath                     | 44         | 41000   | 2278  | 0.396          |
| UniswapV2Library             | 38         | 95525   | 5307  | 0.697          |
| UniswapV2OracleLibrary       | 22         | 8329    | 463   | 0.137          |
| TwapOracle                   | 51         | 212516  | 11806 | 1.187          |
| ProtocolConstants            | 2          | 644     | 36    | 0.025          |
| Vader                        | 28         | 129463  | 7192  | 0.853          |
| USDV                         | 21         | 62565   | 3476  | 0.525          |
| LinearVesting                | 36         | 123611  | 6867  | 0.827          |
| MerkleProof                  | 27         | 81335   | 4519  | 0.626          |
| Converter                    | 14         | 14636   | 813   | 0.199          |
| VaderReserve                 | 17         | 20595   | 1144  | 0.250          |
| StakingRewards               | 39         | 94341   | 5241  | 0.691          |
| Owned                        | 8          | 1316    | 73    | 0.040          |
| RewardsDistributionRecipient | 8          | 1450    | 81    | 0.043          |
| Pausable                     | 10         | 2985    | 166   | 0.069          |
| Counters                     | 7          | 1337    | 74    | 0.040          |
| ShortStrings                 | 24         | 14388   | 799   | 0.197          |
| StorageSlot                  | 2          | 250     | 14    | 0.013          |
| ECDSA                        | 23         | 38856   | 2159  | 0.382          |
| SafeCast                     | 69         | 346303  | 19239 | 1.644          |
| XVader                       | 49         | 423334  | 23519 | 1.879          |
| UniswapV2Pair                | 67         | 460344  | 25575 | 1.987          |
| UniswapV2ERC20               | 21         | 31179   | 1732  | 0.330          |
| VaderRouterV2                | 25         | 80473   | 4471  | 0.621          |
| LPToken                      | 22         | 75476   | 4193  | 0.595          |
| LPWrapper                    | 11         | 9491    | 527   | 0.149          |
| BasePoolV2                   | 61         | 641596  | 35644 | 2.480          |
| VaderPoolV2                  | 67         | 1084779 | 60265 | 3.519          |
| Synth                        | 23         | 70116   | 3895  | 0.567          |
| SynthFactory                 | 12         | 11038   | 613   | 0.165          |
+------------------------------+------------+---------+-------+----------------+
```

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.04
+------------------------------+------------+--------------+-------------+-----------------------------+
| Contract                     | Dependents | Dependencies | Instability | Distance from main sequence |
+------------------------------+------------+--------------+-------------+-----------------------------+
| Migrations                   | 0          | 0            | 0.00        | 0.00                        |
| VaderMath                    | 5          | 0            | 0.00        | 0.04                        |
| SafeERC20                    | 10         | 3            | 0.23        | 0.19                        |
| Address                      | 6          | 0            | 0.00        | 0.04                        |
| VaderRouter                  | 0          | 5            | 1.00        | 0.96                        |
| SwapQueue                    | 0          | 1            | 1.00        | 0.96                        |
| Strings                      | 5          | 2            | 0.29        | 0.25                        |
| Math                         | 3          | 0            | 0.00        | 0.04                        |
| SignedMath                   | 1          | 0            | 0.00        | 0.04                        |
| BasePool                     | 0          | 8            | 1.00        | 0.96                        |
| UQ112x112                    | 5          | 0            | 0.00        | 0.04                        |
| VaderPool                    | 0          | 8            | 1.00        | 0.96                        |
| VaderPoolFactory             | 0          | 1            | 1.00        | 0.96                        |
| GasThrottle                  | 0          | 0            | 0.00        | 0.00                        |
| GovernorAlpha                | 0          | 2            | 1.00        | 0.96                        |
| Timelock                     | 0          | 0            | 0.00        | 0.00                        |
| SafeMath                     | 1          | 0            | 0.00        | 0.04                        |
| Babylonian                   | 1          | 0            | 0.00        | 0.04                        |
| BitMath                      | 1          | 0            | 0.00        | 0.04                        |
| FixedPoint                   | 2          | 3            | 0.60        | 0.56                        |
| FullMath                     | 1          | 0            | 0.00        | 0.04                        |
| UniswapV2Library             | 0          | 2            | 1.00        | 0.96                        |
| UniswapV2OracleLibrary       | 1          | 2            | 0.67        | 0.63                        |
| TwapOracle                   | 0          | 7            | 1.00        | 0.96                        |
| ProtocolConstants            | 0          | 0            | 0.00        | 0.00                        |
| Vader                        | 0          | 1            | 1.00        | 0.96                        |
| USDV                         | 0          | 1            | 1.00        | 0.96                        |
| LinearVesting                | 0          | 1            | 1.00        | 0.96                        |
| MerkleProof                  | 1          | 0            | 0.00        | 0.04                        |
| Converter                    | 0          | 4            | 1.00        | 0.96                        |
| VaderReserve                 | 0          | 2            | 1.00        | 0.96                        |
| StakingRewards               | 0          | 2            | 1.00        | 0.96                        |
| Owned                        | 0          | 0            | 0.00        | 0.00                        |
| RewardsDistributionRecipient | 0          | 0            | 0.00        | 0.00                        |
| Pausable                     | 0          | 0            | 0.00        | 0.00                        |
| Counters                     | 1          | 0            | 0.00        | 0.04                        |
| ShortStrings                 | 1          | 1            | 0.50        | 0.46                        |
| StorageSlot                  | 1          | 0            | 0.00        | 0.04                        |
| ECDSA                        | 1          | 1            | 0.50        | 0.46                        |
| SafeCast                     | 1          | 0            | 0.00        | 0.04                        |
| XVader                       | 0          | 6            | 1.00        | 0.96                        |
| UniswapV2Pair                | 0          | 5            | 1.00        | 0.96                        |
| UniswapV2ERC20               | 0          | 0            | 0.00        | 0.00                        |
| VaderRouterV2                | 0          | 3            | 1.00        | 0.96                        |
| LPToken                      | 0          | 2            | 1.00        | 0.96                        |
| LPWrapper                    | 0          | 0            | 0.00        | 0.00                        |
| BasePoolV2                   | 0          | 7            | 1.00        | 0.96                        |
| VaderPoolV2                  | 0          | 11           | 1.00        | 0.96                        |
| Synth                        | 1          | 1            | 0.50        | 0.46                        |
| SynthFactory                 | 0          | 1            | 1.00        | 0.96                        |
+------------------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 19  | 0   | 0    |
| sloc  | 15  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 35  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 140 | 0   | 0    |
| sloc  | 61  | 0   | 0    |
| cloc  | 62  | 0   | 0    |
| Total | 263 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 23  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 41  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 9   | 0   | 0    |
| sloc  | 3   | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 16  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 23  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 41  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 282 | 0   | 0    |
| sloc  | 106 | 0   | 0    |
| cloc  | 133 | 0   | 0    |
| Total | 521 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 68  | 0   | 0    |
| sloc  | 54  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 126 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 251 | 0   | 0    |
| sloc  | 88  | 0   | 0    |
| cloc  | 129 | 0   | 0    |
| Total | 468 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 37  | 0   | 0    |
| sloc  | 28  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 66  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 93  | 0   | 0    |
| sloc  | 19  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 171 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 13  | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 21  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 35  | 0   | 0    |
| sloc  | 20  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 58  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 33  | 0   | 0    |
| sloc  | 16  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 54  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 19  | 0   | 0    |
| sloc  | 11  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 33  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 20  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 33  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 88  | 0   | 0    |
| sloc  | 17  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 164 | 0   | 0    |
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
| loc   | 128 | 0   | 0    |
| sloc  | 49  | 0   | 0    |
| cloc  | 62  | 0   | 0    |
| Total | 239 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 104 | 0   | 0    |
| sloc  | 25  | 0   | 0    |
| cloc  | 60  | 0   | 0    |
| Total | 189 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 104 | 0   | 0    |
| sloc  | 25  | 0   | 0    |
| cloc  | 60  | 0   | 0    |
| Total | 189 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 118 | 0   | 0    |
| sloc  | 33  | 0   | 0    |
| cloc  | 61  | 0   | 0    |
| Total | 212 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 89  | 0   | 0    |
| sloc  | 17  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 165 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 438 | 0   | 0    |
| sloc  | 181 | 0   | 0    |
| cloc  | 191 | 0   | 0    |
| Total | 810 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 408 | 0   | 0    |
| sloc  | 164 | 0   | 0    |
| cloc  | 187 | 0   | 0    |
| Total | 759 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 185 | 0   | 0    |
| sloc  | 97  | 0   | 0    |
| cloc  | 62  | 0   | 0    |
| Total | 344 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 182 | 0   | 0    |
| sloc  | 92  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 333 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1796 | 0   | 0    |
| sloc  | 803  | 0   | 0    |
| cloc  | 771  | 0   | 0    |
| Total | 3370 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 380 | 0   | 0    |
| sloc  | 144 | 0   | 0    |
| cloc  | 177 | 0   | 0    |
| Total | 701 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2739 | 0   | 0    |
| sloc  | 1177 | 0   | 0    |
| cloc  | 1207 | 0   | 0    |
| Total | 5123 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2896 | 0   | 0    |
| sloc  | 1247 | 0   | 0    |
| cloc  | 1263 | 0   | 0    |
| Total | 5406 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3073 | 0   | 0    |
| sloc  | 1329 | 0   | 0    |
| cloc  | 1324 | 0   | 0    |
| Total | 5726 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 105 | 0   | 0    |
| sloc  | 36  | 0   | 0    |
| cloc  | 36  | 0   | 0    |
| Total | 177 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 946  | 0   | 0    |
| sloc  | 510  | 0   | 0    |
| cloc  | 314  | 0   | 0    |
| Total | 1770 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 357 | 0   | 0    |
| sloc  | 207 | 0   | 0    |
| cloc  | 99  | 0   | 0    |
| Total | 663 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1925 | 0   | 0    |
| sloc  | 1140 | 0   | 0    |
| cloc  | 539  | 0   | 0    |
| Total | 3604 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 78  | 0   | 0    |
| sloc  | 24  | 0   | 0    |
| cloc  | 27  | 0   | 0    |
| Total | 129 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1107 | 0   | 0    |
| sloc  | 380  | 0   | 0    |
| cloc  | 549  | 0   | 0    |
| Total | 2036 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 743  | 0   | 0    |
| sloc  | 237  | 0   | 0    |
| cloc  | 385  | 0   | 0    |
| Total | 1365 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1093 | 0   | 0    |
| sloc  | 401  | 0   | 0    |
| cloc  | 542  | 0   | 0    |
| Total | 2036 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1039 | 0   | 0    |
| sloc  | 397  | 0   | 0    |
| cloc  | 511  | 0   | 0    |
| Total | 1947 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 877  | 0   | 0    |
| sloc  | 323  | 0   | 0    |
| cloc  | 433  | 0   | 0    |
| Total | 1633 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 955  | 0   | 0    |
| sloc  | 429  | 0   | 0    |
| cloc  | 406  | 0   | 0    |
| Total | 1790 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 32  | 0   | 0    |
| sloc  | 13  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 50  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 37  | 0   | 0    |
| sloc  | 29  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 67  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 56  | 0   | 0    |
| sloc  | 42  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 100 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 81  | 0   | 0    |
| sloc  | 53  | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 146 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3562 | 0   | 0    |
| sloc  | 1291 | 0   | 0    |
| cloc  | 1924 | 0   | 0    |
| Total | 6777 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 688  | 0   | 0    |
| sloc  | 504  | 0   | 0    |
| cloc  | 85   | 0   | 0    |
| Total | 1277 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 178 | 0   | 0    |
| sloc  | 147 | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 328 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 12  | 0   | 0    |
| sloc  | 9   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 22  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 118 | 0   | 0    |
| sloc  | 85  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 205 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 53  | 0   | 0    |
| sloc  | 37  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 91  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 32  | 0   | 0    |
| sloc  | 22  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 55  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 54  | 0   | 0    |
| sloc  | 43  | 0   | 0    |
| cloc  | 4   | 0   | 0    |
| Total | 101 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 25  | 0   | 0    |
| sloc  | 18  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 46  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 482 | 0   | 0    |
| sloc  | 282 | 0   | 0    |
| cloc  | 142 | 0   | 0    |
| Total | 906 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 53  | 0   | 0    |
| sloc  | 44  | 0   | 0    |
| cloc  | 7   | 0   | 0    |
| Total | 104 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 389 | 0   | 0    |
| sloc  | 310 | 0   | 0    |
| cloc  | 44  | 0   | 0    |
| Total | 743 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 558  | 0   | 0    |
| sloc  | 431  | 0   | 0    |
| cloc  | 55   | 0   | 0    |
| Total | 1044 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 85  | 0   | 0    |
| sloc  | 75  | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 166 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 55  | 0   | 0    |
| sloc  | 46  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 104 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 22  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 6   | 0   | 0    |
| Total | 38  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1667 | 0   | 0    |
| sloc  | 722  | 0   | 0    |
| cloc  | 723  | 0   | 0    |
| Total | 3112 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1095 | 0   | 0    |
| sloc  | 425  | 0   | 0    |
| cloc  | 501  | 0   | 0    |
| Total | 2021 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1142 | 0   | 0    |
| sloc  | 458  | 0   | 0    |
| cloc  | 504  | 0   | 0    |
| Total | 2104 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2860 | 0   | 0    |
| sloc  | 1293 | 0   | 0    |
| cloc  | 1215 | 0   | 0    |
| Total | 5368 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 3509 | 0   | 0    |
| sloc  | 1660 | 0   | 0    |
| cloc  | 1388 | 0   | 0    |
| Total | 6557 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 741  | 0   | 0    |
| sloc  | 252  | 0   | 0    |
| cloc  | 372  | 0   | 0    |
| Total | 1365 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 794  | 0   | 0    |
| sloc  | 288  | 0   | 0    |
| cloc  | 374  | 0   | 0    |
| Total | 1456 | 0   | 0    |
+-------+------+-----+------+
```

## Function Complexity & Standards Checks
### Contract: Migrations
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setCompleted` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: VaderMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `calculateLiquidityUnits` | **1** | Low (Simple) |
| `calculateSlipAdjustment` | **1** | Low (Simple) |
| `calculateLoss` | **2** | Low (Simple) |
| `calculateSwap` | **1** | Low (Simple) |
| `calculateSwapReverse` | **1** | Low (Simple) |
| `delta` | **2** | Low (Simple) |
| `pow` | **1** | Low (Simple) |
| `root` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

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
| `forceApprove` | **2** | Low (Simple) |
| `safePermit` | **1** | Low (Simple) |
| `_callOptionalReturn` | **1** | Low (Simple) |
| `_callOptionalReturnBool` | **1** | Low (Simple) |

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
| `verifyCallResultFromTarget` | **3** | Low (Simple) |
| `verifyCallResult` | **2** | Low (Simple) |
| `_revert` | **2** | Low (Simple) |

---

### Contract: VaderRouter
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `removeLiquidity` | **1** | Low (Simple) |
| `swapExactTokensForTokens` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `removeLiquidity` | **2** | Low (Simple) |
| `swapExactTokensForTokens` | **1** | Low (Simple) |
| `swapTokensForExactTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `_swap` | **3** | Low (Simple) |
| `_addLiquidity` | **2** | Low (Simple) |
| `calculateInGivenOut` | **3** | Low (Simple) |
| `calculateOutGivenIn` | **3** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SwapQueue
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `executeQueue` | **1** | Low (Simple) |
| `_insertQueue` | **1** | Low (Simple) |
| `_executeQueue` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Strings
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `toString` | **3** | Low (Simple) |
| `toString` | **2** | Low (Simple) |
| `toHexString` | **1** | Low (Simple) |
| `toHexString` | **2** | Low (Simple) |
| `toHexString` | **1** | Low (Simple) |
| `equal` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Math
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `max` | **2** | Low (Simple) |
| `min` | **2** | Low (Simple) |
| `average` | **1** | Low (Simple) |
| `ceilDiv` | **2** | Low (Simple) |
| `mulDiv` | **2** | Low (Simple) |
| `mulDiv` | **2** | Low (Simple) |
| `sqrt` | **2** | Low (Simple) |
| `sqrt` | **2** | Low (Simple) |
| `log2` | **9** | Moderate (Complex) |
| `log2` | **2** | Low (Simple) |
| `log10` | **8** | Moderate (Complex) |
| `log10` | **2** | Low (Simple) |
| `log256` | **6** | Moderate (Complex) |
| `log256` | **2** | Low (Simple) |

---

### Contract: SignedMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `max` | **2** | Low (Simple) |
| `min` | **2** | Low (Simple) |
| `average` | **1** | Low (Simple) |
| `abs` | **2** | Low (Simple) |

---

### Contract: BasePool
**Auto-Detected Standards/Inherited Protocols:** ERC721, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **2** | Low (Simple) |
| `_baseURI` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `_safeTransfer` | **1** | Low (Simple) |
| `_ownerOf` | **1** | Low (Simple) |
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setApprovalForAll` | **1** | Low (Simple) |
| `_requireMinted` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `__unsafe_increaseBalance` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `swap` | **3** | Low (Simple) |
| `_update` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: UQ112x112
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `encode` | **1** | Low (Simple) |
| `uqdiv` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: VaderPool
**Auto-Detected Standards/Inherited Protocols:** ERC721, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getReserves` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `swap` | **3** | Low (Simple) |
| `_update` | **2** | Low (Simple) |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **2** | Low (Simple) |
| `_baseURI` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `_safeTransfer` | **1** | Low (Simple) |
| `_ownerOf` | **1** | Low (Simple) |
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setApprovalForAll` | **1** | Low (Simple) |
| `_requireMinted` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `__unsafe_increaseBalance` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `toggleQueue` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `toggleQueue` | **1** | Low (Simple) |
| `_onlyDAO` | **1** | Low (Simple) |
| `_min` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: VaderPoolFactory
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `createPool` | **1** | Low (Simple) |
| `getPool` | **1** | Low (Simple) |
| `nativeAsset` | **1** | Low (Simple) |
| `createPool` | **3** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `toggleQueue` | **1** | Low (Simple) |
| `_onlyDAO` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: GasThrottle
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: GovernorAlpha
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `quorumVotes` | **1** | Low (Simple) |
| `proposalMaxOperations` | **1** | Low (Simple) |
| `votingDelay` | **1** | Low (Simple) |
| `votingPeriod` | **1** | Low (Simple) |
| `getActions` | **1** | Low (Simple) |
| `getReceipt` | **1** | Low (Simple) |
| `state` | **11** | ⚠️ High (Refactor recommended) |
| `setTimelock` | **1** | Low (Simple) |
| `propose` | **2** | Low (Simple) |
| `queue` | **2** | Low (Simple) |
| `execute` | **2** | Low (Simple) |
| `castVote` | **1** | Low (Simple) |
| `castVoteBySig` | **1** | Low (Simple) |
| `changeFeeReceiver` | **1** | Low (Simple) |
| `changeFeeAmount` | **1** | Low (Simple) |
| `veto` | **4** | Low (Simple) |
| `changeCouncil` | **1** | Low (Simple) |
| `cancel` | **2** | Low (Simple) |
| `__acceptAdmin` | **1** | Low (Simple) |
| `__abdicate` | **1** | Low (Simple) |
| `__queueSetTimelockPendingAdmin` | **1** | Low (Simple) |
| `__executeSetTimelockPendingAdmin` | **1** | Low (Simple) |
| `_queueOrRevert` | **1** | Low (Simple) |
| `_castVote` | **2** | Low (Simple) |
| `getChainId` | **1** | Low (Simple) |
| `_onlyGuardian` | **1** | Low (Simple) |
| `_onlyTimelock` | **1** | Low (Simple) |
| `_onlyCouncil` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Timelock
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `delay` | **1** | Low (Simple) |
| `GRACE_PERIOD` | **1** | Low (Simple) |
| `acceptAdmin` | **1** | Low (Simple) |
| `queuedTransactions` | **1** | Low (Simple) |
| `queueTransaction` | **1** | Low (Simple) |
| `cancelTransaction` | **1** | Low (Simple) |
| `executeTransaction` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |
| `GRACE_PERIOD` | **1** | Low (Simple) |
| `MINIMUM_DELAY` | **1** | Low (Simple) |
| `MAXIMUM_DELAY` | **1** | Low (Simple) |
| `setDelay` | **1** | Low (Simple) |
| `acceptAdmin` | **1** | Low (Simple) |
| `setPendingAdmin` | **1** | Low (Simple) |
| `queueTransaction` | **1** | Low (Simple) |
| `cancelTransaction` | **1** | Low (Simple) |
| `executeTransaction` | **2** | Low (Simple) |
| `getBlockTimestamp` | **1** | Low (Simple) |

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
| `mul` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |
| `sub` | **1** | Low (Simple) |
| `div` | **1** | Low (Simple) |
| `mod` | **1** | Low (Simple) |

---

### Contract: Babylonian
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `sqrt` | **10** | ⚠️ High (Refactor recommended) |

---

### Contract: BitMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mostSignificantBit` | **9** | Moderate (Complex) |
| `leastSignificantBit` | **9** | Moderate (Complex) |

---

### Contract: FixedPoint
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `encode` | **1** | Low (Simple) |
| `encode144` | **1** | Low (Simple) |
| `decode` | **1** | Low (Simple) |
| `decode144` | **1** | Low (Simple) |
| `mul` | **1** | Low (Simple) |
| `muli` | **3** | Low (Simple) |
| `muluq` | **2** | Low (Simple) |
| `divuq` | **3** | Low (Simple) |
| `fraction` | **3** | Low (Simple) |
| `reciprocal` | **1** | Low (Simple) |
| `sqrt` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: FullMath
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `fullMul` | **2** | Low (Simple) |
| `fullDiv` | **1** | Low (Simple) |
| `mulDiv` | **3** | Low (Simple) |

---

### Contract: UniswapV2Library
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `sortTokens` | **2** | Low (Simple) |
| `pairFor` | **1** | Low (Simple) |
| `getReserves` | **2** | Low (Simple) |
| `quote` | **1** | Low (Simple) |
| `getAmountOut` | **1** | Low (Simple) |
| `getAmountIn` | **1** | Low (Simple) |
| `getAmountsOut` | **2** | Low (Simple) |
| `getAmountsIn` | **2** | Low (Simple) |

---

### Contract: UniswapV2OracleLibrary
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `currentBlockTimestamp` | **1** | Low (Simple) |
| `currentCumulativePrices` | **2** | Low (Simple) |

---

### Contract: TwapOracle
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `pairExists` | **1** | Low (Simple) |
| `consult` | **4** | Low (Simple) |
| `getRate` | **1** | Low (Simple) |
| `usdvtoVader` | **1** | Low (Simple) |
| `vaderToUsdv` | **2** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `enableUSDV` | **1** | Low (Simple) |
| `registerAggregator` | **1** | Low (Simple) |
| `registerPair` | **2** | Low (Simple) |
| `update` | **3** | Low (Simple) |

---

### Contract: ProtocolConstants
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Vader
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
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
| `_spendAllowance` | **2** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `createEmission` | **1** | Low (Simple) |
| `calculateFee` | **1** | Low (Simple) |
| `getCurrentEraEmission` | **1** | Low (Simple) |
| `getEraEmission` | **1** | Low (Simple) |
| `calculateFee` | **1** | Low (Simple) |
| `getCurrentEraEmission` | **1** | Low (Simple) |
| `getEraEmission` | **1** | Low (Simple) |
| `createEmission` | **1** | Low (Simple) |
| `setComponents` | **1** | Low (Simple) |
| `claimGrant` | **1** | Low (Simple) |
| `adjustMaxSupply` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **2** | Low (Simple) |
| `_transfer` | **2** | Low (Simple) |
| `_onlyDAO` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: USDV
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
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
| `_spendAllowance` | **2** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `distributeEmission` | **1** | Low (Simple) |
| `distributeEmission` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LinearVesting
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `getClaim` | **1** | Low (Simple) |
| `claim` | **1** | Low (Simple) |
| `claimConverted` | **1** | Low (Simple) |
| `begin` | **1** | Low (Simple) |
| `vestFor` | **1** | Low (Simple) |
| `getClaim` | **1** | Low (Simple) |
| `claim` | **1** | Low (Simple) |
| `claimConverted` | **1** | Low (Simple) |
| `begin` | **1** | Low (Simple) |
| `vestFor` | **1** | Low (Simple) |
| `_getClaim` | **3** | Low (Simple) |
| `_getClaim` | **3** | Low (Simple) |
| `_hasStarted` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: MerkleProof
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `verify` | **1** | Low (Simple) |
| `verifyCalldata` | **1** | Low (Simple) |
| `processProof` | **2** | Low (Simple) |
| `processProofCalldata` | **2** | Low (Simple) |
| `multiProofVerify` | **1** | Low (Simple) |
| `multiProofVerifyCalldata` | **1** | Low (Simple) |
| `processMultiProof` | **7** | Moderate (Complex) |
| `processMultiProofCalldata` | **7** | Moderate (Complex) |
| `_hashPair` | **2** | Low (Simple) |
| `_efficientHash` | **1** | Low (Simple) |

---

### Contract: Converter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `convert` | **1** | Low (Simple) |
| `convert` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: VaderReserve
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `reimburseImpermanentLoss` | **1** | Low (Simple) |
| `grant` | **1** | Low (Simple) |
| `reserve` | **1** | Low (Simple) |
| `reserve` | **1** | Low (Simple) |
| `grant` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `reimburseImpermanentLoss` | **1** | Low (Simple) |
| `_min` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: StakingRewards
**Auto-Detected Standards/Inherited Protocols:** Pausable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setPaused` | **3** | Low (Simple) |
| `nominateNewOwner` | **1** | Low (Simple) |
| `acceptOwnership` | **1** | Low (Simple) |
| `_onlyOwner` | **1** | Low (Simple) |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `notifyRewardAmount` | **1** | Low (Simple) |
| `setRewardsDistribution` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `getRewardForDuration` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **1** | Low (Simple) |
| `rewardPerToken` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `exit` | **1** | Low (Simple) |
| `getReward` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `lastTimeRewardApplicable` | **2** | Low (Simple) |
| `rewardPerToken` | **2** | Low (Simple) |
| `earned` | **1** | Low (Simple) |
| `getRewardForDuration` | **1** | Low (Simple) |
| `stake` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `getReward` | **2** | Low (Simple) |
| `exit` | **1** | Low (Simple) |
| `notifyRewardAmount` | **2** | Low (Simple) |
| `recoverERC20` | **1** | Low (Simple) |
| `setRewardsDuration` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Owned
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `nominateNewOwner` | **1** | Low (Simple) |
| `acceptOwnership` | **1** | Low (Simple) |
| `_onlyOwner` | **1** | Low (Simple) |

---

### Contract: RewardsDistributionRecipient
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `nominateNewOwner` | **1** | Low (Simple) |
| `acceptOwnership` | **1** | Low (Simple) |
| `_onlyOwner` | **1** | Low (Simple) |
| `notifyRewardAmount` | **1** | Low (Simple) |
| `setRewardsDistribution` | **1** | Low (Simple) |

---

### Contract: Pausable
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `nominateNewOwner` | **1** | Low (Simple) |
| `acceptOwnership` | **1** | Low (Simple) |
| `_onlyOwner` | **1** | Low (Simple) |
| `setPaused` | **3** | Low (Simple) |

---

### Contract: Counters
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `current` | **1** | Low (Simple) |
| `increment` | **1** | Low (Simple) |
| `decrement` | **1** | Low (Simple) |
| `reset` | **1** | Low (Simple) |

---

### Contract: ShortStrings
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `toShortString` | **2** | Low (Simple) |
| `toString` | **1** | Low (Simple) |
| `byteLength` | **2** | Low (Simple) |
| `toShortStringWithFallback` | **2** | Low (Simple) |
| `toStringWithFallback` | **2** | Low (Simple) |
| `byteLengthWithFallback` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: StorageSlot
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getAddressSlot` | **1** | Low (Simple) |
| `getBooleanSlot` | **1** | Low (Simple) |
| `getBytes32Slot` | **1** | Low (Simple) |
| `getUint256Slot` | **1** | Low (Simple) |
| `getStringSlot` | **1** | Low (Simple) |
| `getStringSlot` | **1** | Low (Simple) |
| `getBytesSlot` | **1** | Low (Simple) |
| `getBytesSlot` | **1** | Low (Simple) |

---

### Contract: ECDSA
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_throwError` | **5** | Moderate (Complex) |
| `tryRecover` | **2** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `tryRecover` | **1** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `tryRecover` | **3** | Low (Simple) |
| `recover` | **1** | Low (Simple) |
| `toEthSignedMessageHash` | **1** | Low (Simple) |
| `toEthSignedMessageHash` | **1** | Low (Simple) |
| `toTypedDataHash` | **1** | Low (Simple) |
| `toDataWithIntendedValidatorHash` | **1** | Low (Simple) |

---

### Contract: SafeCast
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `toUint248` | **1** | Low (Simple) |
| `toUint240` | **1** | Low (Simple) |
| `toUint232` | **1** | Low (Simple) |
| `toUint224` | **1** | Low (Simple) |
| `toUint216` | **1** | Low (Simple) |
| `toUint208` | **1** | Low (Simple) |
| `toUint200` | **1** | Low (Simple) |
| `toUint192` | **1** | Low (Simple) |
| `toUint184` | **1** | Low (Simple) |
| `toUint176` | **1** | Low (Simple) |
| `toUint168` | **1** | Low (Simple) |
| `toUint160` | **1** | Low (Simple) |
| `toUint152` | **1** | Low (Simple) |
| `toUint144` | **1** | Low (Simple) |
| `toUint136` | **1** | Low (Simple) |
| `toUint128` | **1** | Low (Simple) |
| `toUint120` | **1** | Low (Simple) |
| `toUint112` | **1** | Low (Simple) |
| `toUint104` | **1** | Low (Simple) |
| `toUint96` | **1** | Low (Simple) |
| `toUint88` | **1** | Low (Simple) |
| `toUint80` | **1** | Low (Simple) |
| `toUint72` | **1** | Low (Simple) |
| `toUint64` | **1** | Low (Simple) |
| `toUint56` | **1** | Low (Simple) |
| `toUint48` | **1** | Low (Simple) |
| `toUint40` | **1** | Low (Simple) |
| `toUint32` | **1** | Low (Simple) |
| `toUint24` | **1** | Low (Simple) |
| `toUint16` | **1** | Low (Simple) |
| `toUint8` | **1** | Low (Simple) |
| `toUint256` | **1** | Low (Simple) |
| `toInt248` | **1** | Low (Simple) |
| `toInt240` | **1** | Low (Simple) |
| `toInt232` | **1** | Low (Simple) |
| `toInt224` | **1** | Low (Simple) |
| `toInt216` | **1** | Low (Simple) |
| `toInt208` | **1** | Low (Simple) |
| `toInt200` | **1** | Low (Simple) |
| `toInt192` | **1** | Low (Simple) |
| `toInt184` | **1** | Low (Simple) |
| `toInt176` | **1** | Low (Simple) |
| `toInt168` | **1** | Low (Simple) |
| `toInt160` | **1** | Low (Simple) |
| `toInt152` | **1** | Low (Simple) |
| `toInt144` | **1** | Low (Simple) |
| `toInt136` | **1** | Low (Simple) |
| `toInt128` | **1** | Low (Simple) |
| `toInt120` | **1** | Low (Simple) |
| `toInt112` | **1** | Low (Simple) |
| `toInt104` | **1** | Low (Simple) |
| `toInt96` | **1** | Low (Simple) |
| `toInt88` | **1** | Low (Simple) |
| `toInt80` | **1** | Low (Simple) |
| `toInt72` | **1** | Low (Simple) |
| `toInt64` | **1** | Low (Simple) |
| `toInt56` | **1** | Low (Simple) |
| `toInt48` | **1** | Low (Simple) |
| `toInt40` | **1** | Low (Simple) |
| `toInt32` | **1** | Low (Simple) |
| `toInt24` | **1** | Low (Simple) |
| `toInt16` | **1** | Low (Simple) |
| `toInt8` | **1** | Low (Simple) |
| `toInt256` | **1** | Low (Simple) |

---

### Contract: XVader
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `clock` | **1** | Low (Simple) |
| `CLOCK_MODE` | **1** | Low (Simple) |
| `checkpoints` | **1** | Low (Simple) |
| `numCheckpoints` | **1** | Low (Simple) |
| `delegates` | **1** | Low (Simple) |
| `getVotes` | **2** | Low (Simple) |
| `getPastVotes` | **1** | Low (Simple) |
| `getPastTotalSupply` | **1** | Low (Simple) |
| `_checkpointsLookup` | **6** | Moderate (Complex) |
| `delegate` | **1** | Low (Simple) |
| `delegateBySig` | **1** | Low (Simple) |
| `_maxSupply` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `_delegate` | **1** | Low (Simple) |
| `_moveVotingPower` | **4** | Low (Simple) |
| `_writeCheckpoint` | **3** | Low (Simple) |
| `_add` | **1** | Low (Simple) |
| `_subtract` | **1** | Low (Simple) |
| `_unsafeAccess` | **1** | Low (Simple) |
| `getVotes` | **1** | Low (Simple) |
| `getPastVotes` | **1** | Low (Simple) |
| `getPastTotalSupply` | **1** | Low (Simple) |
| `delegates` | **1** | Low (Simple) |
| `delegate` | **1** | Low (Simple) |
| `delegateBySig` | **1** | Low (Simple) |
| `clock` | **1** | Low (Simple) |
| `CLOCK_MODE` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `_useNonce` | **1** | Low (Simple) |
| `_domainSeparatorV4` | **2** | Low (Simple) |
| `_buildDomainSeparator` | **1** | Low (Simple) |
| `_hashTypedDataV4` | **1** | Low (Simple) |
| `eip712Domain` | **1** | Low (Simple) |
| `eip712Domain` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
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
| `_spendAllowance` | **2** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `enter` | **2** | Low (Simple) |
| `leave` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: UniswapV2Pair
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `PERMIT_TYPEHASH` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `MINIMUM_LIQUIDITY` | **1** | Low (Simple) |
| `factory` | **1** | Low (Simple) |
| `token0` | **1** | Low (Simple) |
| `token1` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `price0CumulativeLast` | **1** | Low (Simple) |
| `price1CumulativeLast` | **1** | Low (Simple) |
| `kLast` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `skim` | **1** | Low (Simple) |
| `sync` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `_safeTransfer` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `_update` | **2** | Low (Simple) |
| `_mintFee` | **6** | Moderate (Complex) |
| `mint` | **3** | Low (Simple) |
| `burn` | **2** | Low (Simple) |
| `swap` | **6** | Moderate (Complex) |
| `skim` | **1** | Low (Simple) |
| `sync` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: UniswapV2ERC20
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `DOMAIN_SEPARATOR` | **1** | Low (Simple) |
| `PERMIT_TYPEHASH` | **1** | Low (Simple) |
| `nonces` | **1** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `transferFrom` | **2** | Low (Simple) |
| `permit` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: VaderRouterV2
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `removeLiquidity` | **1** | Low (Simple) |
| `swapExactTokensForTokens` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `addLiquidity` | **2** | Low (Simple) |
| `removeLiquidity` | **3** | Low (Simple) |
| `swapExactTokensForTokens` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `_swap` | **3** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LPToken
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
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
| `_spendAllowance` | **2** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **2** | Low (Simple) |
| `_calculateName` | **1** | Low (Simple) |
| `_calculateSymbol` | **1** | Low (Simple) |
| `_combine` | **1** | Low (Simple) |
| `_combine` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: LPWrapper
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `tokens` | **1** | Low (Simple) |
| `createWrapper` | **1** | Low (Simple) |
| `createWrapper` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: BasePoolV2
**Auto-Detected Standards/Inherited Protocols:** ERC721
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **2** | Low (Simple) |
| `_baseURI` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `_safeTransfer` | **1** | Low (Simple) |
| `_ownerOf` | **1** | Low (Simple) |
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setApprovalForAll` | **1** | Low (Simple) |
| `_requireMinted` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `__unsafe_increaseBalance` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `nativeAsset` | **1** | Low (Simple) |
| `supported` | **1** | Low (Simple) |
| `positionForeignAsset` | **1** | Low (Simple) |
| `pairSupply` | **1** | Low (Simple) |
| `doubleSwap` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `positionForeignAsset` | **1** | Low (Simple) |
| `pairSupply` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `doubleSwap` | **1** | Low (Simple) |
| `swap` | **3** | Low (Simple) |
| `rescue` | **1** | Low (Simple) |
| `_update` | **2** | Low (Simple) |
| `_supportedToken` | **1** | Low (Simple) |
| `_onlyRouter` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: VaderPoolV2
**Auto-Detected Standards/Inherited Protocols:** ERC721, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `positionForeignAsset` | **1** | Low (Simple) |
| `pairSupply` | **1** | Low (Simple) |
| `mint` | **2** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `doubleSwap` | **1** | Low (Simple) |
| `swap` | **3** | Low (Simple) |
| `rescue` | **1** | Low (Simple) |
| `_update` | **2** | Low (Simple) |
| `_supportedToken` | **1** | Low (Simple) |
| `_onlyRouter` | **1** | Low (Simple) |
| `_nonReentrantBefore` | **1** | Low (Simple) |
| `_nonReentrantAfter` | **1** | Low (Simple) |
| `_reentrancyGuardEntered` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **2** | Low (Simple) |
| `_baseURI` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `_safeTransfer` | **1** | Low (Simple) |
| `_ownerOf` | **1** | Low (Simple) |
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_setApprovalForAll` | **1** | Low (Simple) |
| `_requireMinted` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `__unsafe_increaseBalance` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `getReserves` | **1** | Low (Simple) |
| `nativeAsset` | **1** | Low (Simple) |
| `supported` | **1** | Low (Simple) |
| `positionForeignAsset` | **1** | Low (Simple) |
| `pairSupply` | **1** | Low (Simple) |
| `doubleSwap` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `cumulativePrices` | **1** | Low (Simple) |
| `mintSynth` | **1** | Low (Simple) |
| `burnSynth` | **1** | Low (Simple) |
| `mintFungible` | **1** | Low (Simple) |
| `burnFungible` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `toggleQueue` | **1** | Low (Simple) |
| `setTokenSupport` | **1** | Low (Simple) |
| `setFungibleTokenSupport` | **1** | Low (Simple) |
| `cumulativePrices` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `mintSynth` | **2** | Low (Simple) |
| `burnSynth` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `mintFungible` | **2** | Low (Simple) |
| `burnFungible` | **1** | Low (Simple) |
| `toggleQueue` | **1** | Low (Simple) |
| `setTokenSupport` | **1** | Low (Simple) |
| `setFungibleTokenSupport` | **1** | Low (Simple) |
| `_min` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: Synth
**Auto-Detected Standards/Inherited Protocols:** ERC20, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
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
| `_spendAllowance` | **2** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `_afterTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `decimals` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `_calculateName` | **1** | Low (Simple) |
| `_calculateSymbol` | **1** | Low (Simple) |
| `_combine` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SynthFactory
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `owner` | **1** | Low (Simple) |
| `_checkOwner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `synths` | **1** | Low (Simple) |
| `createSynth` | **1** | Low (Simple) |
| `createSynth` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---
