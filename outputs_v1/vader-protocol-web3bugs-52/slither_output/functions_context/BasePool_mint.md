# Context: BasePool.mint

**Contract:** `BasePool` (Inherits: ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `mint(address) returns (uint256)`
**Method Selector ID:** `0x6a627842`
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
- **Reads:** foreignAsset, nativeAsset, positionId, totalSupply
- **Writes:** positionId, positions, totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(liquidity > 0,BasePool::mint: Insufficient Liquidity Provided)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_627(uint256) = HIGH_LEVEL_CALL, dest:nativeAsset(IERC20), function:balanceOf, arguments:['TMP_626']  `
- `VaderMath.TMP_633(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateLiquidityUnits(uint256,uint256,uint256,uint256,uint256), arguments:['nativeDeposit', 'reserveNative', 'foreignDeposit', 'reserveForeign', 'totalLiquidityUnits'] `
- `IERC20.TMP_629(uint256) = HIGH_LEVEL_CALL, dest:foreignAsset(IERC20), function:balanceOf, arguments:['TMP_628']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_21
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (reserveNative,reserveForeign,None) = getReserves()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - balanceNative = nativeAsset.balanceOf(address(this))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - balanceForeign = foreignAsset.balanceOf(address(this))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - nativeDeposit = balanceNative - reserveNative"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - foreignDeposit = balanceForeign - reserveForeign"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - totalLiquidityUnits = totalSupply"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - totalLiquidityUnits == 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - liquidity = nativeDeposit"]
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - liquidity = VaderMath.calculateLiquidityUnits(nativeDeposit,reserveNative,foreignDeposit,reserveForeign,totalLiquidityUnits)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - require(bool,string)(liquidity > 0,BasePool::mint: Insufficient Liquidity Provided)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - id = positionId ++"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - totalSupply += liquidity"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _mint(to,id)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - positions(id) = Position(block.timestamp,liquidity,nativeDeposit,foreignDeposit)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - _update(balanceNative,balanceForeign,reserveNative,reserveForeign)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - Mint(msg.sender,to,nativeDeposit,foreignDeposit)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - PositionOpened(msg.sender,id,liquidity)"]
    Node_20 --> Node_22
    Node_21["21: NodeType.EXPRESSION - nonReentrant()"]
    Node_21 --> Node_1
    Node_22["22: NodeType.RETURN - liquidity"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/pool/BasePool.sol` on lines **149** to **194**

```solidity
    function mint(address to)
        external
        override
        nonReentrant
        returns (uint256 liquidity)
    {
        (uint112 reserveNative, uint112 reserveForeign, ) = getReserves(); // gas savings
        uint256 balanceNative = nativeAsset.balanceOf(address(this));
        uint256 balanceForeign = foreignAsset.balanceOf(address(this));
        uint256 nativeDeposit = balanceNative - reserveNative;
        uint256 foreignDeposit = balanceForeign - reserveForeign;

        uint256 totalLiquidityUnits = totalSupply;
        if (totalLiquidityUnits == 0)
            liquidity = nativeDeposit; // TODO: Contact ThorChain on proper approach
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
            "BasePool::mint: Insufficient Liquidity Provided"
        );

        uint256 id = positionId++;

        totalSupply += liquidity;
        _mint(to, id);

        positions[id] = Position(
            block.timestamp,
            liquidity,
            nativeDeposit,
            foreignDeposit
        );

        _update(balanceNative, balanceForeign, reserveNative, reserveForeign);

        emit Mint(msg.sender, to, nativeDeposit, foreignDeposit);
        emit PositionOpened(msg.sender, id, liquidity);
    }

```
