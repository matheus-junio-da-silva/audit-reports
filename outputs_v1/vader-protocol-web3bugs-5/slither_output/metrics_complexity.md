# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+----------+-----------------+-----------+------------+
| Contract | State variables | Constants | Immutables |
+----------+-----------------+-----------+------------+
| Attack   | 3               | 0         | 0          |
| DAO      | 14              | 0         | 0          |
| Factory  | 7               | 0         | 0          |
| Pools    | 14              | 0         | 0          |
| Router   | 24              | 0         | 0          |
| Synth    | 8               | 0         | 0          |
| Token1   | 6               | 0         | 0          |
| Token2   | 6               | 0         | 0          |
| USDV     | 13              | 0         | 0          |
| Utils    | 9               | 0         | 0          |
| Vader    | 23              | 0         | 0          |
| Vault    | 14              | 0         | 0          |
| Vether   | 8               | 0         | 0          |
| console  | 0               | 1         | 0          |
| TOTAL    | 149             | 1         | 0          |
+----------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+----------+--------+----------+----------+---------+
| Contract | Public | External | Internal | Private |
+----------+--------+----------+----------+---------+
| Attack   | 2      | 0        | 0        | 0       |
| DAO      | 10     | 0        | 6        | 0       |
| Factory  | 1      | 2        | 1        | 0       |
| Pools    | 9      | 14       | 3        | 0       |
| Router   | 25     | 15       | 14       | 0       |
| Synth    | 8      | 13       | 4        | 0       |
| Token1   | 8      | 12       | 5        | 0       |
| Token2   | 8      | 12       | 5        | 0       |
| USDV     | 8      | 22       | 6        | 1       |
| Utils    | 19     | 12       | 1        | 0       |
| Vader    | 5      | 28       | 4        | 1       |
| Vault    | 9      | 7        | 4        | 0       |
| Vether   | 8      | 9        | 2        | 2       |
| console  | 0      | 0        | 383      | 0       |
| TOTAL    | 120    | 146      | 438      | 4       |
+----------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+----------+----------+------+------+
| Contract | Mutating | View | Pure |
+----------+----------+------+------+
| Attack   | 2        | 0    | 0    |
| DAO      | 12       | 3    | 1    |
| Factory  | 4        | 0    | 0    |
| Pools    | 15       | 11   | 0    |
| Router   | 33       | 21   | 0    |
| Synth    | 17       | 8    | 0    |
| Token1   | 17       | 8    | 0    |
| Token2   | 17       | 8    | 0    |
| USDV     | 25       | 12   | 0    |
| Utils    | 3        | 18   | 11   |
| Vader    | 28       | 10   | 0    |
| Vault    | 11       | 9    | 0    |
| Vether   | 12       | 9    | 0    |
| console  | 1        | 1    | 381  |
| TOTAL    | 197      | 118  | 393  |
+----------+----------+------+------+


