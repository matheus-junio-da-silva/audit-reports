# Project Summary

## Contract: Attack
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `address public VADER` 
- `address public USDV` 

### Public/External Functions
- `init(address,address)` [public]
- `attackUSDV(uint256)` [public]

---

## Contract: DAO
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `uint256 public proposalCount` 
- `address public VADER` 
- `address public USDV` 
- `address public VAULT` 
- `uint256 public coolOffPeriod` 
- `mapping(uint256 => DAO.GrantDetails) public mapPID_grant` 
- `mapping(uint256 => address) public mapPID_address` 
- `mapping(uint256 => string) public mapPID_type` 
- `mapping(uint256 => uint256) public mapPID_votes` 
- `mapping(uint256 => uint256) public mapPID_timeStart` 
- `mapping(uint256 => bool) public mapPID_finalising` 
- `mapping(uint256 => bool) public mapPID_finalised` 
- `mapping(uint256 => mapping(address => uint256)) public mapPIDMember_votes` 

### Public/External Functions
- `init(address,address,address)` [public]
- `newGrantProposal(address,uint256)` [public]
- `newAddressProposal(address,string)` [public]
- `voteProposal(uint256) returns (uint256)` [public]
- `cancelProposal(uint256,uint256)` [public]
- `finaliseProposal(uint256)` [public]
- `hasMajority(uint256) returns (bool)` [public]
- `hasQuorum(uint256) returns (bool)` [public]
- `hasMinority(uint256) returns (bool)` [public]
- `isEqual(bytes,bytes) returns (bool)` [public]

---

## Contract: Factory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `address public VADER` 
- `address public USDV` 
- `address public POOLS` 
- `address[] public arraySynths` 
- `mapping(address => address) public getSynth` 
- `mapping(address => bool) public isSynth` 

### Public/External Functions
- `init(address)` [public]
- `deploySynth(address) returns (address)` [external]
- `mintSynth(address,address,uint256) returns (bool)` [external]

---

## Contract: Pools
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `uint256 public pooledVADER` 
- `uint256 public pooledUSDV` 
- `address public VADER` 
- `address public USDV` 
- `address public ROUTER` 
- `address public FACTORY` 
- `mapping(address => bool) internal _isMember` 
- `mapping(address => bool) internal _isAsset` 
- `mapping(address => bool) internal _isAnchor` 
- `mapping(address => uint256) public mapToken_Units` 
- `mapping(address => mapping(address => uint256)) public mapTokenMember_Units` 
- `mapping(address => uint256) public mapToken_baseAmount` 
- `mapping(address => uint256) public mapToken_tokenAmount` 

### Public/External Functions
- `init(address,address,address,address)` [public]
- `addLiquidity(address,address,address) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256) returns (uint256, uint256)` [external]
- `removeLiquidityDirectly(address,address,uint256) returns (uint256, uint256)` [external]
- `swap(address,address,address,bool) returns (uint256)` [external]
- `sync(address,address)` [external]
- `deploySynth(address)` [external]
- `mintSynth(address,address,address) returns (uint256)` [external]
- `burnSynth(address,address,address) returns (uint256)` [external]
- `syncSynth(address)` [external]
- `lockUnits(uint256,address,address)` [external]
- `unlockUnits(uint256,address,address)` [external]
- `isMember(address) returns (bool)` [public]
- `isAsset(address) returns (bool)` [public]
- `isAnchor(address) returns (bool)` [public]
- `getPoolAmounts(address) returns (uint256, uint256)` [external]
- `getBaseAmount(address) returns (uint256)` [public]
- `getTokenAmount(address) returns (uint256)` [public]
- `getUnits(address) returns (uint256)` [external]
- `getMemberUnits(address,address) returns (uint256)` [external]
- `getSynth(address) returns (address)` [public]
- `isSynth(address) returns (bool)` [public]
- `UTILS() returns (address)` [public]

---

## Contract: Router
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `uint256 internal one` 
- `uint256 public rewardReductionFactor` 
- `uint256 public timeForFullProtection` 
- `uint256 public curatedPoolLimit` 
- `uint256 public curatedPoolCount` 
- `mapping(address => bool) private _isCurated` 
- `address public VADER` 
- `address public USDV` 
- `address public POOLS` 
- `uint256 public anchorLimit` 
- `uint256 public insidePriceLimit` 
- `uint256 public outsidePriceLimit` 
- `address[] public arrayAnchors` 
- `uint256[] public arrayPrices` 
- `uint256 public repayDelay` 
- `mapping(address => mapping(address => uint256)) public mapMemberToken_depositBase` 
- `mapping(address => mapping(address => uint256)) public mapMemberToken_depositToken` 
- `mapping(address => mapping(address => uint256)) public mapMemberToken_lastDeposited` 
- `mapping(address => Router.CollateralDetails) private mapMember_Collateral` 
- `mapping(address => mapping(address => uint256)) private mapCollateralDebt_Collateral` 
- `mapping(address => mapping(address => uint256)) private mapCollateralDebt_Debt` 
- `mapping(address => mapping(address => uint256)) private mapCollateralDebt_interestPaid` 
- `mapping(address => mapping(address => uint256)) private mapCollateralAsset_NextEra` 

