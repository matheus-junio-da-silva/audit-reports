## Package: mochi-library

# Project Summary

## Contract: CheapERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

---


# Project Summary

## Contract: Float
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: BlockVerifier
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: BeaconProxyDeployer
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Create2BeaconMaker
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: Beacon
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal _implementation` 
- `address internal _CONTROLLER` immutable

### Public/External Functions
- `fallback()` [external]

---


# Project Summary


# Project Summary

## Contract: UniswapV2Library
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IUniswapV2Pair
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `PERMIT_TYPEHASH() returns (bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `MINIMUM_LIQUIDITY() returns (uint256)` [external]
- `factory() returns (address)` [external]
- `token0() returns (address)` [external]
- `token1() returns (address)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `price0CumulativeLast() returns (uint256)` [external]
- `price1CumulativeLast() returns (uint256)` [external]
- `kLast() returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `burn(address) returns (uint256, uint256)` [external]
- `swap(uint256,uint256,address,bytes)` [external]
- `skim(address)` [external]
- `sync()` [external]
- `initialize(address,address)` [external]

---


# Project Summary

## Contract: Rlp
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 internal DATA_SHORT_START` constant
- `uint256 internal DATA_LONG_START` constant
- `uint256 internal LIST_SHORT_START` constant
- `uint256 internal LIST_LONG_START` constant
- `uint256 internal DATA_LONG_OFFSET` constant
- `uint256 internal LIST_LONG_OFFSET` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: AccountVerifier
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: MerklePatriciaVerifier
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary

## Contract: SushiswapV2Library
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: UQ112x112
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint224 internal Q112` constant

### Public/External Functions
- *No public/external functions.*

---

---

## Package: mochi-cssr

# Project Summary

## Contract: MochiCSSRv0
**Inheritance (C3 Linearized):** ICSSRRouter

### State Variables & Constants
- `IGovernanceOwned public owned` immutable
- `mapping(address => bool) public blueChip` 
- `address public defaultPriceSource` 
- `address public defaultLiquiditySource` 
- `mapping(address => bool) public adapter` 
- `mapping(address => address) public priceSource` 
- `mapping(address => address) public liquiditySource` 
- `mapping(address => float) public lastPrice` 
- `ICSSRAdapter public fiatPriceAdapter` 

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]
- `setBluechip(address[])` [external]
- `removeBluechip(address[])` [external]
- `listAdapter(address)` [external]
- `delistAdapter(address)` [external]
- `setFiatPriceAdapter(address)` [external]
- `setPriceSource(address,address[])` [external]
- `setLiquiditySource(address,address[])` [external]
- `setDefaultPriceSource(address)` [external]
- `setDefaultLiquiditySource(address)` [external]
- `update(address,bytes) returns (float)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [public]

---

## Contract: ICSSRAdapter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]

---

## Contract: IGovernanceOwned
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `governance() returns (address)` [external]

---

## Contract: Float
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary


# Project Summary

## Contract: ICSSRRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]

---


# Project Summary

## Contract: IUniswapV2CSSR
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `uniswapFactory() returns (address)` [external]
- `getExchangeRatio(address,address) returns (uint256)` [external]
- `getLiquidity(address,address) returns (uint256)` [external]
- `saveState(bytes) returns (bytes32, uint256, uint256)` [external]
- `saveReserve(uint256,address,bytes,bytes,bytes,bytes) returns (ObservedData)` [external]

---


# Project Summary

## Contract: ICurveAddressProvider
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `get_registry() returns (address)` [external]

---


# Project Summary

## Contract: ICurveRegistry
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `get_n_coins(address) returns (uint256[2])` [external]
- `get_pool_from_lp_token(address) returns (address)` [external]

---


# Project Summary

## Contract: ICurvePool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `coins(uint256) returns (address)` [external]
- `get_virtual_price() returns (uint256)` [external]

---


# Project Summary

## Contract: SushiswapV2LPAdapter
**Inheritance (C3 Linearized):** ICSSRAdapter

### State Variables & Constants
- `ICSSRRouter public router` immutable
- `IUniswapV2CSSR public cssr` immutable
- `address public weth` immutable
- `address public factory` immutable
- `uint256 public Q112` constant

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]
- `support(address) returns (bool)` [external]
- `update(address,bytes) returns (float)` [external]
- `getUnderlyingAsset(IUniswapV2Pair) returns (address)` [public]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]

---

## Contract: SushiswapV2Library
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IUniswapV2Pair
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `PERMIT_TYPEHASH() returns (bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `MINIMUM_LIQUIDITY() returns (uint256)` [external]
- `factory() returns (address)` [external]
- `token0() returns (address)` [external]
- `token1() returns (address)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `price0CumulativeLast() returns (uint256)` [external]
- `price1CumulativeLast() returns (uint256)` [external]
- `kLast() returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `burn(address) returns (uint256, uint256)` [external]
- `swap(uint256,uint256,address,bytes)` [external]
- `skim(address)` [external]
- `sync()` [external]
- `initialize(address,address)` [external]

---


# Project Summary

## Contract: UniswapV2LPAdapter
**Inheritance (C3 Linearized):** ICSSRAdapter

### State Variables & Constants
- `ICSSRRouter public router` immutable
- `IUniswapV2CSSR public cssr` immutable
- `address public weth` immutable
- `address public factory` immutable
- `uint256 public Q112` constant

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]
- `support(address) returns (bool)` [external]
- `update(address,bytes) returns (float)` [external]
- `getUnderlyingAsset(IUniswapV2Pair) returns (address)` [public]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]