CK complexity metrics (External mutating functions):
+----------+-------------------+----------------------+--------------+
| Contract | External mutating | No auth or onlyOwner | No modifiers |
+----------+-------------------+----------------------+--------------+
| Attack   | 2                 | 2                    | 2            |
| DAO      | 6                 | 6                    | 6            |
| Factory  | 3                 | 3                    | 1            |
| Pools    | 15                | 15                   | 15           |
| Router   | 23                | 23                   | 21           |
| Synth    | 19                | 19                   | 18           |
| Token1   | 18                | 18                   | 18           |
| Token2   | 18                | 18                   | 18           |
| USDV     | 24                | 24                   | 23           |
| Utils    | 13                | 13                   | 13           |
| Vader    | 30                | 30                   | 22           |
| Vault    | 10                | 10                   | 8            |
| Vether   | 15                | 15                   | 15           |
| console  | 0                 | 0                    | 0            |
| TOTAL    | 196               | 196                  | 180          |
+----------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+----------+-----------+-----+-----+-----+-----+
| Contract | Ext calls | RFC | NOC | DIT | CBO |
+----------+-----------+-----+-----+-----+-----+
| Attack   | 5         | 6   | 0   | 0   | 2   |
| DAO      | 10        | 20  | 0   | 0   | 3   |
| Factory  | 1         | 4   | 0   | 0   | 1   |
| Pools    | 27        | 47  | 0   | 0   | 4   |
| Router   | 87        | 105 | 0   | 0   | 5   |
| Synth    | 0         | 21  | 0   | 1   | 2   |
| Token1   | 0         | 20  | 0   | 1   | 0   |
| Token2   | 0         | 20  | 0   | 1   | 0   |
| USDV     | 15        | 42  | 0   | 1   | 3   |
| Utils    | 46        | 70  | 0   | 0   | 5   |
| Vader    | 8         | 41  | 0   | 1   | 4   |
| Vault    | 34        | 43  | 0   | 0   | 7   |
| Vether   | 0         | 17  | 0   | 1   | 0   |
| console  | 0         | 0   | 0   | 0   | 0   |
+----------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics (Cognitive Volume)
```
Halstead complexity metrics (Core):
+----------+-----------------+------------------+----------------+-----------------+
| Contract | Total Operators | Unique Operators | Total Operands | Unique Operands |
+----------+-----------------+------------------+----------------+-----------------+
| Attack   | 16              | 6                | 21             | 9               |
| DAO      | 188             | 27               | 323            | 115             |
| Factory  | 30              | 15               | 48             | 23              |
| Pools    | 317             | 22               | 579            | 177             |
| Router   | 611             | 33               | 939            | 309             |
| Synth    | 76              | 16               | 141            | 61              |
| Token1   | 69              | 13               | 141            | 58              |
| Token2   | 69              | 13               | 141            | 58              |
| USDV     | 178             | 23               | 251            | 89              |
| Utils    | 406             | 24               | 502            | 190             |
| Vader    | 176             | 25               | 283            | 96              |
| Vault    | 212             | 20               | 295            | 106             |
| Vether   | 85              | 19               | 171            | 71              |
| console  | 769             | 11               | 2064           | 1676            |
+----------+-----------------+------------------+----------------+-----------------+


Halstead complexity metrics (Extended 1/2):
+----------+------------+----------------+------------------+--------+
| Contract | Vocabulary | Program Length | Estimated Length | Volume |
+----------+------------+----------------+------------------+--------+
| Attack   | 15         | 37             | 44               | 145    |
| DAO      | 142        | 511            | 916              | 3654   |
| Factory  | 38         | 78             | 163              | 409    |
| Pools    | 199        | 896            | 1420             | 6842   |
| Router   | 342        | 1550           | 2722             | 13048  |
| Synth    | 77         | 217            | 426              | 1360   |
| Token1   | 71         | 210            | 388              | 1291   |
| Token2   | 71         | 210            | 388              | 1291   |
| USDV     | 112        | 429            | 680              | 2920   |
| Utils    | 214        | 908            | 1548             | 7029   |
| Vader    | 121        | 459            | 748              | 3176   |
| Vault    | 126        | 507            | 800              | 3537   |
| Vether   | 90         | 256            | 517              | 1662   |
| console  | 1687       | 2833           | 17989            | 30370  |
+----------+------------+----------------+------------------+--------+


Halstead complexity metrics (Extended 2/2):
+----------+------------+--------+-------+----------------+
| Contract | Difficulty | Effort | Time  | Estimated Bugs |
+----------+------------+--------+-------+----------------+
| Attack   | 7          | 1012   | 56    | 0.034          |
| DAO      | 38         | 138532 | 7696  | 0.892          |
| Factory  | 16         | 6407   | 356   | 0.115          |
| Pools    | 36         | 246211 | 13678 | 1.309          |
| Router   | 50         | 654220 | 36346 | 2.512          |
| Synth    | 18         | 25147  | 1397  | 0.286          |
| Token1   | 16         | 20407  | 1134  | 0.249          |
| Token2   | 16         | 20407  | 1134  | 0.249          |
| USDV     | 32         | 94715  | 5262  | 0.693          |
| Utils    | 32         | 222864 | 12381 | 1.225          |
| Vader    | 37         | 117023 | 6501  | 0.797          |
| Vault    | 28         | 98449  | 5469  | 0.711          |
| Vether   | 23         | 38025  | 2113  | 0.377          |
| console  | 7          | 205707 | 11428 | 1.162          |
+----------+------------+--------+-------+----------------+
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
+----------+------------+--------------+-------------+-----------------------------+
| Contract | Dependents | Dependencies | Instability | Distance from main sequence |
+----------+------------+--------------+-------------+-----------------------------+
| Attack   | 0          | 2            | 1.00        | 1.00                        |
| DAO      | 0          | 3            | 1.00        | 1.00                        |
| Factory  | 0          | 1            | 1.00        | 1.00                        |
| Pools    | 0          | 4            | 1.00        | 1.00                        |
| Router   | 0          | 5            | 1.00        | 1.00                        |
| Synth    | 1          | 1            | 0.50        | 0.50                        |
| Token1   | 0          | 0            | 0.00        | 0.00                        |
| Token2   | 0          | 0            | 0.00        | 0.00                        |
| USDV     | 0          | 3            | 1.00        | 1.00                        |
| Utils    | 0          | 5            | 1.00        | 1.00                        |
| Vader    | 0          | 4            | 1.00        | 1.00                        |
| Vault    | 0          | 7            | 1.00        | 1.00                        |
| Vether   | 0          | 0            | 0.00        | 0.00                        |
| console  | 0          | 0            | 0.00        | 0.00                        |
+----------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+------+------+------+
|       | src  | dep  | test |
+-------+------+------+------+
| loc   | 2627 | 1552 | 0    |
| sloc  | 2079 | 1167 | 0    |
| cloc  | 263  | 2    | 0    |
| Total | 4969 | 2721 | 0    |
+-------+------+------+------+
```

