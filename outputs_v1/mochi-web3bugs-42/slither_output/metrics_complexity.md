## Package: mochi-library

# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+------------------------+-----------------+-----------+------------+
| Contract               | State variables | Constants | Immutables |
+------------------------+-----------------+-----------+------------+
| CheapERC20             | 0               | 0         | 0          |
| Float                  | 0               | 0         | 0          |
| BlockVerifier          | 0               | 0         | 0          |
| BeaconProxyDeployer    | 0               | 0         | 0          |
| Create2BeaconMaker     | 0               | 0         | 0          |
| Beacon                 | 1               | 0         | 1          |
| UniswapV2Library       | 0               | 0         | 0          |
| Rlp                    | 0               | 6         | 0          |
| AccountVerifier        | 0               | 0         | 0          |
| MerklePatriciaVerifier | 0               | 0         | 0          |
| SushiswapV2Library     | 0               | 0         | 0          |
| UQ112x112              | 0               | 1         | 0          |
| TOTAL                  | 1               | 7         | 1          |
+------------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+------------------------+--------+----------+----------+---------+
| Contract               | Public | External | Internal | Private |
+------------------------+--------+----------+----------+---------+
| CheapERC20             | 0      | 0        | 2        | 0       |
| Float                  | 0      | 0        | 11       | 0       |
| BlockVerifier          | 0      | 0        | 1        | 2       |
| BeaconProxyDeployer    | 0      | 0        | 2        | 0       |
| Create2BeaconMaker     | 0      | 0        | 0        | 0       |
| Beacon                 | 0      | 1        | 0        | 0       |
| UniswapV2Library       | 0      | 0        | 8        | 0       |
| Rlp                    | 0      | 0        | 24       | 4       |
| AccountVerifier        | 0      | 0        | 1        | 0       |
| MerklePatriciaVerifier | 0      | 0        | 1        | 3       |
| SushiswapV2Library     | 0      | 0        | 8        | 0       |
| UQ112x112              | 0      | 0        | 3        | 0       |
| TOTAL                  | 0      | 1        | 61       | 9       |
+------------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+------------------------+----------+------+------+
| Contract               | Mutating | View | Pure |
+------------------------+----------+------+------+
| CheapERC20             | 2        | 0    | 0    |
| Float                  | 0        | 0    | 11   |
| BlockVerifier          | 2        | 1    | 0    |
| BeaconProxyDeployer    | 1        | 1    | 0    |
| Create2BeaconMaker     | 0        | 0    | 0    |
| Beacon                 | 1        | 0    | 0    |
| UniswapV2Library       | 0        | 3    | 5    |
| Rlp                    | 1        | 0    | 27   |
| AccountVerifier        | 0        | 0    | 1    |
| MerklePatriciaVerifier | 0        | 0    | 4    |
| SushiswapV2Library     | 0        | 3    | 5    |
| UQ112x112              | 1        | 0    | 2    |
| TOTAL                  | 8        | 8    | 55   |
+------------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+------------------------+-------------------+----------------------+--------------+
| Contract               | External mutating | No auth or onlyOwner | No modifiers |
+------------------------+-------------------+----------------------+--------------+
| CheapERC20             | 0                 | 0                    | 0            |
| Float                  | 0                 | 0                    | 0            |
| BlockVerifier          | 0                 | 0                    | 0            |
| BeaconProxyDeployer    | 0                 | 0                    | 0            |
| Create2BeaconMaker     | 0                 | 0                    | 0            |
| Beacon                 | 1                 | 1                    | 1            |
| UniswapV2Library       | 0                 | 0                    | 0            |
| Rlp                    | 0                 | 0                    | 0            |
| AccountVerifier        | 0                 | 0                    | 0            |
| MerklePatriciaVerifier | 0                 | 0                    | 0            |
| SushiswapV2Library     | 0                 | 0                    | 0            |
| UQ112x112              | 0                 | 0                    | 0            |
| TOTAL                  | 1                 | 1                    | 1            |
+------------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+------------------------+-----------+-----+-----+-----+-----+
| Contract               | Ext calls | RFC | NOC | DIT | CBO |
+------------------------+-----------+-----+-----+-----+-----+
| CheapERC20             | 0         | 0   | 0   | 0   | 0   |
| Float                  | 0         | 0   | 0   | 0   | 0   |
| BlockVerifier          | 0         | 0   | 0   | 0   | 0   |
| BeaconProxyDeployer    | 0         | 0   | 0   | 0   | 0   |
| Create2BeaconMaker     | 0         | 0   | 0   | 0   | 0   |
| Beacon                 | 0         | 1   | 0   | 0   | 0   |
| UniswapV2Library       | 1         | 1   | 0   | 0   | 1   |
| Rlp                    | 0         | 0   | 0   | 0   | 2   |
| AccountVerifier        | 4         | 4   | 0   | 0   | 2   |
| MerklePatriciaVerifier | 11        | 5   | 0   | 0   | 2   |
| SushiswapV2Library     | 1         | 1   | 0   | 0   | 1   |
| UQ112x112              | 0         | 0   | 0   | 0   | 0   |
+------------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics (Cognitive Volume)
```
Halstead complexity metrics (Core):
+------------------------+-----------------+------------------+----------------+-----------------+
| Contract               | Total Operators | Unique Operators | Total Operands | Unique Operands |
+------------------------+-----------------+------------------+----------------+-----------------+
| CheapERC20             | 24              | 11               | 39             | 23              |
| Float                  | 203             | 18               | 383            | 111             |
| BlockVerifier          | 99              | 19               | 148            | 62              |
| BeaconProxyDeployer    | 39              | 19               | 41             | 21              |
| Create2BeaconMaker     | 19              | 15               | 25             | 16              |
| Beacon                 | 9               | 8                | 12             | 6               |
| UniswapV2Library       | 136             | 30               | 218            | 85              |
| Rlp                    | 377             | 38               | 510            | 182             |
| AccountVerifier        | 11              | 7                | 15             | 10              |
| MerklePatriciaVerifier | 157             | 26               | 237            | 74              |
| SushiswapV2Library     | 136             | 30               | 218            | 85              |
| UQ112x112              | 10              | 6                | 11             | 8               |
+------------------------+-----------------+------------------+----------------+-----------------+


Halstead complexity metrics (Extended 1/2):
+------------------------+------------+----------------+------------------+--------+
| Contract               | Vocabulary | Program Length | Estimated Length | Volume |
+------------------------+------------+----------------+------------------+--------+
| CheapERC20             | 34         | 63             | 142              | 321    |
| Float                  | 129        | 586            | 829              | 4109   |
| BlockVerifier          | 81         | 247            | 450              | 1566   |
| BeaconProxyDeployer    | 40         | 80             | 173              | 426    |
| Create2BeaconMaker     | 31         | 44             | 123              | 218    |
| Beacon                 | 14         | 21             | 40               | 80     |
| UniswapV2Library       | 115        | 354            | 692              | 2423   |
| Rlp                    | 220        | 887            | 1566             | 6902   |
| AccountVerifier        | 17         | 26             | 53               | 106    |
| MerklePatriciaVerifier | 100        | 394            | 582              | 2618   |
| SushiswapV2Library     | 115        | 354            | 692              | 2423   |
| UQ112x112              | 14         | 21             | 40               | 80     |
+------------------------+------------+----------------+------------------+--------+


Halstead complexity metrics (Extended 2/2):
+------------------------+------------+--------+-------+----------------+
| Contract               | Difficulty | Effort | Time  | Estimated Bugs |
+------------------------+------------+--------+-------+----------------+
| CheapERC20             | 9          | 2989   | 166   | 0.069          |
| Float                  | 31         | 127588 | 7088  | 0.845          |
| BlockVerifier          | 23         | 35512  | 1973  | 0.360          |
| BeaconProxyDeployer    | 19         | 7897   | 439   | 0.132          |
| Create2BeaconMaker     | 12         | 2555   | 142   | 0.062          |
| Beacon                 | 8          | 640    | 36    | 0.025          |
| UniswapV2Library       | 38         | 93226  | 5179  | 0.685          |
| Rlp                    | 53         | 367478 | 20415 | 1.710          |
| AccountVerifier        | 5          | 558    | 31    | 0.023          |
| MerklePatriciaVerifier | 42         | 108987 | 6055  | 0.761          |
| SushiswapV2Library     | 38         | 93226  | 5179  | 0.685          |
| UQ112x112              | 4          | 330    | 18    | 0.016          |
+------------------------+------------+--------+-------+----------------+
```

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+------------------------+------------+--------------+-------------+-----------------------------+
| Contract               | Dependents | Dependencies | Instability | Distance from main sequence |
+------------------------+------------+--------------+-------------+-----------------------------+
| CheapERC20             | 0          | 0            | 0.00        | 0.00                        |
| Float                  | 0          | 0            | 0.00        | 0.00                        |
| BlockVerifier          | 0          | 0            | 0.00        | 0.00                        |
| BeaconProxyDeployer    | 0          | 0            | 0.00        | 0.00                        |
| Create2BeaconMaker     | 0          | 0            | 0.00        | 0.00                        |
| Beacon                 | 0          | 0            | 0.00        | 0.00                        |
| UniswapV2Library       | 0          | 1            | 1.00        | 1.00                        |
| Rlp                    | 2          | 0            | 0.00        | 0.00                        |
| AccountVerifier        | 0          | 2            | 1.00        | 1.00                        |
| MerklePatriciaVerifier | 1          | 1            | 0.50        | 0.50                        |
| SushiswapV2Library     | 0          | 1            | 1.00        | 1.00                        |
| UQ112x112              | 0          | 0            | 0.00        | 0.00                        |
+------------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 95  | 0   | 0    |
| sloc  | 23  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 177 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 89  | 0   | 0    |
| sloc  | 75  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 165 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 70  | 0   | 0    |
| sloc  | 58  | 0   | 0    |
| cloc  | 5   | 0   | 0    |
| Total | 133 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 104 | 0   | 0    |
| sloc  | 82  | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 198 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 26  | 0   | 0    |
| sloc  | 19  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 48  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 37  | 0   | 0    |
| sloc  | 26  | 0   | 0    |
| cloc  | 7   | 0   | 0    |
| Total | 70  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 134 | 0   | 0    |
| sloc  | 104 | 0   | 0    |
| cloc  | 11  | 0   | 0    |
| Total | 249 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 401 | 0   | 0    |
| sloc  | 291 | 0   | 0    |
| cloc  | 75  | 0   | 0    |
| Total | 767 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 611  | 0   | 0    |
| sloc  | 446  | 0   | 0    |
| cloc  | 99   | 0   | 0    |
| Total | 1156 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 518 | 0   | 0    |
| sloc  | 370 | 0   | 0    |
| cloc  | 93  | 0   | 0    |
| Total | 981 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 134 | 0   | 0    |
| sloc  | 104 | 0   | 0    |
| cloc  | 11  | 0   | 0    |
| Total | 249 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 23  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 7   | 0   | 0    |
| Total | 40  | 0   | 0    |
+-------+-----+-----+------+
```

## Function Complexity & Standards Checks
### Contract: CheapERC20
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `cheapTransfer` | **1** | Low (Simple) |
| `cheapTransferFrom` | **1** | Low (Simple) |

---

### Contract: Float
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `multiply` | **1** | Low (Simple) |
| `inverse` | **1** | Low (Simple) |
| `divide` | **1** | Low (Simple) |
| `add` | **2** | Low (Simple) |
| `sub` | **2** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `gt` | **1** | Low (Simple) |
| `lt` | **1** | Low (Simple) |
| `gte` | **1** | Low (Simple) |
| `lte` | **1** | Low (Simple) |
| `equals` | **1** | Low (Simple) |

---

### Contract: BlockVerifier
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `extractStateRootAndTimestamp` | **2** | Low (Simple) |
| `revertWithReason` | **1** | Low (Simple) |
| `readDynamic` | **3** | Low (Simple) |

---

### Contract: BeaconProxyDeployer
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `deploy` | **2** | Low (Simple) |
| `calculateAddress` | **1** | Low (Simple) |

---

### Contract: Create2BeaconMaker
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |

---

### Contract: Beacon
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `fallback` | **2** | Low (Simple) |

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

### Contract: Rlp
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `next` | **1** | Low (Simple) |
| `next` | **1** | Low (Simple) |
| `hasNext` | **1** | Low (Simple) |
| `toItem` | **2** | Low (Simple) |
| `toItem` | **2** | Low (Simple) |
| `isNull` | **1** | Low (Simple) |
| `isList` | **2** | Low (Simple) |
| `isData` | **2** | Low (Simple) |
| `isEmpty` | **2** | Low (Simple) |
| `items` | **3** | Low (Simple) |
| `iterator` | **1** | Low (Simple) |
| `toBytes` | **1** | Low (Simple) |
| `toData` | **1** | Low (Simple) |
| `toList` | **2** | Low (Simple) |
| `toAscii` | **1** | Low (Simple) |
| `toUint` | **1** | Low (Simple) |
| `toBool` | **2** | Low (Simple) |
| `toByte` | **1** | Low (Simple) |
| `toInt` | **1** | Low (Simple) |
| `toBytes32` | **1** | Low (Simple) |
| `toAddress` | **1** | Low (Simple) |
| `_payloadOffset` | **5** | Moderate (Complex) |
| `_itemLength` | **5** | Moderate (Complex) |
| `_decode` | **3** | Low (Simple) |
| `_copyToBytes` | **2** | Low (Simple) |
| `_validate` | **2** | Low (Simple) |
| `rlpBytesToUint256` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: AccountVerifier
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getAccountStorageRoot` | **1** | Low (Simple) |

