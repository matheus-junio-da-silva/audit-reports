# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: IUniswapV3Factory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **external** | Yes | None | None direct | None |
| `feeAmountTickSpacing(uint24)` | **external** | Yes | None | None direct | None |
| `getPool(address,address,uint24)` | **external** | Yes | None | None direct | None |
| `createPool(address,address,uint24)` | **external** | Yes | None | None direct | None |
| `setOwner(address)` | **external** | Yes | None | None direct | None |
| `enableFeeAmount(uint24,int24)` | **external** | Yes | None | None direct | None |

---

## Contract: Migrations
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setCompleted(uint256)` | **public** | No (msg/tx) | restricted | `[Internal Call: restricted] require(bool,string)(msg.sender == owner,This function is restricted to the contract's owner)`<br>`[Modifier: restricted] require(bool,string)(msg.sender == owner,This function is restricted to the contract's owner)` | last_completed_migration |
| `slitherConstructorVariables()` | **internal** | No (msg/tx) | None | None direct | owner |

---

## Contract: FluxAggregator
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setValue(int256)` | **public** | Yes | None | None direct | value |
| `getRoundData(uint80)` | **external** | Yes | None | None direct | None |
| `latestRoundData()` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | latestRoundId, value, version |

---

## Contract: GovernanceTester
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(uint256)` | **public** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == gov,Only Governance should be able to hit)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == gov,Only Governance should be able to hit)` | value |

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

