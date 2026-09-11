# 🛡️ Access Control & Authorization (Privilege Mapping)

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
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ISwapQueue
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: IGasQueue
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: IVaderPool
**Linearized C3 Inheritance Tree:** IERC721 -> IERC165 -> IBasePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address,bytes)` | **external** | Yes | None | None direct | None |
| `mint(address)` | **external** | Yes | None | None direct | None |
| `getReserves()` | **external** | Yes | None | None direct | None |
| `burn(uint256,address)` | **external** | Yes | None | None direct | None |
| `toggleQueue()` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderPoolFactory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `createPool(address,address)` | **external** | Yes | None | None direct | None |
| `getPool(address,address)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |

---

## Contract: IBasePool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address,bytes)` | **external** | Yes | None | None direct | None |
| `mint(address)` | **external** | Yes | None | None direct | None |
| `getReserves()` | **external** | Yes | None | None direct | None |

---

## Contract: ITimelock
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `delay()` | **external** | Yes | None | None direct | None |
| `GRACE_PERIOD()` | **external** | Yes | None | None direct | None |
| `acceptAdmin()` | **external** | Yes | None | None direct | None |
| `queuedTransactions(bytes32)` | **external** | Yes | None | None direct | None |
| `queueTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `cancelTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `executeTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IERC20Extended
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
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IUSDV
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `distributeEmission()` | **external** | Yes | None | None direct | None |

---

## Contract: IVader
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `createEmission(address,uint256)` | **external** | Yes | None | None direct | None |
| `calculateFee()` | **external** | Yes | None | None direct | None |
| `getCurrentEraEmission()` | **external** | Yes | None | None direct | None |
| `getEraEmission(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILinearVesting
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getClaim()` | **external** | Yes | None | None direct | None |
| `claim()` | **external** | Yes | None | None direct | None |
| `claimConverted()` | **external** | Yes | None | None direct | None |
| `begin()` | **external** | Yes | None | None direct | None |
| `vestFor(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IConverter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `convert(bytes32[],uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderReserve
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `reimburseImpermanentLoss(address,uint256)` | **external** | Yes | None | None direct | None |
| `grant(address,uint256)` | **external** | Yes | None | None direct | None |
| `reserve()` | **external** | Yes | None | None direct | None |

---

## Contract: IXVader
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
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getPastVotes(address,uint256)` | **external** | Yes | None | None direct | None |
| `getPastTotalSupply(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IAggregator
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `latestAnswer()` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderRouterV2
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ILPWrapper
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `tokens(IERC20)` | **external** | Yes | None | None direct | None |
| `createWrapper(IERC20)` | **external** | Yes | None | None direct | None |

---

## Contract: ILPToken
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ISynth
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
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ISynthFactory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `synths(IERC20)` | **external** | Yes | None | None direct | None |
| `createSynth(IERC20Extended)` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderPoolFactoryV2
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `createPool(address,address)` | **external** | Yes | None | None direct | None |
| `getPool(address,address)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |

---

## Contract: IVaderPoolV2
**Linearized C3 Inheritance Tree:** IERC721 -> IERC165 -> IBasePoolV2
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `getReserves(IERC20)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |
| `supported(IERC20)` | **external** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `cumulativePrices(IERC20)` | **external** | Yes | None | None direct | None |
| `mintSynth(IERC20,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `burnSynth(IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `mintFungible(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `burnFungible(IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `burn(uint256,address)` | **external** | Yes | None | None direct | None |
| `toggleQueue()` | **external** | Yes | None | None direct | None |
| `setTokenSupport(IERC20,bool)` | **external** | Yes | None | None direct | None |
| `setFungibleTokenSupport(IERC20)` | **external** | Yes | None | None direct | None |

---

## Contract: IBasePoolV2
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getReserves(IERC20)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |
| `supported(IERC20)` | **external** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: VaderMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 ONE`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `calculateLiquidityUnits(uint256,uint256,uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calculateSlipAdjustment(uint256,uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calculateLoss(uint256,uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calculateSwap(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calculateSwapReverse(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `delta(uint256,uint256)` | **public** | Yes | None | None direct | None |
| `pow(uint256)` | **public** | Yes | None | None direct | None |
| `root(uint256)` | **public** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | ONE |

---

## Contract: IERC20Permit
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |

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
| `forceApprove(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `safePermit(IERC20Permit,address,address,uint256,uint256,uint8,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `_callOptionalReturn(IERC20,bytes)` | **private** | Yes | None | None direct | None |
| `_callOptionalReturnBool(IERC20,bytes)` | **private** | Yes | None | None direct | None |

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
| `verifyCallResultFromTarget(address,bool,bytes,string)` | **internal** | Yes | None | None direct | None |
| `verifyCallResult(bool,bytes,string)` | **internal** | Yes | None | None direct | None |
| `_revert(bytes,string)` | **private** | Yes | None | None direct | None |

---

## Contract: VaderRouter
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> IVaderRouter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IVaderPoolFactory factory`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **public** | No (msg/tx) | ensure | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **public** | No (msg/tx) | ensure | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,address[],address,uint256)` | **external** | No (msg/tx) | ensure | None direct | None |
| `swapTokensForExactTokens(uint256,uint256,address[],address,uint256)` | **external** | No (msg/tx) | ensure | None direct | None |
| `initialize(IVaderReserve)` | **external** | No (msg/tx) | onlyOwner | None direct | reserve |
| `_swap(uint256,address[],address)` | **private** | No (msg/tx) | None | None direct | None |
| `_addLiquidity(address,address,uint256,uint256)` | **private** | Yes | None | None direct | None |
| `calculateInGivenOut(uint256,address[])` | **public** | Yes | None | None direct | None |
| `calculateOutGivenIn(uint256,address[])` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: SwapQueue
**Linearized C3 Inheritance Tree:** ProtocolConstants -> ISwapQueue
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `executeQueue()` | **external** | No (msg/tx) | None | None direct | None |
| `_insertQueue(uint256)` | **internal** | Yes | None | None direct | None |
| `_executeQueue()` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: IERC721Receiver
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `onERC721Received(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: Strings
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes16 _SYMBOLS`
- Privilege: `uint8 _ADDRESS_LENGTH`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `toString(uint256)` | **internal** | Yes | None | None direct | None |
| `toString(int256)` | **internal** | Yes | None | None direct | None |
| `toHexString(uint256)` | **internal** | Yes | None | None direct | None |
| `toHexString(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `toHexString(address)` | **internal** | Yes | None | None direct | None |
| `equal(string,string)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _ADDRESS_LENGTH, _SYMBOLS |

---

## Contract: Math
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `max(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `min(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `average(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `ceilDiv(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mulDiv(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `mulDiv(uint256,uint256,uint256,Math.Rounding)` | **internal** | Yes | None | None direct | None |
| `sqrt(uint256)` | **internal** | Yes | None | None direct | None |
| `sqrt(uint256,Math.Rounding)` | **internal** | Yes | None | None direct | None |
| `log2(uint256)` | **internal** | Yes | None | None direct | None |
| `log2(uint256,Math.Rounding)` | **internal** | Yes | None | None direct | None |
| `log10(uint256)` | **internal** | Yes | None | None direct | None |
| `log10(uint256,Math.Rounding)` | **internal** | Yes | None | None direct | None |
| `log256(uint256)` | **internal** | Yes | None | None direct | None |
| `log256(uint256,Math.Rounding)` | **internal** | Yes | None | None direct | None |

---

## Contract: SignedMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `max(int256,int256)` | **internal** | Yes | None | None direct | None |
| `min(int256,int256)` | **internal** | Yes | None | None direct | None |
| `average(int256,int256)` | **internal** | Yes | None | None direct | None |
| `abs(int256)` | **internal** | Yes | None | None direct | None |

---

## Contract: BasePool
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> Ownable -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 nativeAsset`
- Privilege: `IERC20 foreignAsset`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | None |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_ownerOf(uint256)` | **internal** | Yes | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_setApprovalForAll(address,address,bool)` | **internal** | Yes | None | None direct | _operatorApprovals |
| `_requireMinted(uint256)` | **internal** | Yes | None | None direct | None |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `__unsafe_increaseBalance(address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address,bytes)` | **external** | Yes | None | None direct | None |
| `mint(address)` | **external** | Yes | None | None direct | None |
| `getReserves()` | **external** | Yes | None | None direct | None |
| `getReserves()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `mint(address)` | **external** | No (msg/tx) | nonReentrant | None direct | positionId, positions, totalSupply |
| `_burn(uint256,address)` | **internal** | No (msg/tx) | nonReentrant | None direct | totalSupply |
| `swap(uint256,uint256,address,bytes)` | **external** | No (msg/tx) | None | None direct | None |
| `swap(uint256,uint256,address)` | **public** | No (msg/tx) | nonReentrant, validateGas | None direct | None |
| `_update(uint256,uint256,uint112,uint112)` | **internal** | No (msg/tx) | None | None direct | _blockTimestampLast, _reserveForeign, _reserveNative, priceForeignCumulativeLast, priceNativeCumulativeLast |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: UQ112x112
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint224 Q112`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `encode(uint112)` | **internal** | Yes | None | None direct | None |
| `uqdiv(uint224,uint112)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | Q112 |

---

## Contract: VaderPool
**Linearized C3 Inheritance Tree:** BasePool -> ReentrancyGuard -> Ownable -> ERC721 -> IERC721Metadata -> IVaderPool -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 nativeAsset`
- Privilege: `IERC20 foreignAsset`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getReserves()` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `mint(address)` | **external** | No (msg/tx) | nonReentrant | None direct | positionId, positions, totalSupply |
| `_burn(uint256,address)` | **internal** | No (msg/tx) | nonReentrant | None direct | totalSupply |
| `swap(uint256,uint256,address,bytes)` | **external** | No (msg/tx) | None | None direct | None |
| `swap(uint256,uint256,address)` | **public** | No (msg/tx) | nonReentrant, validateGas | None direct | None |
| `_update(uint256,uint256,uint112,uint112)` | **internal** | No (msg/tx) | None | None direct | _blockTimestampLast, _reserveForeign, _reserveNative, priceForeignCumulativeLast, priceNativeCumulativeLast |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | None |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_ownerOf(uint256)` | **internal** | Yes | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_setApprovalForAll(address,address,bool)` | **internal** | Yes | None | None direct | _operatorApprovals |
| `_requireMinted(uint256)` | **internal** | Yes | None | None direct | None |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `__unsafe_increaseBalance(address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `swap(uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(uint256,uint256,address,bytes)` | **external** | Yes | None | None direct | None |
| `mint(address)` | **external** | Yes | None | None direct | None |
| `getReserves()` | **external** | Yes | None | None direct | None |
| `burn(uint256,address)` | **external** | Yes | None | None direct | None |
| `toggleQueue()` | **external** | Yes | None | None direct | None |
| `burn(uint256,address)` | **external** | No (msg/tx) | None | None direct | positions |
| `toggleQueue()` | **external** | No (msg/tx) | onlyOwner | None direct | queueActive |
| `_onlyDAO()` | **private** | No (msg/tx) | None | None direct | None |
| `_min(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: VaderPoolFactory
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> IVaderPoolFactory
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `createPool(address,address)` | **external** | Yes | None | None direct | None |
| `getPool(address,address)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |
| `createPool(address,address)` | **external** | Yes | None | None direct | allPools, getPool |
| `initialize(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | nativeAsset |
| `toggleQueue(address,address)` | **external** | No (msg/tx) | onlyDAO | None direct | None |
| `_onlyDAO()` | **private** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: GasThrottle
**Linearized C3 Inheritance Tree:** ProtocolConstants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: GovernorAlpha
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string name`
- Privilege: `IXVader xVader`
- Privilege: `bytes32 DOMAIN_TYPEHASH`
- Privilege: `bytes32 BALLOT_TYPEHASH`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `quorumVotes(uint256)` | **public** | Yes | None | None direct | None |
| `proposalMaxOperations()` | **public** | Yes | None | None direct | None |
| `votingDelay()` | **public** | Yes | None | None direct | None |
| `votingPeriod()` | **public** | Yes | None | None direct | None |
| `getActions(uint256)` | **public** | Yes | None | None direct | None |
| `getReceipt(uint256,address)` | **public** | Yes | None | None direct | None |
| `state(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `setTimelock(address)` | **external** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | timelock |
| `propose(address[],uint256[],string[],bytes[],string)` | **public** | No (msg/tx) | None | None direct | latestProposalIds, proposalCount, proposals |
| `queue(uint256)` | **public** | No (msg/tx) | None | None direct | proposals |
| `execute(uint256)` | **public** | No (msg/tx) | None | None direct | proposals |
| `castVote(uint256,bool)` | **public** | No (msg/tx) | None | None direct | None |
| `castVoteBySig(uint256,bool,uint8,bytes32,bytes32)` | **public** | No (msg/tx) | None | None direct | None |
| `changeFeeReceiver(address)` | **external** | No (msg/tx) | onlyGuardian | `[Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | feeReceiver |
| `changeFeeAmount(uint256)` | **external** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | feeAmount |
| `veto(uint256,bool)` | **external** | No (msg/tx) | onlyCouncil | `[Internal Call: _onlyCouncil] require(bool,string)(msg.sender == council,GovernorAlpha::_onlyCouncil: only council can call)`<br>`[Modifier: onlyCouncil -> Internal: _onlyCouncil] require(bool,string)(msg.sender == council,GovernorAlpha::_onlyCouncil: only council can call)` | None |
| `changeCouncil(address)` | **external** | No (msg/tx) | onlyTimelock | `[Internal Call: onlyTimelock] [Internal Call: _onlyTimelock] require(bool,string)(msg.sender == address(timelock),GovernorAlpha::_onlyTimelock: only timelock can call)`<br>`[Modifier: onlyTimelock -> Internal: _onlyTimelock] require(bool,string)(msg.sender == address(timelock),GovernorAlpha::_onlyTimelock: only timelock can call)` | council |
| `cancel(uint256)` | **public** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | proposals |
| `__acceptAdmin()` | **public** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | None |
| `__abdicate()` | **public** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | guardian |
| `__queueSetTimelockPendingAdmin(address,uint256)` | **public** | No (msg/tx) | onlyGuardian | `[Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | None |
| `__executeSetTimelockPendingAdmin(address,uint256)` | **public** | No (msg/tx) | onlyGuardian | `[Internal Call: onlyGuardian] [Internal Call: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`<br>`[Modifier: onlyGuardian -> Internal: _onlyGuardian] require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | None |
| `_queueOrRevert(address,uint256,string,bytes,uint256)` | **internal** | Yes | None | None direct | None |
| `_castVote(address,uint256,bool)` | **internal** | No (msg/tx) | None | None direct | proposals |
| `getChainId()` | **internal** | Yes | None | None direct | None |
| `_onlyGuardian()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)` | None |
| `_onlyTimelock()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == address(timelock),GovernorAlpha::_onlyTimelock: only timelock can call)` | None |
| `_onlyCouncil()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == council,GovernorAlpha::_onlyCouncil: only council can call)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | BALLOT_TYPEHASH, DOMAIN_TYPEHASH, name |

---

## Contract: Timelock
**Linearized C3 Inheritance Tree:** ITimelock
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `delay()` | **external** | Yes | None | None direct | None |
| `GRACE_PERIOD()` | **external** | Yes | None | None direct | None |
| `acceptAdmin()` | **external** | Yes | None | None direct | None |
| `queuedTransactions(bytes32)` | **external** | Yes | None | None direct | None |
| `queueTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `cancelTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `executeTransaction(address,uint256,string,bytes,uint256)` | **external** | Yes | None | None direct | None |
| `receive()` | **external** | Yes | None | None direct | None |
| `GRACE_PERIOD()` | **public** | Yes | None | None direct | None |
| `MINIMUM_DELAY()` | **public** | Yes | None | None direct | None |
| `MAXIMUM_DELAY()` | **public** | Yes | None | None direct | None |
| `setDelay(uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == address(this),Timelock::setDelay: Call must come from Timelock.)` | delay |
| `acceptAdmin()` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == pendingAdmin,Timelock::acceptAdmin: Call must come from pendingAdmin.)` | admin, pendingAdmin |
| `setPendingAdmin(address)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == address(this),Timelock::setPendingAdmin: Call must come from Timelock.)` | pendingAdmin |
| `queueTransaction(address,uint256,string,bytes,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == admin,Timelock::queueTransaction: Call must come from admin.)` | queuedTransactions |
| `cancelTransaction(address,uint256,string,bytes,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == admin,Timelock::cancelTransaction: Call must come from admin.)` | queuedTransactions |
| `executeTransaction(address,uint256,string,bytes,uint256)` | **public** | No (msg/tx) | None | `require(bool,string)(msg.sender == admin,Timelock::executeTransaction: Call must come from admin.)` | queuedTransactions |
| `getBlockTimestamp()` | **internal** | No (msg/tx) | None | None direct | None |

---

## Contract: IERC20Metadata
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
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |

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

## Contract: IUniswapV2Factory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `feeTo()` | **external** | Yes | None | None direct | None |
| `feeToSetter()` | **external** | Yes | None | None direct | None |
| `getPair(address,address)` | **external** | Yes | None | None direct | None |
| `allPairs(uint256)` | **external** | Yes | None | None direct | None |
| `allPairsLength()` | **external** | Yes | None | None direct | None |
| `createPair(address,address)` | **external** | Yes | None | None direct | None |
| `setFeeTo(address)` | **external** | Yes | None | None direct | None |
| `setFeeToSetter(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IUniswapV2Pair
**Linearized C3 Inheritance Tree:** IUniswapV2ERC20
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

## Contract: Babylonian
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `sqrt(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: BitMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mostSignificantBit(uint256)` | **internal** | Yes | None | None direct | None |
| `leastSignificantBit(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: FixedPoint
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint8 RESOLUTION`
- Privilege: `uint256 Q112`
- Privilege: `uint256 Q224`
- Privilege: `uint256 LOWER_MASK`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `encode(uint112)` | **internal** | Yes | None | None direct | None |
| `encode144(uint144)` | **internal** | Yes | None | None direct | None |
| `decode(FixedPoint.uq112x112)` | **internal** | Yes | None | None direct | None |
| `decode144(FixedPoint.uq144x112)` | **internal** | Yes | None | None direct | None |
| `mul(FixedPoint.uq112x112,uint256)` | **internal** | Yes | None | None direct | None |
| `muli(FixedPoint.uq112x112,int256)` | **internal** | Yes | None | None direct | None |
| `muluq(FixedPoint.uq112x112,FixedPoint.uq112x112)` | **internal** | Yes | None | None direct | None |
| `divuq(FixedPoint.uq112x112,FixedPoint.uq112x112)` | **internal** | Yes | None | None direct | None |
| `fraction(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `reciprocal(FixedPoint.uq112x112)` | **internal** | Yes | None | None direct | None |
| `sqrt(FixedPoint.uq112x112)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | LOWER_MASK, Q112, Q224, RESOLUTION |

---

## Contract: FullMath
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fullMul(uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `fullDiv(uint256,uint256,uint256)` | **private** | Yes | None | None direct | None |
| `mulDiv(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: UniswapV2Library
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `sortTokens(address,address)` | **internal** | Yes | None | None direct | None |
| `pairFor(address,address,address)` | **internal** | Yes | None | None direct | None |
| `getReserves(address,address,address)` | **internal** | Yes | None | None direct | None |
| `quote(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `getAmountOut(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `getAmountIn(uint256,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `getAmountsOut(address,uint256,address[])` | **internal** | Yes | None | None direct | None |
| `getAmountsIn(address,uint256,address[])` | **internal** | Yes | None | None direct | None |

---

## Contract: UniswapV2OracleLibrary
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `currentBlockTimestamp()` | **internal** | No (msg/tx) | None | None direct | None |
| `currentCumulativePrices(address)` | **internal** | No (msg/tx) | None | None direct | None |

---

## Contract: TwapOracle
**Linearized C3 Inheritance Tree:** Ownable -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `pairExists(address,address)` | **public** | Yes | None | None direct | None |
| `consult(address)` | **public** | Yes | None | None direct | None |
| `getRate()` | **public** | Yes | None | None direct | None |
| `usdvtoVader(uint256)` | **external** | Yes | None | None direct | None |
| `vaderToUsdv(uint256)` | **external** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | USDV, VADER |
| `enableUSDV()` | **external** | No (msg/tx) | onlyOwner | None direct | _usdvEnabled |
| `registerAggregator(address,address)` | **external** | No (msg/tx) | onlyOwner, initialized | None direct | _aggregators |
| `registerPair(address,address,address)` | **external** | No (msg/tx) | onlyOwner, initialized | None direct | _pairExists, _pairs |
| `update()` | **external** | No (msg/tx) | onlyOwner, initialized | None direct | _pairs |

---

## Contract: ProtocolConstants
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: Vader
**Linearized C3 Inheritance Tree:** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> IVader
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
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
| `_spendAllowance(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `createEmission(address,uint256)` | **external** | Yes | None | None direct | None |
| `calculateFee()` | **external** | Yes | None | None direct | None |
| `getCurrentEraEmission()` | **external** | Yes | None | None direct | None |
| `getEraEmission(uint256)` | **external** | Yes | None | None direct | None |
| `calculateFee()` | **public** | Yes | None | None direct | None |
| `getCurrentEraEmission()` | **external** | Yes | None | None direct | None |
| `getEraEmission(uint256)` | **public** | Yes | None | None direct | None |
| `createEmission(address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `setComponents(IConverter,ILinearVesting,IUSDV,address)` | **external** | No (msg/tx) | onlyOwner | None direct | converter, untaxed, usdv, vest |
| `claimGrant(address,uint256)` | **external** | No (msg/tx) | onlyDAO | None direct | None |
| `adjustMaxSupply(uint256)` | **external** | No (msg/tx) | onlyDAO | None direct | maxSupply |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_onlyDAO()` | **private** | No (msg/tx) | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | No (msg/tx) | None | None direct | emissionCurve, lastEmission, maxSupply |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: USDV
**Linearized C3 Inheritance Tree:** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> IUSDV
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 vader`
- Privilege: `IVaderReserve reserve`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
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
| `_spendAllowance(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `distributeEmission()` | **external** | Yes | None | None direct | None |
| `distributeEmission()` | **external** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: LinearVesting
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> ILinearVesting
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 vader`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `getClaim()` | **external** | Yes | None | None direct | None |
| `claim()` | **external** | Yes | None | None direct | None |
| `claimConverted()` | **external** | Yes | None | None direct | None |
| `begin()` | **external** | Yes | None | None direct | None |
| `vestFor(address,uint256)` | **external** | Yes | None | None direct | None |
| `getClaim()` | **external** | No (msg/tx) | hasStarted | None direct | None |
| `claim()` | **external** | No (msg/tx) | hasStarted | None direct | vest |
| `claimConverted()` | **external** | No (msg/tx) | None | None direct | vest |
| `begin()` | **external** | No (msg/tx) | onlyOwner | None direct | end, start |
| `vestFor(address,uint256)` | **external** | No (msg/tx) | None | None direct | vest |
| `_getClaim(uint256,uint256)` | **private** | No (msg/tx) | None | None direct | None |
| `_getClaim(uint256,uint256,uint256,uint256)` | **private** | No (msg/tx) | None | None direct | None |
| `_hasStarted()` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: MerkleProof
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `verify(bytes32[],bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `verifyCalldata(bytes32[],bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `processProof(bytes32[],bytes32)` | **internal** | Yes | None | None direct | None |
| `processProofCalldata(bytes32[],bytes32)` | **internal** | Yes | None | None direct | None |
| `multiProofVerify(bytes32[],bool[],bytes32,bytes32[])` | **internal** | Yes | None | None direct | None |
| `multiProofVerifyCalldata(bytes32[],bool[],bytes32,bytes32[])` | **internal** | Yes | None | None direct | None |
| `processMultiProof(bytes32[],bool[],bytes32[])` | **internal** | Yes | None | None direct | None |
| `processMultiProofCalldata(bytes32[],bool[],bytes32[])` | **internal** | Yes | None | None direct | None |
| `_hashPair(bytes32,bytes32)` | **private** | Yes | None | None direct | None |
| `_efficientHash(bytes32,bytes32)` | **private** | Yes | None | None direct | None |

---

## Contract: Converter
**Linearized C3 Inheritance Tree:** ProtocolConstants -> IConverter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 vether`
- Privilege: `IERC20 vader`
- Privilege: `ILinearVesting vesting`
- Privilege: `bytes32 root`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `convert(bytes32[],uint256)` | **external** | Yes | None | None direct | None |
| `convert(bytes32[],uint256)` | **external** | No (msg/tx) | None | None direct | claimed |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: VaderReserve
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> IVaderReserve
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 vader`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `reimburseImpermanentLoss(address,uint256)` | **external** | Yes | None | None direct | None |
| `grant(address,uint256)` | **external** | Yes | None | None direct | None |
| `reserve()` | **external** | Yes | None | None direct | None |
| `reserve()` | **public** | Yes | None | None direct | None |
| `grant(address,uint256)` | **external** | No (msg/tx) | onlyOwner, throttle | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | onlyOwner | None direct | router |
| `reimburseImpermanentLoss(address,uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == router,VaderReserve::reimburseImpermanentLoss: Insufficient Priviledges)` | None |
| `_min(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: StakingRewards
**Linearized C3 Inheritance Tree:** Pausable -> ReentrancyGuard -> RewardsDistributionRecipient -> Owned -> IStakingRewards
**Pausable Safety (Unprotected Mutative Actions):** ⚠️ Warning: `setPaused`, `nominateNewOwner`, `acceptOwnership`, `notifyRewardAmount`, `setRewardsDistribution`, `exit`, `getReward`, `stake`, `withdraw`, `withdraw`, `getReward`, `exit`, `notifyRewardAmount`, `recoverERC20`, `setRewardsDuration`

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address nominatedOwner`
- Privilege: `IERC20 rewardsToken`
- Privilege: `IERC20 stakingToken`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setPaused(bool)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | lastPauseTime, paused |
| `nominateNewOwner(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | nominatedOwner |
| `acceptOwnership()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == nominatedOwner,You must be nominated before you can accept ownership)` | nominatedOwner, owner |
| `_onlyOwner()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | None |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `notifyRewardAmount(uint256)` | **external** | Yes | None | None direct | None |
| `setRewardsDistribution(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | rewardsDistribution |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `getRewardForDuration()` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **external** | Yes | None | None direct | None |
| `rewardPerToken()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `exit()` | **external** | Yes | None | None direct | None |
| `getReward()` | **external** | Yes | None | None direct | None |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **public** | No (msg/tx) | None | None direct | None |
| `rewardPerToken()` | **public** | No (msg/tx) | None | None direct | None |
| `earned(address)` | **public** | No (msg/tx) | None | None direct | None |
| `getRewardForDuration()` | **external** | Yes | None | None direct | None |
| `stake(uint256)` | **external** | No (msg/tx) | nonReentrant, notPaused, updateReward | None direct | _balances, _totalSupply |
| `withdraw(uint256)` | **public** | No (msg/tx) | nonReentrant, updateReward | None direct | _balances, _totalSupply |
| `getReward()` | **public** | No (msg/tx) | nonReentrant, updateReward | None direct | rewards |
| `exit()` | **external** | No (msg/tx) | None | None direct | None |
| `notifyRewardAmount(uint256)` | **external** | No (msg/tx) | onlyRewardsDistribution, updateReward | `[Internal Call: onlyRewardsDistribution] require(bool,string)(msg.sender == rewardsDistribution,not reward distribution)`<br>`[Modifier: onlyRewardsDistribution] require(bool,string)(msg.sender == rewardsDistribution,not reward distribution)` | lastUpdateTime, periodFinish, rewardRate |
| `recoverERC20(address,uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | None |
| `setRewardsDuration(uint256)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | rewardsDuration |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | rewardsDuration |

---

## Contract: IStakingRewards
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `earned(address)` | **external** | Yes | None | None direct | None |
| `getRewardForDuration()` | **external** | Yes | None | None direct | None |
| `lastTimeRewardApplicable()` | **external** | Yes | None | None direct | None |
| `rewardPerToken()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `exit()` | **external** | Yes | None | None direct | None |
| `getReward()` | **external** | Yes | None | None direct | None |
| `stake(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: Owned
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address nominatedOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `nominateNewOwner(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | nominatedOwner |
| `acceptOwnership()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == nominatedOwner,You must be nominated before you can accept ownership)` | nominatedOwner, owner |
| `_onlyOwner()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | None |

---

## Contract: RewardsDistributionRecipient
**Linearized C3 Inheritance Tree:** Owned
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address nominatedOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `nominateNewOwner(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | nominatedOwner |
| `acceptOwnership()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == nominatedOwner,You must be nominated before you can accept ownership)` | nominatedOwner, owner |
| `_onlyOwner()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | None |
| `notifyRewardAmount(uint256)` | **external** | Yes | None | None direct | None |
| `setRewardsDistribution(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | rewardsDistribution |

---

## Contract: Pausable
**Linearized C3 Inheritance Tree:** Owned
**Pausable Safety (Unprotected Mutative Actions):** ⚠️ Warning: `nominateNewOwner`, `acceptOwnership`, `setPaused`

### Configured Privileges & Roles
- Privilege: `address owner`
- Privilege: `address nominatedOwner`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `nominateNewOwner(address)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | nominatedOwner |
| `acceptOwnership()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == nominatedOwner,You must be nominated before you can accept ownership)` | nominatedOwner, owner |
| `_onlyOwner()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | None |
| `setPaused(bool)` | **external** | No (msg/tx) | onlyOwner | `[Internal Call: onlyOwner] [Internal Call: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)`<br>`[Modifier: onlyOwner -> Internal: _onlyOwner] require(bool,string)(msg.sender == owner,Only the contract owner may perform this action)` | lastPauseTime, paused |

---

## Contract: Counters
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `current(Counters.Counter)` | **internal** | Yes | None | None direct | None |
| `increment(Counters.Counter)` | **internal** | Yes | None | None direct | None |
| `decrement(Counters.Counter)` | **internal** | Yes | None | None direct | None |
| `reset(Counters.Counter)` | **internal** | Yes | None | None direct | None |

---

## Contract: ShortStrings
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 _FALLBACK_SENTINEL`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `toShortString(string)` | **internal** | Yes | None | None direct | None |
| `toString(ShortString)` | **internal** | Yes | None | None direct | None |
| `byteLength(ShortString)` | **internal** | Yes | None | None direct | None |
| `toShortStringWithFallback(string,string)` | **internal** | Yes | None | None direct | None |
| `toStringWithFallback(ShortString,string)` | **internal** | Yes | None | None direct | None |
| `byteLengthWithFallback(ShortString,string)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _FALLBACK_SENTINEL |

---

## Contract: StorageSlot
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getAddressSlot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getBooleanSlot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getBytes32Slot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getUint256Slot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getStringSlot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getStringSlot(string)` | **internal** | Yes | None | None direct | None |
| `getBytesSlot(bytes32)` | **internal** | Yes | None | None direct | None |
| `getBytesSlot(bytes)` | **internal** | Yes | None | None direct | None |

---

## Contract: ECDSA
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_throwError(ECDSA.RecoverError)` | **private** | Yes | None | None direct | None |
| `tryRecover(bytes32,bytes)` | **internal** | Yes | None | None direct | None |
| `recover(bytes32,bytes)` | **internal** | Yes | None | None direct | None |
| `tryRecover(bytes32,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `recover(bytes32,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `tryRecover(bytes32,uint8,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `recover(bytes32,uint8,bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `toEthSignedMessageHash(bytes32)` | **internal** | Yes | None | None direct | None |
| `toEthSignedMessageHash(bytes)` | **internal** | Yes | None | None direct | None |
| `toTypedDataHash(bytes32,bytes32)` | **internal** | Yes | None | None direct | None |
| `toDataWithIntendedValidatorHash(address,bytes)` | **internal** | Yes | None | None direct | None |

---

## Contract: SafeCast
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `toUint248(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint240(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint232(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint224(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint216(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint208(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint200(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint192(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint184(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint176(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint168(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint160(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint152(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint144(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint136(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint128(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint120(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint112(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint104(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint96(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint88(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint80(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint72(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint64(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint56(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint48(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint40(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint32(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint24(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint16(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint8(uint256)` | **internal** | Yes | None | None direct | None |
| `toUint256(int256)` | **internal** | Yes | None | None direct | None |
| `toInt248(int256)` | **internal** | Yes | None | None direct | None |
| `toInt240(int256)` | **internal** | Yes | None | None direct | None |
| `toInt232(int256)` | **internal** | Yes | None | None direct | None |
| `toInt224(int256)` | **internal** | Yes | None | None direct | None |
| `toInt216(int256)` | **internal** | Yes | None | None direct | None |
| `toInt208(int256)` | **internal** | Yes | None | None direct | None |
| `toInt200(int256)` | **internal** | Yes | None | None direct | None |
| `toInt192(int256)` | **internal** | Yes | None | None direct | None |
| `toInt184(int256)` | **internal** | Yes | None | None direct | None |
| `toInt176(int256)` | **internal** | Yes | None | None direct | None |
| `toInt168(int256)` | **internal** | Yes | None | None direct | None |
| `toInt160(int256)` | **internal** | Yes | None | None direct | None |
| `toInt152(int256)` | **internal** | Yes | None | None direct | None |
| `toInt144(int256)` | **internal** | Yes | None | None direct | None |
| `toInt136(int256)` | **internal** | Yes | None | None direct | None |
| `toInt128(int256)` | **internal** | Yes | None | None direct | None |
| `toInt120(int256)` | **internal** | Yes | None | None direct | None |
| `toInt112(int256)` | **internal** | Yes | None | None direct | None |
| `toInt104(int256)` | **internal** | Yes | None | None direct | None |
| `toInt96(int256)` | **internal** | Yes | None | None direct | None |
| `toInt88(int256)` | **internal** | Yes | None | None direct | None |
| `toInt80(int256)` | **internal** | Yes | None | None direct | None |
| `toInt72(int256)` | **internal** | Yes | None | None direct | None |
| `toInt64(int256)` | **internal** | Yes | None | None direct | None |
| `toInt56(int256)` | **internal** | Yes | None | None direct | None |
| `toInt48(int256)` | **internal** | Yes | None | None direct | None |
| `toInt40(int256)` | **internal** | Yes | None | None direct | None |
| `toInt32(int256)` | **internal** | Yes | None | None direct | None |
| `toInt24(int256)` | **internal** | Yes | None | None direct | None |
| `toInt16(int256)` | **internal** | Yes | None | None direct | None |
| `toInt8(int256)` | **internal** | Yes | None | None direct | None |
| `toInt256(uint256)` | **internal** | Yes | None | None direct | None |

---

## Contract: XVader
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> ERC20Votes -> IERC5805 -> IVotes -> IERC6372 -> ERC20Permit -> EIP712 -> IERC5267 -> IERC20Permit -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 vader`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `clock()` | **public** | No (msg/tx) | None | None direct | None |
| `CLOCK_MODE()` | **public** | No (msg/tx) | None | None direct | None |
| `checkpoints(address,uint32)` | **public** | Yes | None | None direct | None |
| `numCheckpoints(address)` | **public** | Yes | None | None direct | None |
| `delegates(address)` | **public** | Yes | None | None direct | None |
| `getVotes(address)` | **public** | Yes | None | None direct | None |
| `getPastVotes(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getPastTotalSupply(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_checkpointsLookup(ERC20Votes.Checkpoint[],uint256)` | **private** | Yes | None | None direct | None |
| `delegate(address)` | **public** | No (msg/tx) | None | None direct | None |
| `delegateBySig(address,uint256,uint256,uint8,bytes32,bytes32)` | **public** | No (msg/tx) | None | None direct | None |
| `_maxSupply()` | **internal** | Yes | None | None direct | None |
| `_mint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_delegate(address,address)` | **internal** | No (msg/tx) | None | None direct | _delegates |
| `_moveVotingPower(address,address,uint256)` | **private** | No (msg/tx) | None | None direct | None |
| `_writeCheckpoint(ERC20Votes.Checkpoint[],function(uint256,uint256) returns(uint256),uint256)` | **private** | No (msg/tx) | None | None direct | _totalSupplyCheckpoints |
| `_add(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `_subtract(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `_unsafeAccess(ERC20Votes.Checkpoint[],uint256)` | **private** | Yes | None | None direct | None |
| `getVotes(address)` | **external** | Yes | None | None direct | None |
| `getPastVotes(address,uint256)` | **external** | Yes | None | None direct | None |
| `getPastTotalSupply(uint256)` | **external** | Yes | None | None direct | None |
| `delegates(address)` | **external** | Yes | None | None direct | None |
| `delegate(address)` | **external** | Yes | None | None direct | None |
| `delegateBySig(address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `clock()` | **external** | Yes | None | None direct | None |
| `CLOCK_MODE()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **public** | No (msg/tx) | None | None direct | None |
| `nonces(address)` | **public** | Yes | None | None direct | None |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
| `_useNonce(address)` | **internal** | Yes | None | None direct | None |
| `_domainSeparatorV4()` | **internal** | Yes | None | None direct | None |
| `_buildDomainSeparator()` | **private** | Yes | None | None direct | None |
| `_hashTypedDataV4(bytes32)` | **internal** | Yes | None | None direct | None |
| `eip712Domain()` | **public** | Yes | None | None direct | None |
| `eip712Domain()` | **external** | Yes | None | None direct | None |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `nonces(address)` | **external** | Yes | None | None direct | None |
| `DOMAIN_SEPARATOR()` | **external** | Yes | None | None direct | None |
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
| `_spendAllowance(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `enter(uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `leave(uint256)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: UniswapV2Pair
**Linearized C3 Inheritance Tree:** UniswapV2ERC20 -> IUniswapV2Pair -> IUniswapV2ERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string name`
- Privilege: `string symbol`
- Privilege: `uint8 decimals`
- Privilege: `bytes32 PERMIT_TYPEHASH`
- Privilege: `uint256 MINIMUM_LIQUIDITY`
- Privilege: `bytes4 SELECTOR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |
| `_approve(address,address,uint256)` | **private** | Yes | None | None direct | allowance |
| `_transfer(address,address,uint256)` | **private** | Yes | None | None direct | balanceOf |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | allowance |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | nonces |
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
| `getReserves()` | **public** | Yes | None | None direct | None |
| `_safeTransfer(address,address,uint256)` | **private** | Yes | None | None direct | None |
| `initialize(address,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == factory,UniswapV2: FORBIDDEN)` | token0, token1 |
| `_update(uint256,uint256,uint112,uint112)` | **private** | No (msg/tx) | None | None direct | blockTimestampLast, price0CumulativeLast, price1CumulativeLast, reserve0, reserve1 |
| `_mintFee(uint112,uint112)` | **private** | Yes | None | None direct | kLast |
| `mint(address)` | **external** | No (msg/tx) | lock | None direct | kLast |
| `burn(address)` | **external** | No (msg/tx) | lock | None direct | kLast |
| `swap(uint256,uint256,address,bytes)` | **external** | No (msg/tx) | lock | None direct | None |
| `skim(address)` | **external** | Yes | lock | None direct | None |
| `sync()` | **external** | No (msg/tx) | lock | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | unlocked |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | MINIMUM_LIQUIDITY, PERMIT_TYPEHASH, SELECTOR, decimals, name, symbol |

---

## Contract: IUniswapV2Callee
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `uniswapV2Call(address,uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: UniswapV2ERC20
**Linearized C3 Inheritance Tree:** IUniswapV2ERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `string name`
- Privilege: `string symbol`
- Privilege: `uint8 decimals`
- Privilege: `bytes32 PERMIT_TYPEHASH`

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
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | balanceOf, totalSupply |
| `_approve(address,address,uint256)` | **private** | Yes | None | None direct | allowance |
| `_transfer(address,address,uint256)` | **private** | Yes | None | None direct | balanceOf |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | allowance |
| `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` | **external** | No (msg/tx) | None | None direct | nonces |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | PERMIT_TYPEHASH, decimals, name, symbol |

---

## Contract: IUniswapV2ERC20
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

---

## Contract: VaderRouterV2
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> IVaderRouterV2
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IVaderPoolV2 pool`
- Privilege: `IERC20 nativeAsset`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256)` | **public** | No (msg/tx) | ensure | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **public** | No (msg/tx) | ensure | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256)` | **external** | No (msg/tx) | ensure | None direct | None |
| `initialize(IVaderReserve)` | **external** | No (msg/tx) | onlyOwner | None direct | reserve |
| `_swap(uint256,IERC20[],address)` | **private** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: LPToken
**Linearized C3 Inheritance Tree:** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> ILPToken
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20Extended foreignAsset`
- Privilege: `IVaderPoolV2 pool`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
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
| `_spendAllowance(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `_calculateName(IERC20Extended)` | **internal** | Yes | None | None direct | None |
| `_calculateSymbol(IERC20Extended)` | **internal** | Yes | None | None direct | None |
| `_combine(string,string)` | **internal** | Yes | None | None direct | None |
| `_combine(string,string,string)` | **internal** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `burn(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: LPWrapper
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> ILPWrapper
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `tokens(IERC20)` | **external** | Yes | None | None direct | None |
| `createWrapper(IERC20)` | **external** | Yes | None | None direct | None |
| `createWrapper(IERC20)` | **external** | No (msg/tx) | onlyOwner | None direct | tokens |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: BasePoolV2
**Linearized C3 Inheritance Tree:** ReentrancyGuard -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePoolV2
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 nativeAsset`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | None |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_ownerOf(uint256)` | **internal** | Yes | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_setApprovalForAll(address,address,bool)` | **internal** | Yes | None | None direct | _operatorApprovals |
| `_requireMinted(uint256)` | **internal** | Yes | None | None direct | None |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `__unsafe_increaseBalance(address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `getReserves(IERC20)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |
| `supported(IERC20)` | **external** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `getReserves(IERC20)` | **public** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant, onlyRouter, supportedToken | `[Internal Call: onlyRouter] [Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | pairInfo, positionId, positions |
| `_burn(uint256,address)` | **internal** | No (msg/tx) | nonReentrant | None direct | pairInfo |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | No (msg/tx) | onlyRouter, supportedToken, supportedToken, nonReentrant, validateGas | `[Internal Call: onlyRouter] [Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | No (msg/tx) | onlyRouter, supportedToken, nonReentrant, validateGas | `[Internal Call: onlyRouter] [Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `rescue(IERC20)` | **external** | No (msg/tx) | None | None direct | None |
| `_update(IERC20,uint256,uint256,uint112,uint112)` | **internal** | No (msg/tx) | None | None direct | pairInfo |
| `_supportedToken(IERC20)` | **private** | Yes | None | None direct | None |
| `_onlyRouter()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: VaderPoolV2
**Linearized C3 Inheritance Tree:** Ownable -> BasePoolV2 -> ReentrancyGuard -> ERC721 -> IERC721Metadata -> IVaderPoolV2 -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePoolV2
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`
- Privilege: `IERC20 nativeAsset`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `getReserves(IERC20)` | **public** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant, onlyRouter, supportedToken | `[Internal Call: onlyRouter] [Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | pairInfo, positionId, positions |
| `_burn(uint256,address)` | **internal** | No (msg/tx) | nonReentrant | None direct | pairInfo |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | No (msg/tx) | onlyRouter, supportedToken, supportedToken, nonReentrant, validateGas | `[Internal Call: onlyRouter] [Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | No (msg/tx) | onlyRouter, supportedToken, nonReentrant, validateGas | `[Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `rescue(IERC20)` | **external** | No (msg/tx) | None | None direct | None |
| `_update(IERC20,uint256,uint256,uint112,uint112)` | **internal** | No (msg/tx) | None | None direct | pairInfo |
| `_supportedToken(IERC20)` | **private** | Yes | None | None direct | None |
| `_onlyRouter()` | **private** | No (msg/tx) | None | `require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | None |
| `_nonReentrantBefore()` | **private** | Yes | None | None direct | _status |
| `_nonReentrantAfter()` | **private** | Yes | None | None direct | _status |
| `_reentrancyGuardEntered()` | **internal** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **public** | Yes | None | None direct | None |
| `name()` | **public** | Yes | None | None direct | None |
| `symbol()` | **public** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |
| `_baseURI()` | **internal** | Yes | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getApproved(uint256)` | **public** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **public** | No (msg/tx) | None | None direct | None |
| `isApprovedForAll(address,address)` | **public** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **public** | No (msg/tx) | None | None direct | None |
| `_safeTransfer(address,address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_ownerOf(uint256)` | **internal** | Yes | None | None direct | None |
| `_exists(uint256)` | **internal** | Yes | None | None direct | None |
| `_isApprovedOrOwner(address,uint256)` | **internal** | Yes | None | None direct | None |
| `_safeMint(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `_safeMint(address,uint256,bytes)` | **internal** | No (msg/tx) | None | None direct | None |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners |
| `_burn(uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances, _owners, _tokenApprovals |
| `_approve(address,uint256)` | **internal** | Yes | None | None direct | _tokenApprovals |
| `_setApprovalForAll(address,address,bool)` | **internal** | Yes | None | None direct | _operatorApprovals |
| `_requireMinted(uint256)` | **internal** | Yes | None | None direct | None |
| `_checkOnERC721Received(address,address,uint256,bytes)` | **private** | No (msg/tx) | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `__unsafe_increaseBalance(address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `ownerOf(uint256)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `safeTransferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `setApprovalForAll(address,bool)` | **external** | Yes | None | None direct | None |
| `getApproved(uint256)` | **external** | Yes | None | None direct | None |
| `isApprovedForAll(address,address)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **external** | Yes | None | None direct | None |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `getReserves(IERC20)` | **external** | Yes | None | None direct | None |
| `nativeAsset()` | **external** | Yes | None | None direct | None |
| `supported(IERC20)` | **external** | Yes | None | None direct | None |
| `positionForeignAsset(uint256)` | **external** | Yes | None | None direct | None |
| `pairSupply(IERC20)` | **external** | Yes | None | None direct | None |
| `doubleSwap(IERC20,IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `swap(IERC20,uint256,uint256,address)` | **external** | Yes | None | None direct | None |
| `mint(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `cumulativePrices(IERC20)` | **external** | Yes | None | None direct | None |
| `mintSynth(IERC20,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `burnSynth(IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `mintFungible(IERC20,uint256,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `burnFungible(IERC20,uint256,address)` | **external** | Yes | None | None direct | None |
| `burn(uint256,address)` | **external** | Yes | None | None direct | None |
| `toggleQueue()` | **external** | Yes | None | None direct | None |
| `setTokenSupport(IERC20,bool)` | **external** | Yes | None | None direct | None |
| `setFungibleTokenSupport(IERC20)` | **external** | Yes | None | None direct | None |
| `cumulativePrices(IERC20)` | **public** | Yes | None | None direct | None |
| `initialize(ILPWrapper,ISynthFactory,address)` | **external** | No (msg/tx) | onlyOwner | None direct | router, synthFactory, wrapper |
| `mintSynth(IERC20,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant, supportedToken | None direct | None |
| `burnSynth(IERC20,uint256,address)` | **external** | No (msg/tx) | nonReentrant | None direct | None |
| `burn(uint256,address)` | **external** | No (msg/tx) | onlyRouter | `[Internal Call: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)`<br>`[Modifier: onlyRouter -> Internal: _onlyRouter] require(bool,string)(msg.sender == router,BasePoolV2::_onlyRouter: Only Router is allowed to call)` | positions |
| `mintFungible(IERC20,uint256,uint256,address,address)` | **external** | No (msg/tx) | nonReentrant | None direct | pairInfo |
| `burnFungible(IERC20,uint256,address)` | **external** | No (msg/tx) | nonReentrant | None direct | pairInfo |
| `toggleQueue()` | **external** | No (msg/tx) | onlyOwner | None direct | queueActive |
| `setTokenSupport(IERC20,bool)` | **external** | No (msg/tx) | onlyOwner | None direct | supported |
| `setFungibleTokenSupport(IERC20)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `_min(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: Synth
**Linearized C3 Inheritance Tree:** Ownable -> ERC20 -> IERC20Metadata -> ProtocolConstants -> ISynth -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
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
| `_spendAllowance(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_afterTokenTransfer(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `name()` | **external** | Yes | None | None direct | None |
| `symbol()` | **external** | Yes | None | None direct | None |
| `decimals()` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `_calculateName(IERC20Extended)` | **internal** | Yes | None | None direct | None |
| `_calculateSymbol(IERC20Extended)` | **internal** | Yes | None | None direct | None |
| `_combine(string,string)` | **internal** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `burn(uint256)` | **external** | No (msg/tx) | onlyOwner | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---

## Contract: SynthFactory
**Linearized C3 Inheritance Tree:** Ownable -> Context -> ProtocolConstants -> ISynthFactory
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _ZERO_ADDRESS`
- Privilege: `uint256 _ONE_YEAR`
- Privilege: `uint256 _MAX_BASIS_POINTS`
- Privilege: `uint256 _INITIAL_VADER_SUPPLY`
- Privilege: `uint256 _VETH_ALLOCATION`
- Privilege: `uint256 _TEAM_ALLOCATION`
- Privilege: `uint256 _ECOSYSTEM_GROWTH`
- Privilege: `uint256 _EMISSION_ERA`
- Privilege: `uint256 _INITIAL_EMISSION_CURVE`
- Privilege: `uint256 _MAX_FEE_BASIS_POINTS`
- Privilege: `uint256 _VESTING_DURATION`
- Privilege: `uint256 _VADER_VETHER_CONVERSION_RATE`
- Privilege: `address _BURN`
- Privilege: `uint256 _MIN_SWAPS_EXECUTED`
- Privilege: `uint256 _DEFAULT_SWAPS_EXECUTED`
- Privilege: `uint256 _QUEUE_SIZE`
- Privilege: `address _FAST_GAS_ORACLE`
- Privilege: `uint256 _GRANT_DELAY`
- Privilege: `uint256 _MAX_GRANT_BASIS_POINTS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `owner()` | **public** | Yes | None | None direct | None |
| `_checkOwner()` | **internal** | No (msg/tx) | None | None direct | None |
| `renounceOwnership()` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `transferOwnership(address)` | **public** | No (msg/tx) | onlyOwner | None direct | None |
| `_transferOwnership(address)` | **internal** | Yes | None | None direct | _owner |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `synths(IERC20)` | **external** | Yes | None | None direct | None |
| `createSynth(IERC20Extended)` | **external** | Yes | None | None direct | None |
| `createSynth(IERC20Extended)` | **external** | No (msg/tx) | onlyOwner | None direct | synths |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | _BURN, _DEFAULT_SWAPS_EXECUTED, _ECOSYSTEM_GROWTH, _EMISSION_ERA, _FAST_GAS_ORACLE, _GRANT_DELAY, _INITIAL_EMISSION_CURVE, _INITIAL_VADER_SUPPLY, _MAX_BASIS_POINTS, _MAX_FEE_BASIS_POINTS, _MAX_GRANT_BASIS_POINTS, _MIN_SWAPS_EXECUTED, _ONE_YEAR, _QUEUE_SIZE, _TEAM_ALLOCATION, _VADER_VETHER_CONVERSION_RATE, _VESTING_DURATION, _VETH_ALLOCATION, _ZERO_ADDRESS |

---