---

## Contract: UniswapV2Library
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: UniswapV2TokenAdapter
**Inheritance (C3 Linearized):** ICSSRAdapter

### State Variables & Constants
- `IGovernanceOwned public owned` immutable
- `ICSSRRouter public cssrRouter` immutable
- `IUniswapV2CSSR public uniswapCSSR` immutable
- `IUniswapV2CSSR public sushiCSSR` immutable
- `address[] public keyCurrency` 
- `uint256 public minimumLiquidity` 
- `mapping(address => bool) public isKeyCurrency` 

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]
- `addKeyCurrency(address)` [external]
- `removeKeyCurrency(uint256,address)` [external]
- `setMinimumLiquidity(uint256)` [external]
- `support(address) returns (bool)` [external]
- `update(address,bytes) returns (float)` [external]
- `getPriceRaw(address) returns (uint256, uint256)` [public]
- `getPrice(address) returns (float)` [public]
- `getLiquidity(address) returns (uint256)` [external]
- `aboveLiquidity(address,address) returns (bool)` [public]

---


# Project Summary

## Contract: ChainlinkAdapterEth
**Inheritance (C3 Linearized):** ICSSRAdapter

### State Variables & Constants
- `IGovernanceOwned public owned` immutable
- `mapping(address => AggregatorV3Interface) public feed` 

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]
- `update(address,bytes) returns (float)` [external]
- `setFeed(address[],address[])` [external]
- `support(address) returns (bool)` [external]
- `getPrice(address) returns (float)` [public]
- `getLiquidity(address) returns (uint256)` [external]

---

## Contract: AggregatorV3Interface
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `decimals() returns (uint8)` [external]
- `description() returns (string)` [external]
- `version() returns (uint256)` [external]
- `getRoundData(uint80) returns (uint80, int256, uint256, uint256, uint80)` [external]
- `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)` [external]

---

## Contract: IERC20Metadata
**Inheritance (C3 Linearized):** IERC20

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]

---

---

## Package: mochi-core

# Project Summary

## Contract: MochiEngine
**Inheritance (C3 Linearized):** IMochiEngine

### State Variables & Constants
- `IMochiVaultFactory public vaultFactory` immutable
- `IMochi public mochi` 
- `IVMochi public vMochi` 
- `address public governance` 
- `address public treasury` 
- `address public operationWallet` 
- `IUSDM public usdm` 
- `IMinter public minter` 
- `ICSSRRouter public cssr` 
- `IMochiProfile public mochiProfile` 
- `IDiscountProfile public discountProfile` 
- `ILiquidator public liquidator` 
- `IFeePool public feePool` 
- `IReferralFeePool public referralFeePool` 
- `IMochiNFT public nft` 