---

### Contract: MerklePatriciaVerifier
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `getValueFromProof` | **6** | Moderate (Complex) |
| `_nibblesToTraverse` | **3** | Low (Simple) |
| `_getNibbleArray` | **4** | Low (Simple) |
| `_getNthNibbleOfBytes` | **2** | Low (Simple) |

---

### Contract: SushiswapV2Library
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

### Contract: UQ112x112
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `encode` | **1** | Low (Simple) |
| `uqdiv` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

---

## Package: mochi-cssr

# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+-----------------------+-----------------+-----------+------------+
| Contract              | State variables | Constants | Immutables |
+-----------------------+-----------------+-----------+------------+
| MochiCSSRv0           | 8               | 0         | 1          |
| Float                 | 0               | 0         | 0          |
| SushiswapV2LPAdapter  | 0               | 1         | 4          |
| SushiswapV2Library    | 0               | 0         | 0          |
| UniswapV2LPAdapter    | 0               | 1         | 4          |
| UniswapV2Library      | 0               | 0         | 0          |
| UniswapV2TokenAdapter | 3               | 0         | 4          |
| ChainlinkAdapterEth   | 1               | 0         | 1          |
| TOTAL                 | 12              | 2         | 14         |
+-----------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+-----------------------+--------+----------+----------+---------+
| Contract              | Public | External | Internal | Private |
+-----------------------+--------+----------+----------+---------+
| MochiCSSRv0           | 1      | 14       | 0        | 0       |
| Float                 | 0      | 0        | 11       | 0       |
| SushiswapV2LPAdapter  | 1      | 8        | 3        | 0       |
| SushiswapV2Library    | 0      | 0        | 8        | 0       |
| UniswapV2LPAdapter    | 1      | 8        | 3        | 0       |
| UniswapV2Library      | 0      | 0        | 8        | 0       |
| UniswapV2TokenAdapter | 3      | 10       | 1        | 0       |
| ChainlinkAdapterEth   | 1      | 8        | 0        | 0       |
| TOTAL                 | 7      | 48       | 34       | 0       |
+-----------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+-----------------------+----------+------+------+
| Contract              | Mutating | View | Pure |
+-----------------------+----------+------+------+
| MochiCSSRv0           | 11       | 4    | 0    |
| Float                 | 0        | 0    | 11   |
| SushiswapV2LPAdapter  | 3        | 8    | 1    |
| SushiswapV2Library    | 0        | 3    | 5    |
| UniswapV2LPAdapter    | 3        | 8    | 1    |
| UniswapV2Library      | 0        | 3    | 5    |
| UniswapV2TokenAdapter | 5        | 8    | 1    |
| ChainlinkAdapterEth   | 3        | 6    | 0    |
| TOTAL                 | 25       | 40   | 24   |
+-----------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+-----------------------+-------------------+----------------------+--------------+
| Contract              | External mutating | No auth or onlyOwner | No modifiers |
+-----------------------+-------------------+----------------------+--------------+
| MochiCSSRv0           | 14                | 14                   | 5            |
| Float                 | 0                 | 0                    | 0            |
| SushiswapV2LPAdapter  | 8                 | 8                    | 8            |
| SushiswapV2Library    | 0                 | 0                    | 0            |
| UniswapV2LPAdapter    | 8                 | 8                    | 8            |
| UniswapV2Library      | 0                 | 0                    | 0            |
| UniswapV2TokenAdapter | 10                | 10                   | 7            |
| ChainlinkAdapterEth   | 8                 | 8                    | 7            |
| TOTAL                 | 48                | 48                   | 35           |
+-----------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+-----------------------+-----------+-----+-----+-----+-----+
| Contract              | Ext calls | RFC | NOC | DIT | CBO |
+-----------------------+-----------+-----+-----+-----+-----+
| MochiCSSRv0           | 7         | 21  | 0   | 1   | 1   |
| Float                 | 0         | 0   | 0   | 0   | 2   |
| SushiswapV2LPAdapter  | 14        | 20  | 0   | 1   | 5   |
| SushiswapV2Library    | 1         | 1   | 0   | 0   | 3   |
| UniswapV2LPAdapter    | 14        | 20  | 0   | 1   | 5   |
| UniswapV2Library      | 1         | 1   | 0   | 0   | 3   |
| UniswapV2TokenAdapter | 21        | 25  | 0   | 1   | 4   |
| ChainlinkAdapterEth   | 3         | 12  | 0   | 1   | 2   |
+-----------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics (Cognitive Volume)
```
Halstead complexity metrics (Core):
+-----------------------+-----------------+------------------+----------------+-----------------+
| Contract              | Total Operators | Unique Operators | Total Operands | Unique Operands |
+-----------------------+-----------------+------------------+----------------+-----------------+
| MochiCSSRv0           | 115             | 14               | 184            | 64              |
| Float                 | 203             | 18               | 383            | 111             |
| SushiswapV2LPAdapter  | 137             | 22               | 159            | 60              |
| SushiswapV2Library    | 136             | 30               | 218            | 85              |
| UniswapV2LPAdapter    | 137             | 22               | 159            | 60              |
| UniswapV2Library      | 136             | 30               | 218            | 85              |
| UniswapV2TokenAdapter | 181             | 29               | 328            | 112             |
| ChainlinkAdapterEth   | 44              | 21               | 55             | 25              |
+-----------------------+-----------------+------------------+----------------+-----------------+


Halstead complexity metrics (Extended 1/2):
+-----------------------+------------+----------------+------------------+--------+
| Contract              | Vocabulary | Program Length | Estimated Length | Volume |
+-----------------------+------------+----------------+------------------+--------+
| MochiCSSRv0           | 78         | 299            | 437              | 1879   |
| Float                 | 129        | 586            | 829              | 4109   |
| SushiswapV2LPAdapter  | 82         | 296            | 453              | 1882   |
| SushiswapV2Library    | 115        | 354            | 692              | 2423   |
| UniswapV2LPAdapter    | 82         | 296            | 453              | 1882   |
| UniswapV2Library      | 115        | 354            | 692              | 2423   |
| UniswapV2TokenAdapter | 141        | 509            | 903              | 3634   |
| ChainlinkAdapterEth   | 46         | 99             | 208              | 547    |
+-----------------------+------------+----------------+------------------+--------+


Halstead complexity metrics (Extended 2/2):
+-----------------------+------------+--------+------+----------------+
| Contract              | Difficulty | Effort | Time | Estimated Bugs |
+-----------------------+------------+--------+------+----------------+
| MochiCSSRv0           | 20         | 37822  | 2101 | 0.376          |
| Float                 | 31         | 127588 | 7088 | 0.845          |
| SushiswapV2LPAdapter  | 29         | 54856  | 3048 | 0.481          |
| SushiswapV2Library    | 38         | 93226  | 5179 | 0.685          |
| UniswapV2LPAdapter    | 29         | 54856  | 3048 | 0.481          |
| UniswapV2Library      | 38         | 93226  | 5179 | 0.685          |
| UniswapV2TokenAdapter | 42         | 154317 | 8573 | 0.959          |
| ChainlinkAdapterEth   | 23         | 12632  | 702  | 0.181          |
+-----------------------+------------+--------+------+----------------+
```

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+-----------------------+------------+--------------+-------------+-----------------------------+
| Contract              | Dependents | Dependencies | Instability | Distance from main sequence |
+-----------------------+------------+--------------+-------------+-----------------------------+
| MochiCSSRv0           | 0          | 1            | 1.00        | 1.00                        |
| Float                 | 2          | 0            | 0.00        | 0.00                        |
| SushiswapV2LPAdapter  | 0          | 5            | 1.00        | 1.00                        |
| SushiswapV2Library    | 2          | 1            | 0.33        | 0.33                        |
| UniswapV2LPAdapter    | 0          | 5            | 1.00        | 1.00                        |
| UniswapV2Library      | 2          | 1            | 0.33        | 0.33                        |
| UniswapV2TokenAdapter | 0          | 4            | 1.00        | 1.00                        |
| ChainlinkAdapterEth   | 0          | 2            | 1.00        | 1.00                        |
+-----------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 272 | 0   | 0    |
| sloc  | 213 | 0   | 0    |
| cloc  | 12  | 0   | 0    |
| Total | 497 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 112 | 0   | 0    |
| sloc  | 91  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 205 | 0   | 0    |
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
| loc   | 104 | 0   | 0    |
| sloc  | 84  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 190 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 52  | 0   | 0    |
| sloc  | 42  | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 95  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 9   | 0   | 0    |
| sloc  | 4   | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 15  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 21  | 0   | 0    |
| sloc  | 11  | 0   | 0    |
| cloc  | 7   | 0   | 0    |
| Total | 39  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 9   | 0   | 0    |
| sloc  | 5   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 15  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 431 | 0   | 0    |
| sloc  | 345 | 0   | 0    |
| cloc  | 19  | 0   | 0    |
| Total | 795 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 431 | 0   | 0    |
| sloc  | 345 | 0   | 0    |
| cloc  | 19  | 0   | 0    |
| Total | 795 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 629  | 0   | 0    |
| sloc  | 520  | 0   | 0    |
| cloc  | 29   | 0   | 0    |
| Total | 1178 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 335 | 0   | 0    |
| sloc  | 202 | 0   | 0    |
| cloc  | 82  | 0   | 0    |
| Total | 619 | 0   | 0    |
+-------+-----+-----+------+
```

## Function Complexity & Standards Checks
### Contract: MochiCSSRv0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `setBluechip` | **2** | Low (Simple) |
| `removeBluechip` | **2** | Low (Simple) |
| `listAdapter` | **1** | Low (Simple) |
| `delistAdapter` | **1** | Low (Simple) |
| `setFiatPriceAdapter` | **1** | Low (Simple) |
| `setPriceSource` | **2** | Low (Simple) |
| `setLiquiditySource` | **2** | Low (Simple) |
| `setDefaultPriceSource` | **1** | Low (Simple) |
| `setDefaultLiquiditySource` | **1** | Low (Simple) |
| `update` | **3** | Low (Simple) |
| `getPrice` | **3** | Low (Simple) |
| `getLiquidity` | **2** | Low (Simple) |

---

### Contract: Float
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `multiply` | **1** | Low (Simple) |
| `inverse` | **1** | Low (Simple) |
| `divide` | **1** | Low (Simple) |
| `add` | **2** | Low (Simple) |
| `sub` | **2** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `gt` | **1** | Low (Simple) |
| `lt` | **1** | Low (Simple) |
| `gte` | **1** | Low (Simple) |
| `lte` | **1** | Low (Simple) |
| `equals` | **1** | Low (Simple) |

---

### Contract: SushiswapV2LPAdapter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `update` | **1** | Low (Simple) |
| `getUnderlyingAsset` | **3** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `_getPrice` | **4** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `sqrt` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SushiswapV2Library
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

### Contract: UniswapV2LPAdapter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `update` | **1** | Low (Simple) |
| `getUnderlyingAsset` | **3** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `_getPrice` | **4** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `sqrt` | **4** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

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

### Contract: UniswapV2TokenAdapter
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `addKeyCurrency` | **1** | Low (Simple) |
| `removeKeyCurrency` | **1** | Low (Simple) |
| `setMinimumLiquidity` | **1** | Low (Simple) |
| `support` | **3** | Low (Simple) |
| `update` | **3** | Low (Simple) |
| `getPriceRaw` | **7** | Moderate (Complex) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **7** | Moderate (Complex) |
| `aboveLiquidity` | **3** | Low (Simple) |
| `convertToValue` | **1** | Low (Simple) |

---

### Contract: ChainlinkAdapterEth
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `update` | **1** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `getPrice` | **1** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |
| `update` | **1** | Low (Simple) |
| `setFeed` | **2** | Low (Simple) |
| `support` | **1** | Low (Simple) |
| `getPrice` | **2** | Low (Simple) |
| `getLiquidity` | **1** | Low (Simple) |

---

---

## Package: mochi-core

# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+------------------------+-----------------+-----------+------------+
| Contract               | State variables | Constants | Immutables |
+------------------------+-----------------+-----------+------------+
| MochiEngine            | 14              | 0         | 1          |
| USDM                   | 0               | 2         | 1          |
| MochiVaultFactory      | 1               | 0         | 2          |
| Beacon                 | 1               | 0         | 1          |
| BeaconProxyDeployer    | 0               | 0         | 0          |
| Create2BeaconMaker     | 0               | 0         | 0          |
| Float                  | 0               | 0         | 0          |
| MinterV0               | 2               | 0         | 1          |
| MochiProfileV0         | 5               | 0         | 2          |
| NoDiscountProfile      | 0               | 0         | 0          |
| NoMochiReferralFeePool | 2               | 0         | 1          |
| NoMochiFeePool         | 1               | 0         | 1          |
| ReferralFeePoolV0      | 2               | 0         | 2          |
| FeePoolV0              | 5               | 0         | 2          |
| MochiTreasuryV0        | 3               | 0         | 4          |
| VestedRewardPool       | 2               | 0         | 2          |
| Mochi                  | 0               | 0         | 0          |
| DutchAuctionLiquidator | 1               | 1         | 1          |
| MochiVault             | 9               | 1         | 1          |
| CheapERC20             | 0               | 0         | 0          |
| AddressUpgradeable     | 0               | 0         | 0          |
| MochiNFT               | 2               | 0         | 1          |
| Address                | 0               | 0         | 0          |
| Strings                | 0               | 2         | 0          |
| Math                   | 0               | 0         | 0          |
| SignedMath             | 0               | 0         | 0          |
| TOTAL                  | 50              | 6         | 23         |
+------------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+------------------------+--------+----------+----------+---------+
| Contract               | Public | External | Internal | Private |
+------------------------+--------+----------+----------+---------+
| MochiEngine            | 0      | 29       | 0        | 0       |
| USDM                   | 12     | 18       | 11       | 0       |
| MochiVaultFactory      | 0      | 6        | 0        | 0       |
| Beacon                 | 0      | 1        | 0        | 0       |
| BeaconProxyDeployer    | 0      | 0        | 2        | 0       |
| Create2BeaconMaker     | 0      | 0        | 0        | 0       |
| Float                  | 0      | 0        | 11       | 0       |
| MinterV0               | 2      | 6        | 0        | 0       |
| MochiProfileV0         | 10     | 23       | 1        | 0       |
| NoDiscountProfile      | 0      | 2        | 0        | 0       |
| NoMochiReferralFeePool | 0      | 3        | 0        | 0       |
| NoMochiFeePool         | 0      | 4        | 0        | 0       |
| ReferralFeePoolV0      | 0      | 3        | 0        | 0       |
| FeePoolV0              | 0      | 7        | 2        | 0       |
| MochiTreasuryV0        | 1      | 7        | 2        | 0       |
| VestedRewardPool       | 0      | 4        | 0        | 0       |
| Mochi                  | 11     | 9        | 10       | 0       |
| DutchAuctionLiquidator | 2      | 4        | 2        | 0       |
| MochiVault             | 10     | 25       | 6        | 0       |
| CheapERC20             | 0      | 0        | 2        | 0       |
| AddressUpgradeable     | 0      | 0        | 12       | 1       |
| MochiNFT               | 19     | 21       | 20       | 5       |
| Address                | 0      | 0        | 12       | 1       |
| Strings                | 0      | 0        | 7        | 0       |
| Math                   | 0      | 0        | 14       | 0       |
| SignedMath             | 0      | 0        | 4        | 0       |
| TOTAL                  | 67     | 172      | 118      | 7       |
+------------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+------------------------+----------+------+------+
| Contract               | Mutating | View | Pure |
+------------------------+----------+------+------+
| MochiEngine            | 14       | 15   | 0    |
| USDM                   | 22       | 19   | 0    |
| MochiVaultFactory      | 4        | 2    | 0    |
| Beacon                 | 1        | 0    | 0    |
| BeaconProxyDeployer    | 1        | 1    | 0    |
| Create2BeaconMaker     | 0        | 0    | 0    |
| Float                  | 0        | 0    | 11   |
| MinterV0               | 4        | 4    | 0    |
| MochiProfileV0         | 11       | 21   | 2    |
| NoDiscountProfile      | 0        | 1    | 1    |
| NoMochiReferralFeePool | 3        | 0    | 0    |
| NoMochiFeePool         | 4        | 0    | 0    |
| ReferralFeePoolV0      | 3        | 0    | 0    |
| FeePoolV0              | 9        | 0    | 0    |
| MochiTreasuryV0        | 10       | 0    | 0    |
| VestedRewardPool       | 4        | 0    | 0    |
| Mochi                  | 15       | 15   | 0    |
| DutchAuctionLiquidator | 5        | 2    | 1    |
| MochiVault             | 22       | 19   | 0    |
| CheapERC20             | 2        | 0    | 0    |
| AddressUpgradeable     | 7        | 4    | 2    |
| MochiNFT               | 30       | 35   | 0    |
| Address                | 7        | 4    | 2    |
| Strings                | 1        | 0    | 6    |
| Math                   | 0        | 0    | 14   |
| SignedMath             | 0        | 0    | 4    |
| TOTAL                  | 179      | 142  | 43   |
+------------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+------------------------+-------------------+----------------------+--------------+
| Contract               | External mutating | No auth or onlyOwner | No modifiers |
+------------------------+-------------------+----------------------+--------------+
| MochiEngine            | 29                | 29                   | 15           |
| USDM                   | 23                | 23                   | 22           |
| MochiVaultFactory      | 6                 | 6                    | 6            |
| Beacon                 | 1                 | 1                    | 1            |
| BeaconProxyDeployer    | 0                 | 0                    | 0            |
| Create2BeaconMaker     | 0                 | 0                    | 0            |
| Float                  | 0                 | 0                    | 0            |
| MinterV0               | 6                 | 6                    | 3            |
| MochiProfileV0         | 23                | 23                   | 17           |
| NoDiscountProfile      | 2                 | 2                    | 2            |
| NoMochiReferralFeePool | 3                 | 3                    | 3            |
| NoMochiFeePool         | 4                 | 4                    | 4            |
| ReferralFeePoolV0      | 3                 | 3                    | 3            |
| FeePoolV0              | 7                 | 7                    | 7            |
| MochiTreasuryV0        | 8                 | 8                    | 8            |
| VestedRewardPool       | 4                 | 4                    | 0            |
| Mochi                  | 14                | 14                   | 14           |
| DutchAuctionLiquidator | 4                 | 4                    | 4            |
| MochiVault             | 31                | 31                   | 24           |
| CheapERC20             | 0                 | 0                    | 0            |
| AddressUpgradeable     | 0                 | 0                    | 0            |
| MochiNFT               | 26                | 26                   | 26           |
| Address                | 0                 | 0                    | 0            |
| Strings                | 0                 | 0                    | 0            |
| Math                   | 0                 | 0                    | 0            |
| SignedMath             | 0                 | 0                    | 0            |
| TOTAL                  | 194               | 194                  | 159          |
+------------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+------------------------+-----------+-----+-----+-----+-----+
| Contract               | Ext calls | RFC | NOC | DIT | CBO |
+------------------------+-----------+-----+-----+-----+-----+
| MochiEngine            | 0         | 29  | 0   | 1   | 0   |
| USDM                   | 2         | 32  | 0   | 3   | 2   |
| MochiVaultFactory      | 3         | 9   | 0   | 1   | 2   |
| Beacon                 | 0         | 1   | 0   | 0   | 0   |
| BeaconProxyDeployer    | 0         | 0   | 0   | 0   | 1   |
| Create2BeaconMaker     | 0         | 0   | 0   | 0   | 0   |
| Float                  | 0         | 0   | 0   | 0   | 3   |
| MinterV0               | 5         | 13  | 0   | 1   | 4   |
| MochiProfileV0         | 13        | 46  | 0   | 1   | 5   |
| NoDiscountProfile      | 0         | 2   | 0   | 1   | 0   |
| NoMochiReferralFeePool | 4         | 7   | 0   | 1   | 2   |
| NoMochiFeePool         | 5         | 8   | 0   | 1   | 2   |
| ReferralFeePoolV0      | 11        | 12  | 0   | 1   | 4   |
| FeePoolV0              | 19        | 23  | 0   | 1   | 4   |
| MochiTreasuryV0        | 20        | 27  | 0   | 0   | 5   |
| VestedRewardPool       | 7         | 10  | 0   | 0   | 2   |
| Mochi                  | 0         | 20  | 0   | 3   | 0   |
| DutchAuctionLiquidator | 27        | 24  | 0   | 1   | 7   |
| MochiVault             | 73        | 93  | 0   | 1   | 12  |
| CheapERC20             | 0         | 0   | 0   | 0   | 1   |
| AddressUpgradeable     | 0         | 0   | 0   | 0   | 0   |
| MochiNFT               | 7         | 47  | 0   | 5   | 6   |
| Address                | 0         | 0   | 0   | 0   | 1   |
| Strings                | 4         | 3   | 0   | 0   | 3   |
| Math                   | 0         | 0   | 0   | 0   | 1   |
| SignedMath             | 0         | 0   | 0   | 0   | 1   |
+------------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics (Cognitive Volume)
```
Halstead complexity metrics (Core):
+------------------------+-----------------+------------------+----------------+-----------------+
| Contract               | Total Operators | Unique Operators | Total Operands | Unique Operands |
+------------------------+-----------------+------------------+----------------+-----------------+
| MochiEngine            | 45              | 5                | 48             | 33              |
| USDM                   | 148             | 21               | 239            | 95              |
| MochiVaultFactory      | 29              | 14               | 25             | 16              |
| Beacon                 | 9               | 8                | 12             | 6               |
| BeaconProxyDeployer    | 39              | 19               | 41             | 21              |
| Create2BeaconMaker     | 19              | 15               | 25             | 16              |
| Float                  | 203             | 18               | 383            | 111             |
| MinterV0               | 23              | 10               | 27             | 15              |
| MochiProfileV0         | 286             | 21               | 419            | 150             |
| NoDiscountProfile      | 2               | 2                | 2              | 2               |
| NoMochiReferralFeePool | 17              | 7                | 32             | 13              |
| NoMochiFeePool         | 12              | 6                | 13             | 8               |
| ReferralFeePoolV0      | 38              | 9                | 55             | 22              |
| FeePoolV0              | 70              | 14               | 87             | 30              |
| MochiTreasuryV0        | 72              | 14               | 95             | 27              |
| VestedRewardPool       | 63              | 15               | 136            | 44              |
| Mochi                  | 110             | 15               | 192            | 74              |
| DutchAuctionLiquidator | 121             | 26               | 202            | 72              |
| MochiVault             | 431             | 31               | 745            | 226             |
| CheapERC20             | 24              | 11               | 39             | 23              |
| AddressUpgradeable     | 59              | 21               | 96             | 62              |
| MochiNFT               | 305             | 34               | 497            | 200             |
| Address                | 59              | 21               | 96             | 62              |
| Strings                | 69              | 28               | 84             | 35              |
| Math                   | 287             | 23               | 413            | 62              |
| SignedMath             | 27              | 13               | 24             | 11              |
+------------------------+-----------------+------------------+----------------+-----------------+


