# Context: VaderPool.getReserves

**Contract:** `VaderPool` (Inherits: BasePool, ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IVaderPool, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `getReserves() returns (uint112, uint112, uint32)`
**Method Selector ID:** `0x0902f1ac`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _blockTimestampLast, _reserveForeign, _reserveNative
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - reserveNative = _reserveNative"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - reserveForeign = _reserveForeign"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - blockTimestampLast = _blockTimestampLast"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - (reserveNative,reserveForeign,blockTimestampLast)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/pool/BasePool.sol` on lines **112** to **124**

```solidity
    function getReserves()
        public
        view
        returns (
            uint112 reserveNative,
            uint112 reserveForeign,
            uint32 blockTimestampLast
        )
    {
        reserveNative = _reserveNative;
        reserveForeign = _reserveForeign;
        blockTimestampLast = _blockTimestampLast;
    }

```
