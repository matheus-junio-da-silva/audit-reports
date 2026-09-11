# Context: BasePoolV2.mint

**Contract:** `BasePoolV2` (Inherits: ReentrancyGuard, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePoolV2)
**Signature:** `mint(IERC20,uint256,uint256,address,address) returns (uint256)`
**Method Selector ID:** `0xb044d1e0`
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
- `onlyRouter`
  ```solidity
  modifier onlyRouter() {
          _onlyRouter();
          _;
      }
  ```
- `supportedToken`
  ```solidity
  modifier supportedToken(IERC20 token) {
          _supportedToken(token);
          _;
      }
  ```

### State Variables Interaction
- **Reads:** nativeAsset, pairInfo, positionId
- **Writes:** pairInfo, positionId, positions

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(liquidity > 0,BasePoolV2::mint: Insufficient Liquidity Provided)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['nativeAsset', 'from', 'TMP_537', 'nativeDeposit'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['foreignAsset', 'from', 'TMP_539', 'foreignDeposit'] `
- `VaderMath.TMP_542(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateLiquidityUnits(uint256,uint256,uint256,uint256,uint256), arguments:['nativeDeposit', 'reserveNative', 'foreignDeposit', 'reserveForeign', 'totalLiquidityUnits'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_20
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (reserveNative,reserveForeign,None) = getReserves(foreignAsset)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - nativeAsset.safeTransferFrom(from,address(this),nativeDeposit)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - foreignAsset.safeTransferFrom(from,address(this),foreignDeposit)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - pair = pairInfo(foreignAsset)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - totalLiquidityUnits = pair.totalSupply"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - totalLiquidityUnits == 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - liquidity = nativeDeposit"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - liquidity = VaderMath.calculateLiquidityUnits(nativeDeposit,reserveNative,foreignDeposit,reserveForeign,totalLiquidityUnits)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - require(bool,string)(liquidity > 0,BasePoolV2::mint: Insufficient Liquidity Provided)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - id = positionId ++"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - pair.totalSupply = totalLiquidityUnits + liquidity"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _mint(to,id)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - positions(id) = Position(foreignAsset,block.timestamp,liquidity,nativeDeposit,foreignDeposit)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - _update(foreignAsset,reserveNative + nativeDeposit,reserveForeign + foreignDeposit,reserveNative,reserveForeign)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - Mint(from,to,nativeDeposit,foreignDeposit)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - PositionOpened(from,to,id,liquidity)"]
    Node_19 --> Node_23
    Node_20["20: NodeType.EXPRESSION - nonReentrant()"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - onlyRouter()"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - supportedToken(foreignAsset)"]
    Node_22 --> Node_1
    Node_23["23: NodeType.RETURN - liquidity"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/pool/BasePoolV2.sol` on lines **168** to **229**

```solidity
    function mint(
        IERC20 foreignAsset,
        uint256 nativeDeposit,
        uint256 foreignDeposit,
        address from,
        address to
    )
        external
        override
        nonReentrant
        onlyRouter
        supportedToken(foreignAsset)
        returns (uint256 liquidity)
    {
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
            "BasePoolV2::mint: Insufficient Liquidity Provided"
        );

        uint256 id = positionId++;

        pair.totalSupply = totalLiquidityUnits + liquidity;
        _mint(to, id);

        positions[id] = Position(
            foreignAsset,
            block.timestamp,
            liquidity,
            nativeDeposit,
            foreignDeposit
        );

        _update(
            foreignAsset,
            reserveNative + nativeDeposit,
            reserveForeign + foreignDeposit,
            reserveNative,
            reserveForeign
        );

        emit Mint(from, to, nativeDeposit, foreignDeposit);
        emit PositionOpened(from, to, id, liquidity);
    }

```