Halstead complexity metrics (Extended 1/2):
+------------------------+------------+----------------+------------------+--------+
| Contract               | Vocabulary | Program Length | Estimated Length | Volume |
+------------------------+------------+----------------+------------------+--------+
| MochiEngine            | 38         | 93             | 178              | 488    |
| USDM                   | 116        | 387            | 716              | 2654   |
| MochiVaultFactory      | 30         | 54             | 117              | 265    |
| Beacon                 | 14         | 21             | 40               | 80     |
| BeaconProxyDeployer    | 40         | 80             | 173              | 426    |
| Create2BeaconMaker     | 31         | 44             | 123              | 218    |
| Float                  | 129        | 586            | 829              | 4109   |
| MinterV0               | 25         | 50             | 92               | 232    |
| MochiProfileV0         | 171        | 705            | 1177             | 5230   |
| NoDiscountProfile      | 4          | 4              | 4                | 8      |
| NoMochiReferralFeePool | 20         | 49             | 68               | 212    |
| NoMochiFeePool         | 14         | 25             | 40               | 95     |
| ReferralFeePoolV0      | 31         | 93             | 127              | 461    |
| FeePoolV0              | 44         | 157            | 201              | 857    |
| MochiTreasuryV0        | 41         | 167            | 182              | 895    |
| VestedRewardPool       | 59         | 199            | 299              | 1171   |
| Mochi                  | 89         | 302            | 518              | 1956   |
| DutchAuctionLiquidator | 98         | 323            | 566              | 2137   |
| MochiVault             | 257        | 1176           | 1921             | 9415   |
| CheapERC20             | 34         | 63             | 142              | 321    |
| AddressUpgradeable     | 83         | 155            | 461              | 988    |
| MochiNFT               | 234        | 802            | 1702             | 6312   |
| Address                | 83         | 155            | 461              | 988    |
| Strings                | 63         | 153            | 314              | 915    |
| Math                   | 85         | 700            | 473              | 4487   |
| SignedMath             | 24         | 51             | 86               | 234    |
+------------------------+------------+----------------+------------------+--------+


