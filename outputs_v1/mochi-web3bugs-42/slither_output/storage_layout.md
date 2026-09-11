## Package: mochi-library

# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: Beacon
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_implementation` | `address` | **0** | **0** | Storage | `Beacon` |

---

---

## Package: mochi-cssr

# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: MochiCSSRv0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `blueChip` | `mapping(address => bool)` | **0** | **0** | Storage | `MochiCSSRv0` |
| `defaultPriceSource` | `address` | **1** | **0** | Storage | `MochiCSSRv0` |
| `defaultLiquiditySource` | `address` | **2** | **0** | Storage | `MochiCSSRv0` |
| `adapter` | `mapping(address => bool)` | **3** | **0** | Storage | `MochiCSSRv0` |
| `priceSource` | `mapping(address => address)` | **4** | **0** | Storage | `MochiCSSRv0` |
| `liquiditySource` | `mapping(address => address)` | **5** | **0** | Storage | `MochiCSSRv0` |
| `lastPrice` | `mapping(address => float)` | **6** | **0** | Storage | `MochiCSSRv0` |
| `fiatPriceAdapter` | `ICSSRAdapter` | **7** | **0** | Storage | `MochiCSSRv0` |

---

## Contract: UniswapV2TokenAdapter
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `keyCurrency` | `address[]` | **0** | **0** | Storage | `UniswapV2TokenAdapter` |
| `minimumLiquidity` | `uint256` | **1** | **0** | Storage | `UniswapV2TokenAdapter` |
| `isKeyCurrency` | `mapping(address => bool)` | **2** | **0** | Storage | `UniswapV2TokenAdapter` |

---

## Contract: ChainlinkAdapterEth
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `feed` | `mapping(address => AggregatorV3Interface)` | **0** | **0** | Storage | `ChainlinkAdapterEth` |

---

---

## Package: mochi-core

# 📊 EVM Storage & Transient Layout (Physical Memory Mapping)

## Contract: MochiEngine
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `mochi` | `IMochi` | **0** | **0** | Storage | `MochiEngine` |
| `vMochi` | `IVMochi` | **1** | **0** | Storage | `MochiEngine` |
| `governance` | `address` | **2** | **0** | Storage | `MochiEngine` |
| `treasury` | `address` | **3** | **0** | Storage | `MochiEngine` |
| `operationWallet` | `address` | **4** | **0** | Storage | `MochiEngine` |
| `usdm` | `IUSDM` | **5** | **0** | Storage | `MochiEngine` |
| `minter` | `IMinter` | **6** | **0** | Storage | `MochiEngine` |
| `cssr` | `ICSSRRouter` | **7** | **0** | Storage | `MochiEngine` |
| `mochiProfile` | `IMochiProfile` | **8** | **0** | Storage | `MochiEngine` |
| `discountProfile` | `IDiscountProfile` | **9** | **0** | Storage | `MochiEngine` |
| `liquidator` | `ILiquidator` | **10** | **0** | Storage | `MochiEngine` |
| `feePool` | `IFeePool` | **11** | **0** | Storage | `MochiEngine` |
| `referralFeePool` | `IReferralFeePool` | **12** | **0** | Storage | `MochiEngine` |
| `nft` | `IMochiNFT` | **13** | **0** | Storage | `MochiEngine` |

---

## Contract: USDM
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |

---

## Contract: MochiVaultFactory
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `template` | `address` | **0** | **0** | Storage | `MochiVaultFactory` |

---

## Contract: Beacon
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_implementation` | `address` | **0** | **0** | Storage | `Beacon` |

---

## Contract: MinterV0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `isMinter` | `mapping(address => bool)` | **0** | **0** | Storage | `MinterV0` |
| `factories` | `address[]` | **1** | **0** | Storage | `MinterV0` |

---

## Contract: MochiProfileV0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `liquidityRequirement` | `uint256` | **0** | **0** | Storage | `MochiProfileV0` |
| `minimumDebt` | `uint256` | **1** | **0** | Storage | `MochiProfileV0` |
| `_assetClass` | `mapping(address => AssetClass)` | **2** | **0** | Storage | `MochiProfileV0` |
| `creditCap` | `mapping(address => uint256)` | **3** | **0** | Storage | `MochiProfileV0` |
| `delay` | `uint256` | **4** | **0** | Storage | `MochiProfileV0` |

---

## Contract: NoMochiReferralFeePool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `rewards` | `uint256` | **0** | **0** | Storage | `NoMochiReferralFeePool` |
| `reward` | `mapping(address => uint256)` | **1** | **0** | Storage | `NoMochiReferralFeePool` |

---

## Contract: NoMochiFeePool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `withdrawer` | `address` | **0** | **0** | Storage | `NoMochiFeePool` |

