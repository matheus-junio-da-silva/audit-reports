# Context: VaderPoolV2.mintFungible

**Contract:** `VaderPoolV2` (Inherits: Ownable, BasePoolV2, ReentrancyGuard, ERC721, IERC721Metadata, IVaderPoolV2, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePoolV2)
**Signature:** `mintFungible(IERC20,uint256,uint256,address,address) returns (uint256)`
**Method Selector ID:** `0xb41b23b7`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          _nonReentrantBefore();
          _;
          _nonReentrantAfter();
      }
  ```

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS, nativeAsset, pairInfo, wrapper
- **Writes:** pairInfo

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(lp != IERC20Extended(_ZERO_ADDRESS),VaderPoolV2::mintFungible: Unsupported Token)`
- require/assert: `require(bool,string)(liquidity > 0,VaderPoolV2::mintFungible: Insufficient Liquidity Provided)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20Extended.HIGH_LEVEL_CALL, dest:lp(IERC20Extended), function:mint, arguments:['to', 'liquidity']  `
- `VaderMath.TMP_1046(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateLiquidityUnits(uint256,uint256,uint256,uint256,uint256), arguments:['nativeDeposit', 'reserveNative', 'foreignDeposit', 'reserveForeign', 'totalLiquidityUnits'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['foreignAsset', 'from', 'TMP_1043', 'foreignDeposit'] `
- `ILPWrapper.TMP_1037(IERC20Extended) = HIGH_LEVEL_CALL, dest:wrapper(ILPWrapper), function:tokens, arguments:['foreignAsset']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['nativeAsset', 'from', 'TMP_1041', 'nativeDeposit'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_19
    Node_1["1: NodeType.VARIABLE - lp = wrapper.tokens(foreignAsset)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(lp != IERC20Extended(_ZERO_ADDRESS),VaderPoolV2::mintFungible: Unsupported Token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (reserveNative,reserveForeign,None) = getReserves(foreignAsset)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - nativeAsset.safeTransferFrom(from,address(this),nativeDeposit)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - foreignAsset.safeTransferFrom(from,address(this),foreignDeposit)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - pair = pairInfo(foreignAsset)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - totalLiquidityUnits = pair.totalSupply"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - totalLiquidityUnits == 0"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - liquidity = nativeDeposit"]
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - liquidity = VaderMath.calculateLiquidityUnits(nativeDeposit,reserveNative,foreignDeposit,reserveForeign,totalLiquidityUnits)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - require(bool,string)(liquidity > 0,VaderPoolV2::mintFungible: Insufficient Liquidity Provided)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - pair.totalSupply = totalLiquidityUnits + liquidity"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _update(foreignAsset,reserveNative + nativeDeposit,reserveForeign + foreignDeposit,reserveNative,reserveForeign)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - lp.mint(to,liquidity)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - Mint(from,to,nativeDeposit,foreignDeposit)"]
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - nonReentrant()"]
    Node_19 --> Node_1
    Node_20["20: NodeType.RETURN - liquidity"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/pool/VaderPoolV2.sol` on lines **284** to **335**

```solidity
    function mintFungible(
        IERC20 foreignAsset,
        uint256 nativeDeposit,
        uint256 foreignDeposit,
        address from,
        address to
    ) external override nonReentrant returns (uint256 liquidity) {
        IERC20Extended lp = wrapper.tokens(foreignAsset);

        require(
            lp != IERC20Extended(_ZERO_ADDRESS),
            "VaderPoolV2::mintFungible: Unsupported Token"
        );

        (uint112 reserveNative, uint112 reserveForeign, ) = getReserves(
            foreignAsset
        ); // gas savings

        nativeAsset.safeTransferFrom(from, address(this), nativeDeposit);
        foreignAsset.safeTransferFrom(from, address(this), foreignDeposit);

        PairInfo storage pair = pairInfo[foreignAsset];
        uint256 totalLiquidityUnits = pair.totalSupply;
        if (totalLiquidityUnits == 0) liquidity = nativeDeposit;
        else
            liquidity = VaderMath.calculateLiquidityUnits(
                nativeDeposit,
                reserveNative,
                foreignDeposit,
                reserveForeign,
                totalLiquidityUnits
            );

        require(
            liquidity > 0,
            "VaderPoolV2::mintFungible: Insufficient Liquidity Provided"
        );

        pair.totalSupply = totalLiquidityUnits + liquidity;

        _update(
            foreignAsset,
            reserveNative + nativeDeposit,
            reserveForeign + foreignDeposit,
            reserveNative,
            reserveForeign
        );

        lp.mint(to, liquidity);

        emit Mint(from, to, nativeDeposit, foreignDeposit);
    }

```