Halstead complexity metrics (Extended 2/2):
+------------------------+------------+--------+-------+----------------+
| Contract               | Difficulty | Effort | Time  | Estimated Bugs |
+------------------------+------------+--------+-------+----------------+
| MochiEngine            | 4          | 1775   | 99    | 0.049          |
| USDM                   | 26         | 70109  | 3895  | 0.567          |
| MochiVaultFactory      | 11         | 2898   | 161   | 0.068          |
| Beacon                 | 8          | 640    | 36    | 0.025          |
| BeaconProxyDeployer    | 19         | 7897   | 439   | 0.132          |
| Create2BeaconMaker     | 12         | 2555   | 142   | 0.062          |
| Float                  | 31         | 127588 | 7088  | 0.845          |
| MinterV0               | 9          | 2090   | 116   | 0.054          |
| MochiProfileV0         | 29         | 153384 | 8521  | 0.955          |
| NoDiscountProfile      | 1          | 8      | 0     | 0.001          |
| NoMochiReferralFeePool | 9          | 1825   | 101   | 0.050          |
| NoMochiFeePool         | 5          | 464    | 26    | 0.020          |
| ReferralFeePoolV0      | 11         | 5183   | 288   | 0.100          |
| FeePoolV0              | 20         | 17400  | 967   | 0.224          |
| MochiTreasuryV0        | 25         | 22036  | 1224  | 0.262          |
| VestedRewardPool       | 23         | 27138  | 1508  | 0.301          |
| Mochi                  | 19         | 38056  | 2114  | 0.377          |
| DutchAuctionLiquidator | 36         | 77925  | 4329  | 0.608          |
| MochiVault             | 51         | 481041 | 26724 | 2.046          |
| CheapERC20             | 9          | 2989   | 166   | 0.069          |
| AddressUpgradeable     | 16         | 16065  | 893   | 0.212          |
| MochiNFT               | 42         | 266652 | 14814 | 1.381          |
| Address                | 16         | 16065  | 893   | 0.212          |
| Strings                | 34         | 30728  | 1707  | 0.327          |
| Math                   | 77         | 343693 | 19094 | 1.636          |
| SignedMath             | 14         | 3316   | 184   | 0.074          |
+------------------------+------------+--------+-------+----------------+
```

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+------------------------+------------+--------------+-------------+-----------------------------+
| Contract               | Dependents | Dependencies | Instability | Distance from main sequence |
+------------------------+------------+--------------+-------------+-----------------------------+
| MochiEngine            | 0          | 0            | 0.00        | 0.00                        |
| USDM                   | 0          | 2            | 1.00        | 1.00                        |
| MochiVaultFactory      | 0          | 2            | 1.00        | 1.00                        |
| Beacon                 | 0          | 0            | 0.00        | 0.00                        |
| BeaconProxyDeployer    | 1          | 0            | 0.00        | 0.00                        |
| Create2BeaconMaker     | 0          | 0            | 0.00        | 0.00                        |
| Float                  | 3          | 0            | 0.00        | 0.00                        |
| MinterV0               | 0          | 4            | 1.00        | 1.00                        |
| MochiProfileV0         | 0          | 5            | 1.00        | 1.00                        |
| NoDiscountProfile      | 0          | 0            | 0.00        | 0.00                        |
| NoMochiReferralFeePool | 0          | 2            | 1.00        | 1.00                        |
| NoMochiFeePool         | 0          | 2            | 1.00        | 1.00                        |
| ReferralFeePoolV0      | 0          | 4            | 1.00        | 1.00                        |
| FeePoolV0              | 0          | 4            | 1.00        | 1.00                        |
| MochiTreasuryV0        | 0          | 5            | 1.00        | 1.00                        |
| VestedRewardPool       | 0          | 2            | 1.00        | 1.00                        |
| Mochi                  | 0          | 0            | 0.00        | 0.00                        |
| DutchAuctionLiquidator | 0          | 7            | 1.00        | 1.00                        |
| MochiVault             | 0          | 12           | 1.00        | 1.00                        |
| CheapERC20             | 1          | 0            | 0.00        | 0.00                        |
| AddressUpgradeable     | 0          | 0            | 0.00        | 0.00                        |
| MochiNFT               | 0          | 6            | 1.00        | 1.00                        |
| Address                | 1          | 0            | 0.00        | 0.00                        |
| Strings                | 1          | 2            | 0.67        | 0.67                        |
| Math                   | 1          | 0            | 0.00        | 0.00                        |
| SignedMath             | 1          | 0            | 0.00        | 0.00                        |
+------------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1496 | 0   | 0    |
| sloc  | 756  | 0   | 0    |
| cloc  | 501  | 0   | 0    |
| Total | 2753 | 0   | 0    |
+-------+------+-----+------+

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
| loc   | 201 | 0   | 0    |
| sloc  | 36  | 0   | 0    |
| cloc  | 139 | 0   | 0    |
| Total | 376 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 61  | 0   | 0    |
| sloc  | 25  | 0   | 0    |
| cloc  | 29  | 0   | 0    |
| Total | 115 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 151 | 0   | 0    |
| sloc  | 43  | 0   | 0    |
| cloc  | 88  | 0   | 0    |
| Total | 282 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 15  | 0   | 0    |
| sloc  | 8   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 24  | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 716  | 0   | 0    |
| sloc  | 336  | 0   | 0    |
| cloc  | 240  | 0   | 0    |
| Total | 1292 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 11  | 0   | 0    |
| sloc  | 6   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 18  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 149 | 0   | 0    |
| sloc  | 64  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 272 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 85  | 0   | 0    |
| sloc  | 14  | 0   | 0    |
| cloc  | 59  | 0   | 0    |
| Total | 158 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 10  | 0   | 0    |
| sloc  | 6   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 17  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 162 | 0   | 0    |
| sloc  | 71  | 0   | 0    |
| cloc  | 60  | 0   | 0    |
| Total | 293 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 10  | 0   | 0    |
| sloc  | 7   | 0   | 0    |
| cloc  | 1   | 0   | 0    |
| Total | 18  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 98  | 0   | 0    |
| sloc  | 80  | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 180 | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 22  | 0   | 0    |
| sloc  | 10  | 0   | 0    |
| cloc  | 10  | 0   | 0    |
| Total | 42  | 0   | 0    |
+-------+-----+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 156 | 0   | 0    |
| sloc  | 123 | 0   | 0    |
| cloc  | 2   | 0   | 0    |
| Total | 281 | 0   | 0    |
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
| loc   | 772  | 0   | 0    |
| sloc  | 378  | 0   | 0    |
| cloc  | 241  | 0   | 0    |
| Total | 1391 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 999  | 0   | 0    |
| sloc  | 583  | 0   | 0    |
| cloc  | 245  | 0   | 0    |
| Total | 1827 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 109 | 0   | 0    |
| sloc  | 87  | 0   | 0    |
| cloc  | 3   | 0   | 0    |
| Total | 199 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 746  | 0   | 0    |
| sloc  | 357  | 0   | 0    |
| cloc  | 241  | 0   | 0    |
| Total | 1344 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 748  | 0   | 0    |
| sloc  | 359  | 0   | 0    |
| cloc  | 242  | 0   | 0    |
| Total | 1349 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 903  | 0   | 0    |
| sloc  | 507  | 0   | 0    |
| cloc  | 242  | 0   | 0    |
| Total | 1652 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 956  | 0   | 0    |
| sloc  | 544  | 0   | 0    |
| cloc  | 248  | 0   | 0    |
| Total | 1748 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 971  | 0   | 0    |
| sloc  | 561  | 0   | 0    |
| cloc  | 242  | 0   | 0    |
| Total | 1774 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 166 | 0   | 0    |
| sloc  | 79  | 0   | 0    |
| cloc  | 61  | 0   | 0    |
| Total | 306 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1214 | 0   | 0    |
| sloc  | 533  | 0   | 0    |
| cloc  | 482  | 0   | 0    |
| Total | 2229 | 0   | 0    |
+-------+------+-----+------+

+-------+-----+-----+------+
|       | src | dep | test |
+-------+-----+-----+------+
| loc   | 510 | 0   | 0    |
| sloc  | 152 | 0   | 0    |
| cloc  | 299 | 0   | 0    |
| Total | 961 | 0   | 0    |
+-------+-----+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1083 | 0   | 0    |
| sloc  | 655  | 0   | 0    |
| cloc  | 255  | 0   | 0    |
| Total | 1993 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 904  | 0   | 0    |
| sloc  | 487  | 0   | 0    |
| cloc  | 256  | 0   | 0    |
| Total | 1647 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 1517 | 0   | 0    |
| sloc  | 797  | 0   | 0    |
| cloc  | 513  | 0   | 0    |
| Total | 2827 | 0   | 0    |
+-------+------+-----+------+

+-------+------+-----+------+
|       | src  | dep | test |
+-------+------+-----+------+
| loc   | 2232 | 0   | 0    |
| sloc  | 1043 | 0   | 0    |
| cloc  | 874  | 0   | 0    |
| Total | 4149 | 0   | 0    |
+-------+------+-----+------+
```

