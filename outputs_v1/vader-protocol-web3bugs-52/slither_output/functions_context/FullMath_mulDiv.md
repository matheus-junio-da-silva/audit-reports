# Context: FullMath.mulDiv

**Contract:** `FullMath` (Inherits: None)
**Signature:** `mulDiv(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(h < d,FullMath: FULLDIV_OVERFLOW)`

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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (l,h) = fullMul(x,y)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - mm = mulmod(uint256,uint256,uint256)(x,y,d)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - mm > l"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - h -= 1"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - l -= mm"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - h == 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.RETURN - l / d"]
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - require(bool,string)(h < d,FullMath: FULLDIV_OVERFLOW)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.RETURN - fullDiv(l,h,d)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/FullMath.sol` on lines **39** to **54**

```solidity
    function mulDiv(
        uint256 x,
        uint256 y,
        uint256 d
    ) internal pure returns (uint256) {
        (uint256 l, uint256 h) = fullMul(x, y);

        uint256 mm = mulmod(x, y, d);
        if (mm > l) h -= 1;
        l -= mm;

        if (h == 0) return l / d;

        require(h < d, "FullMath: FULLDIV_OVERFLOW");
        return fullDiv(l, h, d);
    }

```