### Public/External Functions
- `init(address,address,address)` [public]
- `setParams(uint256,uint256,uint256)` [external]
- `setAnchorParams(uint256,uint256,uint256)` [external]
- `addLiquidity(address,uint256,address,uint256) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256) returns (uint256, uint256)` [external]
- `swap(uint256,address,address) returns (uint256)` [external]
- `swapWithLimit(uint256,address,address,uint256) returns (uint256)` [external]
- `swapWithSynths(uint256,address,bool,address,bool) returns (uint256)` [external]
- `swapWithSynthsWithLimit(uint256,address,bool,address,bool,uint256) returns (uint256)` [public]
- `getILProtection(address,address,address,uint256) returns (uint256)` [public]
- `curatePool(address)` [external]
- `replacePool(address,address)` [external]
- `listAnchor(address)` [external]
- `replaceAnchor(address,address)` [external]
- `updateAnchorPrice(address)` [public]
- `getAnchorPrice() returns (uint256)` [public]
- `getVADERAmount(uint256) returns (uint256)` [public]
- `getUSDVAmount(uint256) returns (uint256)` [public]
- `borrow(uint256,address,address) returns (uint256)` [public]
- `borrowForMember(address,uint256,address,address) returns (uint256)` [public]
- `repay(uint256,address,address) returns (uint256)` [public]
- `repayForMember(address,uint256,address,address) returns (uint256)` [public]
- `checkLiquidate()` [public]
- `isBase(address) returns (bool)` [public]
- `reserveVADER() returns (uint256)` [public]
- `reserveUSDV() returns (uint256)` [public]
- `UTILS() returns (address)` [public]
- `DAO() returns (address)` [public]
- `emitting() returns (bool)` [public]
- `isCurated(address) returns (bool)` [public]
- `isPool(address) returns (bool)` [public]
- `getMemberBaseDeposit(address,address) returns (uint256)` [external]
- `getMemberTokenDeposit(address,address) returns (uint256)` [external]
- `getMemberLastDeposit(address,address) returns (uint256)` [external]
- `getMemberCollateral(address,address,address) returns (uint256)` [external]
- `getMemberDebt(address,address,address) returns (uint256)` [public]
- `getSystemCollateral(address,address) returns (uint256)` [public]
- `getSystemDebt(address,address) returns (uint256)` [public]
- `getSystemInterestPaid(address,address) returns (uint256)` [public]
- `getNextEraTime(address,address) returns (uint256)` [public]

---

## Contract: Synth
**Inheritance (C3 Linearized):** iERC20

### State Variables & Constants
- `address public FACTORY` 
- `address public TOKEN` 
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `transferTo(address,uint256) returns (bool)` [public]
- `mint(address,uint256)` [external]
- `burn(uint256)` [public]
- `burnFrom(address,uint256)` [public]

---

## Contract: Token1
**Inheritance (C3 Linearized):** iERC20

### State Variables & Constants
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `transferTo(address,uint256) returns (bool)` [public]
- `burn(uint256)` [public]
- `burnFrom(address,uint256)` [public]

---

## Contract: Token2
**Inheritance (C3 Linearized):** iERC20

### State Variables & Constants
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `transferTo(address,uint256) returns (bool)` [public]
- `burn(uint256)` [public]
- `burnFrom(address,uint256)` [public]

---

## Contract: USDV
**Inheritance (C3 Linearized):** iERC20

### State Variables & Constants
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `bool private inited` 
- `uint256 public nextEraTime` 
- `uint256 public blockDelay` 
- `address public VADER` 
- `address public VAULT` 
- `address public ROUTER` 
- `mapping(address => uint256) public lastBlock` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `isMature() returns (bool)` [public]
- `init(address,address,address)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `setParams(uint256)` [external]
- `convert(uint256) returns (uint256)` [external]
- `convertForMember(address,uint256) returns (uint256)` [public]
- `redeem(uint256) returns (uint256)` [external]
- `redeemForMember(address,uint256) returns (uint256)` [public]
- `DAO() returns (address)` [public]
- `emitting() returns (bool)` [public]
- `minting() returns (bool)` [public]

---

## Contract: Utils
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 private one` 
- `uint256 private _10k` 
- `uint256 private _year` 
- `bool private inited` 
- `address public VADER` 
- `address public USDV` 
- `address public ROUTER` 
- `address public POOLS` 
- `address public FACTORY` 