## Function Complexity & Standards Checks
### Contract: Attack
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `attackUSDV` | **1** | Low (Simple) |

---

### Contract: DAO
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `newGrantProposal` | **1** | Low (Simple) |
| `newAddressProposal` | **1** | Low (Simple) |
| `voteProposal` | **4** | Low (Simple) |
| `_finalise` | **1** | Low (Simple) |
| `cancelProposal` | **1** | Low (Simple) |
| `finaliseProposal` | **5** | Moderate (Complex) |
| `completeProposal` | **1** | Low (Simple) |
| `grantFunds` | **1** | Low (Simple) |
| `moveUtils` | **1** | Low (Simple) |
| `moveRewardAddress` | **1** | Low (Simple) |
| `countMemberVotes` | **1** | Low (Simple) |
| `hasMajority` | **2** | Low (Simple) |
| `hasQuorum` | **2** | Low (Simple) |
| `hasMinority` | **2** | Low (Simple) |
| `isEqual` | **2** | Low (Simple) |

---

### Contract: Factory
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `deploySynth` | **1** | Low (Simple) |
| `mintSynth` | **1** | Low (Simple) |
| `_addSynth` | **1** | Low (Simple) |

---

### Contract: Pools
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `addLiquidity` | **5** | Moderate (Complex) |
| `removeLiquidity` | **1** | Low (Simple) |
| `removeLiquidityDirectly` | **1** | Low (Simple) |
| `_removeLiquidity` | **1** | Low (Simple) |
| `swap` | **2** | Low (Simple) |
| `sync` | **2** | Low (Simple) |
| `deploySynth` | **1** | Low (Simple) |
| `mintSynth` | **1** | Low (Simple) |
| `burnSynth` | **1** | Low (Simple) |
| `syncSynth` | **1** | Low (Simple) |
| `lockUnits` | **1** | Low (Simple) |
| `unlockUnits` | **1** | Low (Simple) |
| `getAddedAmount` | **3** | Low (Simple) |
| `transferOut` | **4** | Low (Simple) |
| `isMember` | **1** | Low (Simple) |
| `isAsset` | **1** | Low (Simple) |
| `isAnchor` | **1** | Low (Simple) |
| `getPoolAmounts` | **1** | Low (Simple) |
| `getBaseAmount` | **1** | Low (Simple) |
| `getTokenAmount` | **1** | Low (Simple) |
| `getUnits` | **1** | Low (Simple) |
| `getMemberUnits` | **1** | Low (Simple) |
| `getSynth` | **1** | Low (Simple) |
| `isSynth` | **1** | Low (Simple) |
| `UTILS` | **1** | Low (Simple) |

