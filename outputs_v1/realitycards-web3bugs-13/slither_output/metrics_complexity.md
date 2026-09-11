# 📐 OO Software Metrics & Structural Complexity

## Chidamber & Kemerer Metrics (OO Integrity)
```
CK complexity metrics (Variables):
+--------------------+-----------------+-----------+------------+
| Contract           | State variables | Constants | Immutables |
+--------------------+-----------------+-----------+------------+
| Clones             | 0               | 0         | 0          |
| Address            | 0               | 0         | 0          |
| Strings            | 0               | 1         | 0          |
| SafeCast           | 0               | 0         | 0          |
| Migrations         | 2               | 0         | 0          |
| RCFactory          | 28              | 0         | 0          |
| RCMarket           | 48              | 3         | 0          |
| RCOrderbook        | 15              | 0         | 0          |
| RCTreasury         | 20              | 0         | 0          |
| BridgeMockup       | 2               | 0         | 0          |
| DaiMockup          | 0               | 0         | 0          |
| RealitioMockup     | 3               | 0         | 0          |
| SelfDestructMockup | 0               | 0         | 0          |
| tokenMockup        | 0               | 0         | 0          |
| RCNftHubL1         | 0               | 2         | 0          |
| RCNftHubL2         | 4               | 2         | 0          |
| console            | 0               | 1         | 0          |
| TOTAL              | 122             | 9         | 0          |
+--------------------+-----------------+-----------+------------+


CK complexity metrics (Function visibility):
+--------------------+--------+----------+----------+---------+
| Contract           | Public | External | Internal | Private |
+--------------------+--------+----------+----------+---------+
| Clones             | 0      | 0        | 4        | 0       |
| Address            | 0      | 0        | 10       | 1       |
| Strings            | 0      | 0        | 4        | 0       |
| SafeCast           | 0      | 0        | 12       | 0       |
| Migrations         | 2      | 0        | 0        | 0       |
| RCFactory          | 12     | 37       | 5        | 0       |
| RCMarket           | 8      | 30       | 18       | 0       |
| RCOrderbook        | 6      | 30       | 11       | 0       |
| RCTreasury         | 12     | 66       | 8        | 0       |
| BridgeMockup       | 0      | 4        | 0        | 0       |
| DaiMockup          | 1      | 1        | 0        | 0       |
| RealitioMockup     | 1      | 4        | 1        | 0       |
| SelfDestructMockup | 1      | 1        | 0        | 0       |
| tokenMockup        | 13     | 9        | 7        | 0       |
| RCNftHubL1         | 26     | 25       | 22       | 3       |
| RCNftHubL2         | 31     | 35       | 21       | 3       |
| console            | 0      | 0        | 383      | 0       |
| TOTAL              | 113    | 242      | 506      | 7       |
+--------------------+--------+----------+----------+---------+


CK complexity metrics (State mutability):
+--------------------+----------+------+------+
| Contract           | Mutating | View | Pure |
+--------------------+----------+------+------+
| Clones             | 2        | 1    | 1    |
| Address            | 7        | 3    | 1    |
| Strings            | 1        | 0    | 3    |
| SafeCast           | 0        | 0    | 12   |
| Migrations         | 2        | 0    | 0    |
| RCFactory          | 40       | 14   | 0    |
| RCMarket           | 44       | 12   | 0    |
| RCOrderbook        | 35       | 12   | 0    |
| RCTreasury         | 58       | 27   | 1    |
| BridgeMockup       | 3        | 1    | 0    |
| DaiMockup          | 0        | 0    | 2    |
| RealitioMockup     | 3        | 3    | 0    |
| SelfDestructMockup | 2        | 0    | 0    |
| tokenMockup        | 15       | 14   | 0    |
| RCNftHubL1         | 41       | 35   | 0    |
| RCNftHubL2         | 51       | 39   | 0    |
| console            | 1        | 1    | 381  |
| TOTAL              | 305      | 162  | 401  |
+--------------------+----------+------+------+


CK complexity metrics (External mutating functions):
+--------------------+-------------------+----------------------+--------------+
| Contract           | External mutating | No auth or onlyOwner | No modifiers |
+--------------------+-------------------+----------------------+--------------+
| Clones             | 0                 | 0                    | 0            |
| Address            | 0                 | 0                    | 0            |
| Strings            | 0                 | 0                    | 0            |
| SafeCast           | 0                 | 0                    | 0            |
| Migrations         | 2                 | 2                    | 0            |
| RCFactory          | 46                | 46                   | 23           |
| RCMarket           | 34                | 34                   | 31           |
| RCOrderbook        | 33                | 33                   | 24           |
| RCTreasury         | 76                | 76                   | 58           |
| BridgeMockup       | 4                 | 4                    | 4            |
| DaiMockup          | 1                 | 1                    | 1            |
| RealitioMockup     | 5                 | 5                    | 5            |
| SelfDestructMockup | 2                 | 2                    | 2            |
| tokenMockup        | 16                | 16                   | 16           |
| RCNftHubL1         | 35                | 35                   | 29           |
| RCNftHubL2         | 48                | 48                   | 42           |
| console            | 0                 | 0                    | 0            |
| TOTAL              | 302               | 302                  | 235          |
+--------------------+-------------------+----------------------+--------------+


CK complexity metrics (Core):
RFC: Response For a Class
NOC: Number of Children
DIT: Depth of Inheritance Tree
CBO: Coupling Between Object Classes
+--------------------+-----------+-----+-----+-----+-----+
| Contract           | Ext calls | RFC | NOC | DIT | CBO |
+--------------------+-----------+-----+-----+-----+-----+
| Clones             | 0         | 0   | 0   | 0   | 1   |
| Address            | 0         | 0   | 0   | 0   | 2   |
| Strings            | 0         | 0   | 0   | 0   | 2   |
| SafeCast           | 0         | 0   | 0   | 0   | 3   |
| Migrations         | 1         | 3   | 0   | 0   | 2   |
| RCFactory          | 10        | 59  | 0   | 2   | 5   |
| RCMarket           | 44        | 81  | 0   | 1   | 6   |
| RCOrderbook        | 31        | 62  | 0   | 2   | 3   |
| RCTreasury         | 28        | 103 | 0   | 2   | 5   |
| BridgeMockup       | 0         | 4   | 0   | 0   | 0   |
| DaiMockup          | 0         | 2   | 0   | 0   | 0   |
| RealitioMockup     | 0         | 5   | 0   | 0   | 0   |
| SelfDestructMockup | 0         | 2   | 0   | 0   | 0   |
| tokenMockup        | 0         | 22  | 0   | 5   | 0   |
| RCNftHubL1         | 5         | 55  | 0   | 5   | 3   |
| RCNftHubL2         | 8         | 73  | 0   | 5   | 5   |
| console            | 0         | 0   | 0   | 0   | 0   |
+--------------------+-----------+-----+-----+-----+-----+
```