### Public/External Functions
- `init(address,address,address,address,address)` [public]
- `getFeeOnTransfer(uint256,uint256) returns (uint256)` [external]
- `assetChecks(address,address)` [external]
- `isBase(address) returns (bool)` [public]
- `isPool(address) returns (bool)` [public]
- `calcValueInBase(address,uint256) returns (uint256)` [public]
- `calcValueInToken(address,uint256) returns (uint256)` [public]
- `calcValueOfTokenInToken(address,uint256,address) returns (uint256)` [public]
- `calcSwapValueInBase(address,uint256) returns (uint256)` [public]
- `calcSwapValueInToken(address,uint256) returns (uint256)` [public]
- `requirePriceBounds(address,uint256,bool,uint256)` [external]
- `getRewardShare(address,uint256) returns (uint256)` [external]
- `getReducedShare(uint256,uint256) returns (uint256)` [public]
- `getProtection(address,address,uint256,uint256) returns (uint256)` [public]
- `getCoverage(address,address) returns (uint256)` [public]
- `getCollateralValueInBase(address,uint256,address,address) returns (uint256, uint256)` [external]
- `getDebtValueInCollateral(address,uint256,address,address) returns (uint256, uint256)` [external]
- `getInterestOwed(address,address,uint256) returns (uint256)` [external]
- `getInterestPayment(address,address) returns (uint256)` [public]
- `getDebtLoading(address,address) returns (uint256)` [public]
- `calcPart(uint256,uint256) returns (uint256)` [public]
- `calcShare(uint256,uint256,uint256) returns (uint256)` [public]
- `calcSwapOutput(uint256,uint256,uint256) returns (uint256)` [public]
- `calcSwapFee(uint256,uint256,uint256) returns (uint256)` [external]
- `calcSwapSlip(uint256,uint256) returns (uint256)` [external]
- `calcLiquidityUnits(uint256,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getSlipAdustment(uint256,uint256,uint256,uint256) returns (uint256)` [public]
- `calcSynthUnits(uint256,uint256,uint256) returns (uint256)` [external]
- `calcAsymmetricShare(uint256,uint256,uint256) returns (uint256)` [public]
- `calcCoverage(uint256,uint256,uint256,uint256) returns (uint256)` [public]
- `sortArray(uint256[]) returns (uint256[])` [external]

---

## Contract: Vader
**Inheritance (C3 Linearized):** iERC20

### State Variables & Constants
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 
- `bool private inited` 
- `bool public emitting` 
- `bool public minting` 
- `uint256 internal _1m` 
- `uint256 public baseline` 
- `uint256 public emissionCurve` 
- `uint256 public maxSupply` 
- `uint256 public secondsPerEra` 
- `uint256 public currentEra` 
- `uint256 public nextEraTime` 
- `uint256 public feeOnTransfer` 
- `address public VETHER` 
- `address public USDV` 
- `address public UTILS` 
- `address public burnAddress` 
- `address public rewardAddress` 
- `address public DAO` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [external]
- `burnFrom(address,uint256)` [external]
- `isMature() returns (bool)` [public]
- `init(address,address,address)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `transferTo(address,uint256) returns (bool)` [external]
- `burn(uint256)` [public]
- `burnFrom(address,uint256)` [external]
- `flipEmissions()` [external]
- `flipMinting()` [external]
- `setParams(uint256,uint256)` [external]
- `setRewardAddress(address)` [external]
- `changeUTILS(address)` [external]
- `changeDAO(address)` [external]
- `purgeDAO()` [external]
- `getDailyEmission() returns (uint256)` [public]
- `upgrade(uint256)` [external]
- `redeem() returns (uint256)` [external]
- `redeemToMember(address) returns (uint256)` [public]

---

## Contract: Vault
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bool private inited` 
- `uint256 public erasToEarn` 
- `uint256 public minGrantTime` 
- `uint256 public lastGranted` 
- `address public VADER` 
- `address public USDV` 
- `address public ROUTER` 
- `address public POOLS` 
- `address public FACTORY` 
- `uint256 public minimumDepositTime` 
- `uint256 public totalWeight` 
- `mapping(address => uint256) private mapMember_weight` 
- `mapping(address => mapping(address => uint256)) private mapMemberSynth_deposit` 
- `mapping(address => mapping(address => uint256)) private mapMemberSynth_lastTime` 

