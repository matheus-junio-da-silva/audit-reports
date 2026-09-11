# Context: FixedPoint.divuq

**Contract:** `FixedPoint` (Inherits: None)
**Signature:** `divuq(FixedPoint.uq112x112,FixedPoint.uq112x112) returns (FixedPoint.uq112x112)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** Q112, RESOLUTION
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(other._x > 0,FixedPoint::divuq: division by zero)`
- require/assert: `require(bool,string)(value <= type()(uint224).max,FixedPoint::divuq: overflow)`
- require/assert: `require(bool,string)(result <= type()(uint224).max,FixedPoint::divuq: overflow)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `FullMath.TMP_194(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['Q112', 'REF_21', 'REF_22'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(other._x > 0,FixedPoint::divuq: division by zero)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - self._x == other._x"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - uq112x112(uint224(Q112))"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - self._x <= type()(uint144).max"]
    Node_5 --> Node_6
    Node_5 --> Node_9
    Node_6["6: NodeType.VARIABLE - value = (uint256(self._x) << RESOLUTION) / other._x"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(value <= type()(uint224).max,FixedPoint::divuq: overflow)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - uq112x112(uint224(value))"]
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - result = FullMath.mulDiv(Q112,self._x,other._x)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - require(bool,string)(result <= type()(uint224).max,FixedPoint::divuq: overflow)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - uq112x112(uint224(result))"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/FixedPoint.sol` on lines **115** to **133**

```solidity
    function divuq(uq112x112 memory self, uq112x112 memory other)
        internal
        pure
        returns (uq112x112 memory)
    {
        require(other._x > 0, "FixedPoint::divuq: division by zero");
        if (self._x == other._x) {
            return uq112x112(uint224(Q112));
        }
        if (self._x <= type(uint144).max) {
            uint256 value = (uint256(self._x) << RESOLUTION) / other._x;
            require(value <= type(uint224).max, "FixedPoint::divuq: overflow");
            return uq112x112(uint224(value));
        }

        uint256 result = FullMath.mulDiv(Q112, self._x, other._x);
        require(result <= type(uint224).max, "FixedPoint::divuq: overflow");
        return uq112x112(uint224(result));
    }

```