### Public/External Functions
- `mochi() returns (IMochi)` [external]
- `vMochi() returns (IVMochi)` [external]
- `usdm() returns (IUSDM)` [external]
- `cssr() returns (ICSSRRouter)` [external]
- `governance() returns (address)` [external]
- `treasury() returns (address)` [external]
- `operationWallet() returns (address)` [external]
- `mochiProfile() returns (IMochiProfile)` [external]
- `discountProfile() returns (IDiscountProfile)` [external]
- `feePool() returns (IFeePool)` [external]
- `referralFeePool() returns (IReferralFeePool)` [external]
- `liquidator() returns (ILiquidator)` [external]
- `minter() returns (IMinter)` [external]
- `nft() returns (IMochiNFT)` [external]
- `vaultFactory() returns (IMochiVaultFactory)` [external]
- `changeMochi(address)` [external]
- `changeVMochi(address)` [external]
- `changeUSDM(address)` [external]
- `changeMinter(address)` [external]
- `changeGovernance(address)` [external]
- `changeTreasury(address)` [external]
- `changeOperationWallet(address)` [external]
- `changeCSSR(address)` [external]
- `changeProfile(address)` [external]
- `changeDiscountProfile(address)` [external]
- `changeLiquidator(address)` [external]
- `changeFeePool(address)` [external]
- `changeReferralFeePool(address)` [external]
- `changeNFT(address)` [external]

---

## Contract: USDM
**Inheritance (C3 Linearized):** IUSDM -> IERC3156FlashLender -> ERC20 -> IERC20Metadata -> IERC20 -> Context

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `uint256 private SCALE` constant
- `bytes32 public CALLBACK_SUCCESS` constant

### Public/External Functions
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [external]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `decreaseAllowance(address,uint256) returns (bool)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [public]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]

---

## Contract: IDiscountProfile
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `discount(address) returns (float)` [external]

---

## Contract: IERC3156FlashBorrower
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `onFlashLoan(address,address,uint256,uint256,bytes) returns (bytes32)` [external]

---

## Contract: IFeePool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `updateReserve()` [external]

---

## Contract: ILiquidator
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `triggerLiquidation(address,uint256)` [external]

---

## Contract: IMinter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `mint(address,uint256)` [external]
- `hasPermission(address) returns (bool)` [external]
- `isVault(address) returns (bool)` [external]

---

## Contract: IMochi
**Inheritance (C3 Linearized):** IERC20

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

---

## Contract: IMochiNFT
**Inheritance (C3 Linearized):** IERC721Enumerable -> IERC721 -> IERC165

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `tokenOfOwnerByIndex(address,uint256) returns (uint256)` [external]
- `tokenByIndex(uint256) returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `safeTransferFrom(address,address,uint256,bytes)` [external]
- `safeTransferFrom(address,address,uint256)` [external]
- `transferFrom(address,address,uint256)` [external]
- `approve(address,uint256)` [external]
- `setApprovalForAll(address,bool)` [external]
- `getApproved(uint256) returns (address)` [external]
- `isApprovedForAll(address,address) returns (bool)` [external]
- `supportsInterface(bytes4) returns (bool)` [external]
- `asset(uint256) returns (address)` [external]
- `mint(address,address) returns (uint256)` [external]

---

## Contract: IMochiProfile
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `assetClass(address) returns (AssetClass)` [external]
- `liquidityRequirement() returns (uint256)` [external]
- `minimumDebt() returns (uint256)` [external]
- `changeAssetClass(address[],AssetClass[])` [external]
- `changeLiquidityRequirement(uint256)` [external]
- `changeMinimumDebt(uint256)` [external]
- `calculateFeeIndex(address,uint256,uint256) returns (uint256)` [external]
- `creditCap(address) returns (uint256)` [external]
- `delay() returns (uint256)` [external]
- `liquidationFactor(address) returns (float)` [external]
- `maxCollateralFactor(address) returns (float)` [external]
- `stabilityFee(address) returns (float)` [external]
- `liquidationFee(address) returns (float)` [external]
- `keeperFee(address) returns (float)` [external]
- `utilizationRatio(address) returns (float)` [external]

---

## Contract: IMochiVault
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `liveDebtIndex() returns (uint256)` [external]
- `details(uint256) returns (Status, uint256, uint256, uint256, address)` [external]
- `status(uint256) returns (Status)` [external]
- `asset() returns (IERC20)` [external]
- `deposits() returns (uint256)` [external]
- `debts() returns (uint256)` [external]
- `claimable() returns (int256)` [external]
- `currentDebt(uint256) returns (uint256)` [external]
- `initialize(address)` [external]
- `deposit(uint256,uint256)` [external]
- `withdraw(uint256,uint256,bytes)` [external]
- `borrow(uint256,uint256,bytes)` [external]
- `repay(uint256,uint256)` [external]
- `liquidate(uint256,uint256,uint256)` [external]

