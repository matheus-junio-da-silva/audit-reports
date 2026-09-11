# Context: BasePoolV2._update

**Contract:** `BasePoolV2` (Inherits: ReentrancyGuard, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePoolV2)
**Signature:** `_update(IERC20,uint256,uint256,uint112,uint112)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** pairInfo
- **Writes:** pairInfo

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(balanceNative <= type()(uint112).max && balanceForeign <= type()(uint112).max,BasePoolV2::_update: Balance Overflow)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `UQ112x112.TMP_672(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_671', 'reserveForeign'] `
- `UQ112x112.TMP_668(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_667', 'reserveNative'] `
- `UQ112x112.TMP_667(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['reserveForeign'] `
- `UQ112x112.TMP_671(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['reserveNative'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(balanceNative <= type()(uint112).max && balanceForeign <= type()(uint112).max,BasePoolV2::_update: Balance Overflow)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - blockTimestamp = uint32(block.timestamp % 2 ** 32)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pair = pairInfo(foreignAsset)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - timeElapsed = blockTimestamp - pair.blockTimestampLast"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - timeElapsed > 0 && reserveNative != 0 && reserveForeign != 0"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - pair.priceCumulative.nativeLast += uint256(UQ112x112.encode(reserveForeign).uqdiv(reserveNative)) * timeElapsed"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - pair.priceCumulative.foreignLast += uint256(UQ112x112.encode(reserveNative).uqdiv(reserveForeign)) * timeElapsed"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - pair.reserveNative = uint112(balanceNative)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - pair.reserveForeign = uint112(balanceForeign)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - pair.blockTimestampLast = blockTimestamp"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - Sync(foreignAsset,balanceNative,balanceForeign)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/pool/BasePoolV2.sol` on lines **533** to **567**

```solidity
    function _update(
        IERC20 foreignAsset,
        uint256 balanceNative,
        uint256 balanceForeign,
        uint112 reserveNative,
        uint112 reserveForeign
    ) internal {
        require(
            balanceNative <= type(uint112).max &&
                balanceForeign <= type(uint112).max,
            "BasePoolV2::_update: Balance Overflow"
        );
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        PairInfo storage pair = pairInfo[foreignAsset];
        unchecked {
            uint32 timeElapsed = blockTimestamp - pair.blockTimestampLast; // overflow is desired
            if (timeElapsed > 0 && reserveNative != 0 && reserveForeign != 0) {
                // * never overflows, and + overflow is desired
                pair.priceCumulative.nativeLast +=
                    uint256(
                        UQ112x112.encode(reserveForeign).uqdiv(reserveNative)
                    ) *
                    timeElapsed;
                pair.priceCumulative.foreignLast +=
                    uint256(
                        UQ112x112.encode(reserveNative).uqdiv(reserveForeign)
                    ) *
                    timeElapsed;
            }
        }
        pair.reserveNative = uint112(balanceNative);
        pair.reserveForeign = uint112(balanceForeign);
        pair.blockTimestampLast = blockTimestamp;
        emit Sync(foreignAsset, balanceNative, balanceForeign);
    }

```