## Function Complexity & Standards Checks
### Contract: MochiEngine
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mochi` | **1** | Low (Simple) |
| `vMochi` | **1** | Low (Simple) |
| `usdm` | **1** | Low (Simple) |
| `cssr` | **1** | Low (Simple) |
| `governance` | **1** | Low (Simple) |
| `treasury` | **1** | Low (Simple) |
| `operationWallet` | **1** | Low (Simple) |
| `mochiProfile` | **1** | Low (Simple) |
| `discountProfile` | **1** | Low (Simple) |
| `feePool` | **1** | Low (Simple) |
| `referralFeePool` | **1** | Low (Simple) |
| `liquidator` | **1** | Low (Simple) |
| `minter` | **1** | Low (Simple) |
| `nft` | **1** | Low (Simple) |
| `vaultFactory` | **1** | Low (Simple) |
| `changeMochi` | **1** | Low (Simple) |
| `changeVMochi` | **1** | Low (Simple) |
| `changeUSDM` | **1** | Low (Simple) |
| `changeMinter` | **1** | Low (Simple) |
| `changeGovernance` | **1** | Low (Simple) |
| `changeTreasury` | **1** | Low (Simple) |
| `changeOperationWallet` | **1** | Low (Simple) |
| `changeCSSR` | **1** | Low (Simple) |
| `changeProfile` | **1** | Low (Simple) |
| `changeDiscountProfile` | **1** | Low (Simple) |
| `changeLiquidator` | **1** | Low (Simple) |
| `changeFeePool` | **1** | Low (Simple) |
| `changeReferralFeePool` | **1** | Low (Simple) |
| `changeNFT` | **1** | Low (Simple) |

---

### Contract: USDM
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `maxFlashLoan` | **1** | Low (Simple) |
| `flashFee` | **1** | Low (Simple) |
| `flashLoan` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
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
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `maxFlashLoan` | **1** | Low (Simple) |
| `flashFee` | **1** | Low (Simple) |
| `flashLoan` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: MochiVaultFactory
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `updateTemplate` | **1** | Low (Simple) |
| `deployVault` | **1** | Low (Simple) |
| `getVault` | **1** | Low (Simple) |
| `updateTemplate` | **1** | Low (Simple) |
| `deployVault` | **1** | Low (Simple) |
| `getVault` | **1** | Low (Simple) |

---

### Contract: Beacon
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `fallback` | **2** | Low (Simple) |

---

### Contract: BeaconProxyDeployer
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `deploy` | **2** | Low (Simple) |
| `calculateAddress` | **1** | Low (Simple) |

---

### Contract: Create2BeaconMaker
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |

---

### Contract: Float
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `multiply` | **1** | Low (Simple) |
| `inverse` | **1** | Low (Simple) |
| `divide` | **1** | Low (Simple) |
| `add` | **2** | Low (Simple) |
| `sub` | **2** | Low (Simple) |
| `mul` | **2** | Low (Simple) |
| `gt` | **1** | Low (Simple) |
| `lt` | **1** | Low (Simple) |
| `gte` | **1** | Low (Simple) |
| `lte` | **1** | Low (Simple) |
| `equals` | **1** | Low (Simple) |

---

### Contract: MinterV0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mint` | **1** | Low (Simple) |
| `hasPermission` | **1** | Low (Simple) |
| `isVault` | **1** | Low (Simple) |
| `addMinter` | **1** | Low (Simple) |
| `removeMinter` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `hasPermission` | **1** | Low (Simple) |
| `isVault` | **1** | Low (Simple) |

