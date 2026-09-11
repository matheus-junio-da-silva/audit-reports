## Package: mochi-library

# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: CheapERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `cheapTransfer(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `cheapTransferFrom(IERC20,address,address,uint256)` | **internal** | Yes | None | None direct | None |

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

## Contract: Float
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `multiply(uint256,float)` | **internal** | Yes | None | None direct | None |
| `inverse(float)` | **internal** | Yes | None | None direct | None |
| `divide(uint256,float)` | **internal** | Yes | None | None direct | None |
| `add(float,float)` | **internal** | Yes | None | None direct | None |
| `sub(float,float)` | **internal** | Yes | None | None direct | None |
| `mul(float,float)` | **internal** | Yes | None | None direct | None |
| `gt(float,float)` | **internal** | Yes | None | None direct | None |
| `lt(float,float)` | **internal** | Yes | None | None direct | None |
| `gte(float,float)` | **internal** | Yes | None | None direct | None |
| `lte(float,float)` | **internal** | Yes | None | None direct | None |
| `equals(float,float)` | **internal** | Yes | None | None direct | None |

---

## Contract: BlockVerifier
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `extractStateRootAndTimestamp(bytes)` | **internal** | Yes | None | None direct | None |
| `revertWithReason(uint256,uint256)` | **private** | Yes | None | None direct | None |
| `readDynamic(uint256)` | **private** | Yes | None | None direct | None |

---