---

## Contract: IReferralFeePool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `addReward(address)` [external]

---

## Contract: MochiVaultFactory
**Inheritance (C3 Linearized):** IMochiVaultFactory

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `Beacon public beacon` immutable
- `address public template` 

### Public/External Functions
- `updateTemplate(address)` [external]
- `deployVault(address) returns (IMochiVault)` [external]
- `getVault(address) returns (IMochiVault)` [external]
- `updateTemplate(address)` [external]
- `deployVault(address) returns (IMochiVault)` [external]
- `getVault(address) returns (IMochiVault)` [external]

---

## Contract: ICSSRRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `update(address,bytes) returns (float)` [external]
- `getPrice(address) returns (float)` [external]
- `getLiquidity(address) returns (uint256)` [external]

---

## Contract: Beacon
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal _implementation` 
- `address internal _CONTROLLER` immutable

### Public/External Functions
- `fallback()` [external]

---

## Contract: BeaconProxyDeployer
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Create2BeaconMaker
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Float
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: IVMochi
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `locked(address) returns (int128, uint256)` [external]
- `depositFor(address,uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: IERC3156FlashLender
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [external]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]

---


# Project Summary

## Contract: IUSDM
**Inheritance (C3 Linearized):** IERC3156FlashLender -> IERC20

### State Variables & Constants
- None

### Public/External Functions
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [external]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---


# Project Summary

## Contract: ICurveVotingEscrow
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `create_lock(uint256,uint256)` [external]
- `increase_amount(uint256)` [external]
- `increase_unlock_time(uint256)` [external]
- `withdraw()` [external]
- `smart_wallet_checker() returns (address)` [external]

---


# Project Summary

## Contract: IMochiEngine
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `mochi() returns (IMochi)` [external]
- `vMochi() returns (IVMochi)` [external]
- `usdm() returns (IUSDM)` [external]
- `cssr() returns (ICSSRRouter)` [external]
- `governance() returns (address)` [external]
- `treasury() returns (address)` [external]
- `operationWallet() returns (address)` [external]
- `mochiProfile() returns (IMochiProfile)` [external]
- `discountProfile() returns (IDiscountProfile)` [external]
- `feePool() returns (IFeePool)` [external]
- `referralFeePool() returns (IReferralFeePool)` [external]
- `liquidator() returns (ILiquidator)` [external]
- `minter() returns (IMinter)` [external]
- `nft() returns (IMochiNFT)` [external]
- `vaultFactory() returns (IMochiVaultFactory)` [external]

---

## Contract: IMochiVaultFactory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `updateTemplate(address)` [external]
- `deployVault(address) returns (IMochiVault)` [external]
- `getVault(address) returns (IMochiVault)` [external]

---


# Project Summary


# Project Summary

