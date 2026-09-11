# Context: VaderPool._update

**Contract:** `VaderPool` (Inherits: BasePool, ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IVaderPool, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `_update(uint256,uint256,uint112,uint112)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _blockTimestampLast, priceForeignCumulativeLast, priceNativeCumulativeLast
- **Writes:** _blockTimestampLast, _reserveForeign, _reserveNative, priceForeignCumulativeLast, priceNativeCumulativeLast

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(balanceNative <= type()(uint112).max && balanceForeign <= type()(uint112).max,BasePool::_update: Balance Overflow)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `UQ112x112.TMP_882(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['reserveNative'] `
- `UQ112x112.TMP_883(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_882', 'reserveForeign'] `
- `UQ112x112.TMP_879(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_878', 'reserveNative'] `
- `UQ112x112.TMP_878(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['reserveForeign'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(balanceNative <= type()(uint112).max && balanceForeign <= type()(uint112).max,BasePool::_update: Balance Overflow)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - blockTimestamp = uint32(block.timestamp % 2 ** 32)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - timeElapsed = blockTimestamp - _blockTimestampLast"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - timeElapsed > 0 && reserveNative != 0 && reserveForeign != 0"]
    Node_4 --> Node_5
    Node_4 --> Node_7
    Node_5["5: NodeType.EXPRESSION - priceNativeCumulativeLast += uint256(UQ112x112.encode(reserveForeign).uqdiv(reserveNative)) * timeElapsed"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - priceForeignCumulativeLast += uint256(UQ112x112.encode(reserveNative).uqdiv(reserveForeign)) * timeElapsed"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _reserveNative = uint112(balanceNative)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _reserveForeign = uint112(balanceForeign)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _blockTimestampLast = blockTimestamp"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - Sync(balanceNative,balanceForeign)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/pool/BasePool.sol` on lines **394** to **426**

```solidity
    function _update(
        uint256 balanceNative,
        uint256 balanceForeign,
        uint112 reserveNative,
        uint112 reserveForeign
    ) internal {
        require(
            balanceNative <= type(uint112).max &&
                balanceForeign <= type(uint112).max,
            "BasePool::_update: Balance Overflow"
        );
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        unchecked {
            uint32 timeElapsed = blockTimestamp - _blockTimestampLast; // overflow is desired
            if (timeElapsed > 0 && reserveNative != 0 && reserveForeign != 0) {
                // * never overflows, and + overflow is desired
                priceNativeCumulativeLast +=
                    uint256(
                        UQ112x112.encode(reserveForeign).uqdiv(reserveNative)
                    ) *
                    timeElapsed;
                priceForeignCumulativeLast +=
                    uint256(
                        UQ112x112.encode(reserveNative).uqdiv(reserveForeign)
                    ) *
                    timeElapsed;
            }
        }
        _reserveNative = uint112(balanceNative);
        _reserveForeign = uint112(balanceForeign);
        _blockTimestampLast = blockTimestamp;
        emit Sync(balanceNative, balanceForeign);
    }

```