## Contract: BeaconProxyDeployer
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deploy(address,bytes)` | **internal** | Yes | None | None direct | None |
| `calculateAddress(address,address,bytes)` | **internal** | Yes | None | None direct | None |

---

## Contract: Create2BeaconMaker
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: Beacon
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _CONTROLLER`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fallback()` | **external** | No (msg/tx) | None | None direct | None |

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

## Contract: Rlp
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `uint256 DATA_SHORT_START`
- Privilege: `uint256 DATA_LONG_START`
- Privilege: `uint256 LIST_SHORT_START`
- Privilege: `uint256 LIST_LONG_START`
- Privilege: `uint256 DATA_LONG_OFFSET`
- Privilege: `uint256 LIST_LONG_OFFSET`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `next(Rlp.Iterator)` | **internal** | Yes | None | None direct | None |
| `next(Rlp.Iterator,bool)` | **internal** | Yes | None | None direct | None |
| `hasNext(Rlp.Iterator)` | **internal** | Yes | None | None direct | None |
| `toItem(bytes)` | **internal** | Yes | None | None direct | None |
| `toItem(bytes,bool)` | **internal** | Yes | None | None direct | None |
| `isNull(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `isList(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `isData(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `isEmpty(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `items(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `iterator(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toBytes(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toData(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toList(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toAscii(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toUint(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toBool(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toByte(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toInt(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toBytes32(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `toAddress(Rlp.Item)` | **internal** | Yes | None | None direct | None |
| `_payloadOffset(Rlp.Item)` | **private** | Yes | None | None direct | None |
| `_itemLength(uint256)` | **private** | Yes | None | None direct | None |
| `_decode(Rlp.Item)` | **private** | Yes | None | None direct | None |
| `_copyToBytes(uint256,bytes,uint256)` | **internal** | Yes | None | None direct | None |
| `_validate(Rlp.Item)` | **private** | Yes | None | None direct | None |
| `rlpBytesToUint256(bytes)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DATA_LONG_OFFSET, DATA_LONG_START, DATA_SHORT_START, LIST_LONG_OFFSET, LIST_LONG_START, LIST_SHORT_START |

---

## Contract: AccountVerifier
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getAccountStorageRoot(address,bytes32,bytes)` | **internal** | Yes | None | None direct | None |

---

## Contract: MerklePatriciaVerifier
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getValueFromProof(bytes32,bytes32,bytes)` | **internal** | Yes | None | None direct | None |
| `_nibblesToTraverse(bytes,bytes,uint256)` | **private** | Yes | None | None direct | None |
| `_getNibbleArray(bytes)` | **private** | Yes | None | None direct | None |
| `_getNthNibbleOfBytes(uint256,bytes)` | **private** | Yes | None | None direct | None |

---

## Contract: SushiswapV2Library
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

---

## Package: mochi-cssr

# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: MochiCSSRv0
**Linearized C3 Inheritance Tree:** ICSSRRouter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IGovernanceOwned owned`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `setBluechip(address[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | blueChip |
| `removeBluechip(address[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | blueChip |
| `listAdapter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | adapter |
| `delistAdapter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | adapter |
| `setFiatPriceAdapter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | fiatPriceAdapter |
| `setPriceSource(address,address[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | priceSource |
| `setLiquiditySource(address,address[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | liquiditySource |
| `setDefaultPriceSource(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | defaultPriceSource |
| `setDefaultLiquiditySource(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | defaultLiquiditySource |
| `update(address,bytes)` | **external** | Yes | None | None direct | lastPrice |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **public** | Yes | None | None direct | None |

---

## Contract: ICSSRAdapter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IGovernanceOwned
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `governance()` | **external** | Yes | None | None direct | None |

---

## Contract: Float
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `multiply(uint256,float)` | **internal** | Yes | None | None direct | None |
| `inverse(float)` | **internal** | Yes | None | None direct | None |
| `divide(uint256,float)` | **internal** | Yes | None | None direct | None |
| `add(float,float)` | **internal** | Yes | None | None direct | None |
| `sub(float,float)` | **internal** | Yes | None | None direct | None |
| `mul(float,float)` | **internal** | Yes | None | None direct | None |
| `gt(float,float)` | **internal** | Yes | None | None direct | None |
| `lt(float,float)` | **internal** | Yes | None | None direct | None |
| `gte(float,float)` | **internal** | Yes | None | None direct | None |
| `lte(float,float)` | **internal** | Yes | None | None direct | None |
| `equals(float,float)` | **internal** | Yes | None | None direct | None |

---

## Contract: ICSSRRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IUniswapV2CSSR
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `uniswapFactory()` | **external** | Yes | None | None direct | None |
| `getExchangeRatio(address,address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address,address)` | **external** | Yes | None | None direct | None |
| `saveState(bytes)` | **external** | Yes | None | None direct | None |
| `saveReserve(uint256,address,bytes,bytes,bytes,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurveAddressProvider
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `get_registry()` | **external** | Yes | None | None direct | None |

---

## Contract: ICurveRegistry
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `get_n_coins(address)` | **external** | Yes | None | None direct | None |
| `get_pool_from_lp_token(address)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurvePool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `coins(uint256)` | **external** | Yes | None | None direct | None |
| `get_virtual_price()` | **external** | Yes | None | None direct | None |

---

## Contract: SushiswapV2LPAdapter
**Linearized C3 Inheritance Tree:** ICSSRAdapter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `ICSSRRouter router`
- Privilege: `IUniswapV2CSSR cssr`
- Privilege: `address weth`
- Privilege: `address factory`
- Privilege: `uint256 Q112`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getUnderlyingAsset(IUniswapV2Pair)` | **public** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `_getPrice(IUniswapV2Pair,address)` | **internal** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `sqrt(uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | Q112 |

---

## Contract: SushiswapV2Library
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

## Contract: UniswapV2LPAdapter
**Linearized C3 Inheritance Tree:** ICSSRAdapter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `ICSSRRouter router`
- Privilege: `IUniswapV2CSSR cssr`
- Privilege: `address weth`
- Privilege: `address factory`
- Privilege: `uint256 Q112`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getUnderlyingAsset(IUniswapV2Pair)` | **public** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `_getPrice(IUniswapV2Pair,address)` | **internal** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `sqrt(uint256)` | **internal** | Yes | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | Q112 |

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

## Contract: UniswapV2TokenAdapter
**Linearized C3 Inheritance Tree:** ICSSRAdapter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IGovernanceOwned owned`
- Privilege: `ICSSRRouter cssrRouter`
- Privilege: `IUniswapV2CSSR uniswapCSSR`
- Privilege: `IUniswapV2CSSR sushiCSSR`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `addKeyCurrency(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | isKeyCurrency, keyCurrency |
| `removeKeyCurrency(uint256,address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | isKeyCurrency, keyCurrency |
| `setMinimumLiquidity(uint256)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | minimumLiquidity |
| `support(address)` | **external** | Yes | None | None direct | None |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getPriceRaw(address)` | **public** | Yes | None | None direct | None |
| `getPrice(address)` | **public** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `aboveLiquidity(address,address)` | **public** | Yes | None | None direct | None |
| `convertToValue(uint256,float)` | **internal** | Yes | None | None direct | None |

---

## Contract: ChainlinkAdapterEth
**Linearized C3 Inheritance Tree:** ICSSRAdapter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IGovernanceOwned owned`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `setFeed(address[],address[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == owned.governance(),!gov)` | feed |
| `support(address)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **public** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |

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

---

## Package: mochi-core

# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: MochiEngine
**Linearized C3 Inheritance Tree:** IMochiEngine
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiVaultFactory vaultFactory`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mochi()` | **external** | Yes | None | None direct | None |
| `vMochi()` | **external** | Yes | None | None direct | None |
| `usdm()` | **external** | Yes | None | None direct | None |
| `cssr()` | **external** | Yes | None | None direct | None |
| `governance()` | **external** | Yes | None | None direct | None |
| `treasury()` | **external** | Yes | None | None direct | None |
| `operationWallet()` | **external** | Yes | None | None direct | None |
| `mochiProfile()` | **external** | Yes | None | None direct | None |
| `discountProfile()` | **external** | Yes | None | None direct | None |
| `feePool()` | **external** | Yes | None | None direct | None |
| `referralFeePool()` | **external** | Yes | None | None direct | None |
| `liquidator()` | **external** | Yes | None | None direct | None |
| `minter()` | **external** | Yes | None | None direct | None |
| `nft()` | **external** | Yes | None | None direct | None |
| `vaultFactory()` | **external** | Yes | None | None direct | None |
| `changeMochi(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | mochi |
| `changeVMochi(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | vMochi |
| `changeUSDM(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | usdm |
| `changeMinter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | minter |
| `changeGovernance(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | governance |
| `changeTreasury(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | treasury |
| `changeOperationWallet(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | operationWallet |
| `changeCSSR(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | cssr |
| `changeProfile(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | mochiProfile |
| `changeDiscountProfile(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | discountProfile |
| `changeLiquidator(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | liquidator |
| `changeFeePool(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | feePool |
| `changeReferralFeePool(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | referralFeePool |
| `changeNFT(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == governance,!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == governance,!gov)` | nft |

---

## Contract: USDM
**Linearized C3 Inheritance Tree:** IUSDM -> IERC3156FlashLender -> ERC20 -> IERC20Metadata -> IERC20 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `uint256 SCALE`
- Privilege: `bytes32 CALLBACK_SUCCESS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **external** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
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
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyMinter | `[Internal Call: onlyMinter] require(bool,string)(msg.sender == address(engine.minter()),!minter)`<br>`[Modifier: onlyMinter] require(bool,string)(msg.sender == address(engine.minter()),!minter)` | None |
| `burn(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **public** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | No (msg/tx) | None | `require(bool,string)(_receiver.onFlashLoan(msg.sender,_token,_amount,fee,_data) == CALLBACK_SUCCESS,!callback)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CALLBACK_SUCCESS, SCALE |

---

## Contract: IDiscountProfile
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `discount(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IERC3156FlashBorrower
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `onFlashLoan(address,address,uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: IFeePool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `updateReserve()` | **external** | Yes | None | None direct | None |

---

## Contract: ILiquidator
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `triggerLiquidation(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IMinter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `hasPermission(address)` | **external** | Yes | None | None direct | None |
| `isVault(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IMochi
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

---

## Contract: IMochiNFT
**Linearized C3 Inheritance Tree:** IERC721Enumerable -> IERC721 -> IERC165
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `tokenOfOwnerByIndex(address,uint256)` | **external** | Yes | None | None direct | None |
| `tokenByIndex(uint256)` | **external** | Yes | None | None direct | None |
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
| `asset(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: IMochiProfile
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `assetClass(address)` | **external** | Yes | None | None direct | None |
| `liquidityRequirement()` | **external** | Yes | None | None direct | None |
| `minimumDebt()` | **external** | Yes | None | None direct | None |
| `changeAssetClass(address[],AssetClass[])` | **external** | Yes | None | None direct | None |
| `changeLiquidityRequirement(uint256)` | **external** | Yes | None | None direct | None |
| `changeMinimumDebt(uint256)` | **external** | Yes | None | None direct | None |
| `calculateFeeIndex(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `creditCap(address)` | **external** | Yes | None | None direct | None |
| `delay()` | **external** | Yes | None | None direct | None |
| `liquidationFactor(address)` | **external** | Yes | None | None direct | None |
| `maxCollateralFactor(address)` | **external** | Yes | None | None direct | None |
| `stabilityFee(address)` | **external** | Yes | None | None direct | None |
| `liquidationFee(address)` | **external** | Yes | None | None direct | None |
| `keeperFee(address)` | **external** | Yes | None | None direct | None |
| `utilizationRatio(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IMochiVault
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `liveDebtIndex()` | **external** | Yes | None | None direct | None |
| `details(uint256)` | **external** | Yes | None | None direct | None |
| `status(uint256)` | **external** | Yes | None | None direct | None |
| `asset()` | **external** | Yes | None | None direct | None |
| `deposits()` | **external** | Yes | None | None direct | None |
| `debts()` | **external** | Yes | None | None direct | None |
| `claimable()` | **external** | Yes | None | None direct | None |
| `currentDebt(uint256)` | **external** | Yes | None | None direct | None |
| `initialize(address)` | **external** | Yes | None | None direct | None |
| `deposit(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `borrow(uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `repay(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `liquidate(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: IReferralFeePool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `addReward(address)` | **external** | Yes | None | None direct | None |

---

## Contract: MochiVaultFactory
**Linearized C3 Inheritance Tree:** IMochiVaultFactory
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `Beacon beacon`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `updateTemplate(address)` | **external** | Yes | None | None direct | None |
| `deployVault(address)` | **external** | Yes | None | None direct | None |
| `getVault(address)` | **external** | Yes | None | None direct | None |
| `updateTemplate(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | template |
| `deployVault(address)` | **external** | Yes | None | None direct | None |
| `getVault(address)` | **external** | Yes | None | None direct | None |

---

## Contract: ICSSRRouter
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `update(address,bytes)` | **external** | Yes | None | None direct | None |
| `getPrice(address)` | **external** | Yes | None | None direct | None |
| `getLiquidity(address)` | **external** | Yes | None | None direct | None |

---

## Contract: Beacon
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address _CONTROLLER`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `fallback()` | **external** | No (msg/tx) | None | None direct | None |

---

## Contract: BeaconProxyDeployer
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deploy(address,bytes)` | **internal** | Yes | None | None direct | None |
| `calculateAddress(address,address,bytes)` | **internal** | Yes | None | None direct | None |

---

## Contract: Create2BeaconMaker
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |

---

## Contract: Float
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `multiply(uint256,float)` | **internal** | Yes | None | None direct | None |
| `inverse(float)` | **internal** | Yes | None | None direct | None |
| `divide(uint256,float)` | **internal** | Yes | None | None direct | None |
| `add(float,float)` | **internal** | Yes | None | None direct | None |
| `sub(float,float)` | **internal** | Yes | None | None direct | None |
| `mul(float,float)` | **internal** | Yes | None | None direct | None |
| `gt(float,float)` | **internal** | Yes | None | None direct | None |
| `lt(float,float)` | **internal** | Yes | None | None direct | None |
| `gte(float,float)` | **internal** | Yes | None | None direct | None |
| `lte(float,float)` | **internal** | Yes | None | None direct | None |
| `equals(float,float)` | **internal** | Yes | None | None direct | None |

---

## Contract: IVMochi
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `locked(address)` | **external** | Yes | None | None direct | None |
| `depositFor(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |

---

## Contract: IERC3156FlashLender
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **external** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | Yes | None | None direct | None |

---

## Contract: IUSDM
**Linearized C3 Inheritance Tree:** IERC3156FlashLender -> IERC20
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **external** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: ICurveVotingEscrow
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `create_lock(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `increase_amount(uint256)` | **external** | Yes | None | None direct | None |
| `increase_unlock_time(uint256)` | **external** | Yes | None | None direct | None |
| `withdraw()` | **external** | Yes | None | None direct | None |
| `smart_wallet_checker()` | **external** | Yes | None | None direct | None |

---

## Contract: IMochiEngine
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mochi()` | **external** | Yes | None | None direct | None |
| `vMochi()` | **external** | Yes | None | None direct | None |
| `usdm()` | **external** | Yes | None | None direct | None |
| `cssr()` | **external** | Yes | None | None direct | None |
| `governance()` | **external** | Yes | None | None direct | None |
| `treasury()` | **external** | Yes | None | None direct | None |
| `operationWallet()` | **external** | Yes | None | None direct | None |
| `mochiProfile()` | **external** | Yes | None | None direct | None |
| `discountProfile()` | **external** | Yes | None | None direct | None |
| `feePool()` | **external** | Yes | None | None direct | None |
| `referralFeePool()` | **external** | Yes | None | None direct | None |
| `liquidator()` | **external** | Yes | None | None direct | None |
| `minter()` | **external** | Yes | None | None direct | None |
| `nft()` | **external** | Yes | None | None direct | None |
| `vaultFactory()` | **external** | Yes | None | None direct | None |

---

## Contract: IMochiVaultFactory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `updateTemplate(address)` | **external** | Yes | None | None direct | None |
| `deployVault(address)` | **external** | Yes | None | None direct | None |
| `getVault(address)` | **external** | Yes | None | None direct | None |

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

## Contract: IMochiPositionDescriptor
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getTokenURI(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: MinterV0
**Linearized C3 Inheritance Tree:** IMinter
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `hasPermission(address)` | **external** | Yes | None | None direct | None |
| `isVault(address)` | **external** | Yes | None | None direct | None |
| `addMinter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | isMinter |
| `removeMinter(address)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | isMinter |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyPermission | `[Internal Call: onlyPermission] require(bool,string)(hasPermission(msg.sender),!permission)`<br>`[Modifier: onlyPermission] require(bool,string)(hasPermission(msg.sender),!permission)` | None |
| `hasPermission(address)` | **public** | Yes | None | None direct | None |
| `isVault(address)` | **public** | Yes | None | None direct | None |

---

## Contract: MochiProfileV0
**Linearized C3 Inheritance Tree:** IMochiProfile
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `uint256 secPerYear`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `assetClass(address)` | **external** | Yes | None | None direct | None |
| `liquidityRequirement()` | **external** | Yes | None | None direct | None |
| `minimumDebt()` | **external** | Yes | None | None direct | None |
| `changeAssetClass(address[],AssetClass[])` | **external** | Yes | None | None direct | None |
| `changeLiquidityRequirement(uint256)` | **external** | Yes | None | None direct | None |
| `changeMinimumDebt(uint256)` | **external** | Yes | None | None direct | None |
| `calculateFeeIndex(address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `creditCap(address)` | **external** | Yes | None | None direct | None |
| `delay()` | **external** | Yes | None | None direct | None |
| `liquidationFactor(address)` | **external** | Yes | None | None direct | None |
| `maxCollateralFactor(address)` | **external** | Yes | None | None direct | None |
| `stabilityFee(address)` | **external** | Yes | None | None direct | None |
| `liquidationFee(address)` | **external** | Yes | None | None direct | None |
| `keeperFee(address)` | **external** | Yes | None | None direct | None |
| `utilizationRatio(address)` | **external** | Yes | None | None direct | None |
| `assetClass(address)` | **public** | Yes | None | None direct | None |
| `changeLiquidityRequirement(uint256)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | liquidityRequirement |
| `registerAsset(address)` | **external** | Yes | None | None direct | None |
| `registerAssetByGov(address[],AssetClass[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | None |
| `_register(address,AssetClass)` | **internal** | Yes | None | None direct | _assetClass |
| `changeMinimumDebt(uint256)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | minimumDebt |
| `changeAssetClass(address[],AssetClass[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | _assetClass |
| `changeCreditCap(address[],uint256[])` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | creditCap |
| `setDelay(uint256)` | **external** | No (msg/tx) | onlyGov | `[Internal Call: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)`<br>`[Modifier: onlyGov] require(bool,string)(msg.sender == engine.governance(),!gov)` | delay |
| `liquidationFactor(address)` | **public** | Yes | None | None direct | None |
| `riskFactor(address)` | **public** | Yes | None | None direct | None |
| `maxCollateralFactor(address)` | **public** | Yes | None | None direct | None |
| `baseFee()` | **public** | Yes | None | None direct | None |
| `liquidationFee(address)` | **public** | Yes | None | None direct | None |
| `keeperFee(address)` | **public** | Yes | None | None direct | None |
| `maxFee(AssetClass)` | **public** | Yes | None | None direct | None |
| `stabilityFee(address)` | **public** | Yes | None | None direct | None |
| `calculateFeeIndex(address,uint256,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `utilizationRatio(address)` | **public** | Yes | None | None direct | None |

---

## Contract: NoDiscountProfile
**Linearized C3 Inheritance Tree:** IDiscountProfile
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `discount(address)` | **external** | Yes | None | None direct | None |
| `discount(address)` | **external** | Yes | None | None direct | None |

---

## Contract: NoMochiReferralFeePool
**Linearized C3 Inheritance Tree:** IReferralFeePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `addReward(address)` | **external** | Yes | None | None direct | None |
| `addReward(address)` | **external** | Yes | None | None direct | reward, rewards |
| `claimReward()` | **external** | No (msg/tx) | None | None direct | reward, rewards |

---

## Contract: NoMochiFeePool
**Linearized C3 Inheritance Tree:** IFeePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `updateReserve()` | **external** | Yes | None | None direct | None |
| `updateReserve()` | **external** | Yes | None | None direct | None |
| `withdraw()` | **external** | Yes | None | None direct | None |
| `changeWithdrawer(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | withdrawer |

---

## Contract: ReferralFeePoolV0
**Linearized C3 Inheritance Tree:** IReferralFeePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `IUniswapV2Router02 uniswapRouter`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `addReward(address)` | **external** | Yes | None | None direct | None |
| `addReward(address)` | **external** | Yes | None | None direct | reward, rewards |
| `claimRewardAsMochi()` | **external** | No (msg/tx) | None | None direct | None |

---

## Contract: IUniswapV2Router02
**Linearized C3 Inheritance Tree:** IUniswapV2Router01
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `factory()` | **external** | Yes | None | None direct | None |
| `WETH()` | **external** | Yes | None | None direct | None |
| `addLiquidity(address,address,uint256,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidityETH(address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidityETH(address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidityWithPermit(address,address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `removeLiquidityETHWithPermit(address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapTokensForExactTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactETHForTokens(uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapTokensForExactETH(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForETH(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapETHForExactTokens(uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `quote(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getAmountOut(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getAmountIn(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getAmountsOut(uint256,address[])` | **external** | Yes | None | None direct | None |
| `getAmountsIn(uint256,address[])` | **external** | Yes | None | None direct | None |
| `removeLiquidityETHSupportingFeeOnTransferTokens(address,uint256,uint256,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactETHForTokensSupportingFeeOnTransferTokens(uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |
| `swapExactTokensForETHSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: FeePoolV0
**Linearized C3 Inheritance Tree:** IFeePool
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `IUniswapV2Router02 uniswapRouter`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `updateReserve()` | **external** | Yes | None | None direct | None |
| `updateReserve()` | **external** | Yes | None | None direct | mochiShare, treasuryShare |
| `changecrvVoterRewardPool(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | crvVoterRewardPool |
| `changeTreasuryRatio(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | treasuryRatio |
| `changevMochiRatio(uint256)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | vMochiRatio |
| `distributeMochi()` | **external** | Yes | None | None direct | None |
| `_buyMochi()` | **internal** | Yes | None | None direct | None |
| `_shareMochi()` | **internal** | Yes | None | None direct | mochiShare, treasuryShare |
| `sendToTreasury()` | **external** | Yes | None | None direct | treasuryShare |

---

## Contract: MochiTreasuryV0
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `IUniswapV2Router02 uniswapRouter`
- Privilege: `IERC20 crv`
- Privilege: `ICurveVotingEscrow veCrv`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `receive()` | **external** | Yes | None | None direct | None |
| `withdrawCRV()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | None |
| `withdrawLock()` | **external** | Yes | None | None direct | None |
| `veCRVInitialize()` | **external** | No (msg/tx) | None | None direct | None |
| `toggleLocking()` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!gov)` | lockCrv |
| `updateFee()` | **public** | Yes | None | None direct | operationShare, veCRVShare |
| `claimOperationCost()` | **external** | Yes | None | None direct | operationShare |
| `veCRVlock()` | **external** | No (msg/tx) | None | None direct | veCRVShare |
| `_buyCRV()` | **internal** | Yes | None | None direct | None |
| `_lockCRV()` | **internal** | No (msg/tx) | None | None direct | None |

---

## Contract: VestedRewardPool
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochi mochi`
- Privilege: `IVMochi vMochi`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `vest(address)` | **external** | No (msg/tx) | checkClaimable | None direct | mochiUnderManagement, vesting |
| `claim()` | **external** | No (msg/tx) | checkClaimable | None direct | mochiUnderManagement, vesting |
| `lock(uint256)` | **external** | No (msg/tx) | checkClaimable | None direct | mochiUnderManagement, vesting |
| `forceClaim(uint256)` | **external** | No (msg/tx) | checkClaimable | None direct | mochiUnderManagement, vesting |

---

## Contract: Mochi
**Linearized C3 Inheritance Tree:** ERC20 -> IERC20Metadata -> IERC20 -> Context
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

---

## Contract: DutchAuctionLiquidator
**Linearized C3 Inheritance Tree:** ILiquidator
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`
- Privilege: `uint256 DURATION`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `triggerLiquidation(address,uint256)` | **external** | Yes | None | None direct | None |
| `auctionId(address,uint256)` | **public** | Yes | None | None direct | None |
| `price(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `currentLiquidationFee(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `triggerLiquidation(address,uint256)` | **external** | No (msg/tx) | None | None direct | auctions |
| `settleLiquidation(uint256,uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | auctions |
| `buy(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | DURATION |

---

## Contract: MochiVault
**Linearized C3 Inheritance Tree:** IERC3156FlashLender -> IMochiVault -> Initializable
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `bytes32 CALLBACK_SUCCESS`
- Privilege: `IMochiEngine engine`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **external** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `liveDebtIndex()` | **external** | Yes | None | None direct | None |
| `details(uint256)` | **external** | Yes | None | None direct | None |
| `status(uint256)` | **external** | Yes | None | None direct | None |
| `asset()` | **external** | Yes | None | None direct | None |
| `deposits()` | **external** | Yes | None | None direct | None |
| `debts()` | **external** | Yes | None | None direct | None |
| `claimable()` | **external** | Yes | None | None direct | None |
| `currentDebt(uint256)` | **external** | Yes | None | None direct | None |
| `initialize(address)` | **external** | Yes | None | None direct | None |
| `deposit(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `withdraw(uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `borrow(uint256,uint256,bytes)` | **external** | Yes | None | None direct | None |
| `repay(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `liquidate(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `_disableInitializers()` | **internal** | Yes | None | None direct | _initialized |
| `_getInitializedVersion()` | **internal** | Yes | None | None direct | None |
| `_isInitializing()` | **internal** | Yes | None | None direct | None |
| `initialize(address)` | **external** | No (msg/tx) | initializer | None direct | asset, debtIndex, lastAccrued |
| `liveDebtIndex()` | **public** | Yes | None | None direct | None |
| `status(uint256)` | **public** | Yes | None | None direct | None |
| `currentDebt(uint256)` | **public** | Yes | None | None direct | None |
| `accrueDebt(uint256)` | **public** | No (msg/tx) | None | None direct | claimable, debtIndex, debts, details, lastAccrued |
| `increase(uint256,uint256,uint256,address,bytes)` | **external** | No (msg/tx) | None | `[Internal Call: borrow] require(bool,string)(engine.nft().ownerOf(_id) == msg.sender,!approved)` | None |
| `decrease(uint256,uint256,uint256,bytes)` | **external** | No (msg/tx) | None | `[Internal Call: withdraw] require(bool,string)(engine.nft().ownerOf(_id) == msg.sender,!approved)` | None |
| `mint(address,address)` | **public** | Yes | None | None direct | details |
| `deposit(uint256,uint256)` | **public** | No (msg/tx) | updateDebt | None direct | deposits, details, lastDeposit |
| `withdraw(uint256,uint256,bytes)` | **public** | No (msg/tx) | wait | `require(bool,string)(engine.nft().ownerOf(_id) == msg.sender,!approved)` | deposits, details |
| `borrow(uint256,uint256,bytes)` | **public** | No (msg/tx) | updateDebt | `require(bool,string)(engine.nft().ownerOf(_id) == msg.sender,!approved)` | debts, details |
| `repay(uint256,uint256)` | **public** | No (msg/tx) | updateDebt | None direct | debts, details |
| `liquidate(uint256,uint256,uint256)` | **external** | No (msg/tx) | updateDebt | `require(bool,string)(msg.sender == address(engine.liquidator()),!liquidator)` | debts, details |
| `_liquidatable(uint256,float,uint256)` | **internal** | Yes | None | None direct | None |
| `liquidatable(uint256)` | **external** | Yes | None | None direct | None |
| `claim()` | **external** | No (msg/tx) | updateDebt | None direct | None |
| `mintFeeToPool(uint256,address)` | **internal** | Yes | None | None direct | claimable |
| `maxFlashLoan(address)` | **external** | Yes | None | None direct | None |
| `flashFee(address,uint256)` | **public** | Yes | None | None direct | None |
| `flashLoan(IERC3156FlashBorrower,address,uint256,bytes)` | **external** | No (msg/tx) | None | `require(bool,string)(_receiver.onFlashLoan(msg.sender,_token,_amount,fee,_data) == CALLBACK_SUCCESS,!callback)` | None |
| `slitherConstructorConstantVariables()` | **internal** | Yes | None | None direct | CALLBACK_SUCCESS |

---

## Contract: CheapERC20
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `cheapTransfer(IERC20,address,uint256)` | **internal** | Yes | None | None direct | None |
| `cheapTransferFrom(IERC20,address,address,uint256)` | **internal** | Yes | None | None direct | None |

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
| `functionDelegateCall(address,bytes)` | **internal** | Yes | None | None direct | None |
| `functionDelegateCall(address,bytes,string)` | **internal** | Yes | None | None direct | None |
| `verifyCallResultFromTarget(address,bool,bytes,string)` | **internal** | Yes | None | None direct | None |
| `verifyCallResult(bool,bytes,string)` | **internal** | Yes | None | None direct | None |
| `_revert(bytes,string)` | **private** | Yes | None | None direct | None |

---

## Contract: MochiNFT
**Linearized C3 Inheritance Tree:** ERC721Enumerable -> IMochiNFT -> IERC721Enumerable -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `IMochiEngine engine`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `tokenOfOwnerByIndex(address,uint256)` | **public** | Yes | None | None direct | None |
| `totalSupply()` | **public** | Yes | None | None direct | None |
| `tokenByIndex(uint256)` | **public** | Yes | None | None direct | None |
| `_beforeTokenTransfer(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | None |
| `_addTokenToOwnerEnumeration(address,uint256)` | **private** | Yes | None | None direct | _ownedTokens, _ownedTokensIndex |
| `_addTokenToAllTokensEnumeration(uint256)` | **private** | Yes | None | None direct | _allTokens, _allTokensIndex |
| `_removeTokenFromOwnerEnumeration(address,uint256)` | **private** | Yes | None | None direct | _ownedTokens, _ownedTokensIndex |
| `_removeTokenFromAllTokensEnumeration(uint256)` | **private** | Yes | None | None direct | _allTokens, _allTokensIndex |
| `totalSupply()` | **external** | Yes | None | None direct | None |
| `tokenOfOwnerByIndex(address,uint256)` | **external** | Yes | None | None direct | None |
| `tokenByIndex(uint256)` | **external** | Yes | None | None direct | None |
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
| `supportsInterface(bytes4)` | **public** | Yes | None | None direct | None |
| `_msgSender()` | **internal** | No (msg/tx) | None | None direct | None |
| `_msgData()` | **internal** | No (msg/tx) | None | None direct | None |
| `_contextSuffixLength()` | **internal** | Yes | None | None direct | None |
| `asset(uint256)` | **external** | Yes | None | None direct | None |
| `mint(address,address)` | **external** | Yes | None | None direct | None |
| `setDescriptor(address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == engine.governance(),!governance)` | descriptor |
| `mint(address,address)` | **external** | No (msg/tx) | None | `require(bool,string)(msg.sender == address(engine.vaultFactory().getVault(_asset)),!vault)` | info |
| `asset(uint256)` | **external** | Yes | None | None direct | None |
| `tokenURI(uint256)` | **public** | Yes | None | None direct | None |

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