---

### Contract: MochiProfileV0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `assetClass` | **1** | Low (Simple) |
| `liquidityRequirement` | **1** | Low (Simple) |
| `minimumDebt` | **1** | Low (Simple) |
| `changeAssetClass` | **1** | Low (Simple) |
| `changeLiquidityRequirement` | **1** | Low (Simple) |
| `changeMinimumDebt` | **1** | Low (Simple) |
| `calculateFeeIndex` | **1** | Low (Simple) |
| `creditCap` | **1** | Low (Simple) |
| `delay` | **1** | Low (Simple) |
| `liquidationFactor` | **1** | Low (Simple) |
| `maxCollateralFactor` | **1** | Low (Simple) |
| `stabilityFee` | **1** | Low (Simple) |
| `liquidationFee` | **1** | Low (Simple) |
| `keeperFee` | **1** | Low (Simple) |
| `utilizationRatio` | **1** | Low (Simple) |
| `assetClass` | **1** | Low (Simple) |
| `changeLiquidityRequirement` | **1** | Low (Simple) |
| `registerAsset` | **1** | Low (Simple) |
| `registerAssetByGov` | **2** | Low (Simple) |
| `_register` | **1** | Low (Simple) |
| `changeMinimumDebt` | **1** | Low (Simple) |
| `changeAssetClass` | **2** | Low (Simple) |
| `changeCreditCap` | **2** | Low (Simple) |
| `setDelay` | **1** | Low (Simple) |
| `liquidationFactor` | **7** | Moderate (Complex) |
| `riskFactor` | **7** | Moderate (Complex) |
| `maxCollateralFactor` | **7** | Moderate (Complex) |
| `baseFee` | **1** | Low (Simple) |
| `liquidationFee` | **7** | Moderate (Complex) |
| `keeperFee` | **7** | Moderate (Complex) |
| `maxFee` | **7** | Moderate (Complex) |
| `stabilityFee` | **2** | Low (Simple) |
| `calculateFeeIndex` | **1** | Low (Simple) |
| `utilizationRatio` | **1** | Low (Simple) |