## Contract: SafeMathUpgradeable
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `tryAdd(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `trySub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryDiv(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `add(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |

---

## Contract: AddressUpgradeable
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
| `_verifyCallResult(bool,bytes,string)` | **private** | Yes | None | None direct | None |

---

## Contract: ECDSA
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `recover(bytes32,bytes)` | **internal** | Yes | None | None direct | None |
| `recover(bytes32,uint8,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `toEthSignedMessageHash(bytes32)` | **internal** | Yes | None | None direct | None |

---

## Contract: SafeMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `tryAdd(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `trySub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryDiv(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `tryMod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `add(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `sub(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `div(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |
| `mod(uint256,uint256,string)` | **internal** | Yes | None | None direct | None |

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

## Contract: IUniswapV3Pool
**Linearized C3 Inheritance Tree:** IUniswapV3PoolEvents -> IUniswapV3PoolOwnerActions -> IUniswapV3PoolActions -> IUniswapV3PoolDerivedState -> IUniswapV3PoolState -> IUniswapV3PoolImmutables
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setFeeProtocol(uint8,uint8)` | **external** | Yes | None | None direct | None |
| `collectProtocol(address,uint128,uint128)` | **external** | Yes | None | None direct | None |
| `initialize(uint160)` | **external** | Yes | None | None direct | None |
| `mint(address,int24,int24,uint128,bytes)` | **external** | Yes | None | None direct | None |
| `collect(address,int24,int24,uint128,uint128)` | **external** | Yes | None | None direct | None |
| `burn(int24,int24,uint128)` | **external** | Yes | None | None direct | None |
| `swap(address,bool,int256,uint160,bytes)` | **external** | Yes | None | None direct | None |
| `flash(address,uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `increaseObservationCardinalityNext(uint16)` | **external** | Yes | None | None direct | None |
| `observe(uint32[])` | **external** | Yes | None | None direct | None |
| `snapshotCumulativesInside(int24,int24)` | **external** | Yes | None | None direct | None |
| `slot0()` | **external** | Yes | None | None direct | None |
| `feeGrowthGlobal0X128()` | **external** | Yes | None | None direct | None |
| `feeGrowthGlobal1X128()` | **external** | Yes | None | None direct | None |
| `protocolFees()` | **external** | Yes | None | None direct | None |
| `liquidity()` | **external** | Yes | None | None direct | None |
| `ticks(int24)` | **external** | Yes | None | None direct | None |
| `tickBitmap(int16)` | **external** | Yes | None | None direct | None |
| `positions(bytes32)` | **external** | Yes | None | None direct | None |
| `observations(uint256)` | **external** | Yes | None | None direct | None |
| `factory()` | **external** | Yes | None | None direct | None |
| `token0()` | **external** | Yes | None | None direct | None |
| `token1()` | **external** | Yes | None | None direct | None |
| `fee()` | **external** | Yes | None | None direct | None |
| `tickSpacing()` | **external** | Yes | None | None direct | None |
| `maxLiquidityPerTick()` | **external** | Yes | None | None direct | None |

---

## Contract: FullMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mulDiv(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mulDivRoundingUp(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: LowGasSafeMath
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
| `add(int256,int256)` | **internal** | Yes | None | None direct | None |
| `sub(int256,int256)` | **internal** | Yes | None | None direct | None |

---

## Contract: TickMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `int24 MIN_TICK`
- Privilege: `int24 MAX_TICK`
- Privilege: `uint160 MIN_SQRT_RATIO`
- Privilege: `uint160 MAX_SQRT_RATIO`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getSqrtRatioAtTick(int24)` | **internal** | Yes | None | None direct | None |
| `getTickAtSqrtRatio(uint160)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | MAX_SQRT_RATIO, MAX_TICK, MIN_SQRT_RATIO, MIN_TICK |

---

## Contract: OracleLibrary
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `consult(address,uint32)` | **internal** | Yes | None | None direct | None |
| `getQuoteAtTick(int24,uint128,address,address)` | **internal** | Yes | None | None direct | None |

---

## Contract: PoolAddress
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 POOL_INIT_CODE_HASH`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getPoolKey(address,address,uint24)` | **internal** | Yes | None | None direct | None |
| `computeAddress(address,PoolAddress.PoolKey)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | POOL_INIT_CODE_HASH |

---

## Contract: CreditLine
**Linearized C3 Inheritance Tree:** OwnableUpgradeable -> ContextUpgradeable -> Initializable -> ReentrancyGuard
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 YEAR_IN_SECONDS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address,address,address,address,address,uint256,address,uint256)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateDefaultStrategy(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateDefaultStrategy(address)` | **internal** | Yes | None | None direct | defaultStrategy |
| `updatePriceOracle(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatePriceOracle(address)` | **internal** | Yes | None | None direct | priceOracle |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `updateProtocolFeeFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateProtocolFeeFraction(uint256)` | **internal** | Yes | None | None direct | protocolFeeFraction |
| `updateProtocolFeeCollector(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateProtocolFeeCollector(address)` | **internal** | Yes | None | None direct | protocolFeeCollector |
| `updateStrategyRegistry(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateStrategyRegistry(address)` | **internal** | Yes | None | None direct | strategyRegistry |
| `updateLiquidatorRewardFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateLiquidatorRewardFraction(uint256)` | **internal** | Yes | None | None direct | liquidatorRewardFraction |
| `calculateInterest(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calculateInterestAccrued(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `calculateCurrentDebt(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `calculateBorrowableAmount(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `updateinterestAccruedTillLastPrincipalUpdate(uint256)` | **internal** | No (msg/tx) | None | None direct | creditLineVariables |
| `_depositCollateralFromSavingsAccount(uint256,uint256,address)` | **internal** | Yes | None | None direct | collateralShareInStrategy |
| `request(address,uint256,uint256,bool,uint256,address,address,bool)` | **external** | No (msg/tx) | None | None direct | None |
| `_createRequest(address,address,uint256,uint256,bool,uint256,address,address,bool)` | **internal** | Yes | None | None direct | creditLineConstants, creditLineCounter, creditLineVariables |
| `accept(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)((msg.sender == creditLineConstants[_id].borrower && _requestByLender) || (msg.sender == creditLineConstants[_id].lender && ! _requestByLender),Only Borrower or Lender who hasn't requested can accept)` | creditLineVariables |
| `depositCollateral(uint256,uint256,address,bool)` | **external** | No (msg/tx) | nonReentrant, ifCreditLineExists | `[Internal Call: _depositCollateral] require(bool,string)(creditLineConstants[_id].lender != msg.sender,lender cant deposit collateral)` | None |
| `_depositCollateral(uint256,uint256,address,bool)` | **internal** | No (msg/tx) | None | `require(bool,string)(creditLineConstants[_id].lender != msg.sender,lender cant deposit collateral)` | collateralShareInStrategy |
| `_withdrawBorrowAmount(address,uint256,address)` | **internal** | Yes | None | None direct | None |
| `borrow(uint256,uint256)` | **external** | No (msg/tx) | nonReentrant, onlyCreditLineBorrower | `[Internal Call: onlyCreditLineBorrower] require(bool,string)(creditLineConstants[_id].borrower == msg.sender,Only credit line Borrower can access)`<br>`[Modifier: onlyCreditLineBorrower] require(bool,string)(creditLineConstants[_id].borrower == msg.sender,Only credit line Borrower can access)` | creditLineVariables |
| `_repayFromSavingsAccount(uint256,address,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_repay(uint256,uint256,bool,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `repay(uint256,uint256,bool)` | **external** | No (msg/tx) | nonReentrant | `require(bool,string)(creditLineConstants[_id].lender != msg.sender,Lender cant repay)` | creditLineVariables |
| `_resetCreditLine(uint256)` | **internal** | Yes | None | None direct | creditLineVariables |
| `close(uint256)` | **external** | No (msg/tx) | ifCreditLineExists | `require(bool,string)(msg.sender == creditLineConstants[_id].borrower || msg.sender == creditLineConstants[_id].lender,CreditLine: Permission denied while closing Line of credit)` | creditLineVariables |
| `calculateCurrentCollateralRatio(uint256)` | **public** | No (msg/tx) | ifCreditLineExists | None direct | None |
| `calculateTotalCollateralTokens(uint256)` | **public** | Yes | None | None direct | None |
| `withdrawCollateral(uint256,uint256,bool)` | **external** | No (msg/tx) | nonReentrant, onlyCreditLineBorrower | `[Internal Call: onlyCreditLineBorrower] require(bool,string)(creditLineConstants[_id].borrower == msg.sender,Only credit line Borrower can access)`<br>`[Modifier: onlyCreditLineBorrower] require(bool,string)(creditLineConstants[_id].borrower == msg.sender,Only credit line Borrower can access)` | None |
| `withdrawableCollateral(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transferCollateral(uint256,address,uint256,bool)` | **internal** | No (msg/tx) | None | None direct | collateralShareInStrategy |
| `liquidate(uint256,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | creditLineVariables |
| `borrowTokensToLiquidate(uint256)` | **external** | Yes | None | None direct | None |
| `_borrowTokensToLiquidate(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `receive()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == savingsAccount,CreditLine::receive invalid transaction)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | YEAR_IN_SECONDS |

---

## Contract: Extension
**Linearized C3 Inheritance Tree:** IExtension -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `initializePoolExtension(uint256)` | **external** | Yes | None | None direct | None |
| `closePoolExtension()` | **external** | Yes | None | None direct | None |
| `removeVotes(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address,uint256)` | **external** | Yes | initializer | None direct | None |
| `initializePoolExtension(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(_poolFactory.poolRegistry(msg.sender),Repayments::onlyValidPool - Invalid Pool)`<br>`require(bool,string)(extensions[msg.sender].repaymentInterval == 0,Extension::initializePoolExtension - already initialized)` | extensions |
| `requestExtension(address)` | **external** | No (msg/tx) | onlyBorrower | `[Internal Call: onlyBorrower] require(bool,string)(IPool(_pool).borrower() == msg.sender,Not Borrower)`<br>`[Modifier: onlyBorrower] require(bool,string)(IPool(_pool).borrower() == msg.sender,Not Borrower)` | extensions |
| `removeVotes(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | extensions |
| `voteOnExtension(address)` | **external** | No (msg/tx) | None | None direct | extensions |
| `grantExtension(address)` | **internal** | No (msg/tx) | None | None direct | extensions |
| `closePoolExtension()` | **external** | No (msg/tx) | None | None direct | extensions |
| `updateVotingPassRatio(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)` | None |
| `_updateVotingPassRatio(uint256)` | **internal** | Yes | None | None direct | votingPassRatio |
| `updatePoolFactory(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)` | None |
| `_updatePoolFactory(address)` | **internal** | Yes | None | None direct | poolFactory |

---

## Contract: Pool
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> IPool -> ERC20PausableUpgradeable -> PausableUpgradeable -> ERC20Upgradeable -> IERC20Upgradeable -> ContextUpgradeable -> Initializable
**Pausable Safety (Unprotected Mutative Actions):** ⚠️ Warning: `depositCollateral`, `addCollateralInMarginCall`, `withdrawBorrowedAmount`, `borrower`, `getMarginCallEndTime`, `closeLoan`, `transfer`, `approve`, `transferFrom`, `increaseAllowance`, `decreaseAllowance`, `transfer`, `approve`, `transferFrom`, `initialize`, `depositCollateral`, `addCollateralInMarginCall`, `withdrawBorrowedAmount`, `lend`, `cancelPool`, `liquidateCancelPenalty`, `terminatePool`, `closeLoan`, `withdrawLiquidity`, `requestMarginCall`, `calculateCollateralRatio`, `getCurrentCollateralRatio`, `getCurrentCollateralRatio`, `liquidatePool`, `liquidateForLender`, `withdrawRepayment`, `receive`

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getLoanStatus()` | **external** | Yes | None | None direct | None |
| `depositCollateral(uint256,bool)` | **external** | Yes | None | None direct | None |
| `addCollateralInMarginCall(address,uint256,bool)` | **external** | Yes | None | None direct | None |
| `withdrawBorrowedAmount()` | **external** | Yes | None | None direct | None |
| `borrower()` | **external** | Yes | None | None direct | None |
| `getMarginCallEndTime(address)` | **external** | Yes | None | None direct | None |
| `getBalanceDetails(address)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `closeLoan()` | **external** | Yes | None | None direct | None |
| `__ERC20Pausable_init()` | **internal** | Yes | initializer | None direct | None |
| `__ERC20Pausable_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `__Pausable_init()` | **internal** | Yes | initializer | None direct | None |
| `__Pausable_init_unchained()` | **internal** | Yes | initializer | None direct | _paused |
| `paused()` | **public** | Yes | None | None direct | None |
| `_pause()` | **internal** | No (msg/tx) | whenNotPaused | None direct | _paused |
| `_unpause()` | **internal** | No (msg/tx) | whenPaused | None direct | _paused |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `__ERC20_init(string,string)` | **internal** | Yes | initializer | None direct | None |
| `__ERC20_init_unchained(string,string)` | **internal** | Yes | initializer | None direct | _decimals, _name, _symbol |
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
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `_burn(address,uint256)` | **internal** | No (msg/tx) | None | None direct | _balances, _totalSupply |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `_setupDecimals(uint8)` | **internal** | Yes | None | None direct | _decimals |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `initialize(uint256,uint256,address,address,address,uint256,uint256,uint256,address,uint256,bool,address,uint256,uint256)` | **external** | No (msg/tx) | initializer | None direct | poolConstants, poolFactory |
| `depositCollateral(uint256,bool)` | **external** | No (msg/tx) | None | `require(bool,string)(balanceOf(msg.sender) == 0,DC2)` | None |
| `_initialDeposit(address,uint256,bool)` | **internal** | No (msg/tx) | None | None direct | None |
| `_depositCollateral(address,uint256,bool)` | **internal** | No (msg/tx) | nonReentrant | None direct | poolVariables |
| `_deposit(bool,bool,address,uint256,address,address,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `addCollateralInMarginCall(address,uint256,bool)` | **external** | No (msg/tx) | nonReentrant | `require(bool,string)(balanceOf(msg.sender) == 0,ACMC2)` | lenders, poolVariables |
| `withdrawBorrowedAmount()` | **external** | No (msg/tx) | onlyBorrower, nonReentrant | None direct | poolConstants, poolVariables |
| `_withdrawAllCollateral(address,uint256)` | **internal** | Yes | None | None direct | poolVariables |
| `lend(address,uint256,address)` | **external** | No (msg/tx) | nonReentrant | `require(bool,string)(_lender != _borrower && _borrower != msg.sender,L1)` | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | lenders |
| `_calculatePenaltyTime(uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `cancelPool()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == poolConstants.borrower,CP2)` | None |
| `_cancelPool(uint256)` | **internal** | No (msg/tx) | None | None direct | poolVariables |
| `liquidateCancelPenalty(bool,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | poolVariables |
| `terminatePool()` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == IPoolFactory(poolFactory).owner(),OO1)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == IPoolFactory(poolFactory).owner(),OO1)` | poolVariables |
| `closeLoan()` | **external** | No (msg/tx) | nonReentrant, onlyRepaymentImpl | `[Internal Call: onlyRepaymentImpl] require(bool,string)(msg.sender == IPoolFactory(poolFactory).repaymentImpl(),OR1)`<br>`[Modifier: onlyRepaymentImpl] require(bool,string)(msg.sender == IPoolFactory(poolFactory).repaymentImpl(),OR1)` | poolVariables |
| `withdrawLiquidity()` | **external** | No (msg/tx) | isLender, nonReentrant | None direct | None |
| `requestMarginCall()` | **external** | No (msg/tx) | isLender | `require(bool,string)(getMarginCallEndTime(msg.sender) == 0,RMC2)`<br>`require(bool,string)(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(msg.sender),RMC3)` | lenders |
| `interestToPay()` | **public** | No (msg/tx) | None | None direct | None |
| `calculateCollateralRatio(uint256,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getCurrentCollateralRatio()` | **public** | No (msg/tx) | None | None direct | None |
| `getCurrentCollateralRatio(address)` | **public** | No (msg/tx) | None | None direct | None |
| `liquidatePool(bool,bool,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | poolVariables |
| `_withdraw(bool,bool,address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_canLenderBeLiquidated(address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_updateLenderSharesDuringLiquidation(address)` | **internal** | Yes | None | None direct | poolVariables |
| `_liquidateForLender(bool,address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `liquidateForLender(address,bool,bool,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | lenders |
| `correspondingBorrowTokens(uint256,address,uint256)` | **public** | Yes | None | None direct | None |
| `interestPerSecond(uint256)` | **public** | Yes | None | None direct | None |
| `interestPerPeriod(uint256)` | **external** | Yes | None | None direct | None |
| `calculateCurrentPeriod()` | **external** | No (msg/tx) | None | None direct | None |
| `calculateRepaymentWithdrawable(address)` | **public** | Yes | None | None direct | None |
| `withdrawRepayment()` | **external** | No (msg/tx) | isLender, nonReentrant | None direct | None |
| `_withdrawRepayment(address)` | **internal** | Yes | None | None direct | lenders |
| `getMarginCallEndTime(address)` | **public** | No (msg/tx) | None | None direct | None |
| `getBalanceDetails(address)` | **external** | Yes | None | None direct | None |
| `getLoanStatus()` | **external** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |
| `getEquivalentTokens(address,address,uint256)` | **public** | Yes | None | None direct | None |
| `borrower()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |

---

## Contract: PoolFactory
**Linearized C3 Inheritance Tree:** IPoolFactory -> OwnableUpgradeable -> ContextUpgradeable -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `savingsAccount()` | **external** | Yes | None | None direct | None |
| `owner()` | **external** | Yes | None | None direct | None |
| `poolRegistry(address)` | **external** | Yes | None | None direct | None |
| `priceOracle()` | **external** | Yes | None | None direct | None |
| `extension()` | **external** | Yes | None | None direct | None |
| `repaymentImpl()` | **external** | Yes | None | None direct | None |
| `userRegistry()` | **external** | Yes | None | None direct | None |
| `collectionPeriod()` | **external** | Yes | None | None direct | None |
| `loanWithdrawalDuration()` | **external** | Yes | None | None direct | None |
| `marginCallDuration()` | **external** | Yes | None | None direct | None |
| `minBorrowFraction()` | **external** | Yes | None | None direct | None |
| `liquidatorRewardFraction()` | **external** | Yes | None | None direct | None |
| `poolCancelPenaltyMultiple()` | **external** | Yes | None | None direct | None |
| `getProtocolFeeData()` | **external** | Yes | None | None direct | None |
| `noStrategyAddress()` | **external** | Yes | None | None direct | None |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `initialize(address,uint256,uint256,uint256,bytes4,uint256,uint256,uint256,uint256,address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `setImplementations(address,address,address,address,address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `createPool(uint256,uint256,address,address,uint256,uint256,uint256,address,uint256,bool,bytes32,address,address)` | **external** | No (msg/tx) | onlyBorrower | `[Internal Call: onlyBorrower] require(bool,string)(IVerification(userRegistry).isUser(msg.sender,_verifier),PoolFactory::onlyBorrower - Only a valid Borrower can create Pool)`<br>`[Modifier: onlyBorrower] require(bool,string)(IVerification(userRegistry).isUser(msg.sender,_verifier),PoolFactory::onlyBorrower - Only a valid Borrower can create Pool)` | None |
| `_createPool(uint256,uint256,address,address,uint256,uint256,uint256,address,uint256,bool,bytes32,address)` | **internal** | No (msg/tx) | None | None direct | poolRegistry |
| `_encodePoolInitCall(uint256,uint256,address,address,uint256,uint256,uint256,address,uint256,bool,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_deploy(uint256,bytes32,bytes)` | **internal** | Yes | None | None direct | None |
| `isWithinLimits(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `updateSupportedBorrowTokens(address,bool)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSupportedBorrowTokens(address,bool)` | **internal** | Yes | None | None direct | isBorrowToken |
| `updateSupportedCollateralTokens(address,bool)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSupportedCollateralTokens(address,bool)` | **internal** | Yes | None | None direct | isCollateralToken |
| `updatepoolInitFuncSelector(bytes4)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatepoolInitFuncSelector(bytes4)` | **internal** | Yes | None | None direct | poolInitFuncSelector |
| `updatePoolLogic(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatePoolLogic(address)` | **internal** | Yes | None | None direct | poolImpl |
| `updateUserRegistry(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateUserRegistry(address)` | **internal** | Yes | None | None direct | userRegistry |
| `updateStrategyRegistry(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateStrategyRegistry(address)` | **internal** | Yes | None | None direct | strategyRegistry |
| `updateRepaymentImpl(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateRepaymentImpl(address)` | **internal** | Yes | None | None direct | repaymentImpl |
| `updateNoStrategy(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateNoStrategy(address)` | **internal** | Yes | None | None direct | noStrategyAddress |
| `updatePriceoracle(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatePriceoracle(address)` | **internal** | Yes | None | None direct | priceOracle |
| `updatedExtension(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatedExtension(address)` | **internal** | Yes | None | None direct | extension |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `updateCollectionPeriod(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateCollectionPeriod(uint256)` | **internal** | Yes | None | None direct | collectionPeriod |
| `updateLoanWithdrawalDuration(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateLoanWithdrawalDuration(uint256)` | **internal** | Yes | None | None direct | loanWithdrawalDuration |
| `updateMarginCallDuration(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateMarginCallDuration(uint256)` | **internal** | Yes | None | None direct | marginCallDuration |
| `updateMinBorrowFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateMinBorrowFraction(uint256)` | **internal** | Yes | None | None direct | minBorrowFraction |
| `updateLiquidatorRewardFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateLiquidatorRewardFraction(uint256)` | **internal** | Yes | None | None direct | liquidatorRewardFraction |
| `updatePoolCancelPenaltyMultiple(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updatePoolCancelPenaltyMultiple(uint256)` | **internal** | Yes | None | None direct | poolCancelPenaltyMultiple |
| `updateProtocolFeeFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateProtocolFeeFraction(uint256)` | **internal** | Yes | None | None direct | protocolFeeFraction |
| `updateProtocolFeeCollector(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateProtocolFeeCollector(address)` | **internal** | Yes | None | None direct | protocolFeeCollector |
| `updatePoolSizeLimit(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | poolSizeLimit |
| `updateidealCollateralRatioLimit(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | idealCollateralRatioLimit |
| `updateBorrowRateLimit(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | borrowRateLimit |
| `updateRepaymentIntervalLimit(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | repaymentIntervalLimit |
| `updateNoOfRepaymentIntervalsLimit(uint256,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | noOfRepaymentIntervalsLimit |
| `getProtocolFeeData()` | **external** | Yes | None | None direct | None |

---

## Contract: Repayments
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> IRepayment -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 MAX_INT`
- Privilege: `uint256 YEAR_IN_SECONDS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `initializeRepayment(uint256,uint256,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `getTotalRepaidAmount(address)` | **external** | Yes | None | None direct | None |
| `getInterestCalculationVars(address)` | **external** | Yes | None | None direct | None |
| `getCurrentLoanInterval(address)` | **external** | Yes | None | None direct | None |
| `instalmentDeadlineExtended(address)` | **external** | Yes | None | None direct | None |
| `didBorrowerDefault(address)` | **external** | Yes | None | None direct | None |
| `getGracePeriodFraction()` | **external** | Yes | None | None direct | None |
| `getNextInstalmentDeadline(address)` | **external** | Yes | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address,uint256,uint256)` | **external** | Yes | initializer | None direct | None |
| `updatePoolFactory(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)` | None |
| `_updatePoolFactory(address)` | **internal** | Yes | None | None direct | poolFactory |
| `updateGracePeriodFraction(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)` | None |
| `_updateGracePeriodFraction(uint256)` | **internal** | Yes | None | None direct | gracePeriodFraction |
| `updateGracePenaltyRate(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)`<br>`[Modifier: onlyOwner] require(bool,string)(msg.sender == poolFactory.owner(),Not owner)` | None |
| `_updateGracePenaltyRate(uint256)` | **internal** | Yes | None | None direct | gracePenaltyRate |
| `initializeRepayment(uint256,uint256,uint256,uint256,address)` | **external** | No (msg/tx) | onlyValidPool | `[Internal Call: onlyValidPool] require(bool,string)(poolFactory.poolRegistry(msg.sender),Repayments::onlyValidPool - Invalid Pool)`<br>`[Modifier: onlyValidPool] require(bool,string)(poolFactory.poolRegistry(msg.sender),Repayments::onlyValidPool - Invalid Pool)` | repayConstants |
| `getInterestPerSecond(address)` | **public** | Yes | None | None direct | None |
| `getInstalmentsCompleted(address)` | **public** | Yes | None | None direct | None |
| `getInterestDueTillInstalmentDeadline(address)` | **public** | Yes | None | None direct | None |
| `getNextInstalmentDeadline(address)` | **public** | Yes | None | None direct | None |
| `getCurrentInstalmentInterval(address)` | **public** | Yes | None | None direct | None |
| `getCurrentLoanInterval(address)` | **external** | No (msg/tx) | None | None direct | None |
| `isGracePenaltyApplicable(address)` | **public** | No (msg/tx) | None | None direct | None |
| `didBorrowerDefault(address)` | **external** | No (msg/tx) | None | None direct | None |
| `getInterestLeft(address)` | **public** | Yes | None | None direct | None |
| `getInterestOverdue(address)` | **public** | Yes | None | None direct | None |
| `repay(address,uint256)` | **external** | No (msg/tx) | nonReentrant, isPoolInitialized | None direct | None |
| `_repayExtension(address)` | **internal** | Yes | None | None direct | repayVariables |
| `_repayGracePenalty(address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_repayInterest(address,uint256,bool)` | **internal** | Yes | None | None direct | repayVariables |
| `_updateRepaidAmount(address,uint256)` | **internal** | Yes | None | None direct | repayVariables |
| `_repay(address,uint256,bool)` | **internal** | No (msg/tx) | None | None direct | None |
| `repayPrincipal(address)` | **external** | No (msg/tx) | nonReentrant, isPoolInitialized | None direct | None |
| `getTotalRepaidAmount(address)` | **external** | Yes | None | None direct | None |
| `instalmentDeadlineExtended(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == poolFactory.extension(),Repayments::repaymentExtended - Invalid caller)` | repayVariables |
| `getInterestCalculationVars(address)` | **external** | Yes | None | None direct | None |
| `getGracePeriodFraction()` | **external** | Yes | None | None direct | None |
| `_transferTokens(address,address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | MAX_INT, YEAR_IN_SECONDS |

---

## Contract: PriceOracle
**Linearized C3 Inheritance Tree:** IPriceOracle -> OwnableUpgradeable -> ContextUpgradeable -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getLatestPrice(address,address)` | **external** | Yes | None | None direct | None |
| `doesFeedExist(address,address)` | **external** | Yes | None | None direct | None |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `getChainlinkLatestPrice(address,address)` | **public** | Yes | None | None direct | None |
| `getDecimals(address)` | **internal** | Yes | None | None direct | None |
| `getUniswapLatestPrice(address,address)` | **public** | Yes | None | None direct | None |
| `getUniswapPoolTokenId(address,address)` | **internal** | Yes | None | None direct | None |
| `getLatestPrice(address,address)` | **external** | Yes | None | None direct | None |
| `doesFeedExist(address,address)` | **external** | Yes | None | None direct | None |
| `setChainlinkFeedAddress(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | chainlinkFeedAddresses, decimals |
| `setUniswapFeedAddress(address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | uniswapPools |
| `setUniswapPriceAveragingPeriod(uint32)` | **external** | No (msg/tx) | onlyOwner | None direct | uniswapPriceAveragingPeriod |

---

## Contract: SublimeProxy
**Linearized C3 Inheritance Tree:** TransparentUpgradeableProxy -> UpgradeableProxy -> Proxy
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `admin()` | **external** | No (msg/tx) | ifAdmin | `[Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)`<br>`[Modifier: ifAdmin -> Internal: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `implementation()` | **external** | No (msg/tx) | ifAdmin | `[Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)`<br>`[Modifier: ifAdmin -> Internal: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `changeAdmin(address)` | **external** | No (msg/tx) | ifAdmin | `[Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)`<br>`[Modifier: ifAdmin -> Internal: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `upgradeTo(address)` | **external** | No (msg/tx) | ifAdmin | `[Internal Call: ifAdmin] [Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)`<br>`[Modifier: ifAdmin -> Internal: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `upgradeToAndCall(address,bytes)` | **external** | No (msg/tx) | ifAdmin | `[Internal Call: ifAdmin] [Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)`<br>`[Modifier: ifAdmin -> Internal: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `_admin()` | **internal** | Yes | None | None direct | None |
| `_setAdmin(address)` | **private** | Yes | None | None direct | None |
| `_beforeFallback()` | **internal** | No (msg/tx) | None | `require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `_implementation()` | **internal** | Yes | None | None direct | None |
| `_upgradeTo(address)` | **internal** | Yes | None | None direct | None |
| `_setImplementation(address)` | **private** | Yes | None | None direct | None |
| `_delegate(address)` | **internal** | Yes | None | None direct | None |
| `_implementation()` | **internal** | Yes | None | None direct | None |
| `_fallback()` | **internal** | No (msg/tx) | None | `[Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `fallback()` | **external** | No (msg/tx) | None | `[Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `receive()` | **external** | No (msg/tx) | None | `[Internal Call: _fallback] [Internal Call: _beforeFallback] require(bool,string)(msg.sender != _admin(),TransparentUpgradeableProxy: admin cannot fallback to proxy target)` | None |
| `_beforeFallback()` | **internal** | Yes | None | None direct | None |

---

## Contract: SavingsAccount
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> ISavingsAccount
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `deposit(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `switchStrategy(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,address,address,address,bool)` | **external** | Yes | None | None direct | None |
| `withdrawAll(address)` | **external** | Yes | None | None direct | None |
| `withdrawAll(address,address)` | **external** | Yes | None | None direct | None |
| `approve(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowance(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `decreaseAllowance(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `transfer(uint256,address,address,address)` | **external** | Yes | None | None direct | None |
| `transferFrom(uint256,address,address,address,address)` | **external** | Yes | None | None direct | None |
| `balanceInShares(address,address,address)` | **external** | Yes | None | None direct | None |
| `increaseAllowanceToCreditLine(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `withdrawFrom(uint256,address,address,address,address,bool)` | **external** | Yes | None | None direct | None |
| `getTotalTokens(address,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateCreditLine(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateCreditLine(address)` | **internal** | Yes | None | None direct | creditLine |
| `updateStrategyRegistry(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateStrategyRegistry(address)` | **internal** | Yes | None | None direct | strategyRegistry |
| `deposit(uint256,address,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | balanceInShares |
| `_deposit(uint256,address,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `_depositToYield(uint256,address,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `switchStrategy(uint256,address,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | balanceInShares |
| `withdraw(uint256,address,address,address,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | balanceInShares |
| `withdrawFrom(uint256,address,address,address,address,bool)` | **external** | No (msg/tx) | nonReentrant | None direct | allowance, balanceInShares |
| `_withdraw(uint256,address,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `_transfer(uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `withdrawAll(address)` | **external** | No (msg/tx) | nonReentrant | None direct | balanceInShares |
| `withdrawAll(address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | balanceInShares |
| `approve(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | allowance |
| `increaseAllowance(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | allowance |
| `decreaseAllowance(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | allowance |
| `increaseAllowanceToCreditLine(uint256,address,address)` | **external** | No (msg/tx) | onlyCreditLine | None direct | allowance |
| `transfer(uint256,address,address,address)` | **external** | No (msg/tx) | None | None direct | balanceInShares |
| `transferFrom(uint256,address,address,address,address)` | **external** | No (msg/tx) | None | None direct | allowance, balanceInShares |
| `getTotalTokens(address,address)` | **external** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---

## Contract: SavingsAccountUtil
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `depositFromSavingsAccount(ISavingsAccount,address,address,uint256,address,address,bool,bool)` | **internal** | Yes | None | None direct | None |
| `directDeposit(ISavingsAccount,address,address,uint256,address,bool,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `directSavingsAccountDeposit(ISavingsAccount,address,address,uint256,address,address)` | **internal** | No (msg/tx) | None | None direct | None |
| `savingsAccountTransfer(ISavingsAccount,address,address,uint256,address,address)` | **internal** | Yes | None | None direct | None |
| `withdrawFromSavingsAccount(ISavingsAccount,address,address,uint256,address,address,bool)` | **internal** | Yes | None | None direct | None |
| `transferTokens(address,uint256,address,address)` | **internal** | No (msg/tx) | None | None direct | None |

---

## Contract: Verification
**Linearized C3 Inheritance Tree:** OwnableUpgradeable -> ContextUpgradeable -> IVerification -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `isUser(address,address)` | **external** | Yes | None | None direct | None |
| `registerMasterAddress(address,bool)` | **external** | Yes | None | None direct | None |
| `unregisterMasterAddress(address,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,uint256)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateActivationDelay(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateActivationDelay(uint256)` | **internal** | Yes | None | None direct | activationDelay |
| `addVerifier(address)` | **external** | No (msg/tx) | onlyOwner | None direct | verifiers |
| `removeVerifier(address)` | **external** | No (msg/tx) | onlyOwner | None direct | verifiers |
| `registerMasterAddress(address,bool)` | **external** | No (msg/tx) | onlyVerifier | `[Internal Call: onlyVerifier] require(bool,string)(verifiers[msg.sender],Invalid verifier)`<br>`[Modifier: onlyVerifier] require(bool,string)(verifiers[msg.sender],Invalid verifier)`<br>`require(bool,string)(masterAddresses[_masterAddress][msg.sender] == 0,V:RMA-Already registered)` | masterAddresses |
| `unregisterMasterAddress(address,address)` | **external** | No (msg/tx) | None | `require(bool,string)(masterAddresses[_masterAddress][msg.sender] != 0 && msg.sender == _verifier,V:UMA-Invalid verifier)` | masterAddresses |
| `_linkAddress(address,address)` | **internal** | No (msg/tx) | None | None direct | linkedAddresses |
| `requestAddressLinking(address)` | **external** | No (msg/tx) | None | None direct | pendingLinkAddresses |
| `cancelAddressLinkingRequest(address)` | **external** | No (msg/tx) | None | `require(bool,string)(pendingLinkAddresses[_linkedAddress][msg.sender],V:CALR-No pending request)` | pendingLinkAddresses |
| `linkAddress(address)` | **external** | No (msg/tx) | None | `require(bool,string)(linkedAddresses[msg.sender].masterAddress == address(0),V:LA-Address already linked)`<br>`require(bool,string)(pendingLinkAddresses[msg.sender][_masterAddress],V:LA-No pending request)` | None |
| `unlinkAddress(address)` | **external** | No (msg/tx) | None | `require(bool,string)(_linkedTo == msg.sender,V:UA-Not linked to sender)` | linkedAddresses |
| `isUser(address,address)` | **external** | No (msg/tx) | None | None direct | None |

---

## Contract: AdminVerifier
**Linearized C3 Inheritance Tree:** OwnableUpgradeable -> ContextUpgradeable -> IVerifier -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `registerUser(address,string,bool)` | **external** | No (msg/tx) | onlyOwner | None direct | userData |
| `unregisterUser(address)` | **external** | No (msg/tx) | onlyOwner | None direct | userData |
| `updateVerification(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateVerification(address)` | **internal** | Yes | None | None direct | verification |

---

## Contract: AaveLendingPool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deposit(address,uint256,address,uint16)` | **external** | Yes | None | None direct | None |
| `withdraw(address,uint256,address)` | **external** | Yes | None | None direct | None |
| `getReserveData(address)` | **external** | Yes | None | None direct | None |
| `getAddressesProvider()` | **external** | Yes | None | None direct | None |

---

## Contract: DataTypes
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: ICEther
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint()` | **external** | Yes | None | None direct | None |
| `repayBorrow()` | **external** | Yes | None | None direct | None |
| `repayBorrowBehalf(address)` | **external** | Yes | None | None direct | None |
| `liquidateBorrow(address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: ICToken
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `underlying()` | **external** | Yes | None | None direct | None |
| `mint(uint256)` | **external** | Yes | None | None direct | None |
| `redeem(uint256)` | **external** | Yes | None | None direct | None |
| `liquidateBorrow(address,uint256,address)` | **external** | Yes | None | None direct | None |
| `repayBorrow(uint256)` | **external** | Yes | None | None direct | None |
| `repayBorrowBehalf(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOfUnderlying(address)` | **external** | Yes | None | None direct | None |
| `exchangeRateCurrent()` | **external** | Yes | None | None direct | None |
| `exchangeRateStored()` | **external** | Yes | None | None direct | None |
| `supplyRatePerBlock()` | **external** | Yes | None | None direct | None |
| `redeemUnderlying(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILendingPoolAddressesProvider
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getMarketId()` | **external** | Yes | None | None direct | None |
| `setMarketId(string)` | **external** | Yes | None | None direct | None |
| `setAddress(bytes32,address)` | **external** | Yes | None | None direct | None |
| `setAddressAsProxy(bytes32,address)` | **external** | Yes | None | None direct | None |
| `getAddress(bytes32)` | **external** | Yes | None | None direct | None |
| `getLendingPool()` | **external** | Yes | None | None direct | None |
| `setLendingPoolImpl(address)` | **external** | Yes | None | None direct | None |
| `getLendingPoolConfigurator()` | **external** | Yes | None | None direct | None |
| `setLendingPoolConfiguratorImpl(address)` | **external** | Yes | None | None direct | None |
| `getLendingPoolCollateralManager()` | **external** | Yes | None | None direct | None |
| `setLendingPoolCollateralManager(address)` | **external** | Yes | None | None direct | None |
| `getPoolAdmin()` | **external** | Yes | None | None direct | None |
| `setPoolAdmin(address)` | **external** | Yes | None | None direct | None |
| `getEmergencyAdmin()` | **external** | Yes | None | None direct | None |
| `setEmergencyAdmin(address)` | **external** | Yes | None | None direct | None |
| `getPriceOracle()` | **external** | Yes | None | None direct | None |
| `setPriceOracle(address)` | **external** | Yes | None | None direct | None |
| `getLendingRateOracle()` | **external** | Yes | None | None direct | None |
| `setLendingRateOracle(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IProtocolDataProvider
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `ADDRESSES_PROVIDER()` | **external** | Yes | None | None direct | None |
| `getAllReservesTokens()` | **external** | Yes | None | None direct | None |
| `getAllATokens()` | **external** | Yes | None | None direct | None |
| `getReserveConfigurationData(address)` | **external** | Yes | None | None direct | None |
| `getReserveData(address)` | **external** | Yes | None | None direct | None |
| `getUserReserveData(address,address)` | **external** | Yes | None | None direct | None |
| `getReserveTokensAddresses(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IScaledBalanceToken
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `scaledBalanceOf(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IWETHGateway
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `depositETH(address,address,uint16)` | **external** | Yes | None | None direct | None |
| `withdrawETH(uint256,address)` | **external** | Yes | None | None direct | None |
| `getWETHAddress()` | **external** | Yes | None | None direct | None |
| `getAWETHAddress()` | **external** | Yes | None | None direct | None |
| `getLendingPoolAddress()` | **external** | Yes | None | None direct | None |

---

## Contract: IyVault
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `earn()` | **external** | Yes | None | None direct | None |
| `depositAll()` | **external** | Yes | None | None direct | None |
| `deposit(uint256)` | **external** | Yes | None | None direct | None |
| `depositETH()` | **external** | Yes | None | None direct | None |
| `withdrawAll()` | **external** | Yes | None | None direct | None |
| `withdrawAllETH()` | **external** | Yes | None | None direct | None |
| `harvest(address,uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `withdrawETH(uint256)` | **external** | Yes | None | None direct | None |
| `getPricePerFullShare()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `setMin(uint256)` | **external** | Yes | None | None direct | None |
| `min()` | **external** | Yes | None | None direct | None |

---

## Contract: Token
**Linearized C3 Inheritance Tree:** Ownable -> ERC20 -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
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
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |

---

## Contract: IStrategy
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `want()` | **external** | Yes | None | None direct | None |
| `deposit()` | **external** | Yes | None | None direct | None |
| `withdraw(address)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `withdrawAll()` | **external** | Yes | None | None direct | None |
| `balanceOf()` | **external** | Yes | None | None direct | None |

---

## Contract: Converter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `convert(address)` | **external** | Yes | None | None direct | None |

---

## Contract: OneSplitAudit
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `swap(address,address,uint256,uint256,uint256[],uint256)` | **external** | Yes | None | None direct | None |
| `getExpectedReturn(address,address,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: Controller
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 max`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setRewards(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | rewards |
| `setStrategist(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | strategist |
| `setSplit(uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | split |
| `setOneSplit(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | onesplit |
| `setGovernance(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | governance |
| `setVault(address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!strategist)` | vaults |
| `approveStrategy(address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | approvedStrategies |
| `revokeStrategy(address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | approvedStrategies |
| `setConverter(address,address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!strategist)` | converters |
| `setStrategy(address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!strategist)` | strategies |
| `earn(address,uint256)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `withdrawAll(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!strategist)` | None |
| `inCaseTokensGetStuck(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!governance)` | None |
| `inCaseStrategyTokenGetStuck(address,address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!governance)` | None |
| `getExpectedReturn(address,address,uint256)` | **public** | Yes | None | None direct | None |
| `yearn(address,address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == strategist || msg.sender == governance,!governance)` | None |
| `withdraw(address,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == vaults[_token],!vault)` | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | split |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | max |

---

## Contract: IController
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `vaults(address)` | **external** | Yes | None | None direct | None |
| `strategies(address)` | **external** | Yes | None | None direct | None |
| `rewards()` | **external** | Yes | None | None direct | None |
| `approveStrategy(address,address)` | **external** | Yes | None | None direct | None |
| `setStrategy(address,address)` | **external** | Yes | None | None direct | None |
| `withdraw(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `earn(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: Strategy
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_approveAll()` | **internal** | Yes | None | None direct | None |
| `deposit()` | **public** | Yes | None | None direct | None |
| `withdraw(IERC20)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!controller)` | None |
| `withdraw(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!controller)` | None |
| `withdrawAll()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!controller)` | None |
| `balanceOf()` | **public** | Yes | None | None direct | None |
| `setGovernance(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | governance |
| `setController(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | controller |

---

## Contract: WETH
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deposit()` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: yVault
**Linearized C3 Inheritance Tree:** ERC20Detailed -> ERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 max`

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
| `_burnFrom(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `balance()` | **public** | Yes | None | None direct | None |
| `setMin(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | min |
| `setGovernance(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | governance |
| `setController(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == governance,!governance)` | controller |
| `available()` | **public** | Yes | None | None direct | None |
| `earn()` | **public** | Yes | None | None direct | None |
| `depositAll()` | **external** | No (msg/tx) | None | None direct | None |
| `deposit(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `depositETH()` | **public** | No (msg/tx) | None | None direct | None |
| `withdrawAll()` | **external** | No (msg/tx) | None | None direct | None |
| `withdrawAllETH()` | **external** | No (msg/tx) | None | None direct | None |
| `harvest(address,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == controller,!controller)` | None |
| `withdraw(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `withdrawETH(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getPricePerFullShare()` | **public** | Yes | None | None direct | None |
| `receive()` | **external** | No (msg/tx) | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | min |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | max |

---

## Contract: AaveYield
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `liquidityToken(address)` | **external** | Yes | None | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockTokens(address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockShares(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTokensForShares(uint256,address)` | **external** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,address,address,address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `liquidityToken(address)` | **public** | Yes | None | None direct | None |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `updateAaveAddresses(address,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateAaveAddresses(address,address,address)` | **internal** | Yes | None | None direct | lendingPoolAddressesProvider, protocolDataProvider, wethGateway |
| `updateReferralCode(uint16)` | **external** | No (msg/tx) | onlyOwner | None direct | referralCode |
| `emergencyWithdraw(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockTokens(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockShares(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `getTokensForShares(uint256,address)` | **public** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `_depositETH(uint256)` | **internal** | Yes | None | None direct | None |
| `_depositERC20(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawETH(uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawERC(address,uint256)` | **internal** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---

## Contract: CompoundYield
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `liquidityToken(address)` | **external** | Yes | None | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockTokens(address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockShares(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTokensForShares(uint256,address)` | **external** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `updateProtocolAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | liquidityToken |
| `emergencyWithdraw(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockTokens(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockShares(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `getTokensForShares(uint256,address)` | **public** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `_depositETH(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_depositERC20(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawETH(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawERC(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---

## Contract: NoYield
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `liquidityToken(address)` | **external** | Yes | None | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockTokens(address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockShares(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTokensForShares(uint256,address)` | **external** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `liquidityToken(address)` | **external** | Yes | None | None direct | None |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `emergencyWithdraw(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockTokens(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockShares(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `_unlockTokens(address,uint256)` | **internal** | Yes | None | None direct | None |
| `getTokensForShares(uint256,address)` | **external** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |

---

## Contract: StrategyRegistry
**Linearized C3 Inheritance Tree:** IStrategyRegistry -> OwnableUpgradeable -> ContextUpgradeable -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `registry(address)` | **external** | Yes | None | None direct | None |
| `getStrategies()` | **external** | Yes | None | None direct | None |
| `addStrategy(address)` | **external** | Yes | None | None direct | None |
| `removeStrategy(uint256)` | **external** | Yes | None | None direct | None |
| `updateStrategy(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `initialize(address,uint256)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateMaxStrategies(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateMaxStrategies(uint256)` | **internal** | Yes | None | None direct | maxStrategies |
| `getStrategies()` | **external** | Yes | None | None direct | None |
| `addStrategy(address)` | **external** | No (msg/tx) | onlyOwner | None direct | registry, strategies |
| `removeStrategy(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | registry, strategies |
| `updateStrategy(uint256,address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | registry, strategies |

---

## Contract: YearnYield
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> OwnableUpgradeable -> ContextUpgradeable -> Initializable -> IYield
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `__Ownable_init()` | **internal** | No (msg/tx) | initializer | None direct | None |
| `__Ownable_init_unchained()` | **internal** | No (msg/tx) | initializer | None direct | _owner |
| `owner()` | **public** | Yes | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | _owner |
| `__Context_init()` | **internal** | Yes | initializer | None direct | None |
| `__Context_init_unchained()` | **internal** | Yes | initializer | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_isConstructor()` | **private** | Yes | None | None direct | None |
| `liquidityToken(address)` | **external** | Yes | None | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockTokens(address,uint256)` | **external** | Yes | None | None direct | None |
| `unlockShares(address,uint256)` | **external** | Yes | None | None direct | None |
| `getTokensForShares(uint256,address)` | **external** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | initializer | None direct | None |
| `updateSavingsAccount(address)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_updateSavingsAccount(address)` | **internal** | Yes | None | None direct | savingsAccount |
| `updateProtocolAddresses(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | liquidityToken |
| `emergencyWithdraw(address,address)` | **external** | No (msg/tx) | onlyOwner, nonReentrant | None direct | None |
| `lockTokens(address,address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockTokens(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `unlockShares(address,uint256)` | **external** | No (msg/tx) | onlySavingsAccount, nonReentrant | None direct | None |
| `getTokensForShares(uint256,address)` | **public** | Yes | None | None direct | None |
| `getSharesForTokens(uint256,address)` | **external** | Yes | None | None direct | None |
| `_depositETH(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_depositERC20(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawETH(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_withdrawERC(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |

---