## Halstead Complexity Metrics
Error executing: encode_ir_for_halstead: REF_141 -> CODESIZE account

## Martin Coupling Metrics (Architecture Stability)
```
Martin agile software metrics
Efferent Coupling (Ce) - Number of contracts that a contract depends on
Afferent Coupling (Ca) - Number of contracts that depend on the contract
Instability (I) - Ratio of efferent coupling to total coupling (Ce / (Ce + Ca))
Abstractness (A) - Number of abstract contracts / total number of contracts
Distance from the Main Sequence (D) - abs(A + I - 1)

Abstractness (overall): 0.0
+--------------------+------------+--------------+-------------+-----------------------------+
| Contract           | Dependents | Dependencies | Instability | Distance from main sequence |
+--------------------+------------+--------------+-------------+-----------------------------+
| Clones             | 1          | 0            | 0.00        | 0.00                        |
| Address            | 2          | 0            | 0.00        | 0.00                        |
| Strings            | 2          | 0            | 0.00        | 0.00                        |
| SafeCast           | 3          | 0            | 0.00        | 0.00                        |
| Migrations         | 1          | 1            | 0.50        | 0.50                        |
| RCFactory          | 0          | 5            | 1.00        | 1.00                        |
| RCMarket           | 0          | 6            | 1.00        | 1.00                        |
| RCOrderbook        | 0          | 3            | 1.00        | 1.00                        |
| RCTreasury         | 0          | 5            | 1.00        | 1.00                        |
| BridgeMockup       | 0          | 0            | 0.00        | 0.00                        |
| DaiMockup          | 0          | 0            | 0.00        | 0.00                        |
| RealitioMockup     | 0          | 0            | 0.00        | 0.00                        |
| SelfDestructMockup | 0          | 0            | 0.00        | 0.00                        |
| tokenMockup        | 0          | 0            | 0.00        | 0.00                        |
| RCNftHubL1         | 0          | 3            | 1.00        | 1.00                        |
| RCNftHubL2         | 0          | 5            | 1.00        | 1.00                        |
| console            | 0          | 0            | 0.00        | 0.00                        |
+--------------------+------------+--------------+-------------+-----------------------------+
```