---

### Contract: Router
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `setAnchorParams` | **1** | Low (Simple) |
| `addLiquidity` | **1** | Low (Simple) |
| `removeLiquidity` | **1** | Low (Simple) |
| `swap` | **1** | Low (Simple) |
| `swapWithLimit` | **1** | Low (Simple) |
| `swapWithSynths` | **1** | Low (Simple) |
| `swapWithSynthsWithLimit` | **10** | ⚠️ High (Refactor recommended) |
| `_handlePoolReward` | **2** | Low (Simple) |
| `addDepositData` | **1** | Low (Simple) |
| `removeDepositData` | **1** | Low (Simple) |
| `getILProtection` | **4** | Low (Simple) |
| `curatePool` | **3** | Low (Simple) |
| `replacePool` | **2** | Low (Simple) |
| `listAnchor` | **1** | Low (Simple) |
| `replaceAnchor` | **3** | Low (Simple) |
| `updateAnchorPrice` | **3** | Low (Simple) |
| `_handleAnchorPriceUpdate` | **2** | Low (Simple) |
| `getAnchorPrice` | **2** | Low (Simple) |
| `getVADERAmount` | **1** | Low (Simple) |
| `getUSDVAmount` | **1** | Low (Simple) |
| `borrow` | **1** | Low (Simple) |
| `borrowForMember` | **3** | Low (Simple) |
| `repay` | **1** | Low (Simple) |
| `repayForMember` | **3** | Low (Simple) |
| `payInterest` | **4** | Low (Simple) |
| `checkLiquidate` | **1** | Low (Simple) |
| `_handleTransferIn` | **3** | Low (Simple) |
| `_handleTransferOut` | **3** | Low (Simple) |
| `_getFunds` | **2** | Low (Simple) |
| `_sendFunds` | **1** | Low (Simple) |
| `_addDebtToMember` | **1** | Low (Simple) |
| `_removeDebtFromMember` | **1** | Low (Simple) |
| `_removeCollateral` | **1** | Low (Simple) |
| `isBase` | **2** | Low (Simple) |
| `reserveVADER` | **1** | Low (Simple) |
| `reserveUSDV` | **1** | Low (Simple) |
| `moveTokenToPools` | **3** | Low (Simple) |
| `UTILS` | **1** | Low (Simple) |
| `DAO` | **1** | Low (Simple) |
| `emitting` | **1** | Low (Simple) |
| `isCurated` | **2** | Low (Simple) |
| `isPool` | **2** | Low (Simple) |
| `getMemberBaseDeposit` | **1** | Low (Simple) |
| `getMemberTokenDeposit` | **1** | Low (Simple) |
| `getMemberLastDeposit` | **1** | Low (Simple) |
| `getMemberCollateral` | **1** | Low (Simple) |
| `getMemberDebt` | **1** | Low (Simple) |
| `getSystemCollateral` | **1** | Low (Simple) |
| `getSystemDebt` | **1** | Low (Simple) |
| `getSystemInterestPaid` | **1** | Low (Simple) |
| `getNextEraTime` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Synth
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
| `transferTo` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `transferTo` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Token1
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
| `transferTo` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `transferTo` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Token2
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
| `transferTo` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `transferTo` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: USDV
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
| `transferTo` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `isMature` | **2** | Low (Simple) |
| `init` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `transferTo` | **1** | Low (Simple) |
| `_transfer` | **2** | Low (Simple) |
| `_mint` | **2** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `_burn` | **2** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `_checkIncentives` | **4** | Low (Simple) |
| `convert` | **1** | Low (Simple) |
| `convertForMember` | **1** | Low (Simple) |
| `_convert` | **2** | Low (Simple) |
| `redeem` | **1** | Low (Simple) |
| `redeemForMember` | **1** | Low (Simple) |
| `getFunds` | **3** | Low (Simple) |
| `DAO` | **1** | Low (Simple) |
| `emitting` | **1** | Low (Simple) |
| `minting` | **1** | Low (Simple) |

---