---

### Contract: NoDiscountProfile
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `discount` | **1** | Low (Simple) |
| `discount` | **1** | Low (Simple) |

---

### Contract: NoMochiReferralFeePool
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `addReward` | **1** | Low (Simple) |
| `addReward` | **1** | Low (Simple) |
| `claimReward` | **1** | Low (Simple) |

---

### Contract: NoMochiFeePool
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `updateReserve` | **1** | Low (Simple) |
| `updateReserve` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `changeWithdrawer` | **1** | Low (Simple) |

---

### Contract: ReferralFeePoolV0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `addReward` | **1** | Low (Simple) |
| `addReward` | **1** | Low (Simple) |
| `claimRewardAsMochi` | **1** | Low (Simple) |

---

### Contract: FeePoolV0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `updateReserve` | **1** | Low (Simple) |
| `updateReserve` | **1** | Low (Simple) |
| `changecrvVoterRewardPool` | **1** | Low (Simple) |
| `changeTreasuryRatio` | **1** | Low (Simple) |
| `changevMochiRatio` | **1** | Low (Simple) |
| `distributeMochi` | **1** | Low (Simple) |
| `_buyMochi` | **1** | Low (Simple) |
| `_shareMochi` | **1** | Low (Simple) |
| `sendToTreasury` | **1** | Low (Simple) |

