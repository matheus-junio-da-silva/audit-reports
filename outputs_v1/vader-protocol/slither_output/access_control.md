# 🛡️ Access Control & Authorization (Privilege Mapping)

## Contract: Attack
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address)` | **public** | Yes | None | None direct | USDV, VADER, inited |
| `attackUSDV(uint256)` | **public** | Yes | None | None direct | None |

---

## Contract: DAO
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address,address)` | **public** | Yes | None | None direct | USDV, VADER, VAULT, coolOffPeriod, inited |
| `newGrantProposal(address,uint256)` | **public** | No (msg/tx) | None | None direct | mapPID_grant, mapPID_type, proposalCount |
| `newAddressProposal(address,string)` | **public** | No (msg/tx) | None | None direct | mapPID_address, mapPID_type, proposalCount |
| `voteProposal(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_finalise(uint256)` | **internal** | No (msg/tx) | None | None direct | mapPID_finalising, mapPID_timeStart |
| `cancelProposal(uint256,uint256)` | **public** | No (msg/tx) | None | None direct | mapPID_votes |
| `finaliseProposal(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `completeProposal(uint256)` | **internal** | No (msg/tx) | None | None direct | mapPID_finalised, mapPID_finalising, mapPID_votes |
| `grantFunds(uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `moveUtils(uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `moveRewardAddress(uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `countMemberVotes(uint256)` | **internal** | No (msg/tx) | None | None direct | mapPIDMember_votes, mapPID_votes |
| `hasMajority(uint256)` | **public** | Yes | None | None direct | None |
| `hasQuorum(uint256)` | **public** | Yes | None | None direct | None |
| `hasMinority(uint256)` | **public** | Yes | None | None direct | None |
| `isEqual(bytes,bytes)` | **public** | Yes | None | None direct | None |

---

## Contract: Factory
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address)` | **public** | Yes | None | None direct | POOLS, inited |
| `deploySynth(address)` | **external** | No (msg/tx) | onlyPOOLS | `[Internal Call: onlyPOOLS] require(bool,string)(msg.sender == POOLS,!POOLS)`<br>`[Modifier: onlyPOOLS] require(bool,string)(msg.sender == POOLS,!POOLS)` | None |
| `mintSynth(address,address,uint256)` | **external** | No (msg/tx) | onlyPOOLS | `[Internal Call: onlyPOOLS] require(bool,string)(msg.sender == POOLS,!POOLS)`<br>`[Modifier: onlyPOOLS] require(bool,string)(msg.sender == POOLS,!POOLS)` | None |
| `_addSynth(address,address)` | **internal** | Yes | None | None direct | arraySynths, getSynth, isSynth |

---

## Contract: Pools
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address,address,address)` | **public** | Yes | None | None direct | FACTORY, ROUTER, USDV, VADER, inited |
| `addLiquidity(address,address,address)` | **external** | Yes | None | None direct | _isAnchor, _isAsset, mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount |
| `removeLiquidity(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `removeLiquidityDirectly(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_removeLiquidity(address,address,uint256,address)` | **internal** | Yes | None | None direct | mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount |
| `swap(address,address,address,bool)` | **external** | Yes | None | None direct | mapToken_baseAmount, mapToken_tokenAmount |
| `sync(address,address)` | **external** | Yes | None | None direct | mapToken_baseAmount, mapToken_tokenAmount |
| `deploySynth(address)` | **external** | Yes | None | None direct | None |
| `mintSynth(address,address,address)` | **external** | Yes | None | None direct | mapTokenMember_Units, mapToken_Units, mapToken_baseAmount |
| `burnSynth(address,address,address)` | **external** | Yes | None | None direct | mapTokenMember_Units, mapToken_Units, mapToken_baseAmount |
| `syncSynth(address)` | **external** | Yes | None | None direct | mapTokenMember_Units, mapToken_Units |
| `lockUnits(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | mapTokenMember_Units |
| `unlockUnits(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | mapTokenMember_Units |
| `getAddedAmount(address,address)` | **internal** | Yes | None | None direct | pooledUSDV, pooledVADER |
| `transferOut(address,uint256,address)` | **internal** | Yes | None | None direct | pooledUSDV, pooledVADER |
| `isMember(address)` | **public** | Yes | None | None direct | None |
| `isAsset(address)` | **public** | Yes | None | None direct | None |
| `isAnchor(address)` | **public** | Yes | None | None direct | None |
| `getPoolAmounts(address)` | **external** | Yes | None | None direct | None |
| `getBaseAmount(address)` | **public** | Yes | None | None direct | None |
| `getTokenAmount(address)` | **public** | Yes | None | None direct | None |
| `getUnits(address)` | **external** | Yes | None | None direct | None |
| `getMemberUnits(address,address)` | **external** | Yes | None | None direct | None |
| `getSynth(address)` | **public** | Yes | None | None direct | None |
| `isSynth(address)` | **public** | Yes | None | None direct | None |
| `UTILS()` | **public** | Yes | None | None direct | None |

---

## Contract: Router
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address,address)` | **public** | Yes | None | None direct | POOLS, USDV, VADER, anchorLimit, curatedPoolLimit, inited, insidePriceLimit, outsidePriceLimit, rewardReductionFactor, timeForFullProtection |
| `setParams(uint256,uint256,uint256)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)` | curatedPoolLimit, rewardReductionFactor, timeForFullProtection |
| `setAnchorParams(uint256,uint256,uint256)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)` | anchorLimit, insidePriceLimit, outsidePriceLimit |
| `addLiquidity(address,uint256,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `removeLiquidity(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `swap(uint256,address,address)` | **external** | No (msg/tx) | None | None direct | None |
| `swapWithLimit(uint256,address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `swapWithSynths(uint256,address,bool,address,bool)` | **external** | No (msg/tx) | None | None direct | None |
| `swapWithSynthsWithLimit(uint256,address,bool,address,bool,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_handlePoolReward(address,address)` | **internal** | Yes | None | None direct | None |
| `addDepositData(address,address,uint256,uint256)` | **internal** | No (msg/tx) | None | None direct | mapMemberToken_depositBase, mapMemberToken_depositToken, mapMemberToken_lastDeposited |
| `removeDepositData(address,address,uint256,uint256)` | **internal** | Yes | None | None direct | mapMemberToken_depositBase, mapMemberToken_depositToken |
| `getILProtection(address,address,address,uint256)` | **public** | Yes | None | None direct | None |
| `curatePool(address)` | **external** | No (msg/tx) | None | None direct | _isCurated, curatedPoolCount |
| `replacePool(address,address)` | **external** | No (msg/tx) | None | None direct | _isCurated |
| `listAnchor(address)` | **external** | Yes | None | None direct | _isCurated, arrayAnchors, arrayPrices |
| `replaceAnchor(address,address)` | **external** | Yes | None | None direct | _isCurated, arrayAnchors |
| `updateAnchorPrice(address)` | **public** | Yes | None | None direct | arrayPrices |
| `_handleAnchorPriceUpdate(address)` | **internal** | Yes | None | None direct | None |
| `getAnchorPrice()` | **public** | Yes | None | None direct | None |
| `getVADERAmount(uint256)` | **public** | Yes | None | None direct | None |
| `getUSDVAmount(uint256)` | **public** | Yes | None | None direct | None |
| `borrow(uint256,address,address)` | **public** | No (msg/tx) | None | `[Internal Call: _getFunds] require(bool)(iERC20(_token).transferFrom(msg.sender,address(this),_amount))` | None |
| `borrowForMember(address,uint256,address,address)` | **public** | No (msg/tx) | None | `[Internal Call: _getFunds] require(bool)(iERC20(_token).transferFrom(msg.sender,address(this),_amount))` | mapCollateralDebt_Collateral, mapCollateralDebt_Debt |
| `repay(uint256,address,address)` | **public** | No (msg/tx) | None | None direct | None |
| `repayForMember(address,uint256,address,address)` | **public** | No (msg/tx) | None | None direct | mapCollateralDebt_Collateral, mapCollateralDebt_Debt, mapCollateralDebt_interestPaid |
| `payInterest(address,address)` | **internal** | No (msg/tx) | None | None direct | mapCollateralAsset_NextEra, mapCollateralDebt_interestPaid |
| `checkLiquidate()` | **public** | Yes | None | None direct | None |
| `_handleTransferIn(address,address,uint256)` | **internal** | No (msg/tx) | None | `[Internal Call: _getFunds] require(bool)(iERC20(_token).transferFrom(msg.sender,address(this),_amount))` | None |
| `_handleTransferOut(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_getFunds(address,uint256)` | **internal** | No (msg/tx) | None | `require(bool)(iERC20(_token).transferFrom(msg.sender,address(this),_amount))` | None |
| `_sendFunds(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `_addDebtToMember(address,uint256,address,uint256,address)` | **internal** | Yes | None | None direct | mapMember_Collateral |
| `_removeDebtFromMember(address,uint256,address,uint256,address)` | **internal** | Yes | None | None direct | mapMember_Collateral |
| `_removeCollateral(uint256,address,address)` | **internal** | Yes | None | None direct | mapCollateralDebt_Collateral |
| `isBase(address)` | **public** | Yes | None | None direct | None |
| `reserveVADER()` | **public** | Yes | None | None direct | None |
| `reserveUSDV()` | **public** | Yes | None | None direct | None |
| `moveTokenToPools(address,uint256)` | **internal** | No (msg/tx) | None | None direct | None |
| `UTILS()` | **public** | Yes | None | None direct | None |
| `DAO()` | **public** | Yes | None | None direct | None |
| `emitting()` | **public** | Yes | None | None direct | None |
| `isCurated(address)` | **public** | Yes | None | None direct | None |
| `isPool(address)` | **public** | Yes | None | None direct | None |
| `getMemberBaseDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberTokenDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberLastDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberCollateral(address,address,address)` | **external** | Yes | None | None direct | None |
| `getMemberDebt(address,address,address)` | **public** | Yes | None | None direct | None |
| `getSystemCollateral(address,address)` | **public** | Yes | None | None direct | None |
| `getSystemDebt(address,address)` | **public** | Yes | None | None direct | None |
| `getSystemInterestPaid(address,address)` | **public** | Yes | None | None direct | None |
| `getNextEraTime(address,address)` | **public** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | one, repayDelay |

---

## Contract: Synth
**Linearized C3 Inheritance Tree:** iERC20
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferTo(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferTo(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `mint(address,uint256)` | **external** | No (msg/tx) | onlyFACTORY | `[Internal Call: onlyFACTORY] require(bool,string)(msg.sender == FACTORY,!FACTORY)`<br>`[Modifier: onlyFACTORY] require(bool,string)(msg.sender == FACTORY,!FACTORY)` | _balances, totalSupply |
| `burn(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | decimals |

---

## Contract: Token1
**Linearized C3 Inheritance Tree:** iERC20
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferTo(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferTo(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `burn(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | decimals, totalSupply |

---

## Contract: Token2
**Linearized C3 Inheritance Tree:** iERC20
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferTo(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `transferTo(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | Yes | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `burn(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | decimals, totalSupply |

---

## Contract: USDV
**Linearized C3 Inheritance Tree:** iERC20
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferTo(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | Yes | None | None direct | None |
| `isMature()` | **public** | No (msg/tx) | None | None direct | None |
| `init(address,address,address)` | **external** | No (msg/tx) | None | None direct | ROUTER, VADER, VAULT, inited, nextEraTime |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferTo(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `burn(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `setParams(uint256)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)` | blockDelay |
| `_checkIncentives()` | **private** | No (msg/tx) | None | None direct | nextEraTime |
| `convert(uint256)` | **external** | No (msg/tx) | None | `[Internal Call: convertForMember] [Internal Call: getFunds] require(bool)(iERC20(token).transferFrom(msg.sender,address(this),amount))` | None |
| `convertForMember(address,uint256)` | **public** | No (msg/tx) | None | `[Internal Call: getFunds] require(bool)(iERC20(token).transferFrom(msg.sender,address(this),amount))` | None |
| `_convert(address,uint256)` | **internal** | No (msg/tx) | flashProof | None direct | lastBlock |
| `redeem(uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `redeemForMember(address,uint256)` | **public** | No (msg/tx) | None | None direct | lastBlock |
| `getFunds(address,uint256)` | **internal** | No (msg/tx) | None | `require(bool)(iERC20(token).transferFrom(msg.sender,address(this),amount))` | None |
| `DAO()` | **public** | Yes | None | None direct | None |
| `emitting()` | **public** | Yes | None | None direct | None |
| `minting()` | **public** | Yes | None | None direct | None |

---

## Contract: Utils
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address,address,address,address)` | **public** | Yes | None | None direct | FACTORY, POOLS, ROUTER, USDV, VADER, inited |
| `getFeeOnTransfer(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `assetChecks(address,address)` | **external** | Yes | None | None direct | None |
| `isBase(address)` | **public** | Yes | None | None direct | None |
| `isPool(address)` | **public** | Yes | None | None direct | None |
| `calcValueInBase(address,uint256)` | **public** | Yes | None | None direct | None |
| `calcValueInToken(address,uint256)` | **public** | Yes | None | None direct | None |
| `calcValueOfTokenInToken(address,uint256,address)` | **public** | Yes | None | None direct | None |
| `calcSwapValueInBase(address,uint256)` | **public** | Yes | None | None direct | None |
| `calcSwapValueInToken(address,uint256)` | **public** | Yes | None | None direct | None |
| `requirePriceBounds(address,uint256,bool,uint256)` | **external** | Yes | None | None direct | None |
| `getRewardShare(address,uint256)` | **external** | Yes | None | None direct | None |
| `getReducedShare(uint256,uint256)` | **public** | Yes | None | None direct | None |
| `getProtection(address,address,uint256,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `getCoverage(address,address)` | **public** | Yes | None | None direct | None |
| `getCollateralValueInBase(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `getDebtValueInCollateral(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `getInterestOwed(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getInterestPayment(address,address)` | **public** | Yes | None | None direct | None |
| `getDebtLoading(address,address)` | **public** | Yes | None | None direct | None |
| `calcPart(uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calcShare(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calcSwapOutput(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calcSwapFee(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcSwapSlip(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcLiquidityUnits(uint256,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getSlipAdustment(uint256,uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calcSynthUnits(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcAsymmetricShare(uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `calcCoverage(uint256,uint256,uint256,uint256)` | **public** | Yes | None | None direct | None |
| `sortArray(uint256[])` | **external** | Yes | None | None direct | None |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | _10k, _year, one |

---

## Contract: Vader
**Linearized C3 Inheritance Tree:** iERC20
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `transferTo(address,uint256)` | **external** | Yes | None | None direct | None |
| `burn(uint256)` | **external** | Yes | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | Yes | None | None direct | None |
| `isMature()` | **public** | Yes | None | None direct | None |
| `init(address,address,address)` | **external** | Yes | None | None direct | USDV, UTILS, VETHER, inited, rewardAddress |
| `balanceOf(address)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `transferTo(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | _balances |
| `_mint(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `burn(uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `burnFrom(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_burn(address,uint256)` | **internal** | Yes | None | None direct | _balances, totalSupply |
| `flipEmissions()` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | emitting |
| `flipMinting()` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | minting |
| `setParams(uint256,uint256)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | emissionCurve, secondsPerEra |
| `setRewardAddress(address)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | rewardAddress |
| `changeUTILS(address)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | UTILS |
| `changeDAO(address)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | DAO |
| `purgeDAO()` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO,Not DAO)` | DAO |
| `_checkEmission()` | **private** | No (msg/tx) | None | None direct | currentEra, feeOnTransfer, nextEraTime |
| `getDailyEmission()` | **public** | Yes | None | None direct | None |
| `upgrade(uint256)` | **external** | No (msg/tx) | None | `require(bool)(iERC20(VETHER).transferFrom(msg.sender,burnAddress,amount))` | None |
| `redeem()` | **external** | No (msg/tx) | None | None direct | None |
| `redeemToMember(address)` | **public** | Yes | flashProof | None direct | None |

---

## Contract: Vault
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `init(address,address,address,address,address)` | **public** | Yes | None | None direct | FACTORY, POOLS, ROUTER, USDV, VADER, erasToEarn, inited, minGrantTime, minimumDepositTime |
| `setParams(uint256,uint256,uint256)` | **external** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)` | erasToEarn, minGrantTime, minimumDepositTime |
| `grant(address,uint256)` | **public** | No (msg/tx) | onlyDAO | `[Internal Call: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)`<br>`[Modifier: onlyDAO] require(bool,string)(msg.sender == DAO(),Not DAO)` | lastGranted |
| `deposit(address,uint256)` | **external** | No (msg/tx) | None | `[Internal Call: depositForMember] [Internal Call: getFunds] require(bool)(iERC20(synth).transferFrom(msg.sender,address(this),amount))` | None |
| `depositForMember(address,address,uint256)` | **public** | No (msg/tx) | None | `[Internal Call: getFunds] require(bool)(iERC20(synth).transferFrom(msg.sender,address(this),amount))` | None |
| `_deposit(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | mapMemberSynth_deposit, mapMemberSynth_lastTime, mapMember_weight, totalWeight |
| `harvest(address)` | **external** | No (msg/tx) | None | None direct | mapMemberSynth_deposit, mapMemberSynth_lastTime, mapMember_weight, totalWeight |
| `calcCurrentReward(address,address)` | **public** | No (msg/tx) | None | None direct | None |
| `calcReward(address,address)` | **public** | Yes | None | None direct | None |
| `withdraw(address,uint256)` | **external** | No (msg/tx) | None | None direct | None |
| `_processWithdraw(address,address,uint256)` | **internal** | No (msg/tx) | None | None direct | mapMemberSynth_deposit, mapMember_weight, totalWeight |
| `getFunds(address,uint256)` | **internal** | No (msg/tx) | None | `require(bool)(iERC20(synth).transferFrom(msg.sender,address(this),amount))` | None |
| `sendFunds(address,address,uint256)` | **internal** | Yes | None | None direct | None |
| `reserveUSDV()` | **public** | Yes | None | None direct | None |
| `reserveVADER()` | **public** | Yes | None | None direct | None |
| `getMemberDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberWeight(address)` | **external** | Yes | None | None direct | None |
| `getMemberLastTime(address,address)` | **external** | Yes | None | None direct | None |
| `DAO()` | **public** | Yes | None | None direct | None |
| `UTILS()` | **public** | Yes | None | None direct | None |

---

## Contract: Vether
**Linearized C3 Inheritance Tree:** iVETHER
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
| `transfer(address,uint256)` | **external** | Yes | None | None direct | None |
| `allowance(address,address)` | **external** | Yes | None | None direct | None |
| `approve(address,uint256)` | **external** | Yes | None | None direct | None |
| `transferFrom(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `balanceOf(address)` | **public** | Yes | None | None direct | None |
| `allowance(address,address)` | **public** | Yes | None | None direct | None |
| `transfer(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `approve(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `increaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `decreaseAllowance(address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_approve(address,address,uint256)` | **internal** | Yes | None | None direct | _allowances |
| `transferFrom(address,address,uint256)` | **public** | No (msg/tx) | None | None direct | None |
| `_transfer(address,address,uint256)` | **private** | Yes | None | None direct | _balances, totalFees |
| `_getFee(address,address,uint256)` | **private** | Yes | None | None direct | None |
| `addExcluded(address)` | **public** | Yes | None | None direct | mapAddress_Excluded |
| `slitherConstructorVariables()` | **internal** | Yes | None | None direct | decimals, totalSupply |

---

## Contract: iFACTORY
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `deploySynth(address)` | **external** | Yes | None | None direct | None |
| `mintSynth(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getSynth(address)` | **external** | Yes | None | None direct | None |
| `isSynth(address)` | **external** | Yes | None | None direct | None |

---

## Contract: iPOOLS
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `pooledVADER()` | **external** | Yes | None | None direct | None |
| `pooledUSDV()` | **external** | Yes | None | None direct | None |
| `addLiquidity(address,address,address)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `sync(address,address)` | **external** | Yes | None | None direct | None |
| `swap(address,address,address,bool)` | **external** | Yes | None | None direct | None |
| `deploySynth(address)` | **external** | Yes | None | None direct | None |
| `mintSynth(address,address,address)` | **external** | Yes | None | None direct | None |
| `burnSynth(address,address,address)` | **external** | Yes | None | None direct | None |
| `syncSynth(address)` | **external** | Yes | None | None direct | None |
| `lockUnits(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `unlockUnits(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `isMember(address)` | **external** | Yes | None | None direct | None |
| `isAsset(address)` | **external** | Yes | None | None direct | None |
| `isAnchor(address)` | **external** | Yes | None | None direct | None |
| `getPoolAmounts(address)` | **external** | Yes | None | None direct | None |
| `getBaseAmount(address)` | **external** | Yes | None | None direct | None |
| `getTokenAmount(address)` | **external** | Yes | None | None direct | None |
| `getUnits(address)` | **external** | Yes | None | None direct | None |
| `getMemberUnits(address,address)` | **external** | Yes | None | None direct | None |
| `getSynth(address)` | **external** | Yes | None | None direct | None |
| `isSynth(address)` | **external** | Yes | None | None direct | None |

---

## Contract: iROUTER
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `addLiquidity(address,uint256,address,uint256)` | **external** | Yes | None | None direct | None |
| `removeLiquidity(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `swap(uint256,address,address)` | **external** | Yes | None | None direct | None |
| `swapWithLimit(uint256,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `swapWithSynths(uint256,address,bool,address,bool)` | **external** | Yes | None | None direct | None |
| `swapWithSynthsWithLimit(uint256,address,bool,address,bool,uint256)` | **external** | Yes | None | None direct | None |
| `getILProtection(address,address,address,uint256)` | **external** | Yes | None | None direct | None |
| `curatePool(address)` | **external** | Yes | None | None direct | None |
| `listAnchor(address)` | **external** | Yes | None | None direct | None |
| `replacePool(address,address)` | **external** | Yes | None | None direct | None |
| `updateAnchorPrice(address)` | **external** | Yes | None | None direct | None |
| `getAnchorPrice()` | **external** | Yes | None | None direct | None |
| `getVADERAmount(uint256)` | **external** | Yes | None | None direct | None |
| `getUSDVAmount(uint256)` | **external** | Yes | None | None direct | None |
| `isCurated(address)` | **external** | Yes | None | None direct | None |
| `reserveUSDV()` | **external** | Yes | None | None direct | None |
| `reserveVADER()` | **external** | Yes | None | None direct | None |
| `getMemberBaseDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberTokenDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberLastDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberCollateral(address,address,address)` | **external** | Yes | None | None direct | None |
| `getMemberDebt(address,address,address)` | **external** | Yes | None | None direct | None |
| `getSystemCollateral(address,address)` | **external** | Yes | None | None direct | None |
| `getSystemDebt(address,address)` | **external** | Yes | None | None direct | None |
| `getSystemInterestPaid(address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: iSYNTH
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `mint(address,uint256)` | **external** | Yes | None | None direct | None |
| `TOKEN()` | **external** | Yes | None | None direct | None |

---

## Contract: iUSDV
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `ROUTER()` | **external** | Yes | None | None direct | None |
| `isMature()` | **external** | Yes | None | None direct | None |
| `setParams(uint256)` | **external** | Yes | None | None direct | None |
| `convert(uint256)` | **external** | Yes | None | None direct | None |
| `convertForMember(address,uint256)` | **external** | Yes | None | None direct | None |
| `redeem(uint256)` | **external** | Yes | None | None direct | None |
| `redeemForMember(address,uint256)` | **external** | Yes | None | None direct | None |

---

## Contract: iUTILS
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `getFeeOnTransfer(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `assetChecks(address,address)` | **external** | Yes | None | None direct | None |
| `isBase(address)` | **external** | Yes | None | None direct | None |
| `calcValueInBase(address,uint256)` | **external** | Yes | None | None direct | None |
| `calcValueInToken(address,uint256)` | **external** | Yes | None | None direct | None |
| `calcValueOfTokenInToken(address,uint256,address)` | **external** | Yes | None | None direct | None |
| `calcSwapValueInBase(address,uint256)` | **external** | Yes | None | None direct | None |
| `calcSwapValueInToken(address,uint256)` | **external** | Yes | None | None direct | None |
| `requirePriceBounds(address,uint256,bool,uint256)` | **external** | Yes | None | None direct | None |
| `getRewardShare(address,uint256)` | **external** | Yes | None | None direct | None |
| `getReducedShare(uint256)` | **external** | Yes | None | None direct | None |
| `getProtection(address,address,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getCoverage(address,address)` | **external** | Yes | None | None direct | None |
| `getCollateralValueInBase(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `getDebtValueInCollateral(address,uint256,address,address)` | **external** | Yes | None | None direct | None |
| `getInterestOwed(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `getInterestPayment(address,address)` | **external** | Yes | None | None direct | None |
| `getDebtLoading(address,address)` | **external** | Yes | None | None direct | None |
| `calcPart(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcShare(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcSwapOutput(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcSwapFee(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcSwapSlip(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcLiquidityUnits(uint256,uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `getSlipAdustment(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcSynthUnits(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcAsymmetricShare(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `calcCoverage(uint256,uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `sortArray(uint256[])` | **external** | Yes | None | None direct | None |

---

## Contract: iVADER
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `UTILS()` | **external** | Yes | None | None direct | None |
| `DAO()` | **external** | Yes | None | None direct | None |
| `emitting()` | **external** | Yes | None | None direct | None |
| `minting()` | **external** | Yes | None | None direct | None |
| `secondsPerEra()` | **external** | Yes | None | None direct | None |
| `flipEmissions()` | **external** | Yes | None | None direct | None |
| `flipMinting()` | **external** | Yes | None | None direct | None |
| `setParams(uint256,uint256)` | **external** | Yes | None | None direct | None |
| `setRewardAddress(address)` | **external** | Yes | None | None direct | None |
| `changeUTILS(address)` | **external** | Yes | None | None direct | None |
| `changeDAO(address)` | **external** | Yes | None | None direct | None |
| `purgeDAO()` | **external** | Yes | None | None direct | None |
| `upgrade(uint256)` | **external** | Yes | None | None direct | None |
| `redeem()` | **external** | Yes | None | None direct | None |
| `redeemToMember(address)` | **external** | Yes | None | None direct | None |

---

## Contract: iVAULT
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- None detected.

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `setParams(uint256,uint256,uint256)` | **external** | Yes | None | None direct | None |
| `grant(address,uint256)` | **external** | Yes | None | None direct | None |
| `deposit(address,uint256)` | **external** | Yes | None | None direct | None |
| `depositForMember(address,address,uint256)` | **external** | Yes | None | None direct | None |
| `harvest(address)` | **external** | Yes | None | None direct | None |
| `calcCurrentReward(address,address)` | **external** | Yes | None | None direct | None |
| `calcReward(address,address)` | **external** | Yes | None | None direct | None |
| `withdraw(address,uint256)` | **external** | Yes | None | None direct | None |
| `totalWeight()` | **external** | Yes | None | None direct | None |
| `reserveUSDV()` | **external** | Yes | None | None direct | None |
| `reserveVADER()` | **external** | Yes | None | None direct | None |
| `getMemberDeposit(address,address)` | **external** | Yes | None | None direct | None |
| `getMemberWeight(address)` | **external** | Yes | None | None direct | None |
| `getMemberLastTime(address,address)` | **external** | Yes | None | None direct | None |

---

## Contract: console
**Linearized C3 Inheritance Tree:** None
**Pausable Safety:** Not Pausable

### Configured Privileges & Roles
- Privilege: `address CONSOLE_ADDRESS`

### Function Access Matrix
| Function Signature | Visibility | Env-Free | Applied Modifiers | Privilege Checks & Assertions | Writes State Variables |
| :--- | :---: | :---: | :--- | :--- | :--- |
| `_sendLogPayloadImplementation(bytes)` | **internal** | Yes | None | None direct | None |
| `_castToPure(function(bytes))` | **internal** | Yes | None | None direct | None |
| `_sendLogPayload(bytes)` | **internal** | Yes | None | None direct | None |
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