### Public/External Functions
- `init(address,address,address,address,address)` [public]
- `setParams(uint256,uint256,uint256)` [external]
- `grant(address,uint256)` [public]
- `deposit(address,uint256)` [external]
- `depositForMember(address,address,uint256)` [public]
- `harvest(address) returns (uint256)` [external]
- `calcCurrentReward(address,address) returns (uint256)` [public]
- `calcReward(address,address) returns (uint256)` [public]
- `withdraw(address,uint256) returns (uint256)` [external]
- `reserveUSDV() returns (uint256)` [public]
- `reserveVADER() returns (uint256)` [public]
- `getMemberDeposit(address,address) returns (uint256)` [external]
- `getMemberWeight(address) returns (uint256)` [external]
- `getMemberLastTime(address,address) returns (uint256)` [external]
- `DAO() returns (address)` [public]
- `UTILS() returns (address)` [public]

---

## Contract: Vether
**Inheritance (C3 Linearized):** iVETHER

### State Variables & Constants
- `string public name` 
- `string public symbol` 
- `uint256 public decimals` 
- `uint256 public totalSupply` 
- `uint256 public totalFees` 
- `mapping(address => bool) public mapAddress_Excluded` 
- `mapping(address => uint256) private _balances` 
- `mapping(address => mapping(address => uint256)) private _allowances` 

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `balanceOf(address) returns (uint256)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `decreaseAllowance(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `addExcluded(address)` [public]

---

## Contract: iFACTORY
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `deploySynth(address) returns (address)` [external]
- `mintSynth(address,address,uint256) returns (bool)` [external]
- `getSynth(address) returns (address)` [external]
- `isSynth(address) returns (bool)` [external]

---

## Contract: iPOOLS
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `pooledVADER() returns (uint256)` [external]
- `pooledUSDV() returns (uint256)` [external]
- `addLiquidity(address,address,address) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256) returns (uint256, uint256)` [external]
- `sync(address,address)` [external]
- `swap(address,address,address,bool) returns (uint256)` [external]
- `deploySynth(address)` [external]
- `mintSynth(address,address,address) returns (uint256)` [external]
- `burnSynth(address,address,address) returns (uint256)` [external]
- `syncSynth(address)` [external]
- `lockUnits(uint256,address,address)` [external]
- `unlockUnits(uint256,address,address)` [external]
- `isMember(address) returns (bool)` [external]
- `isAsset(address) returns (bool)` [external]
- `isAnchor(address) returns (bool)` [external]
- `getPoolAmounts(address) returns (uint256, uint256)` [external]
- `getBaseAmount(address) returns (uint256)` [external]
- `getTokenAmount(address) returns (uint256)` [external]
- `getUnits(address) returns (uint256)` [external]
- `getMemberUnits(address,address) returns (uint256)` [external]
- `getSynth(address) returns (address)` [external]
- `isSynth(address) returns (bool)` [external]

---

## Contract: iROUTER
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setParams(uint256,uint256,uint256)` [external]
- `addLiquidity(address,uint256,address,uint256) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256) returns (uint256, uint256)` [external]
- `swap(uint256,address,address) returns (uint256)` [external]
- `swapWithLimit(uint256,address,address,uint256) returns (uint256)` [external]
- `swapWithSynths(uint256,address,bool,address,bool) returns (uint256)` [external]
- `swapWithSynthsWithLimit(uint256,address,bool,address,bool,uint256) returns (uint256)` [external]
- `getILProtection(address,address,address,uint256) returns (uint256)` [external]
- `curatePool(address)` [external]
- `listAnchor(address)` [external]
- `replacePool(address,address)` [external]
- `updateAnchorPrice(address)` [external]
- `getAnchorPrice() returns (uint256)` [external]
- `getVADERAmount(uint256) returns (uint256)` [external]
- `getUSDVAmount(uint256) returns (uint256)` [external]
- `isCurated(address) returns (bool)` [external]
- `reserveUSDV() returns (uint256)` [external]
- `reserveVADER() returns (uint256)` [external]
- `getMemberBaseDeposit(address,address) returns (uint256)` [external]
- `getMemberTokenDeposit(address,address) returns (uint256)` [external]
- `getMemberLastDeposit(address,address) returns (uint256)` [external]
- `getMemberCollateral(address,address,address) returns (uint256)` [external]
- `getMemberDebt(address,address,address) returns (uint256)` [external]
- `getSystemCollateral(address,address) returns (uint256)` [external]
- `getSystemDebt(address,address) returns (uint256)` [external]
- `getSystemInterestPaid(address,address) returns (uint256)` [external]

---

## Contract: iSYNTH
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `mint(address,uint256)` [external]
- `TOKEN() returns (address)` [external]

---

## Contract: iUSDV
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `ROUTER() returns (address)` [external]
- `isMature() returns (bool)` [external]
- `setParams(uint256)` [external]
- `convert(uint256) returns (uint256)` [external]
- `convertForMember(address,uint256) returns (uint256)` [external]
- `redeem(uint256) returns (uint256)` [external]
- `redeemForMember(address,uint256) returns (uint256)` [external]

---

## Contract: iUTILS
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getFeeOnTransfer(uint256,uint256) returns (uint256)` [external]
- `assetChecks(address,address)` [external]
- `isBase(address) returns (bool)` [external]
- `calcValueInBase(address,uint256) returns (uint256)` [external]
- `calcValueInToken(address,uint256) returns (uint256)` [external]
- `calcValueOfTokenInToken(address,uint256,address) returns (uint256)` [external]
- `calcSwapValueInBase(address,uint256) returns (uint256)` [external]
- `calcSwapValueInToken(address,uint256) returns (uint256)` [external]
- `requirePriceBounds(address,uint256,bool,uint256)` [external]
- `getRewardShare(address,uint256) returns (uint256)` [external]
- `getReducedShare(uint256) returns (uint256)` [external]
- `getProtection(address,address,uint256,uint256) returns (uint256)` [external]
- `getCoverage(address,address) returns (uint256)` [external]
- `getCollateralValueInBase(address,uint256,address,address) returns (uint256, uint256)` [external]
- `getDebtValueInCollateral(address,uint256,address,address) returns (uint256, uint256)` [external]
- `getInterestOwed(address,address,uint256) returns (uint256)` [external]
- `getInterestPayment(address,address) returns (uint256)` [external]
- `getDebtLoading(address,address) returns (uint256)` [external]
- `calcPart(uint256,uint256) returns (uint256)` [external]
- `calcShare(uint256,uint256,uint256) returns (uint256)` [external]
- `calcSwapOutput(uint256,uint256,uint256) returns (uint256)` [external]
- `calcSwapFee(uint256,uint256,uint256) returns (uint256)` [external]
- `calcSwapSlip(uint256,uint256) returns (uint256)` [external]
- `calcLiquidityUnits(uint256,uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `getSlipAdustment(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `calcSynthUnits(uint256,uint256,uint256) returns (uint256)` [external]
- `calcAsymmetricShare(uint256,uint256,uint256) returns (uint256)` [external]
- `calcCoverage(uint256,uint256,uint256,uint256) returns (uint256)` [external]
- `sortArray(uint256[]) returns (uint256[])` [external]

---

## Contract: iVADER
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `UTILS() returns (address)` [external]
- `DAO() returns (address)` [external]
- `emitting() returns (bool)` [external]
- `minting() returns (bool)` [external]
- `secondsPerEra() returns (uint256)` [external]
- `flipEmissions()` [external]
- `flipMinting()` [external]
- `setParams(uint256,uint256)` [external]
- `setRewardAddress(address)` [external]
- `changeUTILS(address)` [external]
- `changeDAO(address)` [external]
- `purgeDAO()` [external]
- `upgrade(uint256)` [external]
- `redeem() returns (uint256)` [external]
- `redeemToMember(address) returns (uint256)` [external]

---

## Contract: iVAULT
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `setParams(uint256,uint256,uint256)` [external]
- `grant(address,uint256)` [external]
- `deposit(address,uint256)` [external]
- `depositForMember(address,address,uint256)` [external]
- `harvest(address) returns (uint256)` [external]
- `calcCurrentReward(address,address) returns (uint256)` [external]
- `calcReward(address,address) returns (uint256)` [external]
- `withdraw(address,uint256) returns (uint256)` [external]
- `totalWeight() returns (uint256)` [external]
- `reserveUSDV() returns (uint256)` [external]
- `reserveVADER() returns (uint256)` [external]
- `getMemberDeposit(address,address) returns (uint256)` [external]
- `getMemberWeight(address) returns (uint256)` [external]
- `getMemberLastTime(address,address) returns (uint256)` [external]

---

## Contract: console
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal CONSOLE_ADDRESS` constant

### Public/External Functions
- *No public/external functions.*

---
