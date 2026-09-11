# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: Address
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `isContract(address)` | **internal** | Yes | None | None direct | None |
| `sendValue(address,uint256)` | **internal** | Yes | None | None direct | None |
| `functionCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `functionCallWithValue(address,bytes,uint256)` | **internal** | Yes | None | None direct | None |
| `functionCallWithValue(address,bytes,uint256,string)` | **internal** | Yes | None | None direct | None |
| `functionStaticCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionStaticCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `functionDelegateCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionDelegateCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `_verifyCallResult(bool,bytes,string)` | **private** | Yes | None | None direct | None |

---

## Contract: SafeERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `safeTransfer(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeTransferFrom(IERC20,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeApprove(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeIncreaseAllowance(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeDecreaseAllowance(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_callOptionalReturn(IERC20,bytes)` | **private** | Yes | None | None direct | None |

---

## Contract: IERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |

---

## Contract: YetiFinanceTreasury
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `sendToken(IERC20,address,uint256)` | **external** | No (msg/tx) | onlyTeam | `[Internal Call: onlyTeam] require(bool,string)(msg.sender == teamWallet,Treasury : Not Team Sender)`<br>`[Modifier: onlyTeam] require(bool,string)(msg.sender == teamWallet,Treasury : Not Team Sender)` | None |
| `updateTeamWallet(address)` | **external** | No (msg/tx) | onlyTeam | `[Internal Call: onlyTeam] require(bool,string)(msg.sender == teamWallet,Treasury : Not Team Sender)`<br>`[Modifier: onlyTeam] require(bool,string)(msg.sender == teamWallet,Treasury : Not Team Sender)` | teamWallet |
| `getTeamWallet()` | **external** | Yes | None | None direct | None |

---

## Contract: BorrowerOperations
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`
- Privilege: `uint256 BOOTSTRAP_PERIOD`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, collSurplusPool, defaultPool, deploymentTime, gasPoolAddress, sYETIAddress, sortedTroves, stabilityPoolAddress, troveManager, whitelist, yusdToken |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_singleLeverUp(address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_openTroveInternal(address,uint256,uint256,uint256,address,address,address[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_adjustTrove(BorrowerOperations.AdjustTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `_singleUnleverUp(address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_unleverColls(IActivePool,address[],uint256[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTrove()` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_closeTrove(BorrowerOperations.CloseTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `claimCollateral()` | **external** | No (msg/tx) | None | None direct | None |
| `_getTotalVariableDepositFee(address[],uint256[],uint256,uint256,uint256,uint256,BorrowerOperations.ContractsCache)` | **internal** | No (msg/tx) | None | None direct | None |
| `_transferCollateralsIntoActivePool(address,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_singleTransferCollateralIntoActivePool(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerBorrowingFee(ITroveManager,IYUSDToken,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerDepositFee(IYUSDToken,uint256)` | **internal** | Yes | None | None direct | None |
| `_updateTroveFromAdjustment(ITroveManager,address,address[],uint256[],uint256,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_getNewPortfolio(address[],uint256[],address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_moveYUSD(IActivePool,IYUSDToken,address,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawYUSD(IActivePool,IYUSDToken,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_repayYUSD(IActivePool,IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidDepositCollateral(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroAdjustment(uint256[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_arrayIsNonzero(uint256[])` | **internal** | Yes | None | None direct | None |
| `_isBeforeFeeBootstrapPeriod()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireTroveisActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireTroveisNotActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroDebtChange(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNoOverlapColls(address[],address[])` | **internal** | Yes | None | None direct | None |
| `_requireNoDuplicateColls(address[])` | **internal** | Yes | None | None direct | None |
| `_requireNotInRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireNoCollWithdrawal(uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireLengthNonzero(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireLengthsEqual(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidAdjustmentInCurrentMode(bool,uint256[],bool,BorrowerOperations.LocalVariables_adjustTrove)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveMCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewICRisAboveOldICR(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewTCRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireAtLeastMinNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidYUSDRepayment(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireSufficientYUSDBalance(IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidMaxFeePercentage(uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewICRFromTroveChange(uint256,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewTCRFromTroveChange(uint256,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: LiquityMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 HALF_DECIMAL_PRECISION`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_min(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_max(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `decMul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_decPow(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_getAbsoluteDifference(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_computeCR(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, HALF_DECIMAL_PRECISION |

---

## Contract: SafeMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `mul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |

---

## Contract: IActivePool
**Linearized C3 Inheritance Tree:** IPool -> ICollateralReceiver
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendCollaterals(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendCollateralsUnwrap(address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendSingleCollateral(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `sendSingleCollateralUnwrap(address,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |

---

## Contract: ICollSurplusPool
**Linearized C3 Inheritance Tree:** ICollateralReceiver
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `getCollVC()` | **external** | Yes | None | None direct | None |
| `getAmountClaimable(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `accountSurplus(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `claimColl(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IDefaultPool
**Linearized C3 Inheritance Tree:** IPool -> ICollateralReceiver
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendCollsToActivePool(address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IPriceFeed
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |

---

## Contract: ISYETI
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `mint(uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ISortedTroves
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `insert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `remove(address)` | **external** | Yes | None | None direct | None |
| `reInsert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `contains(address)` | **external** | Yes | None | None direct | None |
| `isFull()` | **external** | Yes | None | None direct | None |
| `isEmpty()` | **external** | Yes | None | None direct | None |
| `getSize()` | **external** | Yes | None | None direct | None |
| `getMaxSize()` | **external** | Yes | None | None direct | None |
| `getFirst()` | **external** | Yes | None | None direct | None |
| `getLast()` | **external** | Yes | None | None direct | None |
| `getNext(address)` | **external** | Yes | None | None direct | None |
| `getPrev(address)` | **external** | Yes | None | None direct | None |
| `getOldICR(address)` | **external** | Yes | None | None direct | None |
| `validInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: IStabilityPool
**Linearized C3 Inheritance Tree:** ICollateralReceiver
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | Yes | None | None direct | None |
| `registerFrontEnd(uint256)` | **external** | Yes | None | None direct | None |
| `offset(uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getDepositorGains(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getTotalYUSDDeposits()` | **external** | Yes | None | None direct | None |
| `getDepositorYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getFrontEndYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedYUSDDeposit(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedFrontEndStake(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getDepositSnapshotS(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |

---

## Contract: ITroveManager
**Linearized C3 Inheritance Tree:** ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `stabilityPool()` | **external** | Yes | None | None direct | None |
| `yusdToken()` | **external** | Yes | None | None direct | None |
| `yetiToken()` | **external** | Yes | None | None direct | None |
| `sYETI()` | **external** | Yes | None | None direct | None |
| `getTroveOwnersCount()` | **external** | Yes | None | None direct | None |
| `getTroveFromTroveOwnersArray(uint256)` | **external** | Yes | None | None direct | None |
| `getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `liquidate(address)` | **external** | Yes | None | None direct | None |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `updateStakeAndTotalStakes(address)` | **external** | Yes | None | None direct | None |
| `updateTroveCollTMR(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateTroveRewardSnapshots(address)` | **external** | Yes | None | None direct | None |
| `addTroveOwnerToArray(address)` | **external** | Yes | None | None direct | None |
| `applyPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingCollRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingYUSDDebtReward(address)` | **external** | Yes | None | None direct | None |
| `hasPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `closeTrove(address)` | **external** | Yes | None | None direct | None |
| `removeStake(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTMR(address)` | **external** | Yes | None | None direct | None |
| `updateTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getRedemptionRate()` | **external** | Yes | None | None direct | None |
| `getRedemptionRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getRedemptionFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingRate()` | **external** | Yes | None | None direct | None |
| `getBorrowingRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getBorrowingFee(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `decayBaseRateFromBorrowing()` | **external** | Yes | None | None direct | None |
| `getTroveStatus(address)` | **external** | Yes | None | None direct | None |
| `isTroveActive(address)` | **external** | Yes | None | None direct | None |
| `getTroveStake(address,address)` | **external** | Yes | None | None direct | None |
| `getTotalStake(address)` | **external** | Yes | None | None direct | None |
| `getTroveDebt(address)` | **external** | Yes | None | None direct | None |
| `getL_Coll(address)` | **external** | Yes | None | None direct | None |
| `getL_YUSD(address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotColl(address,address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotYUSD(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveVC(address)` | **external** | Yes | None | None direct | None |
| `getTroveColls(address)` | **external** | Yes | None | None direct | None |
| `getCurrentTroveState(address)` | **external** | Yes | None | None direct | None |
| `setTroveStatus(address,uint256)` | **external** | Yes | None | None direct | None |
| `updateTroveColl(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `increaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTCR()` | **external** | Yes | None | None direct | None |
| `checkRecoveryMode()` | **external** | Yes | None | None direct | None |
| `closeTroveRedemption(address)` | **external** | Yes | None | None direct | None |
| `closeTroveLiquidation(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTLR(address)` | **external** | Yes | None | None direct | None |
| `updateBaseRate(uint256)` | **external** | Yes | None | None direct | None |
| `calcDecayedBaseRate()` | **external** | Yes | None | None direct | None |
| `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getEntireDebtAndColls(address)` | **external** | Yes | None | None direct | None |
| `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `collSurplusUpdate(address,address[],uint256[])` | **external** | Yes | None | None direct | None |

---

## Contract: IWAsset
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `wrap(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `updateReward(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | Yes | None | None direct | None |
| `claimRewardFor(address)` | **external** | Yes | None | None direct | None |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `endTreasuryReward(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IWhitelist
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getValidCollateral()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `isValidRouter(address)` | **external** | Yes | None | None direct | None |
| `getOracle(address)` | **external** | Yes | None | None direct | None |
| `getRatio(address)` | **external** | Yes | None | None direct | None |
| `getIsActive(address)` | **external** | Yes | None | None direct | None |
| `getPriceCurve(address)` | **external** | Yes | None | None direct | None |
| `getDecimals(address)` | **external** | Yes | None | None direct | None |
| `getFee(address,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeAndUpdate(address,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getIndex(address)` | **external** | Yes | None | None direct | None |
| `isWrapped(address)` | **external** | Yes | None | None direct | None |
| `setDefaultRouter(address,address)` | **external** | Yes | None | None direct | None |
| `getValueVC(address,uint256)` | **external** | Yes | None | None direct | None |
| `getValueUSD(address,uint256)` | **external** | Yes | None | None direct | None |
| `getDefaultRouterAddress(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IYETIToken
**Linearized C3 Inheritance Tree:** IERC2612 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `sendToSYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `getDeploymentStartTime()` | **external** | Yes | None | None direct | None |

---

## Contract: IYUSDToken
**Linearized C3 Inheritance Tree:** IERC2612 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256)` | **external** | Yes | None | None direct | None |
| `sendToPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `returnFromPool(address,address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IYetiRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `route(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `unRoute(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ITroveManagerLiquidations
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | None | None direct | None |

---

## Contract: ITroveManagerRedemptions
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` | **external** | Yes | None | None direct | None |

---

## Contract: TroveManager
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> ITroveManager -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_MINUTE`
- Privilege: `uint256 MINUTE_DECAY_FACTOR`
- Privilege: `uint256 MAX_BORROWING_FEE`
- Privilege: `uint256 BOOTSTRAP_PERIOD`
- Privilege: `address[] TroveOwners`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `stabilityPool()` | **external** | Yes | None | None direct | None |
| `yusdToken()` | **external** | Yes | None | None direct | None |
| `yetiToken()` | **external** | Yes | None | None direct | None |
| `sYETI()` | **external** | Yes | None | None direct | None |
| `getTroveOwnersCount()` | **external** | Yes | None | None direct | None |
| `getTroveFromTroveOwnersArray(uint256)` | **external** | Yes | None | None direct | None |
| `getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `liquidate(address)` | **external** | Yes | None | None direct | None |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `updateStakeAndTotalStakes(address)` | **external** | Yes | None | None direct | None |
| `updateTroveCollTMR(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateTroveRewardSnapshots(address)` | **external** | Yes | None | None direct | None |
| `addTroveOwnerToArray(address)` | **external** | Yes | None | None direct | None |
| `applyPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingCollRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingYUSDDebtReward(address)` | **external** | Yes | None | None direct | None |
| `hasPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `closeTrove(address)` | **external** | Yes | None | None direct | None |
| `removeStake(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTMR(address)` | **external** | Yes | None | None direct | None |
| `updateTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getRedemptionRate()` | **external** | Yes | None | None direct | None |
| `getRedemptionRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getRedemptionFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingRate()` | **external** | Yes | None | None direct | None |
| `getBorrowingRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getBorrowingFee(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `decayBaseRateFromBorrowing()` | **external** | Yes | None | None direct | None |
| `getTroveStatus(address)` | **external** | Yes | None | None direct | None |
| `isTroveActive(address)` | **external** | Yes | None | None direct | None |
| `getTroveStake(address,address)` | **external** | Yes | None | None direct | None |
| `getTotalStake(address)` | **external** | Yes | None | None direct | None |
| `getTroveDebt(address)` | **external** | Yes | None | None direct | None |
| `getL_Coll(address)` | **external** | Yes | None | None direct | None |
| `getL_YUSD(address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotColl(address,address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotYUSD(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveVC(address)` | **external** | Yes | None | None direct | None |
| `getTroveColls(address)` | **external** | Yes | None | None direct | None |
| `getCurrentTroveState(address)` | **external** | Yes | None | None direct | None |
| `setTroveStatus(address,uint256)` | **external** | Yes | None | None direct | None |
| `updateTroveColl(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `increaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTCR()` | **external** | Yes | None | None direct | None |
| `checkRecoveryMode()` | **external** | Yes | None | None direct | None |
| `closeTroveRedemption(address)` | **external** | Yes | None | None direct | None |
| `closeTroveLiquidation(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTLR(address)` | **external** | Yes | None | None direct | None |
| `updateBaseRate(uint256)` | **external** | Yes | None | None direct | None |
| `calcDecayedBaseRate()` | **external** | Yes | None | None direct | None |
| `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getEntireDebtAndColls(address)` | **external** | Yes | None | None direct | None |
| `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `collSurplusUpdate(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperationsAddress, collSurplusPool, defaultPool, gasPoolAddress, sYETIContract, sortedTroves, stabilityPoolContract, troveManagerLiquidations, troveManagerLiquidationsAddress, troveManagerRedemptions, troveManagerRedemptionsAddress, whitelist, yetiTokenContract, yusdTokenContract |
| `getTroveOwnersCount()` | **external** | Yes | None | None direct | None |
| `getTroveFromTroveOwnersArray(uint256)` | **external** | Yes | None | None direct | None |
| `liquidate(address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | nonReentrant | None direct | None |
| `collSurplusUpdate(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **external** | No (msg/tx) | None | None direct | None |
| `_movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **internal** | Yes | None | None direct | None |
| `_updateTrove(address,address,address)` | **internal** | Yes | None | None direct | None |
| `updateTroves(address[],address[],address[])` | **external** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `_getCurrentTroveState(address)` | **internal** | Yes | None | None direct | None |
| `applyPendingRewards(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_applyPendingRewards(IActivePool,IDefaultPool,address)` | **internal** | No (msg/tx) | None | None direct | Troves |
| `updateTroveRewardSnapshots(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_updateTroveRewardSnapshots(address)` | **internal** | No (msg/tx) | None | None direct | rewardSnapshots |
| `getPendingCollRewards(address)` | **external** | Yes | None | None direct | None |
| `_getPendingCollRewards(address)` | **internal** | Yes | None | None direct | None |
| `getPendingYUSDDebtReward(address)` | **public** | Yes | None | None direct | None |
| `hasPendingRewards(address)` | **public** | Yes | None | None direct | None |
| `getEntireDebtAndColls(address)` | **public** | Yes | None | None direct | None |
| `removeStake(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_removeStake(address)` | **internal** | Yes | None | None direct | Troves, totalStakes |
| `updateStakeAndTotalStakes(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_updateStakeAndTotalStakes(address)` | **internal** | Yes | None | None direct | Troves, totalStakes |
| `_computeNewStake(address,uint256)` | **internal** | Yes | None | None direct | None |
| `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | L_Coll, L_YUSDDebt, lastCollError_Redistribution, lastYUSDDebtError_Redistribution |
| `closeTrove(address)` | **external** | No (msg/tx) | None | None direct | None |
| `closeTroveLiquidation(address)` | **external** | No (msg/tx) | None | None direct | None |
| `closeTroveRedemption(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_closeTrove(address,TroveManagerBase.Status)` | **internal** | Yes | None | None direct | Troves, rewardSnapshots |
| `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | totalCollateralSnapshot, totalStakesSnapshot |
| `addTroveOwnerToArray(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_addTroveOwnerToArray(address)` | **internal** | Yes | None | None direct | TroveOwners, Troves |
| `_removeTroveOwner(address,uint256)` | **internal** | Yes | None | None direct | TroveOwners, Troves |
| `getTCR()` | **external** | Yes | None | None direct | None |
| `checkRecoveryMode()` | **external** | Yes | None | None direct | None |
| `updateBaseRate(uint256)` | **external** | No (msg/tx) | None | None direct | baseRate |
| `getRedemptionRate()` | **public** | Yes | None | None direct | None |
| `getRedemptionRateWithDecay()` | **public** | No (msg/tx) | None | None direct | None |
| `_calcRedemptionRate(uint256)` | **internal** | Yes | None | None direct | None |
| `_getRedemptionFee(uint256)` | **internal** | Yes | None | None direct | None |
| `getRedemptionFeeWithDecay(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_calcRedemptionFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `getBorrowingRate()` | **public** | Yes | None | None direct | None |
| `getBorrowingRateWithDecay()` | **public** | No (msg/tx) | None | None direct | None |
| `_calcBorrowingRate(uint256)` | **internal** | Yes | None | None direct | None |
| `getBorrowingFee(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingFeeWithDecay(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_calcBorrowingFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `decayBaseRateFromBorrowing()` | **external** | No (msg/tx) | None | None direct | baseRate |
| `_updateLastFeeOpTime()` | **internal** | No (msg/tx) | None | None direct | lastFeeOperationTime |
| `calcDecayedBaseRate()` | **public** | No (msg/tx) | None | None direct | None |
| `_minutesPassedSinceLastFeeOp()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTMR()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTMR()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTML()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `_requireTroveIsActive(address)` | **internal** | Yes | None | None direct | None |
| `_requireMoreThanOneTroveInSystem(uint256)` | **internal** | Yes | None | None direct | None |
| `getTroveStatus(address)` | **external** | Yes | None | None direct | None |
| `isTroveActive(address)` | **external** | Yes | None | None direct | None |
| `getTroveStake(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveDebt(address)` | **external** | Yes | None | None direct | None |
| `getTotalStake(address)` | **external** | Yes | None | None direct | None |
| `getL_Coll(address)` | **external** | Yes | None | None direct | None |
| `getL_YUSD(address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotColl(address,address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotYUSD(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveVC(address)` | **external** | Yes | None | None direct | None |
| `getTroveColls(address)` | **external** | Yes | None | None direct | None |
| `getCurrentTroveState(address)` | **external** | Yes | None | None direct | None |
| `updateTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `updateTroveCollTMR(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | Troves |
| `removeStakeTMR(address)` | **external** | No (msg/tx) | None | None direct | None |
| `removeStakeTLR(address)` | **external** | No (msg/tx) | None | None direct | None |
| `setTroveStatus(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `updateTroveColl(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | Troves |
| `increaseTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `decreaseTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `stabilityPool()` | **external** | Yes | None | None direct | None |
| `yusdToken()` | **external** | Yes | None | None direct | None |
| `yetiToken()` | **external** | Yes | None | None direct | None |
| `sYETI()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MAX_BORROWING_FEE, MCR, MINUTE_DECAY_FACTOR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, SECONDS_IN_ONE_MINUTE, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: DefaultPool
**Linearized C3 Inheritance Tree:** YetiCustomBase -> BaseMath -> IDefaultPool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `string NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `sendCollsToActivePool(address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePoolAddress, troveManagerAddress, whitelist, whitelistAddress, yetiFinanceTreasury |
| `getCollateral(address)` | **public** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `_sendCollateral(address,uint256)` | **internal** | Yes | None | None direct | poolColl |
| `sendCollsToActivePool(address[],uint256[],address)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `decreaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTroveManager()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | poolColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | poolColl |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, NAME |

---

## Contract: YUSDToken
**Linearized C3 Inheritance Tree:** IYUSDToken -> IERC2612 -> IERC20 -> CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string _NAME`
- Privilege: `string _SYMBOL`
- Privilege: `string _VERSION`
- Privilege: `uint8 _DECIMALS`
- Privilege: `bytes32 _PERMIT_TYPEHASH`
- Privilege: `bytes32 _TYPE_HASH`
- Privilege: `bytes32 _CACHED_DOMAIN_SEPARATOR`
- Privilege: `uint256 _CACHED_CHAIN_ID`
- Privilege: `bytes32 _HASHED_NAME`
- Privilege: `bytes32 _HASHED_VERSION`
- Privilege: `address troveManagerAddress`
- Privilege: `address troveManagerLiquidationsAddress`
- Privilege: `address troveManagerRedemptionsAddress`
- Privilege: `address stabilityPoolAddress`
- Privilege: `address borrowerOperationsAddress`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256)` | **external** | Yes | None | None direct | None |
| `sendToPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `returnFromPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBorrowerOperations] require(bool,string)(msg.sender == borrowerOperationsAddress,YUSDToken: Caller is not BorrowerOperations)` | None |
| `burn(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBOorTroveMorSP] require(bool,string)(msg.sender == borrowerOperationsAddress || msg.sender == troveManagerAddress || msg.sender == stabilityPoolAddress || msg.sender == troveManagerRedemptionsAddress,YUSD: Caller is neither BorrowerOperations nor TroveManager nor StabilityPool)` | None |
| `sendToPool(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,YUSD: Caller is not the StabilityPool)` | None |
| `returnFromPool(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsTMLorSP] require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)` | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `domainSeparator()` | **public** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | _nonces |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `_chainID()` | **private** | Yes | None | None direct | None |
| `_buildDomainSeparator(bytes32,bytes32,bytes32)` | **private** | Yes | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_requireValidRecipient(address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == borrowerOperationsAddress,YUSDToken: Caller is not BorrowerOperations)` | None |
| `_requireCallerIsBOorTroveMorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == borrowerOperationsAddress || msg.sender == troveManagerAddress || msg.sender == stabilityPoolAddress || msg.sender == troveManagerRedemptionsAddress,YUSD: Caller is neither BorrowerOperations nor TroveManager nor StabilityPool)` | None |
| `_requireCallerIsStabilityPool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress,YUSD: Caller is not the StabilityPool)` | None |
| `_requireCallerIsTMLorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)` | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _DECIMALS, _NAME, _PERMIT_TYPEHASH, _SYMBOL, _TYPE_HASH, _VERSION |

---

## Contract: TroveManagerRedemptions
**Linearized C3 Inheritance Tree:** ITroveManagerRedemptions -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 BETA`
- Privilege: `uint256 BOOTSTRAP_PERIOD`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperationsAddress, collSurplusPool, defaultPool, gasPoolAddress, sYETIContract, sortedTroves, stabilityPoolContract, troveManager, whitelist, yetiTokenContract, yusdTokenContract |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256,address)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerisTroveManager] require(bool,string)(msg.sender == address(troveManager),TMR:Caller not TM)` | None |
| `redeemCollateralSingle(uint256,uint256,address,address,address,uint256,address)` | **external** | No (msg/tx) | None | `require(bool,string)(contractsCache.yusdToken.balanceOf(msg.sender) <= totals.totalYUSDSupplyAtStart,TMR:Redeemer YUSD Bal too high)` | None |
| `_redeemCollateralFromTrove(TroveManagerBase.ContractsCache,address,uint256,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_redeemCloseTrove(TroveManagerBase.ContractsCache,address,uint256,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_updateBaseRateFromRedemption(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_isValidFirstRedemptionHint(ISortedTroves,address)` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFeeRedemption(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidMaxFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireAfterBootstrapPeriod()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireTCRoverMCR()` | **internal** | Yes | None | None direct | None |
| `_requireAmountGreaterThanZero(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireYUSDBalanceCoversRedemption(IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `isNonzero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_requireCallerisTroveManager()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == address(troveManager),TMR:Caller not TM)` | None |
| `_getRedemptionFee(uint256)` | **internal** | Yes | None | None direct | None |
| `_calcRedemptionFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_calcRedemptionRate(uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BETA, BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: CollSurplusPool
**Linearized C3 Inheritance Tree:** LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase -> ICollSurplusPool -> ICollateralReceiver -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `getCollVC()` | **external** | Yes | None | None direct | None |
| `getAmountClaimable(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `accountSurplus(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `claimColl(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePoolAddress, borrowerOperationsAddress, troveManagerAddress, troveManagerRedemptionsAddress, whitelist |
| `getCollVC()` | **external** | Yes | None | None direct | None |
| `getAmountClaimable(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `accountSurplus(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | balances |
| `claimColl(address)` | **external** | No (msg/tx) | None | None direct | balances, poolColl |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTroveManager()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | poolColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | poolColl |
| `_sendColl(address,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: TroveManagerLiquidations
**Linearized C3 Inheritance Tree:** ITroveManagerLiquidations -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperationsAddress, collSurplusPool, defaultPool, gasPoolAddress, sYETIContract, sortedTroves, stabilityPoolContract, troveManager, troveManagerAddress, whitelist, yetiFinanceTreasury, yetiTokenContract, yusdTokenContract |
| `batchLiquidateTroves(address[],address)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerisTroveManager] require(bool,string)(msg.sender == troveManagerAddress,Caller not TM)` | None |
| `_getTotalFromBatchLiquidate_RecoveryMode(IActivePool,IDefaultPool,uint256,address[])` | **internal** | Yes | None | None direct | None |
| `_getTotalsFromBatchLiquidate_NormalMode(IActivePool,IDefaultPool,uint256,address[])` | **internal** | Yes | None | None direct | None |
| `_liquidateNormalMode(IActivePool,IDefaultPool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_liquidateRecoveryMode(IActivePool,IDefaultPool,address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_updateSingleLiquidation(TroveManagerLiquidations.LocalVariables_ORVals,TroveManagerLiquidations.LiquidationValues)` | **internal** | Yes | None | None direct | None |
| `_getOffsetAndRedistributionVals(uint256,YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_addLiquidationValuesToTotals(TroveManagerLiquidations.LiquidationTotals,TroveManagerLiquidations.LiquidationValues)` | **internal** | Yes | None | None direct | None |
| `_getCappedOffsetVals(uint256,address[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_sendGasCompensation(IActivePool,address,uint256,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_updateWAssetsRewardOwner(YetiCustomBase.newColls,address,address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerisTroveManager()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == troveManagerAddress,Caller not TM)` | None |
| `_getCollGasCompensation(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: SortedTroves
**Linearized C3 Inheritance Tree:** ISortedTroves -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `insert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `remove(address)` | **external** | Yes | None | None direct | None |
| `reInsert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `contains(address)` | **external** | Yes | None | None direct | None |
| `isFull()` | **external** | Yes | None | None direct | None |
| `isEmpty()` | **external** | Yes | None | None direct | None |
| `getSize()` | **external** | Yes | None | None direct | None |
| `getMaxSize()` | **external** | Yes | None | None direct | None |
| `getFirst()` | **external** | Yes | None | None direct | None |
| `getLast()` | **external** | Yes | None | None direct | None |
| `getNext(address)` | **external** | Yes | None | None direct | None |
| `getPrev(address)` | **external** | Yes | None | None direct | None |
| `getOldICR(address)` | **external** | Yes | None | None direct | None |
| `validInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setParams(uint256,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | borrowerOperationsAddress, data, troveManagerAddress, troveManagerRedemptionsAddress |
| `insert(address,uint256,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `_insert(address,uint256,address,address)` | **internal** | Yes | None | None direct | data |
| `remove(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_remove(address)` | **internal** | Yes | None | None direct | data |
| `reInsert(address,uint256,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `contains(address)` | **public** | Yes | None | None direct | None |
| `isFull()` | **public** | Yes | None | None direct | None |
| `isEmpty()` | **public** | Yes | None | None direct | None |
| `getSize()` | **external** | Yes | None | None direct | None |
| `getMaxSize()` | **external** | Yes | None | None direct | None |
| `getFirst()` | **external** | Yes | None | None direct | None |
| `getLast()` | **external** | Yes | None | None direct | None |
| `getNext(address)` | **external** | Yes | None | None direct | None |
| `getPrev(address)` | **external** | Yes | None | None direct | None |
| `getOldICR(address)` | **external** | Yes | None | None direct | None |
| `validInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `_validInsertPosition(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `_descendList(uint256,address)` | **internal** | Yes | None | None direct | None |
| `_ascendList(uint256,address)` | **internal** | Yes | None | None direct | None |
| `findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `_findInsertPosition(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsTroveManager()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveM()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: AggregatorV3Interface
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `decimals()` | **external** | Yes | None | None direct | None |
| `description()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `getRoundData(uint80)` | **external** | Yes | None | None direct | None |
| `latestRoundData()` | **external** | Yes | None | None direct | None |

---

## Contract: ITellorCaller
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getTellorCurrentValue(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: PriceFeed
**Linearized C3 Inheritance Tree:** IPriceFeed -> BaseMath -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 ETHUSD_TELLOR_REQ_ID`
- Privilege: `uint256 TARGET_DIGITS`
- Privilege: `uint256 TELLOR_DIGITS`
- Privilege: `uint256 TIMEOUT`
- Privilege: `uint256 MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND`
- Privilege: `uint256 MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | priceAggregator, status, tellorCaller |
| `fetchPrice()` | **external** | No (msg/tx) | None | None direct | None |
| `fetchPrice_v()` | **external** | No (msg/tx) | None | None direct | None |
| `_chainlinkIsBroken(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_badChainlinkResponse(PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_chainlinkIsFrozen(PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_chainlinkPriceChangeAboveMax(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse)` | **internal** | Yes | None | None direct | None |
| `_tellorIsBroken(PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_tellorIsFrozen(PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_bothOraclesLiveAndUnbrokenAndSimilarPrice(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse,PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_bothOraclesSimilarPrice(PriceFeed.ChainlinkResponse,PriceFeed.TellorResponse)` | **internal** | Yes | None | None direct | None |
| `_scaleChainlinkPriceByDigits(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_scaleTellorPriceByDigits(uint256)` | **internal** | Yes | None | None direct | None |
| `_changeStatus(PriceFeed.Status)` | **internal** | Yes | None | None direct | status |
| `_storePrice(uint256)` | **internal** | Yes | None | None direct | lastGoodPrice |
| `_storeTellorPrice(PriceFeed.TellorResponse)` | **internal** | Yes | None | None direct | None |
| `_storeChainlinkPrice(PriceFeed.ChainlinkResponse)` | **internal** | Yes | None | None direct | None |
| `_getCurrentTellorResponse()` | **internal** | Yes | None | None direct | None |
| `_getCurrentChainlinkResponse()` | **internal** | Yes | None | None direct | None |
| `_getPrevChainlinkResponse(uint80,uint8)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, ETHUSD_TELLOR_REQ_ID, MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND, MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES, NAME, TARGET_DIGITS, TELLOR_DIGITS, TIMEOUT |

---

## Contract: TeamAllocation
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setYetiAddress(IERC20)` | **external** | No (msg/tx) | onlyTeam | `[Internal Call: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)`<br>`[Modifier: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)` | YETI, yetiSet |
| `sendAllocatedYETI()` | **external** | Yes | None | None direct | allocationClaimed |
| `sendUnallocatedYETI(address,uint256)` | **external** | No (msg/tx) | onlyTeam | `[Internal Call: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)`<br>`[Modifier: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)` | None |
| `updateTeamAddress(address)` | **external** | No (msg/tx) | onlyTeam | `[Internal Call: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)`<br>`[Modifier: onlyTeam] require(bool,string)(msg.sender == teamWallet,Not a team wallet)` | teamWallet |
| `getTeamWallet()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _94_5_thousand |

---

## Contract: Whitelist
**Linearized C3 Inheritance Tree:** CheckContract -> IBaseOracle -> IWhitelist -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getValidCollateral()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `isValidRouter(address)` | **external** | Yes | None | None direct | None |
| `getOracle(address)` | **external** | Yes | None | None direct | None |
| `getRatio(address)` | **external** | Yes | None | None direct | None |
| `getIsActive(address)` | **external** | Yes | None | None direct | None |
| `getPriceCurve(address)` | **external** | Yes | None | None direct | None |
| `getDecimals(address)` | **external** | Yes | None | None direct | None |
| `getFee(address,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeAndUpdate(address,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getIndex(address)` | **external** | Yes | None | None direct | None |
| `isWrapped(address)` | **external** | Yes | None | None direct | None |
| `setDefaultRouter(address,address)` | **external** | Yes | None | None direct | None |
| `getValueVC(address,uint256)` | **external** | Yes | None | None direct | None |
| `getValueUSD(address,uint256)` | **external** | Yes | None | None direct | None |
| `getDefaultRouterAddress(address)` | **external** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_exists(address)` | **internal** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, addressesSet, borrowerOperationsAddress, collSurplusPool, defaultPool, stabilityPool |
| `addCollateral(address,uint256,address,uint256,address,bool,address)` | **external** | No (msg/tx) | onlyOwner | None direct | collateralParams, validCollateral |
| `deprecateCollateral(address)` | **external** | No (msg/tx) | exists, onlyOwner | None direct | collateralParams |
| `undeprecateCollateral(address)` | **external** | No (msg/tx) | exists, onlyOwner | None direct | collateralParams |
| `changeOracle(address,address)` | **external** | No (msg/tx) | exists, onlyOwner | None direct | collateralParams |
| `changePriceCurve(address,address)` | **external** | No (msg/tx) | exists, onlyOwner | None direct | collateralParams |
| `changeRatio(address,uint256)` | **external** | No (msg/tx) | exists, onlyOwner | None direct | collateralParams |
| `setDefaultRouter(address,address)` | **external** | No (msg/tx) | onlyOwner, exists | None direct | collateralParams |
| `getDefaultRouterAddress(address)` | **external** | Yes | exists | None direct | None |
| `isValidRouter(address)` | **external** | Yes | None | None direct | None |
| `isWrapped(address)` | **external** | Yes | None | None direct | None |
| `getValidCollateral()` | **external** | Yes | None | None direct | None |
| `getRatio(address)` | **external** | Yes | exists | None direct | None |
| `getOracle(address)` | **external** | Yes | exists | None direct | None |
| `getPriceCurve(address)` | **external** | Yes | exists | None direct | None |
| `getIsActive(address)` | **external** | Yes | exists | None direct | None |
| `getDecimals(address)` | **external** | Yes | exists | None direct | None |
| `getIndex(address)` | **external** | Yes | exists | None direct | None |
| `getFee(address,uint256,uint256,uint256,uint256)` | **external** | Yes | exists | None direct | None |
| `getFeeAndUpdate(address,uint256,uint256,uint256,uint256)` | **external** | No (msg/tx) | exists | `require(bool,string)(msg.sender == borrowerOperationsAddress,caller must be BO)` | None |
| `getPrice(address)` | **public** | Yes | exists | None direct | None |
| `getValueUSD(address,uint256)` | **external** | Yes | exists | None direct | None |
| `getValueVC(address,uint256)` | **external** | Yes | exists | None direct | None |

---

## Contract: IPriceCurve
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address)` | **external** | Yes | None | None direct | None |
| `setDecayTime(uint256)` | **external** | Yes | None | None direct | None |
| `getFee(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeAndUpdate(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `setFeeCapAndTime(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeCapAndTime()` | **external** | Yes | None | None direct | None |
| `calculateDecayedFee()` | **external** | Yes | None | None direct | None |

---

## Contract: MultiTroveGetter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getMultipleSortedTroves(int256,uint256)` | **external** | Yes | None | None direct | None |
| `_getMultipleSortedTrovesFromHead(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_getMultipleSortedTrovesFromTail(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_getCombinedTroveData(address)` | **internal** | Yes | None | None direct | None |

---

## Contract: GasPool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: Migrations
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setCompleted(uint256)` | **public** | No (msg/tx) | restricted | None direct | last_completed_migration |
| `upgrade(address)` | **public** | No (msg/tx) | restricted | None direct | None |

---

## Contract: ActivePool
**Linearized C3 Inheritance Tree:** YetiCustomBase -> BaseMath -> IActivePool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `sendCollaterals(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendCollateralsUnwrap(address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendSingleCollateral(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `sendSingleCollateralUnwrap(address,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | borrowerOperationsAddress, collSurplusPoolAddress, defaultPoolAddress, stabilityPoolAddress, troveManagerAddress, troveManagerLiquidationsAddress, troveManagerRedemptionsAddress, whitelist |
| `getCollateral(address)` | **public** | Yes | None | None direct | None |
| `getAllCollateral()` | **public** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `_sendCollateral(address,address,uint256)` | **internal** | Yes | None | None direct | poolColl |
| `sendCollaterals(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `sendCollateralsUnwrap(address,address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `sendSingleCollateral(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `sendSingleCollateralUnwrap(address,address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_needsUpdateCollateral(address)` | **internal** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `decreaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `_requireCallerIsBOorTroveMorTMLorSP()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperationsOrDefaultPool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveMorSP()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveM()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | poolColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | poolColl |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, NAME |

---

## Contract: HintHelpers
**Linearized C3 Inheritance Tree:** CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | sortedTroves, troveManager, whitelist |
| `getRedemptionHints(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `_calculateVCAfterRedemption(address,uint256)` | **internal** | Yes | None | None direct | None |
| `getApproxHint(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: LiquitySafeMath128
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint128,uint128)` | **internal** | Yes | None | None direct | None |
| `sub(uint128,uint128)` | **internal** | Yes | None | None direct | None |

---

## Contract: IBorrowerOperations
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ICommunityIssuance
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address)` | **external** | Yes | None | None direct | None |
| `issueYETI()` | **external** | Yes | None | None direct | None |
| `sendYETI(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: StabilityPool
**Linearized C3 Inheritance Tree:** IStabilityPool -> ICollateralReceiver -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`
- Privilege: `uint256 SCALE_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | Yes | None | None direct | None |
| `registerFrontEnd(uint256)` | **external** | Yes | None | None direct | None |
| `offset(uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getDepositorGains(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getTotalYUSDDeposits()` | **external** | Yes | None | None direct | None |
| `getDepositorYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getFrontEndYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedYUSDDeposit(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedFrontEndStake(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getDepositSnapshotS(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperations, communityIssuance, sortedTroves, troveManager, troveManagerLiquidationsAddress, whitelist, whitelistAddress, yusdToken |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getTotalYUSDDeposits()` | **external** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_triggerYETIIssuance(ICommunityIssuance)` | **internal** | Yes | None | None direct | None |
| `_updateG(uint256)` | **internal** | Yes | None | None direct | epochToScaleToG |
| `_computeYETIPerUnitStaked(uint256,uint256)` | **internal** | Yes | None | None direct | lastYETIError |
| `offset(uint256,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `_computeRewardsPerUnitStaked(address[],uint256[],uint256,uint256)` | **internal** | Yes | None | None direct | lastAssetError_Offset, lastYUSDLossError_Offset |
| `_updateRewardSumAndProduct(address[],uint256[],uint256)` | **internal** | Yes | None | None direct | P, currentEpoch, currentScale, epochToScaleToSum |
| `_moveOffsetCollAndDebt(address[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_decreaseYUSD(uint256)` | **internal** | Yes | None | None direct | totalYUSDDeposits |
| `getDepositorGains(address)` | **public** | Yes | None | None direct | None |
| `_calculateGains(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `_getGainFromSnapshots(uint256,StabilityPool.Snapshots,address)` | **internal** | Yes | None | None direct | None |
| `getDepositorYETIGain(address)` | **public** | Yes | None | None direct | None |
| `getFrontEndYETIGain(address)` | **public** | Yes | None | None direct | None |
| `_getYETIGainFromSnapshots(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `getCompoundedYUSDDeposit(address)` | **public** | Yes | None | None direct | None |
| `getCompoundedFrontEndStake(address)` | **public** | Yes | None | None direct | None |
| `_getCompoundedStakeFromSnapshots(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `_sendYUSDtoStabilityPool(address,uint256)` | **internal** | Yes | None | None direct | totalYUSDDeposits |
| `_sendGainsToDepositor(address,address[],uint256[])` | **internal** | Yes | None | None direct | totalColl |
| `_sendYUSDToDepositor(address,uint256)` | **internal** | Yes | None | None direct | None |
| `registerFrontEnd(uint256)` | **external** | No (msg/tx) | None | None direct | frontEnds |
| `_setFrontEndTag(address,address)` | **internal** | Yes | None | None direct | deposits |
| `_updateDepositAndSnapshots(address,uint256)` | **internal** | Yes | None | None direct | depositSnapshots, deposits |
| `_updateFrontEndStakeAndSnapshots(address,uint256)` | **internal** | Yes | None | None direct | frontEndSnapshots, frontEndStakes |
| `_payOutYETIGains(ICommunityIssuance,address,address)` | **internal** | Yes | None | None direct | None |
| `_requireNoUnderCollateralizedTroves()` | **internal** | Yes | None | None direct | None |
| `_requireUserHasDeposit(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireUserHasNoDeposit(address)` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroAmount(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireFrontEndNotRegistered(address)` | **internal** | Yes | None | None direct | None |
| `_requireFrontEndIsRegisteredOrZero(address)` | **internal** | Yes | None | None direct | None |
| `_requireValidKickbackRate(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTML()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | totalColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | lastAssetError_Offset, totalColl |
| `getDepositSnapshotS(address,address)` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | P |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, SCALE_FACTOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: IsYETIRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |

---

## Contract: ShortLockupContract
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_YEAR`
- Privilege: `address beneficiary`
- Privilege: `IYETIToken yetiToken`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdrawYETI()` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBeneficiary] require(bool,string)(msg.sender == beneficiary,LockupContract: caller is not the beneficiary)` | None |
| `_requireCallerIsBeneficiary()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == beneficiary,LockupContract: caller is not the beneficiary)` | None |
| `_requireLockupDurationHasPassed()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment(uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME, SECONDS_IN_ONE_YEAR |

---

## Contract: YETIToken
**Linearized C3 Inheritance Tree:** IYETIToken -> IERC2612 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string _NAME`
- Privilege: `string _SYMBOL`
- Privilege: `string _VERSION`
- Privilege: `uint8 _DECIMALS`
- Privilege: `bytes32 _PERMIT_TYPEHASH`
- Privilege: `bytes32 _TYPE_HASH`
- Privilege: `bytes32 _CACHED_DOMAIN_SEPARATOR`
- Privilege: `uint256 _CACHED_CHAIN_ID`
- Privilege: `bytes32 _HASHED_NAME`
- Privilege: `bytes32 _HASHED_VERSION`
- Privilege: `uint256 deploymentStartTime`
- Privilege: `address sYETIAddress`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `sendToSYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `getDeploymentStartTime()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `sendToSYETI(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsSYETI] require(bool,string)(msg.sender == sYETIAddress,YETI: caller must be the SYETI contract)` | None |
| `domainSeparator()` | **public** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | _nonces |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `_chainID()` | **private** | Yes | None | None direct | None |
| `_buildDomainSeparator(bytes32,bytes32,bytes32)` | **private** | Yes | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_requireValidRecipient(address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsSYETI()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == sYETIAddress,YETI: caller must be the SYETI contract)` | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `getDeploymentStartTime()` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _1_MILLION |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _DECIMALS, _NAME, _SYMBOL, _TYPE_HASH, _VERSION |

---

## Contract: TeamLockup
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 vestingStart`
- Privilege: `uint256 vestingLength`
- Privilege: `uint256 totalVest`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `claimYeti(uint256)` | **external** | No (msg/tx) | onlyMultisig | `[Internal Call: onlyMultisig] require(bool,string)(msg.sender == multisig,Only the multisig can call this function.)`<br>`[Modifier: onlyMultisig] require(bool,string)(msg.sender == multisig,Only the multisig can call this function.)` | totalClaimed |
| `updateMultisig(address)` | **external** | No (msg/tx) | onlyMultisig | `[Internal Call: onlyMultisig] require(bool,string)(msg.sender == multisig,Only the multisig can call this function.)`<br>`[Modifier: onlyMultisig] require(bool,string)(msg.sender == multisig,Only the multisig can call this function.)` | multisig |
| `_min(uint256,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: LockupContract
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_YEAR`
- Privilege: `address beneficiary`
- Privilege: `IYETIToken yetiToken`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `withdrawYETI()` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBeneficiary] require(bool,string)(msg.sender == beneficiary,LockupContract: caller is not the beneficiary)` | None |
| `_requireCallerIsBeneficiary()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == beneficiary,LockupContract: caller is not the beneficiary)` | None |
| `_requireLockupDurationHasPassed()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment(uint256,IYETIToken)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME, SECONDS_IN_ONE_YEAR |

---

## Contract: LockupContractFactory
**Linearized C3 Inheritance Tree:** CheckContract -> Ownable -> ILockupContractFactory
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_YEAR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setYETITokenAddress(address)` | **external** | Yes | None | None direct | None |
| `deployLockupContract(address,uint256)` | **external** | Yes | None | None direct | None |
| `isRegisteredLockup(address)` | **external** | Yes | None | None direct | None |
| `setYETITokenAddress(address)` | **external** | No (msg/tx) | onlyOwner | None direct | yetiTokenAddress |
| `deployLockupContract(address,uint256)` | **external** | No (msg/tx) | None | None direct | lockupContractToDeployer |
| `isRegisteredLockup(address)` | **public** | Yes | None | None direct | None |
| `_requireYETIAddressIsSet(address)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME, SECONDS_IN_ONE_YEAR |

---

## Contract: BoringERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes4 SIG_SYMBOL`
- Privilege: `bytes4 SIG_NAME`
- Privilege: `bytes4 SIG_DECIMALS`
- Privilege: `bytes4 SIG_BALANCE_OF`
- Privilege: `bytes4 SIG_TRANSFER`
- Privilege: `bytes4 SIG_TRANSFER_FROM`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `returnDataToString(bytes)` | **internal** | Yes | None | None direct | None |
| `safeSymbol(IERC20)` | **internal** | Yes | None | None direct | None |
| `safeName(IERC20)` | **internal** | Yes | None | None direct | None |
| `safeDecimals(IERC20)` | **internal** | Yes | None | None direct | None |
| `safeBalanceOf(IERC20,address)` | **internal** | Yes | None | None direct | None |
| `safeTransfer(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safeTransferFrom(IERC20,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | SIG_BALANCE_OF, SIG_DECIMALS, SIG_NAME, SIG_SYMBOL, SIG_TRANSFER, SIG_TRANSFER_FROM |

---

## Contract: BoringMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `to128(uint256)` | **internal** | Yes | None | None direct | None |
| `to64(uint256)` | **internal** | Yes | None | None direct | None |
| `to32(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: BoringMath128
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint128,uint128)` | **internal** | Yes | None | None direct | None |
| `sub(uint128,uint128)` | **internal** | Yes | None | None direct | None |

---

## Contract: BoringMath64
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint64,uint64)` | **internal** | Yes | None | None direct | None |
| `sub(uint64,uint64)` | **internal** | Yes | None | None direct | None |

---

## Contract: BoringMath32
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint32,uint32)` | **internal** | Yes | None | None direct | None |
| `sub(uint32,uint32)` | **internal** | Yes | None | None direct | None |

---

## Contract: ERC20Data
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: ERC20WithSupply
**Linearized C3 Inheritance Tree:** ERC20 -> Domain -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | balanceOf |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance, balanceOf |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | allowance, nonces |
| `_calculateDomainSeparator(uint256)` | **private** | Yes | None | None direct | None |
| `_domainSeparator()` | **internal** | Yes | None | None direct | None |
| `_getDigest(bytes32)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |

---

## Contract: sYETIToken
**Linearized C3 Inheritance Tree:** BoringOwnable -> BoringOwnableData -> Domain -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address pendingOwner`
- Privilege: `string symbol`
- Privilege: `string name`
- Privilege: `uint8 decimals`
- Privilege: `uint256 LOCK_TIME`
- Privilege: `bytes32 PERMIT_SIGNATURE_HASH`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transferOwnership(address,bool,bool)` | **public** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | owner, pendingOwner |
| `claimOwnership()` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == _pendingOwner,Ownable: caller != pending owner)` | owner, pendingOwner |
| `_calculateDomainSeparator(uint256)` | **private** | Yes | None | None direct | None |
| `_domainSeparator()` | **internal** | Yes | None | None direct | None |
| `_getDigest(bytes32)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `setAddresses(IYETIToken,IERC20)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | addressesSet, yetiToken, yusdToken |
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | users |
| `_useAllowance(address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowance |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | allowance, nonces |
| `mint(uint256)` | **public** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, totalSupply, users |
| `_burn(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, totalSupply, users |
| `burn(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `buyBack(address,uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | None |
| `publicBuyBack(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_buyBack(address,uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | lastBuybackPrice, lastBuybackTime |
| `rebase()` | **external** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, lastRebaseTime |
| `_getValueOfContract(uint256)` | **internal** | Yes | None | None direct | None |
| `setTransferRatio(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | transferRatio |
| `addValidRouter(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | validRouters |
| `removeValidRouter(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | validRouters |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | LOCK_TIME, PERMIT_SIGNATURE_HASH, decimals, name, symbol |

---

## Contract: CommunityIssuance
**Linearized C3 Inheritance Tree:** BaseMath -> CheckContract -> Ownable -> ICommunityIssuance
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_MINUTE`
- Privilege: `uint256 ISSUANCE_FACTOR`
- Privilege: `uint256 YETISupplyCap`
- Privilege: `uint256 deploymentTime`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address)` | **external** | Yes | None | None direct | None |
| `issueYETI()` | **external** | Yes | None | None direct | None |
| `sendYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | stabilityPoolAddress, yetiToken |
| `issueYETI()` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | totalYETIIssued |
| `_getCumulativeIssuanceFraction()` | **internal** | No (msg/tx) | None | None direct | None |
| `sendYETI(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | None |
| `_requireCallerIsStabilityPool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, ISSUANCE_FACTOR, NAME, SECONDS_IN_ONE_MINUTE, YETISupplyCap |

---

## Contract: dummyUniV2Router
**Linearized C3 Inheritance Tree:** BoringOwnable -> BoringOwnableData -> IsYETIRouter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address pendingOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transferOwnership(address,bool,bool)` | **public** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | owner, pendingOwner |
| `claimOwnership()` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == _pendingOwner,Ownable: caller != pending owner)` | owner, pendingOwner |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `setup(address,address,address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Internal Call: transferOwnership] [Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | JOERouter, JOERouterAddress, path, yetiToken, yusdToken |
| `swap(uint256,uint256,address)` | **external** | No (msg/tx) | None | None direct | None |

---

## Contract: IRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `swapExactTokensForTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: Domain
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 DOMAIN_SEPARATOR_SIGNATURE_HASH`
- Privilege: `string EIP191_PREFIX_FOR_EIP712_STRUCTURED_DATA`
- Privilege: `bytes32 _DOMAIN_SEPARATOR`
- Privilege: `uint256 DOMAIN_SEPARATOR_CHAIN_ID`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_calculateDomainSeparator(uint256)` | **private** | Yes | None | None direct | None |
| `_domainSeparator()` | **internal** | Yes | None | None direct | None |
| `_getDigest(bytes32)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DOMAIN_SEPARATOR_SIGNATURE_HASH, EIP191_PREFIX_FOR_EIP712_STRUCTURED_DATA |

---

## Contract: BoringBatchable
**Linearized C3 Inheritance Tree:** BaseBoringBatchable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_getRevertMsg(bytes)` | **internal** | Yes | None | None direct | None |
| `batch(bytes[],bool)` | **external** | Yes | None | None direct | None |
| `permitToken(IERC20,address,address,uint256,uint256,uint8,bytes32,bytes32)` | **public** | Yes | None | None direct | None |

---

## Contract: BoringOwnable
**Linearized C3 Inheritance Tree:** BoringOwnableData
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address pendingOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transferOwnership(address,bool,bool)` | **public** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | owner, pendingOwner |
| `claimOwnership()` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == _pendingOwner,Ownable: caller != pending owner)` | owner, pendingOwner |

---

## Contract: YetiCustomBase
**Linearized C3 Inheritance Tree:** BaseMath
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION |

---

## Contract: BaseMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION |

---

## Contract: TroveManagerBase
**Linearized C3 Inheritance Tree:** CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: ReentrancyGuard
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 _NOT_ENTERED`
- Privilege: `uint256 _ENTERED`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _ENTERED, _NOT_ENTERED |

---

## Contract: CheckContract
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |

---

## Contract: HomoraMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `divCeil(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `fmul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `fdiv(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sqrt(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: Ownable
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _owner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |

---

## Contract: LiquityBase
**Linearized C3 Inheritance Tree:** YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: TellorCaller
**Linearized C3 Inheritance Tree:** ITellorCaller
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getTellorCurrentValue(uint256)` | **external** | Yes | None | None direct | None |
| `getTellorCurrentValue(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ITellor
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `beginDispute(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `vote(uint256,bool)` | **external** | Yes | None | None direct | None |
| `tallyVotes(uint256)` | **external** | Yes | None | None direct | None |
| `proposeFork(address)` | **external** | Yes | None | None direct | None |
| `addTip(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `submitMiningSolution(string,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `submitMiningSolution(string,uint256[5],uint256[5])` | **external** | Yes | None | None direct | None |
| `proposeOwnership(address)` | **external** | Yes | None | None direct | None |
| `claimOwnership()` | **external** | Yes | None | None direct | None |
| `depositStake()` | **external** | Yes | None | None direct | None |
| `requestStakingWithdraw()` | **external** | Yes | None | None direct | None |
| `withdrawStake()` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `getNewCurrentVariables()` | **external** | Yes | None | None direct | None |
| `getTopRequestIDs()` | **external** | Yes | None | None direct | None |
| `getNewVariablesOnDeck()` | **external** | Yes | None | None direct | None |
| `updateTellor(uint256)` | **external** | Yes | None | None direct | None |
| `unlockDisputeFee(uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `allowedToTrade(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `balanceOfAt(address,uint256)` | **external** | Yes | None | None direct | None |
| `didMine(bytes32,address)` | **external** | Yes | None | None direct | None |
| `didVote(uint256,address)` | **external** | Yes | None | None direct | None |
| `getAddressVars(bytes32)` | **external** | Yes | None | None direct | None |
| `getAllDisputeVars(uint256)` | **external** | Yes | None | None direct | None |
| `getCurrentVariables()` | **external** | Yes | None | None direct | None |
| `getDisputeIdByDisputeHash(bytes32)` | **external** | Yes | None | None direct | None |
| `getDisputeUintVars(uint256,bytes32)` | **external** | Yes | None | None direct | None |
| `getLastNewValue()` | **external** | Yes | None | None direct | None |
| `getLastNewValueById(uint256)` | **external** | Yes | None | None direct | None |
| `getMinedBlockNum(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getMinersByRequestIdAndTimestamp(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getNewValueCountbyRequestId(uint256)` | **external** | Yes | None | None direct | None |
| `getRequestIdByRequestQIndex(uint256)` | **external** | Yes | None | None direct | None |
| `getRequestIdByTimestamp(uint256)` | **external** | Yes | None | None direct | None |
| `getRequestIdByQueryHash(bytes32)` | **external** | Yes | None | None direct | None |
| `getRequestQ()` | **external** | Yes | None | None direct | None |
| `getRequestUintVars(uint256,bytes32)` | **external** | Yes | None | None direct | None |
| `getRequestVars(uint256)` | **external** | Yes | None | None direct | None |
| `getStakerInfo(address)` | **external** | Yes | None | None direct | None |
| `getSubmissionsByTimestamp(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getTimestampbyRequestIDandIndex(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getUintVar(bytes32)` | **external** | Yes | None | None direct | None |
| `getVariablesOnDeck()` | **external** | Yes | None | None direct | None |
| `isInDispute(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `retrieveData(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |

---

## Contract: TokenScript
**Linearized C3 Inheritance Tree:** CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `IERC20 token`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: BorrowerOperationsScript
**Linearized C3 Inheritance Tree:** CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IBorrowerOperations borrowerOperations`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |

---

## Contract: ETHTransferScript
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transferETH(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: SYETIScript
**Linearized C3 Inheritance Tree:** CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `ISYETI SYETI`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `stake(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: TroveManagerScript
**Linearized C3 Inheritance Tree:** CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `ITroveManager troveManager`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: BorrowerWrappersScript
**Linearized C3 Inheritance Tree:** SYETIScript -> ETHTransferScript -> BorrowerOperationsScript -> CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IBorrowerOperations borrowerOperations`
- Privilege: `ISYETI SYETI`
- Privilege: `bytes32 NAME`
- Privilege: `ITroveManager troveManager`
- Privilege: `IStabilityPool stabilityPool`
- Privilege: `IERC20 yusdToken`
- Privilege: `IERC20 yetiToken`
- Privilege: `ISYETI sYETI`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `transferETH(address,uint256)` | **external** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |
| `_requireUserHasTrove(address)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: StabilityPoolScript
**Linearized C3 Inheritance Tree:** CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`
- Privilege: `IStabilityPool stabilityPool`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: IRewarder
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: IMasterChefJoeV2
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deposit(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `poolInfo(uint256)` | **external** | Yes | None | None direct | None |
| `poolLength()` | **external** | Yes | None | None direct | None |

---

## Contract: WJLP
**Linearized C3 Inheritance Tree:** IWAsset -> ERC20_8 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IERC20 JLP`
- Privilege: `IERC20 JOE`
- Privilege: `IMasterChefJoeV2 _MasterChefJoe`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `wrap(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `unwrap(uint256)` | **external** | Yes | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `updateReward(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | Yes | None | None direct | None |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `endTreasuryReward(address,uint256)` | **external** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | balances |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | allowed |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transferFrom(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowed, balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | TML, TMR, YetiFinanceTreasury, activePool, addressesSet, borrowerOperations, collSurplusPool, defaultPool, stabilityPool |
| `wrap(uint256,address,address,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == _from,WJLP: msg.sender and _from must be the same)` | userInfo |
| `unwrap(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `[Internal Call: transfer] require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | None |
| `unwrapFor(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsPool] require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool || msg.sender == collSurplusPool),Caller is not active pool or stability pool)` | userInfo |
| `endTreasuryReward(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsSPorDP] require(bool,string)((msg.sender == stabilityPool || msg.sender == defaultPool),Caller is not stability pool or default pool)` | None |
| `updateReward(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsLRDorBO] require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool || msg.sender == borrowerOperations),Caller is not LRD)` | None |
| `_updateReward(address,address,uint256)` | **internal** | Yes | None | None direct | userInfo |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_sendJoeReward(address,address)` | **internal** | Yes | None | None direct | userInfo |
| `_userUpdate(address,uint256,bool)` | **private** | Yes | None | None direct | userInfo |
| `_safeJoeTransfer(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsPool()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool || msg.sender == collSurplusPool),Caller is not active pool or stability pool)` | None |
| `_requireCallerIsSPorDP()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == stabilityPool || msg.sender == defaultPool),Caller is not stability pool or default pool)` | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == activePool,Caller is not active pool)` | None |
| `_requireCallerIsLRDorBO()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool || msg.sender == borrowerOperations),Caller is not LRD)` | None |
| `_requireCallerIsSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPool,Caller is not stability pool)` | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |

---

## Contract: IComptroller
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `claimReward(uint8,address,address[])` | **external** | Yes | None | None direct | None |
| `claimReward(uint8,address)` | **external** | Yes | None | None direct | None |

---

## Contract: WBQI
**Linearized C3 Inheritance Tree:** IWAsset -> ERC20_8 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `wrap(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `unwrap(uint256)` | **external** | Yes | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `updateReward(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | Yes | None | None direct | None |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `endTreasuryReward(address,uint256)` | **external** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | balances |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | allowed |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transferFrom(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowed, balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address)` | **external** | Yes | None | None direct | TML, TMR, YetiFinanceTreasury, activePool, addressesSet, defaultPool, stabilityPool |
| `wrap(uint256,address,address,address)` | **external** | No (msg/tx) | None | None direct | userInfo |
| `accumulateRewards(address)` | **internal** | Yes | None | None direct | globalAVAXRewardPending, globalQIRewardPending, userInfo |
| `unwrap(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsAPorSP] require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)` | None |
| `endTreasuryReward(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsSP] require(bool,string)(msg.sender == stabilityPool,Caller is not stability pool)` | userInfo |
| `updateReward(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsLRD] require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool),Caller is not LRD)` | userInfo |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_sendReward(address,address)` | **internal** | Yes | None | None direct | userInfo |
| `_safeRewardsTransfer(address,uint256,uint256)` | **internal** | Yes | None | None direct | globalAVAXRewardPending, globalQIRewardPending |
| `_requireCallerIsAPorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)` | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == activePool,Caller is not active pool)` | None |
| `_requireCallerIsLRD()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool),Caller is not LRD)` | None |
| `_requireCallerIsSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPool,Caller is not stability pool)` | None |
| `fallback()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | SHAREOFFSET, qiTokens |

---

## Contract: WAAVE
**Linearized C3 Inheritance Tree:** IWAsset -> ERC20_8 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `wrap(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `unwrap(uint256)` | **external** | Yes | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `updateReward(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `claimReward(address)` | **external** | Yes | None | None direct | None |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `endTreasuryReward(address,uint256)` | **external** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | balances |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | allowed |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transferFrom(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowed, balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address)` | **external** | Yes | None | None direct | TML, TMR, YetiFinanceTreasury, activePool, addressesSet, defaultPool, stabilityPool |
| `wrap(uint256,address,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `aavePerShare()` | **public** | Yes | None | None direct | None |
| `unwrap(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `unwrapFor(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsAPorSP] require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)` | None |
| `endTreasuryReward(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsSP] require(bool,string)(msg.sender == stabilityPool,Caller is not stability pool)` | None |
| `updateReward(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsLRD] require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool),Caller is not LRD)` | None |
| `getPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **external** | Yes | None | None direct | None |
| `claimRewardTreasury()` | **external** | No (msg/tx) | None | `require(bool)(msg.sender == YetiFinanceTreasury)` | None |
| `claimReward(address)` | **external** | Yes | None | None direct | None |
| `_requireCallerIsAPorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)` | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == activePool,Caller is not active pool)` | None |
| `_requireCallerIsLRD()` | **internal** | No (msg/tx) | None | `require(bool,string)((msg.sender == TML || msg.sender == TMR || msg.sender == defaultPool),Caller is not LRD)` | None |
| `_requireCallerIsSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPool,Caller is not stability pool)` | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | SHAREOFFSET |

---

## Contract: ERC20_8
**Linearized C3 Inheritance Tree:** IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | balances |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | allowed |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transferFrom(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowed, balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _totalSupply, balances |

---

## Contract: IZap
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `zapInToken(address,uint256,address)` | **external** | Yes | None | None direct | None |
| `zapIn(address)` | **external** | Yes | None | None direct | None |
| `zapOut(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IBaseOracle
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getPrice(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IUniswapV2Pair
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
| `PERMIT_TYPEHASH()` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `MINIMUM_LIQUIDITY()` | **external** | Yes | None | None direct | None |
| `factory()` | **external** | Yes | None | None direct | None |
| `token0()` | **external** | Yes | None | None direct | None |
| `token1()` | **external** | Yes | None | None direct | None |
| `getReserves()` | **external** | Yes | None | None direct | None |
| `price0CumulativeLast()` | **external** | Yes | None | None direct | None |
| `price1CumulativeLast()` | **external** | Yes | None | None direct | None |
| `kLast()` | **external** | Yes | None | None direct | None |
| `mint(address)` | **external** | Yes | None | None direct | None |
| `burn(address)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address,bytes)` | **external** | Yes | None | None direct | None |
| `skim(address)` | **external** | Yes | None | None direct | None |
| `sync()` | **external** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: UniswapV2LPTokenPriceFeed
**Linearized C3 Inheritance Tree:** Ownable -> IPriceFeed
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `setParam(IBaseOracle,address)` | **external** | No (msg/tx) | onlyOwner | None direct | base, pair |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |

---

## Contract: IQIToken
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `exchangeRateCurrent()` | **external** | Yes | None | None direct | None |
| `underlying()` | **external** | Yes | None | None direct | None |

---

## Contract: BQIOracle
**Linearized C3 Inheritance Tree:** Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setParam(IBaseOracle,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | BQI, base, underlying |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `fetchPrice()` | **external** | Yes | None | None direct | None |

---

## Contract: IWAAVE
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `aavePerShare()` | **external** | Yes | None | None direct | None |

---

## Contract: AAVEOracle
**Linearized C3 Inheritance Tree:** Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setParam(IBaseOracle,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | WAAVE, base, underlying |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `fetchPrice()` | **external** | Yes | None | None direct | None |

---

## Contract: IJoeZapper
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `zapInToken(address,uint256,address)` | **external** | Yes | None | None direct | None |
| `zapIn(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IPool
**Linearized C3 Inheritance Tree:** ICollateralReceiver
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILockupContractFactory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setYETITokenAddress(address)` | **external** | Yes | None | None direct | None |
| `deployLockupContract(address,uint256)` | **external** | Yes | None | None direct | None |
| `isRegisteredLockup(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IERC2612
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |

---

## Contract: IOracle
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getPrice()` | **external** | Yes | None | None direct | None |
| `getValue(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILiquityBase
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |

---

## Contract: ICollateralReceiver
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |

---

## Contract: ITraderJoeZap
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `zapOut(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ERC20Router
**Linearized C3 Inheritance Tree:** IYetiRouter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `route(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `unRoute(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `route(address,address,address,uint256,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `unRoute(address,address,address,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |

---

## Contract: WJLPRouter
**Linearized C3 Inheritance Tree:** IYetiRouter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `route(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `unRoute(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `route(address,address,address,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `unRoute(address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `_wrapJLP(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `_zapInAvax(uint256)` | **internal** | Yes | None | None direct | None |
| `_zapInToken(address,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: Unipool
**Linearized C3 Inheritance Tree:** IUnipool -> CheckContract -> Ownable -> LPTokenWrapper -> ILPTokenWrapper
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **external** | Yes | None | None direct | None |
| `rewardPerToken()` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `withdrawAndClaim()` | **external** | Yes | None | None direct | None |
| `claimReward()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `stake(uint256)` | **public** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `withdraw(uint256)` | **public** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `setParams(address,address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | duration, uniToken, yetiToken |
| `lastTimeRewardApplicable()` | **public** | No (msg/tx) | None | None direct | None |
| `rewardPerToken()` | **public** | No (msg/tx) | None | None direct | None |
| `earned(address)` | **public** | No (msg/tx) | None | None direct | None |
| `stake(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `withdraw(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `withdrawAndClaim()` | **external** | No (msg/tx) | None | None direct | None |
| `claimReward()` | **public** | No (msg/tx) | None | None direct | rewards |
| `_notifyRewardAmount(uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | lastUpdateTime, periodFinish, rewardRate |
| `_updatePeriodFinish()` | **internal** | No (msg/tx) | None | None direct | periodFinish |
| `_updateReward()` | **internal** | No (msg/tx) | None | None direct | lastUpdateTime, rewardPerTokenStored |
| `_updateAccountReward(address)` | **internal** | No (msg/tx) | None | None direct | rewards, userRewardPerTokenPaid |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | periodFinish, rewardRate |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: Pool2Unipool
**Linearized C3 Inheritance Tree:** IUnipool -> CheckContract -> Ownable -> LPTokenWrapper -> ILPTokenWrapper
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **external** | Yes | None | None direct | None |
| `rewardPerToken()` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `withdrawAndClaim()` | **external** | Yes | None | None direct | None |
| `claimReward()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `stake(uint256)` | **public** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `withdraw(uint256)` | **public** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `setParams(address,address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | uniToken, yetiToken |
| `setReward(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | duration |
| `lastTimeRewardApplicable()` | **public** | No (msg/tx) | None | None direct | None |
| `rewardPerToken()` | **public** | No (msg/tx) | None | None direct | None |
| `earned(address)` | **public** | No (msg/tx) | None | None direct | None |
| `stake(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `withdraw(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `withdrawAndClaim()` | **external** | No (msg/tx) | None | None direct | None |
| `claimReward()` | **public** | No (msg/tx) | None | None direct | rewards |
| `_notifyRewardAmount(uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | lastUpdateTime, periodFinish, rewardRate |
| `_updatePeriodFinish()` | **internal** | No (msg/tx) | None | None direct | periodFinish |
| `_updateReward()` | **internal** | No (msg/tx) | None | None direct | lastUpdateTime, rewardPerTokenStored |
| `_updateAccountReward(address)` | **internal** | No (msg/tx) | None | None direct | rewards, userRewardPerTokenPaid |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | periodFinish, rewardRate |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: ILPTokenWrapper
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IUnipool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **external** | Yes | None | None direct | None |
| `rewardPerToken()` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `withdrawAndClaim()` | **external** | Yes | None | None direct | None |
| `claimReward()` | **external** | Yes | None | None direct | None |

---

## Contract: ERC20Mock
**Linearized C3 Inheritance Tree:** ERC20 -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `decimals()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `mint(address,uint256)` | **public** | Yes | None | None direct | None |
| `burn(address,uint256)` | **public** | Yes | None | None direct | None |
| `transferInternal(address,address,uint256)` | **public** | Yes | None | None direct | None |
| `approveInternal(address,address,uint256)` | **public** | Yes | None | None direct | None |

---

## Contract: StabilityPoolTester
**Linearized C3 Inheritance Tree:** StabilityPool -> IStabilityPool -> ICollateralReceiver -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`
- Privilege: `uint256 SCALE_FACTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperations, communityIssuance, sortedTroves, troveManager, troveManagerLiquidationsAddress, whitelist, whitelistAddress, yusdToken |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getTotalYUSDDeposits()` | **external** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_triggerYETIIssuance(ICommunityIssuance)` | **internal** | Yes | None | None direct | None |
| `_updateG(uint256)` | **internal** | Yes | None | None direct | epochToScaleToG |
| `_computeYETIPerUnitStaked(uint256,uint256)` | **internal** | Yes | None | None direct | lastYETIError |
| `offset(uint256,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `_computeRewardsPerUnitStaked(address[],uint256[],uint256,uint256)` | **internal** | Yes | None | None direct | lastAssetError_Offset, lastYUSDLossError_Offset |
| `_updateRewardSumAndProduct(address[],uint256[],uint256)` | **internal** | Yes | None | None direct | P, currentEpoch, currentScale, epochToScaleToSum |
| `_moveOffsetCollAndDebt(address[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_decreaseYUSD(uint256)` | **internal** | Yes | None | None direct | totalYUSDDeposits |
| `getDepositorGains(address)` | **public** | Yes | None | None direct | None |
| `_calculateGains(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `_getGainFromSnapshots(uint256,StabilityPool.Snapshots,address)` | **internal** | Yes | None | None direct | None |
| `getDepositorYETIGain(address)` | **public** | Yes | None | None direct | None |
| `getFrontEndYETIGain(address)` | **public** | Yes | None | None direct | None |
| `_getYETIGainFromSnapshots(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `getCompoundedYUSDDeposit(address)` | **public** | Yes | None | None direct | None |
| `getCompoundedFrontEndStake(address)` | **public** | Yes | None | None direct | None |
| `_getCompoundedStakeFromSnapshots(uint256,StabilityPool.Snapshots)` | **internal** | Yes | None | None direct | None |
| `_sendYUSDtoStabilityPool(address,uint256)` | **internal** | Yes | None | None direct | totalYUSDDeposits |
| `_sendGainsToDepositor(address,address[],uint256[])` | **internal** | Yes | None | None direct | totalColl |
| `_sendYUSDToDepositor(address,uint256)` | **internal** | Yes | None | None direct | None |
| `registerFrontEnd(uint256)` | **external** | No (msg/tx) | None | None direct | frontEnds |
| `_setFrontEndTag(address,address)` | **internal** | Yes | None | None direct | deposits |
| `_updateDepositAndSnapshots(address,uint256)` | **internal** | Yes | None | None direct | depositSnapshots, deposits |
| `_updateFrontEndStakeAndSnapshots(address,uint256)` | **internal** | Yes | None | None direct | frontEndSnapshots, frontEndStakes |
| `_payOutYETIGains(ICommunityIssuance,address,address)` | **internal** | Yes | None | None direct | None |
| `_requireNoUnderCollateralizedTroves()` | **internal** | Yes | None | None direct | None |
| `_requireUserHasDeposit(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireUserHasNoDeposit(address)` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroAmount(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireFrontEndNotRegistered(address)` | **internal** | Yes | None | None direct | None |
| `_requireFrontEndIsRegisteredOrZero(address)` | **internal** | Yes | None | None direct | None |
| `_requireValidKickbackRate(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTML()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | totalColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | lastAssetError_Offset, totalColl |
| `getDepositSnapshotS(address,address)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `provideToSP(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawFromSP(uint256)` | **external** | Yes | None | None direct | None |
| `registerFrontEnd(uint256)` | **external** | Yes | None | None direct | None |
| `offset(uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getDepositorGains(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getTotalYUSDDeposits()` | **external** | Yes | None | None direct | None |
| `getDepositorYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getFrontEndYETIGain(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedYUSDDeposit(address)` | **external** | Yes | None | None direct | None |
| `getCompoundedFrontEndStake(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getDepositSnapshotS(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | P |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, SCALE_FACTOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: DefaultPoolTester
**Linearized C3 Inheritance Tree:** DefaultPool -> YetiCustomBase -> BaseMath -> IDefaultPool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `string NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePoolAddress, troveManagerAddress, whitelist, whitelistAddress, yetiFinanceTreasury |
| `getCollateral(address)` | **public** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `_sendCollateral(address,uint256)` | **internal** | Yes | None | None direct | poolColl |
| `sendCollsToActivePool(address[],uint256[],address)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `decreaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `_requireCallerIsActivePool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTroveManager()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | poolColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | poolColl |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `sendCollsToActivePool(address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `unprotectedIncreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | YUSDDebt |
| `unprotectedPayable()` | **external** | Yes | None | None direct | None |
| `getEthAmount()` | **external** | Yes | None | None direct | None |
| `getCollateralVCC(address)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, NAME |

---

## Contract: BorrowerOperationsTester
**Linearized C3 Inheritance Tree:** BorrowerOperations -> ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`
- Privilege: `uint256 BOOTSTRAP_PERIOD`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, collSurplusPool, defaultPool, deploymentTime, gasPoolAddress, sYETIAddress, sortedTroves, stabilityPoolAddress, troveManager, whitelist, yusdToken |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_singleLeverUp(address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_openTroveInternal(address,uint256,uint256,uint256,address,address,address[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_adjustTrove(BorrowerOperations.AdjustTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `_singleUnleverUp(address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_unleverColls(IActivePool,address[],uint256[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTrove()` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_closeTrove(BorrowerOperations.CloseTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `claimCollateral()` | **external** | No (msg/tx) | None | None direct | None |
| `_getTotalVariableDepositFee(address[],uint256[],uint256,uint256,uint256,uint256,BorrowerOperations.ContractsCache)` | **internal** | No (msg/tx) | None | None direct | None |
| `_transferCollateralsIntoActivePool(address,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_singleTransferCollateralIntoActivePool(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerBorrowingFee(ITroveManager,IYUSDToken,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerDepositFee(IYUSDToken,uint256)` | **internal** | Yes | None | None direct | None |
| `_updateTroveFromAdjustment(ITroveManager,address,address[],uint256[],uint256,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_getNewPortfolio(address[],uint256[],address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_moveYUSD(IActivePool,IYUSDToken,address,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawYUSD(IActivePool,IYUSDToken,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_repayYUSD(IActivePool,IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidDepositCollateral(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroAdjustment(uint256[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_arrayIsNonzero(uint256[])` | **internal** | Yes | None | None direct | None |
| `_isBeforeFeeBootstrapPeriod()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireTroveisActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireTroveisNotActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroDebtChange(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNoOverlapColls(address[],address[])` | **internal** | Yes | None | None direct | None |
| `_requireNoDuplicateColls(address[])` | **internal** | Yes | None | None direct | None |
| `_requireNotInRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireNoCollWithdrawal(uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireLengthNonzero(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireLengthsEqual(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidAdjustmentInCurrentMode(bool,uint256[],bool,BorrowerOperations.LocalVariables_adjustTrove)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveMCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewICRisAboveOldICR(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewTCRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireAtLeastMinNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidYUSDRepayment(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireSufficientYUSDBalance(IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidMaxFeePercentage(uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewICRFromTroveChange(uint256,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewTCRFromTroveChange(uint256,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `getNewICRFromTroveChange(uint256,uint256,uint256,bool)` | **external** | Yes | None | None direct | None |
| `getNewTCRFromTroveChange(uint256,bool,uint256,bool)` | **external** | Yes | None | None direct | None |
| `getVC(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sumColls(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `get_MIN_NET_DEBT()` | **external** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: console
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address CONSOLE_ADDRESS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sendLogPayload(bytes)` | **private** | Yes | None | None direct | None |
| `log()` | **internal** | Yes | None | None direct | None |
| `logInt(int256)` | **internal** | Yes | None | None direct | None |
| `logUint(uint256)` | **internal** | Yes | None | None direct | None |
| `logString(string)` | **internal** | Yes | None | None direct | None |
| `logBool(bool)` | **internal** | Yes | None | None direct | None |
| `logAddress(address)` | **internal** | Yes | None | None direct | None |
| `logBytes(bytes)` | **internal** | Yes | None | None direct | None |
| `logBytes1(bytes1)` | **internal** | Yes | None | None direct | None |
| `logBytes2(bytes2)` | **internal** | Yes | None | None direct | None |
| `logBytes3(bytes3)` | **internal** | Yes | None | None direct | None |
| `logBytes4(bytes4)` | **internal** | Yes | None | None direct | None |
| `logBytes5(bytes5)` | **internal** | Yes | None | None direct | None |
| `logBytes6(bytes6)` | **internal** | Yes | None | None direct | None |
| `logBytes7(bytes7)` | **internal** | Yes | None | None direct | None |
| `logBytes8(bytes8)` | **internal** | Yes | None | None direct | None |
| `logBytes9(bytes9)` | **internal** | Yes | None | None direct | None |
| `logBytes10(bytes10)` | **internal** | Yes | None | None direct | None |
| `logBytes11(bytes11)` | **internal** | Yes | None | None direct | None |
| `logBytes12(bytes12)` | **internal** | Yes | None | None direct | None |
| `logBytes13(bytes13)` | **internal** | Yes | None | None direct | None |
| `logBytes14(bytes14)` | **internal** | Yes | None | None direct | None |
| `logBytes15(bytes15)` | **internal** | Yes | None | None direct | None |
| `logBytes16(bytes16)` | **internal** | Yes | None | None direct | None |
| `logBytes17(bytes17)` | **internal** | Yes | None | None direct | None |
| `logBytes18(bytes18)` | **internal** | Yes | None | None direct | None |
| `logBytes19(bytes19)` | **internal** | Yes | None | None direct | None |
| `logBytes20(bytes20)` | **internal** | Yes | None | None direct | None |
| `logBytes21(bytes21)` | **internal** | Yes | None | None direct | None |
| `logBytes22(bytes22)` | **internal** | Yes | None | None direct | None |
| `logBytes23(bytes23)` | **internal** | Yes | None | None direct | None |
| `logBytes24(bytes24)` | **internal** | Yes | None | None direct | None |
| `logBytes25(bytes25)` | **internal** | Yes | None | None direct | None |
| `logBytes26(bytes26)` | **internal** | Yes | None | None direct | None |
| `logBytes27(bytes27)` | **internal** | Yes | None | None direct | None |
| `logBytes28(bytes28)` | **internal** | Yes | None | None direct | None |
| `logBytes29(bytes29)` | **internal** | Yes | None | None direct | None |
| `logBytes30(bytes30)` | **internal** | Yes | None | None direct | None |
| `logBytes31(bytes31)` | **internal** | Yes | None | None direct | None |
| `logBytes32(bytes32)` | **internal** | Yes | None | None direct | None |
| `log(uint256)` | **internal** | Yes | None | None direct | None |
| `log(string)` | **internal** | Yes | None | None direct | None |
| `log(bool)` | **internal** | Yes | None | None direct | None |
| `log(address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(uint256,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(string,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(bool,address,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,string,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,bool,address,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,string,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,bool,address)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,string)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `log(address,address,address,address)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CONSOLE_ADDRESS |

---

## Contract: MockAggregator
**Linearized C3 Inheritance Tree:** AggregatorV3Interface
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `decimals()` | **external** | Yes | None | None direct | None |
| `description()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `getRoundData(uint80)` | **external** | Yes | None | None direct | None |
| `latestRoundData()` | **external** | Yes | None | None direct | None |
| `setDecimals(uint8)` | **external** | Yes | None | None direct | decimalsVal |
| `setPrice(int256)` | **external** | Yes | None | None direct | price |
| `setPrevPrice(int256)` | **external** | Yes | None | None direct | prevPrice |
| `setPrevUpdateTime(uint256)` | **external** | Yes | None | None direct | prevUpdateTime |
| `setUpdateTime(uint256)` | **external** | Yes | None | None direct | updateTime |
| `setLatestRevert()` | **external** | Yes | None | None direct | latestRevert |
| `setPrevRevert()` | **external** | Yes | None | None direct | prevRevert |
| `setDecimalsRevert()` | **external** | Yes | None | None direct | decimalsRevert |
| `setLatestRoundId(uint80)` | **external** | Yes | None | None direct | latestRoundId |
| `setPrevRoundId(uint80)` | **external** | Yes | None | None direct | prevRoundId |
| `decimals()` | **external** | Yes | None | None direct | None |
| `latestRoundData()` | **external** | Yes | None | None direct | None |
| `getRoundData(uint80)` | **external** | Yes | None | None direct | None |
| `description()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | decimalsVal |

---

## Contract: LiquitySafeMath128Tester
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `add(uint128,uint128)` | **external** | Yes | None | None direct | None |
| `sub(uint128,uint128)` | **external** | Yes | None | None direct | None |

---

## Contract: FunctionCaller
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setTroveManagerAddress(address)` | **external** | Yes | None | None direct | troveManager, troveManagerAddress |
| `setSortedTrovesAddress(address)` | **external** | Yes | None | None direct | sortedTroves, troveManagerAddress |
| `setPriceFeedAddress(address)` | **external** | Yes | None | None direct | priceFeed, priceFeedAddress |
| `troveManager_getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `sortedTroves_findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: PriceFeedTestnet
**Linearized C3 Inheritance Tree:** IPriceFeed
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `getPrice()` | **external** | Yes | None | None direct | None |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `setPrice(uint256)` | **external** | Yes | None | None direct | _price |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _price |

---

## Contract: MockTellor
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setPrice(uint256)` | **external** | Yes | None | None direct | price |
| `setDidRetrieve(bool)` | **external** | Yes | None | None direct | didRetrieve |
| `setUpdateTime(uint256)` | **external** | Yes | None | None direct | updateTime |
| `setRevertRequest()` | **external** | Yes | None | None direct | revertRequest |
| `getTimestampbyRequestIDandIndex(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getNewValueCountbyRequestId(uint256)` | **external** | Yes | None | None direct | None |
| `retrieveData(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | didRetrieve |

---

## Contract: Destructible
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receive()` | **external** | Yes | None | None direct | None |
| `destruct(address)` | **external** | Yes | None | None direct | None |

---

## Contract: CommunityIssuanceTester
**Linearized C3 Inheritance Tree:** CommunityIssuance -> BaseMath -> CheckContract -> Ownable -> ICommunityIssuance
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_MINUTE`
- Privilege: `uint256 ISSUANCE_FACTOR`
- Privilege: `uint256 YETISupplyCap`
- Privilege: `uint256 deploymentTime`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | stabilityPoolAddress, yetiToken |
| `issueYETI()` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | totalYETIIssued |
| `_getCumulativeIssuanceFraction()` | **internal** | No (msg/tx) | None | None direct | None |
| `sendYETI(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | None |
| `_requireCallerIsStabilityPool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress,CommunityIssuance: caller is not SP)` | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address,address)` | **external** | Yes | None | None direct | None |
| `issueYETI()` | **external** | Yes | None | None direct | None |
| `sendYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `obtainYETI(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `getCumulativeIssuanceFraction()` | **external** | No (msg/tx) | None | None direct | None |
| `unprotectedIssueYETI()` | **external** | No (msg/tx) | None | None direct | totalYETIIssued |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, ISSUANCE_FACTOR, NAME, SECONDS_IN_ONE_MINUTE, YETISupplyCap |

---

## Contract: EchidnaProxy
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receive()` | **external** | Yes | None | None direct | None |
| `liquidatePrx(address)` | **external** | Yes | None | None direct | None |
| `liquidateTrovesPrx(uint256)` | **external** | Yes | None | None direct | None |
| `batchLiquidateTrovesPrx(address[])` | **external** | No (msg/tx) | None | None direct | None |
| `redeemCollateralPrx(uint256,uint256,address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `openTrovePrx(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `addCollPrx(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawCollPrx(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSDPrx(uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `repayYUSDPrx(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `closeTrovePrx()` | **external** | Yes | None | None direct | None |
| `adjustTrovePrx(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `provideToSPPrx(uint256,address)` | **external** | Yes | None | None direct | None |
| `withdrawFromSPPrx(uint256)` | **external** | Yes | None | None direct | None |
| `transferPrx(address,uint256)` | **external** | Yes | None | None direct | None |
| `approvePrx(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFromPrx(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowancePrx(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowancePrx(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: EchidnaTester
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 NUMBER_OF_ACTORS`
- Privilege: `uint256 INITIAL_BALANCE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | INITIAL_BALANCE, NUMBER_OF_ACTORS |

---

## Contract: YUSDTokenTester
**Linearized C3 Inheritance Tree:** YUSDToken -> IYUSDToken -> IERC2612 -> IERC20 -> CheckContract
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string _NAME`
- Privilege: `string _SYMBOL`
- Privilege: `string _VERSION`
- Privilege: `uint8 _DECIMALS`
- Privilege: `address troveManagerAddress`
- Privilege: `address troveManagerLiquidationsAddress`
- Privilege: `address troveManagerRedemptionsAddress`
- Privilege: `address stabilityPoolAddress`
- Privilege: `address borrowerOperationsAddress`
- Privilege: `bytes32 _PERMIT_TYPEHASH`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBorrowerOperations] require(bool,string)(msg.sender == borrowerOperationsAddress,YUSDToken: Caller is not BorrowerOperations)` | None |
| `burn(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsBOorTroveMorSP] require(bool,string)(msg.sender == borrowerOperationsAddress || msg.sender == troveManagerAddress || msg.sender == stabilityPoolAddress || msg.sender == troveManagerRedemptionsAddress,YUSD: Caller is neither BorrowerOperations nor TroveManager nor StabilityPool)` | None |
| `sendToPool(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsStabilityPool] require(bool,string)(msg.sender == stabilityPoolAddress,YUSD: Caller is not the StabilityPool)` | None |
| `returnFromPool(address,address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsTMLorSP] require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)` | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `domainSeparator()` | **public** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | _nonces |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `_chainID()` | **private** | Yes | None | None direct | None |
| `_buildDomainSeparator(bytes32,bytes32,bytes32)` | **private** | Yes | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_requireValidRecipient(address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == borrowerOperationsAddress,YUSDToken: Caller is not BorrowerOperations)` | None |
| `_requireCallerIsBOorTroveMorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == borrowerOperationsAddress || msg.sender == troveManagerAddress || msg.sender == stabilityPoolAddress || msg.sender == troveManagerRedemptionsAddress,YUSD: Caller is neither BorrowerOperations nor TroveManager nor StabilityPool)` | None |
| `_requireCallerIsStabilityPool()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress,YUSD: Caller is not the StabilityPool)` | None |
| `_requireCallerIsTMLorSP()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)` | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(address,uint256)` | **external** | Yes | None | None direct | None |
| `sendToPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `returnFromPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `unprotectedMint(address,uint256)` | **external** | Yes | None | None direct | None |
| `unprotectedBurn(address,uint256)` | **external** | Yes | None | None direct | None |
| `unprotectedSendToPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `unprotectedReturnFromPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `callInternalApprove(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getChainId()` | **external** | Yes | None | None direct | None |
| `getDigest(address,address,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `recoverAddress(bytes32,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _PERMIT_TYPEHASH |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _DECIMALS, _NAME, _SYMBOL, _VERSION |

---

## Contract: NonPayable
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setPayable(bool)` | **external** | Yes | None | None direct | isPayable |
| `forward(address,bytes)` | **external** | No (msg/tx) | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---

## Contract: LiquityBaseTester
**Linearized C3 Inheritance Tree:** LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address)` | **external** | Yes | None | None direct | activePool, defaultPool, whitelist |
| `_toColls(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `createCollExample()` | **external** | Yes | None | None direct | None |
| `sumCollsTwoColls(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sumCollsOneCollsOneSplit(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sumCollsTwoSplit(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `leftSumColls(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `leftSubColls(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `subColls(address[],uint256[],address[],uint256[])` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: SortedTrovesTester
**Linearized C3 Inheritance Tree:** SortedTroves -> ISortedTroves -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(uint256,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | borrowerOperationsAddress, data, troveManagerAddress, troveManagerRedemptionsAddress |
| `insert(address,uint256,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `_insert(address,uint256,address,address)` | **internal** | Yes | None | None direct | data |
| `remove(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_remove(address)` | **internal** | Yes | None | None direct | data |
| `reInsert(address,uint256,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `contains(address)` | **public** | Yes | None | None direct | None |
| `isFull()` | **public** | Yes | None | None direct | None |
| `isEmpty()` | **public** | Yes | None | None direct | None |
| `getSize()` | **external** | Yes | None | None direct | None |
| `getMaxSize()` | **external** | Yes | None | None direct | None |
| `getFirst()` | **external** | Yes | None | None direct | None |
| `getLast()` | **external** | Yes | None | None direct | None |
| `getNext(address)` | **external** | Yes | None | None direct | None |
| `getPrev(address)` | **external** | Yes | None | None direct | None |
| `getOldICR(address)` | **external** | Yes | None | None direct | None |
| `validInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `_validInsertPosition(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `_descendList(uint256,address)` | **internal** | Yes | None | None direct | None |
| `_ascendList(uint256,address)` | **internal** | Yes | None | None direct | None |
| `findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `_findInsertPosition(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsTroveManager()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveM()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `setParams(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `insert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `remove(address)` | **external** | Yes | None | None direct | None |
| `reInsert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `contains(address)` | **external** | Yes | None | None direct | None |
| `isFull()` | **external** | Yes | None | None direct | None |
| `isEmpty()` | **external** | Yes | None | None direct | None |
| `getSize()` | **external** | Yes | None | None direct | None |
| `getMaxSize()` | **external** | Yes | None | None direct | None |
| `getFirst()` | **external** | Yes | None | None direct | None |
| `getLast()` | **external** | Yes | None | None direct | None |
| `getNext(address)` | **external** | Yes | None | None direct | None |
| `getPrev(address)` | **external** | Yes | None | None direct | None |
| `getOldICR(address)` | **external** | Yes | None | None direct | None |
| `validInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `findInsertPosition(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `callInsert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `callRemove(address)` | **external** | Yes | None | None direct | None |
| `callReInsert(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | NAME |

---

## Contract: TroveManagerTester
**Linearized C3 Inheritance Tree:** TroveManager -> ReentrancyGuard -> ITroveManager -> TroveManagerBase -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 SECONDS_IN_ONE_MINUTE`
- Privilege: `uint256 MINUTE_DECAY_FACTOR`
- Privilege: `uint256 MAX_BORROWING_FEE`
- Privilege: `uint256 BOOTSTRAP_PERIOD`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, borrowerOperationsAddress, collSurplusPool, defaultPool, gasPoolAddress, sYETIContract, sortedTroves, stabilityPoolContract, troveManagerLiquidations, troveManagerLiquidationsAddress, troveManagerRedemptions, troveManagerRedemptionsAddress, whitelist, yetiTokenContract, yusdTokenContract |
| `getTroveOwnersCount()` | **external** | Yes | None | None direct | None |
| `getTroveFromTroveOwnersArray(uint256)` | **external** | Yes | None | None direct | None |
| `liquidate(address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | nonReentrant | None direct | None |
| `collSurplusUpdate(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **external** | No (msg/tx) | None | None direct | None |
| `_movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **internal** | Yes | None | None direct | None |
| `_updateTrove(address,address,address)` | **internal** | Yes | None | None direct | None |
| `updateTroves(address[],address[],address[])` | **external** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `_getCurrentTroveState(address)` | **internal** | Yes | None | None direct | None |
| `applyPendingRewards(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_applyPendingRewards(IActivePool,IDefaultPool,address)` | **internal** | No (msg/tx) | None | None direct | Troves |
| `updateTroveRewardSnapshots(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_updateTroveRewardSnapshots(address)` | **internal** | No (msg/tx) | None | None direct | rewardSnapshots |
| `getPendingCollRewards(address)` | **external** | Yes | None | None direct | None |
| `_getPendingCollRewards(address)` | **internal** | Yes | None | None direct | None |
| `getPendingYUSDDebtReward(address)` | **public** | Yes | None | None direct | None |
| `hasPendingRewards(address)` | **public** | Yes | None | None direct | None |
| `getEntireDebtAndColls(address)` | **public** | Yes | None | None direct | None |
| `removeStake(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_removeStake(address)` | **internal** | Yes | None | None direct | Troves, totalStakes |
| `updateStakeAndTotalStakes(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_updateStakeAndTotalStakes(address)` | **internal** | Yes | None | None direct | Troves, totalStakes |
| `_computeNewStake(address,uint256)` | **internal** | Yes | None | None direct | None |
| `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | L_Coll, L_YUSDDebt, lastCollError_Redistribution, lastYUSDDebtError_Redistribution |
| `closeTrove(address)` | **external** | No (msg/tx) | None | None direct | None |
| `closeTroveLiquidation(address)` | **external** | No (msg/tx) | None | None direct | None |
| `closeTroveRedemption(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_closeTrove(address,TroveManagerBase.Status)` | **internal** | Yes | None | None direct | Troves, rewardSnapshots |
| `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | totalCollateralSnapshot, totalStakesSnapshot |
| `addTroveOwnerToArray(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_addTroveOwnerToArray(address)` | **internal** | Yes | None | None direct | TroveOwners, Troves |
| `_removeTroveOwner(address,uint256)` | **internal** | Yes | None | None direct | TroveOwners, Troves |
| `getTCR()` | **external** | Yes | None | None direct | None |
| `checkRecoveryMode()` | **external** | Yes | None | None direct | None |
| `updateBaseRate(uint256)` | **external** | No (msg/tx) | None | None direct | baseRate |
| `getRedemptionRate()` | **public** | Yes | None | None direct | None |
| `getRedemptionRateWithDecay()` | **public** | No (msg/tx) | None | None direct | None |
| `_calcRedemptionRate(uint256)` | **internal** | Yes | None | None direct | None |
| `_getRedemptionFee(uint256)` | **internal** | Yes | None | None direct | None |
| `getRedemptionFeeWithDecay(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_calcRedemptionFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `getBorrowingRate()` | **public** | Yes | None | None direct | None |
| `getBorrowingRateWithDecay()` | **public** | No (msg/tx) | None | None direct | None |
| `_calcBorrowingRate(uint256)` | **internal** | Yes | None | None direct | None |
| `getBorrowingFee(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingFeeWithDecay(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_calcBorrowingFee(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `decayBaseRateFromBorrowing()` | **external** | No (msg/tx) | None | None direct | baseRate |
| `_updateLastFeeOpTime()` | **internal** | No (msg/tx) | None | None direct | lastFeeOperationTime |
| `calcDecayedBaseRate()` | **public** | No (msg/tx) | None | None direct | None |
| `_minutesPassedSinceLastFeeOp()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTMR()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTMR()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsTML()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `_requireTroveIsActive(address)` | **internal** | Yes | None | None direct | None |
| `_requireMoreThanOneTroveInSystem(uint256)` | **internal** | Yes | None | None direct | None |
| `getTroveStatus(address)` | **external** | Yes | None | None direct | None |
| `isTroveActive(address)` | **external** | Yes | None | None direct | None |
| `getTroveStake(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveDebt(address)` | **external** | Yes | None | None direct | None |
| `getTotalStake(address)` | **external** | Yes | None | None direct | None |
| `getL_Coll(address)` | **external** | Yes | None | None direct | None |
| `getL_YUSD(address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotColl(address,address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotYUSD(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveVC(address)` | **external** | Yes | None | None direct | None |
| `getTroveColls(address)` | **external** | Yes | None | None direct | None |
| `getCurrentTroveState(address)` | **external** | Yes | None | None direct | None |
| `updateTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `updateTroveCollTMR(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | Troves |
| `removeStakeTMR(address)` | **external** | No (msg/tx) | None | None direct | None |
| `removeStakeTLR(address)` | **external** | No (msg/tx) | None | None direct | None |
| `setTroveStatus(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `updateTroveColl(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | Troves |
| `increaseTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `decreaseTroveDebt(address,uint256)` | **external** | No (msg/tx) | None | None direct | Troves |
| `stabilityPool()` | **external** | Yes | None | None direct | None |
| `yusdToken()` | **external** | Yes | None | None direct | None |
| `yetiToken()` | **external** | Yes | None | None direct | None |
| `sYETI()` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `stabilityPool()` | **external** | Yes | None | None direct | None |
| `yusdToken()` | **external** | Yes | None | None direct | None |
| `yetiToken()` | **external** | Yes | None | None direct | None |
| `sYETI()` | **external** | Yes | None | None direct | None |
| `getTroveOwnersCount()` | **external** | Yes | None | None direct | None |
| `getTroveFromTroveOwnersArray(uint256)` | **external** | Yes | None | None direct | None |
| `getCurrentICR(address)` | **external** | Yes | None | None direct | None |
| `liquidate(address)` | **external** | Yes | None | None direct | None |
| `batchLiquidateTroves(address[],address)` | **external** | Yes | None | None direct | None |
| `redeemCollateral(uint256,uint256,address,address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `updateStakeAndTotalStakes(address)` | **external** | Yes | None | None direct | None |
| `updateTroveCollTMR(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateTroveRewardSnapshots(address)` | **external** | Yes | None | None direct | None |
| `addTroveOwnerToArray(address)` | **external** | Yes | None | None direct | None |
| `applyPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingCollRewards(address)` | **external** | Yes | None | None direct | None |
| `getPendingYUSDDebtReward(address)` | **external** | Yes | None | None direct | None |
| `hasPendingRewards(address)` | **external** | Yes | None | None direct | None |
| `closeTrove(address)` | **external** | Yes | None | None direct | None |
| `removeStake(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTMR(address)` | **external** | Yes | None | None direct | None |
| `updateTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getRedemptionRate()` | **external** | Yes | None | None direct | None |
| `getRedemptionRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getRedemptionFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingRate()` | **external** | Yes | None | None direct | None |
| `getBorrowingRateWithDecay()` | **external** | Yes | None | None direct | None |
| `getBorrowingFee(uint256)` | **external** | Yes | None | None direct | None |
| `getBorrowingFeeWithDecay(uint256)` | **external** | Yes | None | None direct | None |
| `decayBaseRateFromBorrowing()` | **external** | Yes | None | None direct | None |
| `getTroveStatus(address)` | **external** | Yes | None | None direct | None |
| `isTroveActive(address)` | **external** | Yes | None | None direct | None |
| `getTroveStake(address,address)` | **external** | Yes | None | None direct | None |
| `getTotalStake(address)` | **external** | Yes | None | None direct | None |
| `getTroveDebt(address)` | **external** | Yes | None | None direct | None |
| `getL_Coll(address)` | **external** | Yes | None | None direct | None |
| `getL_YUSD(address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotColl(address,address)` | **external** | Yes | None | None direct | None |
| `getRewardSnapshotYUSD(address,address)` | **external** | Yes | None | None direct | None |
| `getTroveVC(address)` | **external** | Yes | None | None direct | None |
| `getTroveColls(address)` | **external** | Yes | None | None direct | None |
| `getCurrentTroveState(address)` | **external** | Yes | None | None direct | None |
| `setTroveStatus(address,uint256)` | **external** | Yes | None | None direct | None |
| `updateTroveColl(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `increaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseTroveDebt(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTCR()` | **external** | Yes | None | None direct | None |
| `checkRecoveryMode()` | **external** | Yes | None | None direct | None |
| `closeTroveRedemption(address)` | **external** | Yes | None | None direct | None |
| `closeTroveLiquidation(address)` | **external** | Yes | None | None direct | None |
| `removeStakeTLR(address)` | **external** | Yes | None | None direct | None |
| `updateBaseRate(uint256)` | **external** | Yes | None | None direct | None |
| `calcDecayedBaseRate()` | **external** | Yes | None | None direct | None |
| `redistributeDebtAndColl(IActivePool,IDefaultPool,uint256,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getEntireDebtAndColls(address)` | **external** | Yes | None | None direct | None |
| `movePendingTroveRewardsToActivePool(IActivePool,IDefaultPool,uint256,address[],uint256[],address)` | **external** | Yes | None | None direct | None |
| `collSurplusUpdate(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `computeICR(address[],uint256[],uint256)` | **external** | Yes | None | None direct | None |
| `getYUSDGasCompensation()` | **external** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `unprotectedDecayBaseRateFromBorrowing()` | **external** | No (msg/tx) | None | None direct | baseRate |
| `minutesPassedSinceLastFeeOp()` | **external** | No (msg/tx) | None | None direct | None |
| `setLastFeeOpTimeToNow()` | **external** | No (msg/tx) | None | None direct | lastFeeOperationTime |
| `setBaseRate(uint256)` | **external** | Yes | None | None direct | baseRate |
| `callGetRedemptionFee(uint256)` | **external** | Yes | None | None direct | None |
| `getActualDebtFromComposite(uint256)` | **external** | Yes | None | None direct | None |
| `callInternalRemoveTroveOwner(address)` | **external** | Yes | None | None direct | None |
| `getTotalStakes(address)` | **external** | Yes | None | None direct | None |
| `getTroveIndex(address)` | **external** | Yes | None | None direct | None |
| `getEDC(address)` | **external** | Yes | None | None direct | None |
| `getCollGasCompensation(address,uint256)` | **external** | Yes | None | None direct | None |
| `getVC(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `getUSD(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `_getCollGasCompensation(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MAX_BORROWING_FEE, MCR, MINUTE_DECAY_FACTOR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, SECONDS_IN_ONE_MINUTE, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: LiquityMathTester
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `callMax(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `callDecPowTx(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `callDecPow(uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ActivePoolTester
**Linearized C3 Inheritance Tree:** ActivePool -> YetiCustomBase -> BaseMath -> IActivePool -> IPool -> ICollateralReceiver -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | borrowerOperationsAddress, collSurplusPoolAddress, defaultPoolAddress, stabilityPoolAddress, troveManagerAddress, troveManagerLiquidationsAddress, troveManagerRedemptionsAddress, whitelist |
| `getCollateral(address)` | **public** | Yes | None | None direct | None |
| `getAllCollateral()` | **public** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `_sendCollateral(address,address,uint256)` | **internal** | Yes | None | None direct | poolColl |
| `sendCollaterals(address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `sendCollateralsUnwrap(address,address,address[],uint256[])` | **external** | No (msg/tx) | None | None direct | None |
| `sendSingleCollateral(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `sendSingleCollateralUnwrap(address,address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_needsUpdateCollateral(address)` | **internal** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `decreaseYUSDDebt(uint256)` | **external** | No (msg/tx) | None | None direct | YUSDDebt |
| `_requireCallerIsBOorTroveMorTMLorSP()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperationsOrDefaultPool()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBorrowerOperations()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveMorSP()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsBOorTroveM()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireCallerIsWhitelist()` | **internal** | No (msg/tx) | None | None direct | None |
| `_revertWrongFuncCaller()` | **internal** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | No (msg/tx) | None | None direct | poolColl |
| `addCollateralType(address)` | **external** | No (msg/tx) | None | None direct | poolColl |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `sendCollaterals(address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendCollateralsUnwrap(address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `sendSingleCollateral(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `sendSingleCollateralUnwrap(address,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getCollateralVC(address)` | **external** | Yes | None | None direct | None |
| `addCollateralType(address)` | **external** | Yes | None | None direct | None |
| `getVC()` | **external** | Yes | None | None direct | None |
| `getCollateral(address)` | **external** | Yes | None | None direct | None |
| `getAllCollateral()` | **external** | Yes | None | None direct | None |
| `getYUSDDebt()` | **external** | Yes | None | None direct | None |
| `increaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `decreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | None |
| `receiveCollateral(address[],uint256[])` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `unprotectedIncreaseYUSDDebt(uint256)` | **external** | Yes | None | None direct | YUSDDebt |
| `unprotectedPayable()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, NAME |

---

## Contract: YETITokenTester
**Linearized C3 Inheritance Tree:** YETIToken -> IYETIToken -> IERC2612 -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string _NAME`
- Privilege: `string _SYMBOL`
- Privilege: `string _VERSION`
- Privilege: `uint8 _DECIMALS`
- Privilege: `uint256 deploymentStartTime`
- Privilege: `address sYETIAddress`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `sendToSYETI(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: _requireCallerIsSYETI] require(bool,string)(msg.sender == sYETIAddress,YETI: caller must be the SYETI contract)` | None |
| `domainSeparator()` | **public** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | _nonces |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `_chainID()` | **private** | Yes | None | None direct | None |
| `_buildDomainSeparator(bytes32,bytes32,bytes32)` | **private** | Yes | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_requireValidRecipient(address)` | **internal** | Yes | None | None direct | None |
| `_requireCallerIsSYETI()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender == sYETIAddress,YETI: caller must be the SYETI contract)` | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `getDeploymentStartTime()` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _totalSupply |
| `sendToSYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `getDeploymentStartTime()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `version()` | **external** | Yes | None | None direct | None |
| `permitTypeHash()` | **external** | Yes | None | None direct | None |
| `domainSeparator()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `unprotectedMint(address,uint256)` | **external** | Yes | None | None direct | None |
| `unprotectedSendToSYETI(address,uint256)` | **external** | Yes | None | None direct | None |
| `callInternalApprove(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `callInternalTransfer(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getChainId()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _1_MILLION |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _DECIMALS, _NAME, _SYMBOL, _VERSION |

---

## Contract: SortedTrovesBOTester
**Linearized C3 Inheritance Tree:** BorrowerOperations -> ReentrancyGuard -> IBorrowerOperations -> CheckContract -> Ownable -> LiquityBase -> YetiCustomBase -> BaseMath -> ILiquityBase
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `uint256 _100pct`
- Privilege: `uint256 _110pct`
- Privilege: `uint256 MCR`
- Privilege: `uint256 CCR`
- Privilege: `uint256 YUSD_GAS_COMPENSATION`
- Privilege: `uint256 MIN_NET_DEBT`
- Privilege: `uint256 PERCENT_DIVISOR`
- Privilege: `uint256 BORROWING_FEE_FLOOR`
- Privilege: `uint256 REDEMPTION_FEE_FLOOR`
- Privilege: `string NAME`
- Privilege: `uint256 BOOTSTRAP_PERIOD`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | activePool, collSurplusPool, defaultPool, deploymentTime, gasPoolAddress, sYETIAddress, sortedTroves, stabilityPoolAddress, troveManager, whitelist, yusdToken |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_singleLeverUp(address,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_openTroveInternal(address,uint256,uint256,uint256,address,address,address[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_adjustTrove(BorrowerOperations.AdjustTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `_singleUnleverUp(address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_unleverColls(IActivePool,address[],uint256[],uint256[])` | **internal** | No (msg/tx) | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `closeTrove()` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `_closeTrove(BorrowerOperations.CloseTrove_Params)` | **internal** | No (msg/tx) | None | None direct | None |
| `claimCollateral()` | **external** | No (msg/tx) | None | None direct | None |
| `_getTotalVariableDepositFee(address[],uint256[],uint256,uint256,uint256,uint256,BorrowerOperations.ContractsCache)` | **internal** | No (msg/tx) | None | None direct | None |
| `_transferCollateralsIntoActivePool(address,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_singleTransferCollateralIntoActivePool(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerBorrowingFee(ITroveManager,IYUSDToken,uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_triggerDepositFee(IYUSDToken,uint256)` | **internal** | Yes | None | None direct | None |
| `_updateTroveFromAdjustment(ITroveManager,address,address[],uint256[],uint256,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_getNewPortfolio(address[],uint256[],address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_moveYUSD(IActivePool,IYUSDToken,address,uint256,bool,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawYUSD(IActivePool,IYUSDToken,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_repayYUSD(IActivePool,IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidDepositCollateral(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroAdjustment(uint256[],uint256[],uint256)` | **internal** | Yes | None | None direct | None |
| `_arrayIsNonzero(uint256[])` | **internal** | Yes | None | None direct | None |
| `_isBeforeFeeBootstrapPeriod()` | **internal** | No (msg/tx) | None | None direct | None |
| `_requireTroveisActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireTroveisNotActive(ITroveManager,address)` | **internal** | Yes | None | None direct | None |
| `_requireNonZeroDebtChange(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNoOverlapColls(address[],address[])` | **internal** | Yes | None | None direct | None |
| `_requireNoDuplicateColls(address[])` | **internal** | Yes | None | None direct | None |
| `_requireNotInRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireNoCollWithdrawal(uint256[])` | **internal** | Yes | None | None direct | None |
| `_requireLengthNonzero(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireLengthsEqual(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidAdjustmentInCurrentMode(bool,uint256[],bool,BorrowerOperations.LocalVariables_adjustTrove)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveMCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireICRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewICRisAboveOldICR(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireNewTCRisAboveCCR(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireAtLeastMinNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidYUSDRepayment(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireSufficientYUSDBalance(IYUSDToken,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_requireValidMaxFeePercentage(uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewICRFromTroveChange(uint256,uint256,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `_getNewTCRFromTroveChange(uint256,bool,uint256,bool)` | **internal** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `setAddresses(address,address,address,address,address,address,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `openTrove(uint256,uint256,address,address,address[],uint256[])` | **external** | Yes | None | None direct | None |
| `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTroveUnlever(address[],uint256[],uint256[])` | **external** | Yes | None | None direct | None |
| `closeTrove()` | **external** | Yes | None | None direct | None |
| `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addColl(address[],uint256[],address,address,uint256)` | **external** | Yes | None | None direct | None |
| `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `withdrawColl(address[],uint256[],address,address)` | **external** | Yes | None | None direct | None |
| `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)` | **external** | Yes | None | None direct | None |
| `withdrawYUSD(uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `repayYUSD(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `claimCollateral()` | **external** | Yes | None | None direct | None |
| `getCompositeDebt(uint256)` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `_getCompositeDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `_getNetDebt(uint256)` | **internal** | Yes | None | None direct | None |
| `getEntireSystemColl()` | **public** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **public** | Yes | None | None direct | None |
| `_getICRColls(YetiCustomBase.newColls,uint256)` | **internal** | Yes | None | None direct | None |
| `_getVC(address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getVCColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getUSDColls(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_getTCR()` | **internal** | Yes | None | None direct | None |
| `_checkRecoveryMode()` | **internal** | Yes | None | None direct | None |
| `_requireUserAcceptsFee(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_CollsIsNonZero(YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_checkPotentialRecoveryMode(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls)` | **internal** | Yes | None | None direct | None |
| `_sumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_sumColls(address[],uint256[],address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSumColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_leftSubColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_subColls(YetiCustomBase.newColls,address[],uint256[])` | **internal** | Yes | None | None direct | None |
| `_getArrayCopy(uint256[])` | **internal** | Yes | None | None direct | None |
| `getEntireSystemDebt()` | **external** | Yes | None | None direct | None |
| `resetSortedTroves(address)` | **external** | Yes | None | None direct | sortedTroves |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BOOTSTRAP_PERIOD, BORROWING_FEE_FLOOR, CCR, DECIMAL_PRECISION, MCR, MIN_NET_DEBT, NAME, PERCENT_DIVISOR, REDEMPTION_FEE_FLOOR, YUSD_GAS_COMPENSATION, _100pct, _110pct |

---

## Contract: PriceFeedTester
**Linearized C3 Inheritance Tree:** PriceFeed -> IPriceFeed -> BaseMath -> CheckContract -> Ownable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DECIMAL_PRECISION`
- Privilege: `bytes32 NAME`
- Privilege: `uint256 ETHUSD_TELLOR_REQ_ID`
- Privilege: `uint256 TARGET_DIGITS`
- Privilege: `uint256 TELLOR_DIGITS`
- Privilege: `uint256 TIMEOUT`
- Privilege: `uint256 MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND`
- Privilege: `uint256 MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | priceAggregator, status, tellorCaller |
| `fetchPrice()` | **external** | No (msg/tx) | None | None direct | None |
| `fetchPrice_v()` | **external** | No (msg/tx) | None | None direct | None |
| `_chainlinkIsBroken(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_badChainlinkResponse(PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_chainlinkIsFrozen(PriceFeed.ChainlinkResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_chainlinkPriceChangeAboveMax(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse)` | **internal** | Yes | None | None direct | None |
| `_tellorIsBroken(PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_tellorIsFrozen(PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_bothOraclesLiveAndUnbrokenAndSimilarPrice(PriceFeed.ChainlinkResponse,PriceFeed.ChainlinkResponse,PriceFeed.TellorResponse)` | **internal** | No (msg/tx) | None | None direct | None |
| `_bothOraclesSimilarPrice(PriceFeed.ChainlinkResponse,PriceFeed.TellorResponse)` | **internal** | Yes | None | None direct | None |
| `_scaleChainlinkPriceByDigits(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_scaleTellorPriceByDigits(uint256)` | **internal** | Yes | None | None direct | None |
| `_changeStatus(PriceFeed.Status)` | **internal** | Yes | None | None direct | status |
| `_storePrice(uint256)` | **internal** | Yes | None | None direct | lastGoodPrice |
| `_storeTellorPrice(PriceFeed.TellorResponse)` | **internal** | Yes | None | None direct | None |
| `_storeChainlinkPrice(PriceFeed.ChainlinkResponse)` | **internal** | Yes | None | None direct | None |
| `_getCurrentTellorResponse()` | **internal** | Yes | None | None direct | None |
| `_getCurrentChainlinkResponse()` | **internal** | Yes | None | None direct | None |
| `_getPrevChainlinkResponse(uint80,uint8)` | **internal** | Yes | None | None direct | None |
| `fetchPrice_v()` | **external** | Yes | None | None direct | None |
| `checkContract(address)` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setLastGoodPrice(uint256)` | **external** | Yes | None | None direct | lastGoodPrice |
| `setStatus(PriceFeed.Status)` | **external** | Yes | None | None direct | status |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DECIMAL_PRECISION, ETHUSD_TELLOR_REQ_ID, MAX_PRICE_DEVIATION_FROM_PREVIOUS_ROUND, MAX_PRICE_DIFFERENCE_BETWEEN_ORACLES, NAME, TARGET_DIGITS, TELLOR_DIGITS, TIMEOUT |

---

## Contract: YUSDTokenCaller
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setYUSD(IYUSDToken)` | **external** | Yes | None | None direct | YUSD |
| `yusdMint(address,uint256)` | **external** | Yes | None | None direct | None |
| `yusdBurn(address,uint256)` | **external** | Yes | None | None direct | None |
| `yusdSendToPool(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `yusdReturnFromPool(address,address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: sYETITokenTester
**Linearized C3 Inheritance Tree:** sYETIToken -> BoringOwnable -> BoringOwnableData -> Domain -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address pendingOwner`
- Privilege: `string symbol`
- Privilege: `string name`
- Privilege: `uint8 decimals`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `setAddresses(IYETIToken,IERC20)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | addressesSet, yetiToken, yusdToken |
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | users |
| `_useAllowance(address,uint256)` | **internal** | No (msg/tx) | None | None direct | allowance |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowance |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | allowance, nonces |
| `mint(uint256)` | **public** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, totalSupply, users |
| `_burn(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, totalSupply, users |
| `burn(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `buyBack(address,uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | None |
| `publicBuyBack(address)` | **external** | No (msg/tx) | None | None direct | None |
| `_buyBack(address,uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | lastBuybackPrice, lastBuybackTime |
| `rebase()` | **external** | No (msg/tx) | None | None direct | effectiveYetiTokenBalance, lastRebaseTime |
| `_getValueOfContract(uint256)` | **internal** | Yes | None | None direct | None |
| `setTransferRatio(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | transferRatio |
| `addValidRouter(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | validRouters |
| `removeValidRouter(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | validRouters |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `transferOwnership(address,bool,bool)` | **public** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == owner,Ownable: caller is not the owner)` | owner, pendingOwner |
| `claimOwnership()` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == _pendingOwner,Ownable: caller != pending owner)` | owner, pendingOwner |
| `_calculateDomainSeparator(uint256)` | **private** | Yes | None | None direct | None |
| `_domainSeparator()` | **internal** | Yes | None | None direct | None |
| `_getDigest(bytes32)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(address,uint256)` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `getUserInfo(address)` | **public** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | decimals, name, symbol |

---

## Contract: ERC20Token
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `decimals()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)` | balances |
| `mint(address,uint256)` | **public** | Yes | None | None direct | balances |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | allowed |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(allowed[from][msg.sender] >= tokens,You are trying to transfer more tokens than you have approved)` | allowed, balances |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |

---

## Contract: ThreePieceWiseLinearPriceCurve
**Linearized C3 Inheritance Tree:** Ownable -> IPriceCurve
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `isOwner()` | **public** | No (msg/tx) | None | None direct | None |
| `_renounceOwnership()` | **internal** | Yes | None | None direct | _owner |
| `setAddresses(address)` | **external** | Yes | None | None direct | None |
| `setDecayTime(uint256)` | **external** | Yes | None | None direct | None |
| `getFee(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeAndUpdate(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `setFeeCapAndTime(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getFeeCapAndTime()` | **external** | Yes | None | None direct | None |
| `calculateDecayedFee()` | **external** | Yes | None | None direct | None |
| `adjustParams(string,uint256,uint256,uint256,uint256,uint256,uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | b1, b2, b2Negative, b3, b3Negative, cutoff1, cutoff2, decayTime, dollarCap, m1, m2, m3, name |
| `setAddresses(address)` | **external** | No (msg/tx) | onlyOwner | None direct | addressesSet, whitelistAddress |
| `setDecayTime(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | decayTime |
| `getFeeCapAndTime()` | **external** | Yes | None | None direct | None |
| `setFeeCapAndTime(uint256,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == whitelistAddress,caller must be whitelist)` | lastFeePercent, lastFeeTime |
| `getFee(uint256,uint256,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `getFeeAndUpdate(uint256,uint256,uint256,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == whitelistAddress,Only whitelist can update fee)` | lastFeePercent, lastFeeTime |
| `_getFeePoint(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `calculateDecayedFee()` | **public** | No (msg/tx) | None | None direct | None |
| `_min(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_max(uint256,uint256)` | **internal** | Yes | None | None direct | None |

---