---

## Contract: ReferralFeePoolV0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `rewards` | `uint256` | **0** | **0** | Storage | `ReferralFeePoolV0` |
| `reward` | `mapping(address => uint256)` | **1** | **0** | Storage | `ReferralFeePoolV0` |

---

## Contract: FeePoolV0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `crvVoterRewardPool` | `address` | **0** | **0** | Storage | `FeePoolV0` |
| `treasuryRatio` | `uint256` | **1** | **0** | Storage | `FeePoolV0` |
| `vMochiRatio` | `uint256` | **2** | **0** | Storage | `FeePoolV0` |
| `mochiShare` | `uint256` | **3** | **0** | Storage | `FeePoolV0` |
| `treasuryShare` | `uint256` | **4** | **0** | Storage | `FeePoolV0` |

---

## Contract: MochiTreasuryV0
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `lockCrv` | `bool` | **0** | **0** | Storage | `MochiTreasuryV0` |
| `operationShare` | `uint256` | **1** | **0** | Storage | `MochiTreasuryV0` |
| `veCRVShare` | `uint256` | **2** | **0** | Storage | `MochiTreasuryV0` |

---

## Contract: VestedRewardPool
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `mochiUnderManagement` | `uint256` | **0** | **0** | Storage | `VestedRewardPool` |
| `vesting` | `mapping(address => VestedRewardPool.Vesting)` | **1** | **0** | Storage | `VestedRewardPool` |

---

## Contract: Mochi
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_balances` | `mapping(address => uint256)` | **0** | **0** | Storage | `ERC20` |
| `_allowances` | `mapping(address => mapping(address => uint256))` | **1** | **0** | Storage | `ERC20` |
| `_totalSupply` | `uint256` | **2** | **0** | Storage | `ERC20` |
| `_name` | `string` | **3** | **0** | Storage | `ERC20` |
| `_symbol` | `string` | **4** | **0** | Storage | `ERC20` |

---

## Contract: DutchAuctionLiquidator
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `auctions` | `mapping(uint256 => DutchAuctionLiquidator.Auction)` | **0** | **0** | Storage | `DutchAuctionLiquidator` |

---

## Contract: MochiVault
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_initialized` | `uint8` | **0** | **0** | Storage | `Initializable` |
| `_initializing` | `bool` | **0** | **1** | Storage | `Initializable` |
| `asset` | `IERC20` | **0** | **2** | Storage | `MochiVault` |
| `debtIndex` | `uint256` | **1** | **0** | Storage | `MochiVault` |
| `lastAccrued` | `uint256` | **2** | **0** | Storage | `MochiVault` |
| `deposits` | `uint256` | **3** | **0** | Storage | `MochiVault` |
| `debts` | `uint256` | **4** | **0** | Storage | `MochiVault` |
| `claimable` | `int256` | **5** | **0** | Storage | `MochiVault` |
| `liquidated` | `uint256` | **6** | **0** | Storage | `MochiVault` |
| `details` | `mapping(uint256 => Detail)` | **7** | **0** | Storage | `MochiVault` |
| `lastDeposit` | `mapping(uint256 => uint256)` | **8** | **0** | Storage | `MochiVault` |

---

## Contract: MochiNFT
| State Var Name | Type | EVM Slot | Offset | State Class | Declared In |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `_name` | `string` | **0** | **0** | Storage | `ERC721` |
| `_symbol` | `string` | **1** | **0** | Storage | `ERC721` |
| `_owners` | `mapping(uint256 => address)` | **2** | **0** | Storage | `ERC721` |
| `_balances` | `mapping(address => uint256)` | **3** | **0** | Storage | `ERC721` |
| `_tokenApprovals` | `mapping(uint256 => address)` | **4** | **0** | Storage | `ERC721` |
| `_operatorApprovals` | `mapping(address => mapping(address => bool))` | **5** | **0** | Storage | `ERC721` |
| `_ownedTokens` | `mapping(address => mapping(uint256 => uint256))` | **6** | **0** | Storage | `ERC721Enumerable` |
| `_ownedTokensIndex` | `mapping(uint256 => uint256)` | **7** | **0** | Storage | `ERC721Enumerable` |
| `_allTokens` | `uint256[]` | **8** | **0** | Storage | `ERC721Enumerable` |
| `_allTokensIndex` | `mapping(uint256 => uint256)` | **9** | **0** | Storage | `ERC721Enumerable` |
| `descriptor` | `address` | **10** | **0** | Storage | `MochiNFT` |
| `info` | `mapping(uint256 => IMochiNFT.MochiInfo)` | **11** | **0** | Storage | `MochiNFT` |

---