### Contract: Utils
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `getFeeOnTransfer` | **1** | Low (Simple) |
| `assetChecks` | **5** | Moderate (Complex) |
| `isBase` | **2** | Low (Simple) |
| `isPool` | **2** | Low (Simple) |
| `calcValueInBase` | **2** | Low (Simple) |
| `calcValueInToken` | **2** | Low (Simple) |
| `calcValueOfTokenInToken` | **1** | Low (Simple) |
| `calcSwapValueInBase` | **1** | Low (Simple) |
| `calcSwapValueInToken` | **1** | Low (Simple) |
| `requirePriceBounds` | **2** | Low (Simple) |
| `getRewardShare` | **4** | Low (Simple) |
| `getReducedShare` | **1** | Low (Simple) |
| `getProtection` | **3** | Low (Simple) |
| `getCoverage` | **1** | Low (Simple) |
| `getCollateralValueInBase` | **4** | Low (Simple) |
| `getDebtValueInCollateral` | **1** | Low (Simple) |
| `getInterestOwed` | **3** | Low (Simple) |
| `getInterestPayment` | **1** | Low (Simple) |
| `getDebtLoading` | **1** | Low (Simple) |
| `calcPart` | **1** | Low (Simple) |
| `calcShare` | **3** | Low (Simple) |
| `calcSwapOutput` | **1** | Low (Simple) |
| `calcSwapFee` | **1** | Low (Simple) |
| `calcSwapSlip` | **1** | Low (Simple) |
| `calcLiquidityUnits` | **2** | Low (Simple) |
| `getSlipAdustment` | **2** | Low (Simple) |
| `calcSynthUnits` | **1** | Low (Simple) |
| `calcAsymmetricShare` | **1** | Low (Simple) |
| `calcCoverage` | **3** | Low (Simple) |
| `sortArray` | **4** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: Vader
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
| `transferTo` | **1** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `isMature` | **1** | Low (Simple) |
| `init` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `transferTo` | **1** | Low (Simple) |
| `_transfer` | **2** | Low (Simple) |
| `_mint` | **2** | Low (Simple) |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `flipEmissions` | **2** | Low (Simple) |
| `flipMinting` | **2** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `setRewardAddress` | **1** | Low (Simple) |
| `changeUTILS` | **1** | Low (Simple) |
| `changeDAO` | **1** | Low (Simple) |
| `purgeDAO` | **1** | Low (Simple) |
| `_checkEmission` | **3** | Low (Simple) |
| `getDailyEmission` | **2** | Low (Simple) |
| `upgrade` | **1** | Low (Simple) |
| `redeem` | **1** | Low (Simple) |
| `redeemToMember` | **2** | Low (Simple) |

---

### Contract: Vault
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `init` | **1** | Low (Simple) |
| `setParams` | **1** | Low (Simple) |
| `grant` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `depositForMember` | **1** | Low (Simple) |
| `_deposit` | **2** | Low (Simple) |
| `harvest` | **2** | Low (Simple) |
| `calcCurrentReward` | **3** | Low (Simple) |
| `calcReward` | **2** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `_processWithdraw` | **1** | Low (Simple) |
| `getFunds` | **2** | Low (Simple) |
| `sendFunds` | **1** | Low (Simple) |
| `reserveUSDV` | **1** | Low (Simple) |
| `reserveVADER` | **1** | Low (Simple) |
| `getMemberDeposit` | **1** | Low (Simple) |
| `getMemberWeight` | **1** | Low (Simple) |
| `getMemberLastTime` | **1** | Low (Simple) |
| `DAO` | **1** | Low (Simple) |
| `UTILS` | **1** | Low (Simple) |

---

### Contract: Vether
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
| `balanceOf` | **1** | Low (Simple) |
| `allowance` | **1** | Low (Simple) |
| `transfer` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `increaseAllowance` | **1** | Low (Simple) |
| `decreaseAllowance` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `_transfer` | **2** | Low (Simple) |
| `_getFee` | **2** | Low (Simple) |
| `addExcluded` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: console
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `_sendLogPayloadImplementation` | **1** | Low (Simple) |
| `_castToPure` | **1** | Low (Simple) |
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
