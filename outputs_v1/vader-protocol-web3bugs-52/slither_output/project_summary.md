# Project Summary

## Contract: Migrations
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public owner` 
- `uint256 public last_completed_migration` 

### Public/External Functions
- `setCompleted(uint256)` [public]

---


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

## Contract: IVaderRouter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ISwapQueue
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: IGasQueue
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---


# Project Summary


# Project Summary

## Contract: IVaderPool
**Inheritance (C3 Linearized):** IERC721 -> IERC165 -> IBasePool

### State Variables & Constants
- None

### Public/External Functions
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
- `swap(uint256,uint256,address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `toggleQueue()` [external]

---

## Contract: IVaderPoolFactory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `createPool(address,address) returns (IVaderPool)` [external]
- `getPool(address,address) returns (IVaderPool)` [external]
- `nativeAsset() returns (address)` [external]

---


# Project Summary

## Contract: IBasePool
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `swap(uint256,uint256,address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]

---


# Project Summary


# Project Summary

## Contract: ITimelock
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `delay() returns (uint256)` [external]
- `GRACE_PERIOD() returns (uint256)` [external]
- `acceptAdmin()` [external]
- `queuedTransactions(bytes32) returns (bool)` [external]
- `queueTransaction(address,uint256,string,bytes,uint256) returns (bytes32)` [external]
- `cancelTransaction(address,uint256,string,bytes,uint256)` [external]
- `executeTransaction(address,uint256,string,bytes,uint256) returns (bytes)` [external]

---


# Project Summary

## Contract: IERC20Extended
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
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---


# Project Summary

## Contract: IUSDV
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `distributeEmission()` [external]

---


# Project Summary

## Contract: IVader
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `createEmission(address,uint256)` [external]
- `calculateFee() returns (uint256)` [external]
- `getCurrentEraEmission() returns (uint256)` [external]
- `getEraEmission(uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ILinearVesting
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getClaim() returns (uint256)` [external]
- `claim() returns (uint256)` [external]
- `claimConverted() returns (uint256)` [external]
- `begin()` [external]
- `vestFor(address,uint256)` [external]

---


# Project Summary

## Contract: IConverter
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `convert(bytes32[],uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: IVaderReserve
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `reimburseImpermanentLoss(address,uint256)` [external]
- `grant(address,uint256)` [external]
- `reserve() returns (uint256)` [external]

---


# Project Summary

## Contract: IXVader
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
- `getPastVotes(address,uint256) returns (uint256)` [external]
- `getPastTotalSupply(uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: IAggregator
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `latestAnswer() returns (int256)` [external]

---


# Project Summary

## Contract: IVaderRouterV2
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: ILPWrapper
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `tokens(IERC20) returns (IERC20Extended)` [external]
- `createWrapper(IERC20)` [external]

---


# Project Summary

## Contract: ILPToken
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---


# Project Summary

## Contract: ISynth
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
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---

## Contract: ISynthFactory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `synths(IERC20) returns (ISynth)` [external]
- `createSynth(IERC20Extended) returns (ISynth)` [external]

---


# Project Summary


# Project Summary

## Contract: IVaderPoolFactoryV2
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `createPool(address,address) returns (IVaderPoolV2)` [external]
- `getPool(address,address) returns (IVaderPoolV2)` [external]
- `nativeAsset() returns (address)` [external]

---

## Contract: IVaderPoolV2
**Inheritance (C3 Linearized):** IERC721 -> IERC165 -> IBasePoolV2

### State Variables & Constants
- None

### Public/External Functions
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
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [external]
- `nativeAsset() returns (IERC20)` [external]
- `supported(IERC20) returns (bool)` [external]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `cumulativePrices(IERC20) returns (uint256, uint256, uint32)` [external]
- `mintSynth(IERC20,uint256,address,address) returns (uint256)` [external]
- `burnSynth(IERC20,uint256,address) returns (uint256)` [external]
- `mintFungible(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `burnFungible(IERC20,uint256,address) returns (uint256, uint256)` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `toggleQueue()` [external]
- `setTokenSupport(IERC20,bool)` [external]
- `setFungibleTokenSupport(IERC20)` [external]

---


# Project Summary


# Project Summary

## Contract: IBasePoolV2
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [external]
- `nativeAsset() returns (IERC20)` [external]
- `supported(IERC20) returns (bool)` [external]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]

---


# Project Summary

## Contract: VaderMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint256 public ONE` constant

### Public/External Functions
- `calculateLiquidityUnits(uint256,uint256,uint256,uint256,uint256) returns (uint256)` [public]
- `calculateSlipAdjustment(uint256,uint256,uint256,uint256) returns (uint256)` [public]
- `calculateLoss(uint256,uint256,uint256,uint256) returns (uint256)` [public]
- `calculateSwap(uint256,uint256,uint256) returns (uint256)` [public]
- `calculateSwapReverse(uint256,uint256,uint256) returns (uint256)` [public]
- `delta(uint256,uint256) returns (uint256)` [public]
- `pow(uint256) returns (uint256)` [public]
- `root(uint256) returns (uint256)` [public]

---


# Project Summary

## Contract: IERC20Permit
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]

---

## Contract: SafeERC20
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Address
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: VaderRouter
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> IVaderRouter

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IVaderPoolFactory public factory` immutable
- `IVaderReserve public reserve` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256, uint256, uint256)` [public]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [public]
- `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256)` [external]
- `swapTokensForExactTokens(uint256,uint256,address[],address,uint256) returns (uint256)` [external]
- `initialize(IVaderReserve)` [external]
- `calculateInGivenOut(uint256,address[]) returns (uint256)` [public]
- `calculateOutGivenIn(uint256,address[]) returns (uint256)` [external]

---


# Project Summary

## Contract: SwapQueue
**Inheritance (C3 Linearized):** ProtocolConstants -> ISwapQueue

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `mapping(uint256 => ISwapQueue.Queue) public queue` 

### Public/External Functions
- `executeQueue()` [external]

---


# Project Summary

## Contract: IERC721Receiver
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `onERC721Received(address,address,uint256,bytes) returns (bytes4)` [external]

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

## Contract: BasePool
**Inheritance (C3 Linearized):** ReentrancyGuard -> Ownable -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePool

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public nativeAsset` immutable
- `IERC20 public foreignAsset` immutable
- `uint256 public priceNativeCumulativeLast` 
- `uint256 public priceForeignCumulativeLast` 
- `mapping(uint256 => IBasePool.Position) public positions` 
- `uint256 public positionId` 
- `uint256 public totalSupply` 
- `string private _name` 
- `uint112 private _reserveNative` 
- `uint112 private _reserveForeign` 
- `uint32 private _blockTimestampLast` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `swap(uint256,uint256,address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [public]
- `name() returns (string)` [public]
- `mint(address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `swap(uint256,uint256,address) returns (uint256)` [public]

---

## Contract: UQ112x112
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint224 internal Q112` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: VaderPool
**Inheritance (C3 Linearized):** BasePool -> ReentrancyGuard -> Ownable -> ERC721 -> IERC721Metadata -> IVaderPool -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePool

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public nativeAsset` immutable
- `IERC20 public foreignAsset` immutable
- `uint256 public priceNativeCumulativeLast` 
- `uint256 public priceForeignCumulativeLast` 
- `mapping(uint256 => IBasePool.Position) public positions` 
- `uint256 public positionId` 
- `uint256 public totalSupply` 
- `bool public queueActive` 

### Public/External Functions
- `getReserves() returns (uint112, uint112, uint32)` [public]
- `name() returns (string)` [public]
- `mint(address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `swap(uint256,uint256,address) returns (uint256)` [public]
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `swap(uint256,uint256,address) returns (uint256)` [external]
- `swap(uint256,uint256,address,bytes) returns (uint256)` [external]
- `mint(address) returns (uint256)` [external]
- `getReserves() returns (uint112, uint112, uint32)` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `toggleQueue()` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `toggleQueue()` [external]

---


# Project Summary

## Contract: VaderPoolFactory
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> IVaderPoolFactory

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `bool public queueActive` 
- `address public nativeAsset` 
- `mapping(address => mapping(address => IVaderPool)) public getPool` 
- `IVaderPool[] public allPools` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `createPool(address,address) returns (IVaderPool)` [external]
- `getPool(address,address) returns (IVaderPool)` [external]
- `nativeAsset() returns (address)` [external]
- `createPool(address,address) returns (IVaderPool)` [external]
- `initialize(address,address)` [external]
- `toggleQueue(address,address)` [external]

---


# Project Summary

## Contract: GasThrottle
**Inheritance (C3 Linearized):** ProtocolConstants

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: GovernorAlpha
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `string public name` constant
- `ITimelock public timelock` 
- `address public guardian` 
- `uint256 public proposalCount` 
- `IXVader public xVader` immutable
- `address public feeReceiver` 
- `uint256 public feeAmount` 
- `address public council` 
- `mapping(uint256 => GovernorAlpha.Proposal) public proposals` 
- `mapping(address => uint256) public latestProposalIds` 
- `bytes32 public DOMAIN_TYPEHASH` constant
- `bytes32 public BALLOT_TYPEHASH` constant

### Public/External Functions
- `quorumVotes(uint256) returns (uint256)` [public]
- `proposalMaxOperations() returns (uint256)` [public]
- `votingDelay() returns (uint256)` [public]
- `votingPeriod() returns (uint256)` [public]
- `getActions(uint256) returns (address[], uint256[], string[], bytes[])` [public]
- `getReceipt(uint256,address) returns (GovernorAlpha.Receipt)` [public]
- `state(uint256) returns (GovernorAlpha.ProposalState)` [public]
- `setTimelock(address)` [external]
- `propose(address[],uint256[],string[],bytes[],string) returns (uint256)` [public]
- `queue(uint256)` [public]
- `execute(uint256)` [public]
- `castVote(uint256,bool)` [public]
- `castVoteBySig(uint256,bool,uint8,bytes32,bytes32)` [public]
- `changeFeeReceiver(address)` [external]
- `changeFeeAmount(uint256)` [external]
- `veto(uint256,bool)` [external]
- `changeCouncil(address)` [external]
- `cancel(uint256)` [public]
- `__acceptAdmin()` [public]
- `__abdicate()` [public]
- `__queueSetTimelockPendingAdmin(address,uint256)` [public]
- `__executeSetTimelockPendingAdmin(address,uint256)` [public]

---


# Project Summary

## Contract: Timelock
**Inheritance (C3 Linearized):** ITimelock

### State Variables & Constants
- `address public admin` 
- `address public pendingAdmin` 
- `uint256 public delay` 
- `mapping(bytes32 => bool) public queuedTransactions` 

### Public/External Functions
- `delay() returns (uint256)` [external]
- `GRACE_PERIOD() returns (uint256)` [external]
- `acceptAdmin()` [external]
- `queuedTransactions(bytes32) returns (bool)` [external]
- `queueTransaction(address,uint256,string,bytes,uint256) returns (bytes32)` [external]
- `cancelTransaction(address,uint256,string,bytes,uint256)` [external]
- `executeTransaction(address,uint256,string,bytes,uint256) returns (bytes)` [external]
- `receive()` [external]
- `GRACE_PERIOD() returns (uint256)` [public]
- `MINIMUM_DELAY() returns (uint256)` [public]
- `MAXIMUM_DELAY() returns (uint256)` [public]
- `setDelay(uint256)` [public]
- `acceptAdmin()` [public]
- `setPendingAdmin(address)` [public]
- `queueTransaction(address,uint256,string,bytes,uint256) returns (bytes32)` [public]
- `cancelTransaction(address,uint256,string,bytes,uint256)` [public]
- `executeTransaction(address,uint256,string,bytes,uint256) returns (bytes)` [public]

---


# Project Summary

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

## Contract: SafeMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

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

## Contract: IUniswapV2Factory
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `feeTo() returns (address)` [external]
- `feeToSetter() returns (address)` [external]
- `getPair(address,address) returns (address)` [external]
- `allPairs(uint256) returns (address)` [external]
- `allPairsLength() returns (uint256)` [external]
- `createPair(address,address) returns (address)` [external]
- `setFeeTo(address)` [external]
- `setFeeToSetter(address)` [external]

---

## Contract: IUniswapV2Pair
**Inheritance (C3 Linearized):** IUniswapV2ERC20

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

## Contract: Babylonian
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: BitMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: FixedPoint
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `uint8 public RESOLUTION` constant
- `uint256 public Q112` constant
- `uint256 private Q224` constant
- `uint256 private LOWER_MASK` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: FullMath
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: UniswapV2Library
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: UniswapV2OracleLibrary
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: TwapOracle
**Inheritance (C3 Linearized):** Ownable -> Context

### State Variables & Constants
- `address public VADER` 
- `address public USDV` 
- `bool private _usdvEnabled` 
- `mapping(address => address) private _aggregators` 
- `IVaderPoolV2 private _vaderPool` 
- `uint256 private _updatePeriod` 
- `TwapOracle.PairData[] private _pairs` 
- `mapping(bytes32 => bool) private _pairExists` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `pairExists(address,address) returns (bool)` [public]
- `consult(address) returns (uint256)` [public]
- `getRate() returns (uint256)` [public]
- `usdvtoVader(uint256) returns (uint256)` [external]
- `vaderToUsdv(uint256) returns (uint256)` [external]
- `initialize(address,address)` [external]
- `enableUSDV()` [external]
- `registerAggregator(address,address)` [external]
- `registerPair(address,address,address)` [external]
- `update()` [external]

---


# Project Summary

## Contract: ProtocolConstants
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant

### Public/External Functions
- *No public/external functions.*

---


# Project Summary

## Contract: Vader
**Inheritance (C3 Linearized):** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> IVader

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IConverter public converter` 
- `ILinearVesting public vest` 
- `IUSDV public usdv` 
- `uint256 public emissionCurve` 
- `uint256 public lastEmission` 
- `uint256 public maxSupply` 
- `mapping(address => bool) public untaxed` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `createEmission(address,uint256)` [external]
- `calculateFee() returns (uint256)` [external]
- `getCurrentEraEmission() returns (uint256)` [external]
- `getEraEmission(uint256) returns (uint256)` [external]
- `calculateFee() returns (uint256)` [public]
- `getCurrentEraEmission() returns (uint256)` [external]
- `getEraEmission(uint256) returns (uint256)` [public]
- `createEmission(address,uint256)` [external]
- `setComponents(IConverter,ILinearVesting,IUSDV,address)` [external]
- `claimGrant(address,uint256)` [external]
- `adjustMaxSupply(uint256)` [external]

---


# Project Summary

## Contract: USDV
**Inheritance (C3 Linearized):** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> IUSDV

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public vader` immutable
- `IVaderReserve public reserve` immutable

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `distributeEmission()` [external]
- `distributeEmission()` [external]

---


# Project Summary

## Contract: LinearVesting
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> ILinearVesting

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public vader` immutable
- `uint256 public start` 
- `uint256 public end` 
- `mapping(address => ILinearVesting.Vester) public vest` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `getClaim() returns (uint256)` [external]
- `claim() returns (uint256)` [external]
- `claimConverted() returns (uint256)` [external]
- `begin()` [external]
- `vestFor(address,uint256)` [external]
- `getClaim() returns (uint256)` [external]
- `claim() returns (uint256)` [external]
- `claimConverted() returns (uint256)` [external]
- `begin()` [external]
- `vestFor(address,uint256)` [external]

---


# Project Summary

## Contract: MerkleProof
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: Converter
**Inheritance (C3 Linearized):** ProtocolConstants -> IConverter

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public vether` immutable
- `IERC20 public vader` immutable
- `ILinearVesting public vesting` immutable
- `bytes32 public root` immutable
- `mapping(bytes32 => bool) public claimed` 

### Public/External Functions
- `convert(bytes32[],uint256) returns (uint256)` [external]
- `convert(bytes32[],uint256) returns (uint256)` [external]

---


# Project Summary

## Contract: VaderReserve
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> IVaderReserve

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public vader` immutable
- `address public router` 
- `uint256 public lastGrant` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `reimburseImpermanentLoss(address,uint256)` [external]
- `grant(address,uint256)` [external]
- `reserve() returns (uint256)` [external]
- `reserve() returns (uint256)` [public]
- `grant(address,uint256)` [external]
- `initialize(address,address)` [external]
- `reimburseImpermanentLoss(address,uint256)` [external]

---


# Project Summary

## Contract: StakingRewards
**Inheritance (C3 Linearized):** Pausable -> ReentrancyGuard -> RewardsDistributionRecipient -> Owned -> IStakingRewards

### State Variables & Constants
- `address public owner` 
- `address public nominatedOwner` 
- `address public rewardsDistribution` 
- `uint256 public lastPauseTime` 
- `bool public paused` 
- `IERC20 public rewardsToken` immutable
- `IERC20 public stakingToken` immutable
- `uint256 public periodFinish` 
- `uint256 public rewardRate` 
- `uint256 public rewardsDuration` 
- `uint256 public lastUpdateTime` 
- `uint256 public rewardPerTokenStored` 
- `mapping(address => uint256) public userRewardPerTokenPaid` 
- `mapping(address => uint256) public rewards` 
- `uint256 private _totalSupply` 
- `mapping(address => uint256) private _balances` 

### Public/External Functions
- `setPaused(bool)` [external]
- `nominateNewOwner(address)` [external]
- `acceptOwnership()` [external]
- `notifyRewardAmount(uint256)` [external]
- `setRewardsDistribution(address)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `getRewardForDuration() returns (uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [external]
- `rewardPerToken() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `exit()` [external]
- `getReward()` [external]
- `stake(uint256)` [external]
- `withdraw(uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `balanceOf(address) returns (uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [public]
- `rewardPerToken() returns (uint256)` [public]
- `earned(address) returns (uint256)` [public]
- `getRewardForDuration() returns (uint256)` [external]
- `stake(uint256)` [external]
- `withdraw(uint256)` [public]
- `getReward()` [public]
- `exit()` [external]
- `notifyRewardAmount(uint256)` [external]
- `recoverERC20(address,uint256)` [external]
- `setRewardsDuration(uint256)` [external]

---


# Project Summary

## Contract: IStakingRewards
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `balanceOf(address) returns (uint256)` [external]
- `earned(address) returns (uint256)` [external]
- `getRewardForDuration() returns (uint256)` [external]
- `lastTimeRewardApplicable() returns (uint256)` [external]
- `rewardPerToken() returns (uint256)` [external]
- `totalSupply() returns (uint256)` [external]
- `exit()` [external]
- `getReward()` [external]
- `stake(uint256)` [external]
- `withdraw(uint256)` [external]

---


# Project Summary

## Contract: Owned
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `address public owner` 
- `address public nominatedOwner` 

### Public/External Functions
- `nominateNewOwner(address)` [external]
- `acceptOwnership()` [external]

---


# Project Summary

## Contract: RewardsDistributionRecipient
**Inheritance (C3 Linearized):** Owned

### State Variables & Constants
- `address public owner` 
- `address public nominatedOwner` 
- `address public rewardsDistribution` 

### Public/External Functions
- `nominateNewOwner(address)` [external]
- `acceptOwnership()` [external]
- `notifyRewardAmount(uint256)` [external]
- `setRewardsDistribution(address)` [external]

---


# Project Summary

## Contract: Pausable
**Inheritance (C3 Linearized):** Owned

### State Variables & Constants
- `address public owner` 
- `address public nominatedOwner` 
- `uint256 public lastPauseTime` 
- `bool public paused` 

### Public/External Functions
- `nominateNewOwner(address)` [external]
- `acceptOwnership()` [external]
- `setPaused(bool)` [external]

---


# Project Summary

## Contract: Counters
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: ShortStrings
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- `bytes32 private _FALLBACK_SENTINEL` constant

### Public/External Functions
- *No public/external functions.*

---

## Contract: StorageSlot
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: ECDSA
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: SafeCast
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- *No public/external functions.*

---

## Contract: XVader
**Inheritance (C3 Linearized):** ReentrancyGuard -> ERC20Votes -> IERC5805 -> IVotes -> IERC6372 -> ERC20Permit -> EIP712 -> IERC5267 -> IERC20Permit -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public vader` immutable

### Public/External Functions
- `clock() returns (uint48)` [public]
- `CLOCK_MODE() returns (string)` [public]
- `checkpoints(address,uint32) returns (ERC20Votes.Checkpoint)` [public]
- `numCheckpoints(address) returns (uint32)` [public]
- `delegates(address) returns (address)` [public]
- `getVotes(address) returns (uint256)` [public]
- `getPastVotes(address,uint256) returns (uint256)` [public]
- `getPastTotalSupply(uint256) returns (uint256)` [public]
- `delegate(address)` [public]
- `delegateBySig(address,uint256,uint256,uint8,bytes32,bytes32)` [public]
- `getVotes(address) returns (uint256)` [external]
- `getPastVotes(address,uint256) returns (uint256)` [external]
- `getPastTotalSupply(uint256) returns (uint256)` [external]
- `delegates(address) returns (address)` [external]
- `delegate(address)` [external]
- `delegateBySig(address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `clock() returns (uint48)` [external]
- `CLOCK_MODE() returns (string)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [public]
- `nonces(address) returns (uint256)` [public]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
- `eip712Domain() returns (bytes1, string, string, uint256, address, bytes32, uint256[])` [public]
- `eip712Domain() returns (bytes1, string, string, uint256, address, bytes32, uint256[])` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
- `nonces(address) returns (uint256)` [external]
- `DOMAIN_SEPARATOR() returns (bytes32)` [external]
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
- `enter(uint256)` [external]
- `leave(uint256)` [external]

---


# Project Summary

## Contract: UniswapV2Pair
**Inheritance (C3 Linearized):** UniswapV2ERC20 -> IUniswapV2Pair -> IUniswapV2ERC20

### State Variables & Constants
- `string public name` constant
- `string public symbol` constant
- `uint8 public decimals` constant
- `uint256 public totalSupply` 
- `mapping(address => uint256) public balanceOf` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `bytes32 public DOMAIN_SEPARATOR` 
- `bytes32 public PERMIT_TYPEHASH` constant
- `mapping(address => uint256) public nonces` 
- `uint256 public MINIMUM_LIQUIDITY` constant
- `bytes4 private SELECTOR` constant
- `address public factory` 
- `address public token0` 
- `address public token1` 
- `uint112 private reserve0` 
- `uint112 private reserve1` 
- `uint32 private blockTimestampLast` 
- `uint256 public price0CumulativeLast` 
- `uint256 public price1CumulativeLast` 
- `uint256 public kLast` 
- `uint256 private unlocked` 

### Public/External Functions
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]
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
- `getReserves() returns (uint112, uint112, uint32)` [public]
- `initialize(address,address)` [external]
- `mint(address) returns (uint256)` [external]
- `burn(address) returns (uint256, uint256)` [external]
- `swap(uint256,uint256,address,bytes)` [external]
- `skim(address)` [external]
- `sync()` [external]

---

## Contract: IUniswapV2Callee
**Inheritance (C3 Linearized):** None

### State Variables & Constants
- None

### Public/External Functions
- `uniswapV2Call(address,uint256,uint256,bytes)` [external]

---


# Project Summary

## Contract: UniswapV2ERC20
**Inheritance (C3 Linearized):** IUniswapV2ERC20

### State Variables & Constants
- `string public name` constant
- `string public symbol` constant
- `uint8 public decimals` constant
- `uint256 public totalSupply` 
- `mapping(address => uint256) public balanceOf` 
- `mapping(address => mapping(address => uint256)) public allowance` 
- `bytes32 public DOMAIN_SEPARATOR` 
- `bytes32 public PERMIT_TYPEHASH` constant
- `mapping(address => uint256) public nonces` 

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
- `approve(address,uint256) returns (bool)` [external]
- `transfer(address,uint256) returns (bool)` [external]
- `transferFrom(address,address,uint256) returns (bool)` [external]
- `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)` [external]

---


# Project Summary


# Project Summary


# Project Summary

## Contract: IUniswapV2ERC20
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

---


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary


# Project Summary

## Contract: VaderRouterV2
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> IVaderRouterV2

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IVaderPoolV2 public pool` immutable
- `IERC20 public nativeAsset` immutable
- `IVaderReserve public reserve` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256)` [external]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [external]
- `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256) returns (uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,uint256,uint256,address,uint256) returns (uint256)` [external]
- `addLiquidity(IERC20,IERC20,uint256,uint256,address,uint256) returns (uint256)` [public]
- `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)` [public]
- `swapExactTokensForTokens(uint256,uint256,IERC20[],address,uint256) returns (uint256)` [external]
- `initialize(IVaderReserve)` [external]

---


# Project Summary

## Contract: LPToken
**Inheritance (C3 Linearized):** Ownable -> ERC20 -> IERC20Metadata -> IERC20 -> Context -> ProtocolConstants -> ILPToken

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20Extended public foreignAsset` immutable
- `IVaderPoolV2 public pool` immutable

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]
- `totalSupply() returns (uint256)` [public]
- `balanceOf(address) returns (uint256)` [public]
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---


# Project Summary

## Contract: LPWrapper
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> ILPWrapper

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `mapping(IERC20 => IERC20Extended) public tokens` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `tokens(IERC20) returns (IERC20Extended)` [external]
- `createWrapper(IERC20)` [external]
- `createWrapper(IERC20)` [external]

---


# Project Summary

## Contract: BasePoolV2
**Inheritance (C3 Linearized):** ReentrancyGuard -> ERC721 -> IERC721Metadata -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePoolV2

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public nativeAsset` immutable
- `mapping(IERC20 => bool) public supported` 
- `mapping(IERC20 => IBasePoolV2.PairInfo) public pairInfo` 
- `mapping(uint256 => IBasePoolV2.Position) public positions` 
- `uint256 public positionId` 
- `address public router` 

### Public/External Functions
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
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [external]
- `nativeAsset() returns (IERC20)` [external]
- `supported(IERC20) returns (bool)` [external]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [public]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `rescue(IERC20)` [external]

---


# Project Summary

## Contract: VaderPoolV2
**Inheritance (C3 Linearized):** Ownable -> BasePoolV2 -> ReentrancyGuard -> ERC721 -> IERC721Metadata -> IVaderPoolV2 -> IERC721 -> ERC165 -> IERC165 -> Context -> GasThrottle -> ProtocolConstants -> IBasePoolV2

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `IERC20 public nativeAsset` immutable
- `mapping(IERC20 => bool) public supported` 
- `mapping(IERC20 => IBasePoolV2.PairInfo) public pairInfo` 
- `mapping(uint256 => IBasePoolV2.Position) public positions` 
- `uint256 public positionId` 
- `address public router` 
- `ILPWrapper public wrapper` 
- `ISynthFactory public synthFactory` 
- `bool public queueActive` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [public]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `rescue(IERC20)` [external]
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
- `getReserves(IERC20) returns (uint112, uint112, uint32)` [external]
- `nativeAsset() returns (IERC20)` [external]
- `supported(IERC20) returns (bool)` [external]
- `positionForeignAsset(uint256) returns (IERC20)` [external]
- `pairSupply(IERC20) returns (uint256)` [external]
- `doubleSwap(IERC20,IERC20,uint256,address) returns (uint256)` [external]
- `swap(IERC20,uint256,uint256,address) returns (uint256)` [external]
- `mint(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `cumulativePrices(IERC20) returns (uint256, uint256, uint32)` [external]
- `mintSynth(IERC20,uint256,address,address) returns (uint256)` [external]
- `burnSynth(IERC20,uint256,address) returns (uint256)` [external]
- `mintFungible(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `burnFungible(IERC20,uint256,address) returns (uint256, uint256)` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `toggleQueue()` [external]
- `setTokenSupport(IERC20,bool)` [external]
- `setFungibleTokenSupport(IERC20)` [external]
- `cumulativePrices(IERC20) returns (uint256, uint256, uint32)` [public]
- `initialize(ILPWrapper,ISynthFactory,address)` [external]
- `mintSynth(IERC20,uint256,address,address) returns (uint256)` [external]
- `burnSynth(IERC20,uint256,address) returns (uint256)` [external]
- `burn(uint256,address) returns (uint256, uint256, uint256)` [external]
- `mintFungible(IERC20,uint256,uint256,address,address) returns (uint256)` [external]
- `burnFungible(IERC20,uint256,address) returns (uint256, uint256)` [external]
- `toggleQueue()` [external]
- `setTokenSupport(IERC20,bool)` [external]
- `setFungibleTokenSupport(IERC20)` [external]

---


# Project Summary

## Contract: Synth
**Inheritance (C3 Linearized):** Ownable -> ERC20 -> IERC20Metadata -> ProtocolConstants -> ISynth -> IERC20 -> Context

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
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
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]
- `mint(address,uint256)` [external]
- `burn(uint256)` [external]

---


# Project Summary

## Contract: SynthFactory
**Inheritance (C3 Linearized):** Ownable -> Context -> ProtocolConstants -> ISynthFactory

### State Variables & Constants
- `address internal _ZERO_ADDRESS` constant
- `uint256 internal _ONE_YEAR` constant
- `uint256 internal _MAX_BASIS_POINTS` constant
- `uint256 internal _INITIAL_VADER_SUPPLY` constant
- `uint256 internal _VETH_ALLOCATION` constant
- `uint256 internal _TEAM_ALLOCATION` constant
- `uint256 internal _ECOSYSTEM_GROWTH` constant
- `uint256 internal _EMISSION_ERA` constant
- `uint256 internal _INITIAL_EMISSION_CURVE` constant
- `uint256 internal _MAX_FEE_BASIS_POINTS` constant
- `uint256 internal _VESTING_DURATION` constant
- `uint256 internal _VADER_VETHER_CONVERSION_RATE` constant
- `address internal _BURN` constant
- `uint256 internal _MIN_SWAPS_EXECUTED` constant
- `uint256 internal _DEFAULT_SWAPS_EXECUTED` constant
- `uint256 internal _QUEUE_SIZE` constant
- `address internal _FAST_GAS_ORACLE` constant
- `uint256 internal _GRANT_DELAY` constant
- `uint256 internal _MAX_GRANT_BASIS_POINTS` constant
- `mapping(IERC20 => ISynth) public synths` 

### Public/External Functions
- `owner() returns (address)` [public]
- `renounceOwnership()` [public]
- `transferOwnership(address)` [public]
- `synths(IERC20) returns (ISynth)` [external]
- `createSynth(IERC20Extended) returns (ISynth)` [external]
- `createSynth(IERC20Extended) returns (ISynth)` [external]

---