## Contract: IERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: IMochiPositionDescriptor
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getTokenURI(address,uint256) returns (string)` [external]

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: MinterV0
**Inheritance (C3 Linearized):** IMinter

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `mapping(address => bool) public isMinter` 
- `address[] public factories` 

### Public/External Functions
- `mint(address,uint256)` [external]
- `hasPermission(address) returns (bool)` [external]
- `isVault(address) returns (bool)` [external]
- `addMinter(address)` [external]
- `removeMinter(address)` [external]
- `mint(address,uint256)` [external]
- `hasPermission(address) returns (bool)` [public]
- `isVault(address) returns (bool)` [public]

---


# Project Summary

## Contract: MochiProfileV0
**Inheritance (C3 Linearized):** IMochiProfile

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `uint256 public liquidityRequirement` 
- `uint256 public minimumDebt` 
- `mapping(address => AssetClass) internal _assetClass` 
- `mapping(address => uint256) public creditCap` 
- `uint256 public secPerYear` immutable
- `uint256 public delay` 

### Public/External Functions
- `assetClass(address) returns (AssetClass)` [external]
- `liquidityRequirement() returns (uint256)` [external]
- `minimumDebt() returns (uint256)` [external]
- `changeAssetClass(address[],AssetClass[])` [external]
- `changeLiquidityRequirement(uint256)` [external]
- `changeMinimumDebt(uint256)` [external]
- `calculateFeeIndex(address,uint256,uint256) returns (uint256)` [external]
- `creditCap(address) returns (uint256)` [external]
- `delay() returns (uint256)` [external]
- `liquidationFactor(address) returns (float)` [external]
- `maxCollateralFactor(address) returns (float)` [external]
- `stabilityFee(address) returns (float)` [external]
- `liquidationFee(address) returns (float)` [external]
- `keeperFee(address) returns (float)` [external]
- `utilizationRatio(address) returns (float)` [external]
- `assetClass(address) returns (AssetClass)` [public]
- `changeLiquidityRequirement(uint256)` [external]
- `registerAsset(address)` [external]
- `registerAssetByGov(address[],AssetClass[])` [external]
- `changeMinimumDebt(uint256)` [external]
- `changeAssetClass(address[],AssetClass[])` [external]
- `changeCreditCap(address[],uint256[])` [external]
- `setDelay(uint256)` [external]
- `liquidationFactor(address) returns (float)` [public]
- `riskFactor(address) returns (uint256)` [public]
- `maxCollateralFactor(address) returns (float)` [public]
- `baseFee() returns (float)` [public]
- `liquidationFee(address) returns (float)` [public]
- `keeperFee(address) returns (float)` [public]
- `maxFee(AssetClass) returns (float)` [public]
- `stabilityFee(address) returns (float)` [public]
- `calculateFeeIndex(address,uint256,uint256) returns (uint256)` [external]
- `utilizationRatio(address) returns (float)` [public]

---


# Project Summary

## Contract: NoDiscountProfile
**Inheritance (C3 Linearized):** IDiscountProfile

### State Variables & Constants
- None

### Public/External Functions
- `discount(address) returns (float)` [external]
- `discount(address) returns (float)` [external]

---


# Project Summary

## Contract: NoMochiReferralFeePool
**Inheritance (C3 Linearized):** IReferralFeePool

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `uint256 public rewards` 
- `mapping(address => uint256) public reward` 

### Public/External Functions
- `addReward(address)` [external]
- `addReward(address)` [external]
- `claimReward()` [external]

---


# Project Summary

## Contract: NoMochiFeePool
**Inheritance (C3 Linearized):** IFeePool

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `address public withdrawer` 

### Public/External Functions
- `updateReserve()` [external]
- `updateReserve()` [external]
- `withdraw()` [external]
- `changeWithdrawer(address)` [external]

---


# Project Summary

## Contract: ReferralFeePoolV0
**Inheritance (C3 Linearized):** IReferralFeePool

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `IUniswapV2Router02 public uniswapRouter` immutable
- `uint256 public rewards` 
- `mapping(address => uint256) public reward` 

### Public/External Functions
- `addReward(address)` [external]
- `addReward(address)` [external]
- `claimRewardAsMochi()` [external]

---

## Contract: IUniswapV2Router02
**Inheritance (C3 Linearized):** IUniswapV2Router01

### State Variables & Constants
- None

### Public/External Functions
- `factory() returns (address)` [external]
- `WETH() returns (address)` [external]
- `addLiquidity(address,address,uint256,uint256,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `addLiquidityETH(address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `removeLiquidityETH(address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `removeLiquidityWithPermit(address,address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32) returns (uint256, uint256)` [external]
- `removeLiquidityETHWithPermit(address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32) returns (uint256, uint256)` [external]
- `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256[])` [external]
- `swapTokensForExactTokens(uint256,uint256,address[],address,uint256) returns (uint256[])` [external]
- `swapExactETHForTokens(uint256,address[],address,uint256) returns (uint256[])` [external]
- `swapTokensForExactETH(uint256,uint256,address[],address,uint256) returns (uint256[])` [external]
- `swapExactTokensForETH(uint256,uint256,address[],address,uint256) returns (uint256[])` [external]
- `swapETHForExactTokens(uint256,address[],address,uint256) returns (uint256[])` [external]
- `quote(uint256,uint256,uint256) returns (uint256)` [external]
- `getAmountOut(uint256,uint256,uint256) returns (uint256)` [external]
- `getAmountIn(uint256,uint256,uint256) returns (uint256)` [external]
- `getAmountsOut(uint256,address[]) returns (uint256[])` [external]
- `getAmountsIn(uint256,address[]) returns (uint256[])` [external]
- `removeLiquidityETHSupportingFeeOnTransferTokens(address,uint256,uint256,uint256,address,uint256) returns (uint256)` [external]
- `removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(address,uint256,uint256,uint256,address,uint256,bool,uint8,bytes32,bytes32) returns (uint256)` [external]
- `swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)` [external]
- `swapExactETHForTokensSupportingFeeOnTransferTokens(uint256,address[],address,uint256)` [external]
- `swapExactTokensForETHSupportingFeeOnTransferTokens(uint256,uint256,address[],address,uint256)` [external]

---


# Project Summary

## Contract: FeePoolV0
**Inheritance (C3 Linearized):** IFeePool

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `IUniswapV2Router02 public uniswapRouter` immutable
- `address public crvVoterRewardPool` 
- `uint256 public treasuryRatio` 
- `uint256 public vMochiRatio` 
- `uint256 public mochiShare` 
- `uint256 public treasuryShare` 

### Public/External Functions
- `updateReserve()` [external]
- `updateReserve()` [external]
- `changecrvVoterRewardPool(address)` [external]
- `changeTreasuryRatio(uint256)` [external]
- `changevMochiRatio(uint256)` [external]
- `distributeMochi()` [external]
- `sendToTreasury()` [external]

---


# Project Summary

## Contract: MochiTreasuryV0
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `IUniswapV2Router02 public uniswapRouter` immutable
- `IERC20 public crv` immutable
- `ICurveVotingEscrow public veCrv` immutable
- `bool public lockCrv` 
- `uint256 public operationShare` 
- `uint256 public veCRVShare` 

### Public/External Functions
- `receive()` [external]
- `withdrawCRV()` [external]
- `withdrawLock()` [external]
- `veCRVInitialize()` [external]
- `toggleLocking()` [external]
- `updateFee()` [public]
- `claimOperationCost()` [external]
- `veCRVlock()` [external]

---


# Project Summary

## Contract: VestedRewardPool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `IMochi public mochi` immutable
- `IVMochi public vMochi` immutable
- `uint256 public mochiUnderManagement` 
- `mapping(address => VestedRewardPool.Vesting) public vesting` 

### Public/External Functions
- `vest(address)` [external]
- `claim()` [external]
- `lock(uint256)` [external]
- `forceClaim(uint256)` [external]

---


# Project Summary


# Project Summary

## Contract: Mochi
**Inheritance (C3 Linearized):** ERC20 -> IERC20Metadata -> IERC20 -> Context

### State Variables & Constants
- None

### Public/External Functions
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `decimals() returns (uint8)` [public]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `transfer(address,uint256) returns (bool)` [public]
- `allowance(address,address) returns (uint256)` [public]
- `approve(address,uint256) returns (bool)` [public]
- `transferFrom(address,address,uint256) returns (bool)` [public]
- `increaseAllowance(address,uint256) returns (bool)` [public]
- `decreaseAllowance(address,uint256) returns (bool)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `decimals() returns (uint8)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `allowance(address,address) returns (uint256)` [external]
- `approve(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]

---


# Project Summary

## Contract: DutchAuctionLiquidator
**Inheritance (C3 Linearized):** ILiquidator

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `uint256 public DURATION` constant
- `mapping(uint256 => DutchAuctionLiquidator.Auction) public auctions` 

### Public/External Functions
- `triggerLiquidation(address,uint256)` [external]
- `auctionId(address,uint256) returns (uint256)` [public]
- `price(uint256) returns (uint256)` [external]
- `currentLiquidationFee(uint256) returns (uint256)` [public]
- `triggerLiquidation(address,uint256)` [external]
- `buy(uint256)` [external]

---


# Project Summary


# Project Summary

## Contract: MochiVault
**Inheritance (C3 Linearized):** IERC3156FlashLender -> IMochiVault -> Initializable

### State Variables & Constants
- `bytes32 public CALLBACK_SUCCESS` constant
- `IMochiEngine public engine` immutable
- `IERC20 public asset` 
- `uint256 public debtIndex` 
- `uint256 public lastAccrued` 
- `uint256 public deposits` 
- `uint256 public debts` 
- `int256 public claimable` 
- `uint256 public liquidated` 
- `mapping(uint256 => Detail) public details` 
- `mapping(uint256 => uint256) public lastDeposit` 

### Public/External Functions
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [external]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]
- `liveDebtIndex() returns (uint256)` [external]
- `details(uint256) returns (Status, uint256, uint256, uint256, address)` [external]
- `status(uint256) returns (Status)` [external]
- `asset() returns (IERC20)` [external]
- `deposits() returns (uint256)` [external]
- `debts() returns (uint256)` [external]
- `claimable() returns (int256)` [external]
- `currentDebt(uint256) returns (uint256)` [external]
- `initialize(address)` [external]
- `deposit(uint256,uint256)` [external]
- `withdraw(uint256,uint256,bytes)` [external]
- `borrow(uint256,uint256,bytes)` [external]
- `repay(uint256,uint256)` [external]
- `liquidate(uint256,uint256,uint256)` [external]
- `initialize(address)` [external]
- `liveDebtIndex() returns (uint256)` [public]
- `status(uint256) returns (Status)` [public]
- `currentDebt(uint256) returns (uint256)` [public]
- `accrueDebt(uint256)` [public]
- `increase(uint256,uint256,uint256,address,bytes)` [external]
- `decrease(uint256,uint256,uint256,bytes)` [external]
- `mint(address,address) returns (uint256)` [public]
- `deposit(uint256,uint256)` [public]
- `withdraw(uint256,uint256,bytes)` [public]
- `borrow(uint256,uint256,bytes)` [public]
- `repay(uint256,uint256)` [public]
- `liquidate(uint256,uint256,uint256)` [external]
- `liquidatable(uint256) returns (bool)` [external]
- `claim()` [external]
- `maxFlashLoan(address) returns (uint256)` [external]
- `flashFee(address,uint256) returns (uint256)` [public]
- `flashLoan(IERC3156FlashBorrower,address,uint256,bytes) returns (bool)` [external]

---

## Contract: CheapERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: AddressUpgradeable
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: MochiNFT
**Inheritance (C3 Linearized):** ERC721Enumerable -> IMochiNFT -> IERC721Enumerable -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context

### State Variables & Constants
- `IMochiEngine public engine` immutable
- `address public descriptor` 
- `mapping(uint256 => IMochiNFT.MochiInfo) public info` 

### Public/External Functions
- `supportsInterface(bytes4) returns (bool)` [public]
- `tokenOfOwnerByIndex(address,uint256) returns (uint256)` [public]
- `totalSupply() returns (uint256)` [public]
- `tokenByIndex(uint256) returns (uint256)` [public]
- `totalSupply() returns (uint256)` [external]
- `tokenOfOwnerByIndex(address,uint256) returns (uint256)` [external]
- `tokenByIndex(uint256) returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `ownerOf(uint256) returns (address)` [external]
- `safeTransferFrom(address,address,uint256,bytes)` [external]
- `safeTransferFrom(address,address,uint256)` [external]
- `transferFrom(address,address,uint256)` [external]
- `approve(address,uint256)` [external]
- `setApprovalForAll(address,bool)` [external]
- `getApproved(uint256) returns (address)` [external]
- `isApprovedForAll(address,address) returns (bool)` [external]
- `supportsInterface(bytes4) returns (bool)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `ownerOf(uint256) returns (address)` [public]
- `name() returns (string)` [public]
- `symbol() returns (string)` [public]
- `tokenURI(uint256) returns (string)` [public]
- `approve(address,uint256)` [public]
- `getApproved(uint256) returns (address)` [public]
- `setApprovalForAll(address,bool)` [public]
- `isApprovedForAll(address,address) returns (bool)` [public]
- `transferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256)` [public]
- `safeTransferFrom(address,address,uint256,bytes)` [public]
- `name() returns (string)` [external]
- `symbol() returns (string)` [external]
- `tokenURI(uint256) returns (string)` [external]
- `supportsInterface(bytes4) returns (bool)` [public]
- `asset(uint256) returns (address)` [external]
- `mint(address,address) returns (uint256)` [external]
- `setDescriptor(address)` [external]
- `mint(address,address) returns (uint256)` [external]
- `asset(uint256) returns (address)` [external]
- `tokenURI(uint256) returns (string)` [public]

---

## Contract: IERC721Receiver
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `onERC721Received(address,address,uint256,bytes) returns (bytes4)` [external]

---

## Contract: Address
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Strings
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes16 private _SYMBOLS` constant
- `uint8 private _ADDRESS_LENGTH` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: Math
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: SignedMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---