## Lines of Code Counts (LOC)
```
+-------+------+------+------+
|       | src  | dep  | test |
+-------+------+------+------+
| loc   | 4380 | 3629 | 0    |
| sloc  | 2912 | 1841 | 0    |
| cloc  | 952  | 1176 | 0    |
| Total | 8244 | 6646 | 0    |
+-------+------+------+------+
```

## Function Complexity & Standards Checks
### Contract: Clones
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `clone` | **1** | Low (Simple) |
| `cloneDeterministic` | **1** | Low (Simple) |
| `predictDeterministicAddress` | **1** | Low (Simple) |
| `predictDeterministicAddress` | **1** | Low (Simple) |

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

### Contract: Strings
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `toString` | **4** | Low (Simple) |
| `toHexString` | **3** | Low (Simple) |
| `toHexString` | **2** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: SafeCast
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `toUint128` | **1** | Low (Simple) |
| `toUint64` | **1** | Low (Simple) |
| `toUint32` | **1** | Low (Simple) |
| `toUint16` | **1** | Low (Simple) |
| `toUint8` | **1** | Low (Simple) |
| `toUint256` | **1** | Low (Simple) |
| `toInt128` | **1** | Low (Simple) |
| `toInt64` | **1** | Low (Simple) |
| `toInt32` | **1** | Low (Simple) |
| `toInt16` | **1** | Low (Simple) |
| `toInt8` | **1** | Low (Simple) |
| `toInt256` | **1** | Low (Simple) |

---