---

### Contract: MochiTreasuryV0
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `receive` | **1** | Low (Simple) |
| `withdrawCRV` | **1** | Low (Simple) |
| `withdrawLock` | **1** | Low (Simple) |
| `veCRVInitialize` | **1** | Low (Simple) |
| `toggleLocking` | **1** | Low (Simple) |
| `updateFee` | **1** | Low (Simple) |
| `claimOperationCost` | **1** | Low (Simple) |
| `veCRVlock` | **1** | Low (Simple) |
| `_buyCRV` | **1** | Low (Simple) |
| `_lockCRV` | **1** | Low (Simple) |

---

### Contract: VestedRewardPool
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `vest` | **1** | Low (Simple) |
| `claim` | **1** | Low (Simple) |
| `lock` | **2** | Low (Simple) |
| `forceClaim` | **1** | Low (Simple) |

---

### Contract: Mochi
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

---

### Contract: DutchAuctionLiquidator
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `triggerLiquidation` | **1** | Low (Simple) |
| `auctionId` | **1** | Low (Simple) |
| `price` | **1** | Low (Simple) |
| `currentLiquidationFee` | **2** | Low (Simple) |
| `triggerLiquidation` | **1** | Low (Simple) |
| `settleLiquidation` | **1** | Low (Simple) |
| `buy` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: MochiVault
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `maxFlashLoan` | **1** | Low (Simple) |
| `flashFee` | **1** | Low (Simple) |
| `flashLoan` | **1** | Low (Simple) |
| `liveDebtIndex` | **1** | Low (Simple) |
| `details` | **1** | Low (Simple) |
| `status` | **1** | Low (Simple) |
| `asset` | **1** | Low (Simple) |
| `deposits` | **1** | Low (Simple) |
| `debts` | **1** | Low (Simple) |
| `claimable` | **1** | Low (Simple) |
| `currentDebt` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `borrow` | **1** | Low (Simple) |
| `repay` | **1** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `_disableInitializers` | **2** | Low (Simple) |
| `_getInitializedVersion` | **1** | Low (Simple) |
| `_isInitializing` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `liveDebtIndex` | **1** | Low (Simple) |
| `status` | **1** | Low (Simple) |
| `currentDebt` | **1** | Low (Simple) |
| `accrueDebt` | **3** | Low (Simple) |
| `increase` | **4** | Low (Simple) |
| `decrease` | **3** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `deposit` | **2** | Low (Simple) |
| `withdraw` | **2** | Low (Simple) |
| `borrow` | **3** | Low (Simple) |
| `repay` | **4** | Low (Simple) |
| `liquidate` | **1** | Low (Simple) |
| `_liquidatable` | **1** | Low (Simple) |
| `liquidatable` | **1** | Low (Simple) |
| `claim` | **1** | Low (Simple) |
| `mintFeeToPool` | **2** | Low (Simple) |
| `maxFlashLoan` | **1** | Low (Simple) |
| `flashFee` | **1** | Low (Simple) |
| `flashLoan` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: CheapERC20
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `cheapTransfer` | **1** | Low (Simple) |
| `cheapTransferFrom` | **1** | Low (Simple) |

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
| `functionDelegateCall` | **1** | Low (Simple) |
| `functionDelegateCall` | **1** | Low (Simple) |
| `verifyCallResultFromTarget` | **3** | Low (Simple) |
| `verifyCallResult` | **2** | Low (Simple) |
| `_revert` | **2** | Low (Simple) |

---

### Contract: MochiNFT
**Auto-Detected Standards/Inherited Protocols:** ERC721
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `supportsInterface` | **1** | Low (Simple) |
| `tokenOfOwnerByIndex` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `tokenByIndex` | **1** | Low (Simple) |
| `_beforeTokenTransfer` | **6** | Moderate (Complex) |
| `_addTokenToOwnerEnumeration` | **1** | Low (Simple) |
| `_addTokenToAllTokensEnumeration` | **1** | Low (Simple) |
| `_removeTokenFromOwnerEnumeration` | **2** | Low (Simple) |
| `_removeTokenFromAllTokensEnumeration` | **1** | Low (Simple) |
| `totalSupply` | **1** | Low (Simple) |
| `tokenOfOwnerByIndex` | **1** | Low (Simple) |
| `tokenByIndex` | **1** | Low (Simple) |
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
| `supportsInterface` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `_contextSuffixLength` | **1** | Low (Simple) |
| `asset` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `setDescriptor` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `asset` | **1** | Low (Simple) |
| `tokenURI` | **2** | Low (Simple) |

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