### Contract: Migrations
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setCompleted` | **1** | Low (Simple) |
| `upgrade` | **1** | Low (Simple) |

---

### Contract: RCFactory
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `nfthub` | **1** | Low (Simple) |
| `treasury` | **1** | Low (Simple) |
| `orderbook` | **1** | Low (Simple) |
| `getPotDistribution` | **1** | Low (Simple) |
| `minimumPriceIncreasePercent` | **1** | Low (Simple) |
| `trapIfUnapproved` | **1** | Low (Simple) |
| `isMarketApproved` | **1** | Low (Simple) |
| `maxRentIterations` | **1** | Low (Simple) |
| `setminimumPriceIncreasePercent` | **1** | Low (Simple) |
| `setNFTMintingLimit` | **1** | Low (Simple) |
| `setMaxRentIterations` | **1** | Low (Simple) |
| `getOracleSettings` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isGovernor` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `getMostRecentMarket` | **1** | Low (Simple) |
| `getAllMarkets` | **1** | Low (Simple) |
| `getPotDistribution` | **1** | Low (Simple) |
| `setNftHubAddress` | **1** | Low (Simple) |
| `setOrderbookAddress` | **1** | Low (Simple) |
| `setPotDistribution` | **1** | Low (Simple) |
| `setminimumPriceIncreasePercent` | **1** | Low (Simple) |
| `setNFTMintingLimit` | **1** | Low (Simple) |
| `setMaxRentIterations` | **1** | Low (Simple) |
| `setRealitioAddress` | **1** | Low (Simple) |
| `setArbitrator` | **1** | Low (Simple) |
| `setTimeout` | **1** | Low (Simple) |
| `changeMarketCreationGovernorsOnly` | **1** | Low (Simple) |
| `changeApprovedArtistsOnly` | **1** | Low (Simple) |
| `changeApprovedAffilliatesOnly` | **1** | Low (Simple) |
| `setSponsorshipRequired` | **1** | Low (Simple) |
| `changeTrapCardsIfUnapproved` | **1** | Low (Simple) |
| `setAdvancedWarning` | **1** | Low (Simple) |
| `setMaximumDuration` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `isGovernor` | **1** | Low (Simple) |
| `changeGovernorApproval` | **1** | Low (Simple) |
| `changeMarketApproval` | **1** | Low (Simple) |
| `changeArtistApproval` | **1** | Low (Simple) |
| `changeAffiliateApproval` | **1** | Low (Simple) |
| `changeCardAffiliateApproval` | **1** | Low (Simple) |
| `setReferenceContractAddress` | **1** | Low (Simple) |
| `changeUberOwner` | **1** | Low (Simple) |
| `createMarket` | **9** | Moderate (Complex) |
| `getOracleSettings` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: RCMarket
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `isMarket` | **1** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `initialize` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `state` | **1** | Low (Simple) |
| `collectRentAllCards` | **1** | Low (Simple) |
| `exitAll` | **1** | Low (Simple) |
| `exit` | **1** | Low (Simple) |
| `marketLockingTime` | **1** | Low (Simple) |
| `transferCard` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `initialize` | **8** | Moderate (Complex) |
| `upgradeCard` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `_transferCard` | **1** | Low (Simple) |
| `transferCard` | **2** | Low (Simple) |
| `_postQuestionToOracle` | **1** | Low (Simple) |
| `isFinalized` | **1** | Low (Simple) |
| `getWinnerFromOracle` | **1** | Low (Simple) |
| `setAmicableResolution` | **1** | Low (Simple) |
| `lockMarket` | **3** | Low (Simple) |
| `setWinner` | **3** | Low (Simple) |
| `withdraw` | **2** | Low (Simple) |
| `claimCard` | **1** | Low (Simple) |
| `_payoutWinnings` | **3** | Low (Simple) |
| `_returnRent` | **1** | Low (Simple) |
| `_payout` | **1** | Low (Simple) |
| `payArtist` | **1** | Low (Simple) |
| `payMarketCreator` | **1** | Low (Simple) |
| `payAffiliate` | **1** | Low (Simple) |
| `payCardAffiliate` | **2** | Low (Simple) |
| `_processStakeholderPayment` | **2** | Low (Simple) |
| `collectRentAllCards` | **4** | Low (Simple) |
| `rentAllCards` | **5** | Moderate (Complex) |
| `newRental` | **5** | Moderate (Complex) |
| `_checkTimeHeldLimit` | **2** | Low (Simple) |
| `updateTimeHeldLimit` | **3** | Low (Simple) |
| `exitAll` | **2** | Low (Simple) |
| `exit` | **3** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `_sponsor` | **2** | Low (Simple) |
| `_collectRentAction` | **17** | ⚠️ High (Refactor recommended) |
| `_collectRent` | **2** | Low (Simple) |
| `_processRentCollection` | **3** | Low (Simple) |
| `_checkState` | **1** | Low (Simple) |
| `_checkNotState` | **1** | Low (Simple) |
| `_incrementState` | **1** | Low (Simple) |
| `circuitBreaker` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: RCOrderbook
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `changeUberOwner` | **1** | Low (Simple) |
| `setFactoryAddress` | **1** | Low (Simple) |
| `addMarket` | **1** | Low (Simple) |
| `setLimits` | **1** | Low (Simple) |
| `addBidToOrderbook` | **1** | Low (Simple) |
| `removeBidFromOrderbook` | **1** | Low (Simple) |
| `closeMarket` | **1** | Low (Simple) |
| `findNewOwner` | **1** | Low (Simple) |
| `getBidValue` | **1** | Low (Simple) |
| `getTimeHeldlimit` | **1** | Low (Simple) |
| `bidExists` | **1** | Low (Simple) |
| `setTimeHeldlimit` | **1** | Low (Simple) |
| `removeUserFromOrderbook` | **1** | Low (Simple) |
| `removeOldBids` | **1** | Low (Simple) |
| `reduceTimeHeldLimit` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `changeUberOwner` | **1** | Low (Simple) |
| `setFactoryAddress` | **1** | Low (Simple) |
| `setLimits` | **4** | Low (Simple) |
| `addMarket` | **2** | Low (Simple) |
| `addBidToOrderbook` | **4** | Low (Simple) |
| `_searchOrderbook` | **3** | Low (Simple) |
| `_newBidInOrderbook` | **3** | Low (Simple) |
| `_updateBidInOrderbook` | **4** | Low (Simple) |
| `removeBidFromOrderbook` | **4** | Low (Simple) |
| `_removeBidFromOrderbookIgnoreOwner` | **3** | Low (Simple) |
| `findNewOwner` | **2** | Low (Simple) |
| `removeUserFromOrderbook` | **5** | Moderate (Complex) |
| `closeMarket` | **2** | Low (Simple) |
| `removeOldBids` | **4** | Low (Simple) |
| `cleanWastePile` | **5** | Moderate (Complex) |
| `bidExists` | **4** | Low (Simple) |
| `getBidValue` | **2** | Low (Simple) |
| `getBid` | **2** | Low (Simple) |
| `getTimeHeldlimit` | **1** | Low (Simple) |
| `setTimeHeldlimit` | **1** | Low (Simple) |
| `reduceTimeHeldLimit` | **1** | Low (Simple) |
| `transferCard` | **1** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: RCTreasury
**Auto-Detected Standards/Inherited Protocols:** Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setTokenAddress` | **1** | Low (Simple) |
| `foreclosureTimeUser` | **1** | Low (Simple) |
| `refundUser` | **1** | Low (Simple) |
| `bridgeAddress` | **1** | Low (Simple) |
| `factoryAddress` | **1** | Low (Simple) |
| `isMarket` | **1** | Low (Simple) |
| `isForeclosed` | **1** | Low (Simple) |
| `totalDeposits` | **1** | Low (Simple) |
| `marketPot` | **1** | Low (Simple) |
| `totalMarketPots` | **1** | Low (Simple) |
| `minRentalDayDivisor` | **1** | Low (Simple) |
| `maxContractBalance` | **1** | Low (Simple) |
| `globalPause` | **1** | Low (Simple) |
| `marketPaused` | **1** | Low (Simple) |
| `uberOwner` | **1** | Low (Simple) |
| `addMarket` | **1** | Low (Simple) |
| `setMinRental` | **1** | Low (Simple) |
| `setMaxContractBalance` | **1** | Low (Simple) |
| `setBridgeAddress` | **1** | Low (Simple) |
| `changeGlobalPause` | **1** | Low (Simple) |
| `changePauseMarket` | **1** | Low (Simple) |
| `setFactoryAddress` | **1** | Low (Simple) |
| `changeUberOwner` | **1** | Low (Simple) |
| `erc20` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `withdrawDeposit` | **1** | Low (Simple) |
| `payRent` | **1** | Low (Simple) |
| `payout` | **1** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `updateLastRentalTime` | **1** | Low (Simple) |
| `userTotalBids` | **1** | Low (Simple) |
| `checkSponsorship` | **1** | Low (Simple) |
| `updateRentalRate` | **1** | Low (Simple) |
| `increaseBidRate` | **1** | Low (Simple) |
| `decreaseBidRate` | **1** | Low (Simple) |
| `resetUser` | **1** | Low (Simple) |
| `collectRentUser` | **1** | Low (Simple) |
| `userDeposit` | **1** | Low (Simple) |
| `topupMarketBalance` | **1** | Low (Simple) |
| `toggleWhitelist` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `batchAddToWhitelist` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `addMarket` | **1** | Low (Simple) |
| `setMinRental` | **1** | Low (Simple) |
| `setMaxContractBalance` | **1** | Low (Simple) |
| `changeGlobalPause` | **1** | Low (Simple) |
| `changePauseMarket` | **1** | Low (Simple) |
| `toggleWhitelist` | **1** | Low (Simple) |
| `addToWhitelist` | **1** | Low (Simple) |
| `batchAddToWhitelist` | **2** | Low (Simple) |
| `setFactoryAddress` | **1** | Low (Simple) |
| `setOrderbookAddress` | **1** | Low (Simple) |
| `setNftHubAddress` | **1** | Low (Simple) |
| `setTokenAddress` | **1** | Low (Simple) |
| `setBridgeAddress` | **1** | Low (Simple) |
| `changeUberOwner` | **1** | Low (Simple) |
| `deposit` | **3** | Low (Simple) |
| `withdrawDeposit` | **4** | Low (Simple) |
| `topupMarketBalance` | **2** | Low (Simple) |
| `checkSponsorship` | **1** | Low (Simple) |
| `payRent` | **2** | Low (Simple) |
| `payout` | **1** | Low (Simple) |
| `refundUser` | **2** | Low (Simple) |
| `sponsor` | **1** | Low (Simple) |
| `updateLastRentalTime` | **2** | Low (Simple) |
| `userTotalBids` | **1** | Low (Simple) |
| `userDeposit` | **1** | Low (Simple) |
| `updateRentalRate` | **4** | Low (Simple) |
| `increaseBidRate` | **1** | Low (Simple) |
| `decreaseBidRate` | **1** | Low (Simple) |
| `resetUser` | **1** | Low (Simple) |
| `rentOwedUser` | **1** | Low (Simple) |
| `rentOwedBetweenTimestmaps` | **2** | Low (Simple) |
| `depositAbleToWithdraw` | **2** | Low (Simple) |
| `foreclosureTimeUser` | **3** | Low (Simple) |
| `collectRentUser` | **3** | Low (Simple) |
| `_increaseMarketBalance` | **1** | Low (Simple) |

---

### Contract: BridgeMockup
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `requireToPassMessage` | **2** | Low (Simple) |
| `messageSender` | **2** | Low (Simple) |
| `setProxyL1Address` | **1** | Low (Simple) |
| `setProxyL2Address` | **1** | Low (Simple) |

---

### Contract: DaiMockup
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `approve` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |

---

### Contract: RealitioMockup
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `setResult` | **2** | Low (Simple) |
| `askQuestion` | **1** | Low (Simple) |
| `resultFor` | **1** | Low (Simple) |
| `isFinalized` | **2** | Low (Simple) |
| `getContentHash` | **2** | Low (Simple) |
| `slitherConstructorVariables` | **1** | Low (Simple) |

---

### Contract: SelfDestructMockup
**Auto-Detected Standards/Inherited Protocols:** None
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `killme` | **1** | Low (Simple) |
| `receive` | **1** | Low (Simple) |

---

### Contract: tokenMockup
**Auto-Detected Standards/Inherited Protocols:** ERC20
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `burn` | **1** | Low (Simple) |
| `burnFrom` | **1** | Low (Simple) |
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
| `_beforeTokenTransfer` | **1** | Low (Simple) |
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

---

### Contract: RCNftHubL1
**Auto-Detected Standards/Inherited Protocols:** ERC721, AccessControl, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `mint` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `exists` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `hasRole` | **1** | Low (Simple) |
| `_checkRole` | **2** | Low (Simple) |
| `getRoleAdmin` | **1** | Low (Simple) |
| `grantRole` | **1** | Low (Simple) |
| `revokeRole` | **1** | Low (Simple) |
| `renounceRole` | **1** | Low (Simple) |
| `_setupRole` | **1** | Low (Simple) |
| `_setRoleAdmin` | **1** | Low (Simple) |
| `_grantRole` | **2** | Low (Simple) |
| `_revokeRole` | **2** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `hasRole` | **1** | Low (Simple) |
| `getRoleAdmin` | **1** | Low (Simple) |
| `grantRole` | **1** | Low (Simple) |
| `revokeRole` | **1** | Low (Simple) |
| `renounceRole` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `tokenURI` | **3** | Low (Simple) |
| `_setTokenURI` | **1** | Low (Simple) |
| `_burn` | **2** | Low (Simple) |
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
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `setTokenMetadata` | **1** | Low (Simple) |
| `exists` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

---

### Contract: RCNftHubL2
**Auto-Detected Standards/Inherited Protocols:** ERC721, AccessControl, Ownable
| Function Name | Cyclomatic Complexity ($M$) | Complexity Rating |
| :--- | :---: | :--- |
| `marketTracker` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `addMarket` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `transferNft` | **1** | Low (Simple) |
| `deposit` | **1** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawWithMetadata` | **1** | Low (Simple) |
| `_initializeEIP712` | **1** | Low (Simple) |
| `getNonce` | **1** | Low (Simple) |
| `executeMetaTransaction` | **1** | Low (Simple) |
| `msgSender` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `hasRole` | **1** | Low (Simple) |
| `_checkRole` | **2** | Low (Simple) |
| `getRoleAdmin` | **1** | Low (Simple) |
| `grantRole` | **1** | Low (Simple) |
| `revokeRole` | **1** | Low (Simple) |
| `renounceRole` | **1** | Low (Simple) |
| `_setupRole` | **1** | Low (Simple) |
| `_setRoleAdmin` | **1** | Low (Simple) |
| `_grantRole` | **2** | Low (Simple) |
| `_revokeRole` | **2** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `hasRole` | **1** | Low (Simple) |
| `getRoleAdmin` | **1** | Low (Simple) |
| `grantRole` | **1** | Low (Simple) |
| `revokeRole` | **1** | Low (Simple) |
| `renounceRole` | **1** | Low (Simple) |
| `_msgSender` | **1** | Low (Simple) |
| `_msgData` | **1** | Low (Simple) |
| `tokenURI` | **3** | Low (Simple) |
| `_setTokenURI` | **1** | Low (Simple) |
| `_burn` | **2** | Low (Simple) |
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
| `_exists` | **1** | Low (Simple) |
| `_isApprovedOrOwner` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_safeMint` | **1** | Low (Simple) |
| `_mint` | **1** | Low (Simple) |
| `_burn` | **1** | Low (Simple) |
| `_transfer` | **1** | Low (Simple) |
| `_approve` | **1** | Low (Simple) |
| `_checkOnERC721Received` | **4** | Low (Simple) |
| `_beforeTokenTransfer` | **1** | Low (Simple) |
| `name` | **1** | Low (Simple) |
| `symbol` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `balanceOf` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `approve` | **1** | Low (Simple) |
| `getApproved` | **1** | Low (Simple) |
| `setApprovalForAll` | **1** | Low (Simple) |
| `isApprovedForAll` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `owner` | **1** | Low (Simple) |
| `renounceOwnership` | **1** | Low (Simple) |
| `transferOwnership` | **1** | Low (Simple) |
| `addMarket` | **1** | Low (Simple) |
| `setFactoryAddress` | **1** | Low (Simple) |
| `mint` | **1** | Low (Simple) |
| `transferNft` | **1** | Low (Simple) |
| `ownerOf` | **1** | Low (Simple) |
| `tokenURI` | **1** | Low (Simple) |
| `deposit` | **3** | Low (Simple) |
| `withdraw` | **1** | Low (Simple) |
| `withdrawWithMetadata` | **1** | Low (Simple) |
| `encodeTokenMetadata` | **1** | Low (Simple) |
| `supportsInterface` | **1** | Low (Simple) |
| `transferFrom` | **1** | Low (Simple) |
| `safeTransferFrom` | **1** | Low (Simple) |
| `slitherConstructorConstantVariables` | **1** | Low (Simple) |

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
