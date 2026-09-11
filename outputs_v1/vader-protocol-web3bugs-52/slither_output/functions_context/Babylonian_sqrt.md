# Context: Babylonian.sqrt

**Contract:** `Babylonian` (Inherits: None)
**Signature:** `sqrt(uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.IF - x == 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - xx = x"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - r = 1"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - xx >= 0x100000000000000000000000000000000"]
    Node_6 --> Node_7
    Node_6 --> Node_9
    Node_7["7: NodeType.EXPRESSION - xx >>= 128"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - r <<= 64"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - xx >= 0x10000000000000000"]
    Node_10 --> Node_11
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - xx >>= 64"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - r <<= 32"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - xx >= 0x100000000"]
    Node_14 --> Node_15
    Node_14 --> Node_17
    Node_15["15: NodeType.EXPRESSION - xx >>= 32"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - r <<= 16"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - xx >= 0x10000"]
    Node_18 --> Node_19
    Node_18 --> Node_21
    Node_19["19: NodeType.EXPRESSION - xx >>= 16"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - r <<= 8"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.IF - xx >= 0x100"]
    Node_22 --> Node_23
    Node_22 --> Node_25
    Node_23["23: NodeType.EXPRESSION - xx >>= 8"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - r <<= 4"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.IF - xx >= 0x10"]
    Node_26 --> Node_27
    Node_26 --> Node_29
    Node_27["27: NodeType.EXPRESSION - xx >>= 4"]
    Node_27 --> Node_28
    Node_28["28: NodeType.EXPRESSION - r <<= 2"]
    Node_28 --> Node_29
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_30
    Node_30["30: NodeType.IF - xx >= 0x8"]
    Node_30 --> Node_31
    Node_30 --> Node_32
    Node_31["31: NodeType.EXPRESSION - r <<= 1"]
    Node_31 --> Node_32
    Node_32["32: NodeType.ENDIF - "]
    Node_32 --> Node_33
    Node_33["33: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_33 --> Node_34
    Node_34["34: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_36 --> Node_37
    Node_37["37: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_37 --> Node_38
    Node_38["38: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_38 --> Node_39
    Node_39["39: NodeType.EXPRESSION - r = (r + x / r) >> 1"]
    Node_39 --> Node_40
    Node_40["40: NodeType.VARIABLE - r1 = x / r"]
    Node_40 --> Node_42
    Node_42["42: NodeType.IF - r < r1"]
    Node_42 --> Node_43
    Node_42 --> Node_44
    Node_43["43: NodeType.RETURN - (r)"]
    Node_44["44: NodeType.RETURN - (r1)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/Babylonian.sol` on lines **10** to **52**

```solidity
    function sqrt(uint256 x) internal pure returns (uint256) {
        if (x == 0) return 0;
        // this block is equivalent to r = uint256(1) << (BitMath.mostSignificantBit(x) / 2);
        // however that code costs significantly more gas
        uint256 xx = x;
        uint256 r = 1;
        if (xx >= 0x100000000000000000000000000000000) {
            xx >>= 128;
            r <<= 64;
        }
        if (xx >= 0x10000000000000000) {
            xx >>= 64;
            r <<= 32;
        }
        if (xx >= 0x100000000) {
            xx >>= 32;
            r <<= 16;
        }
        if (xx >= 0x10000) {
            xx >>= 16;
            r <<= 8;
        }
        if (xx >= 0x100) {
            xx >>= 8;
            r <<= 4;
        }
        if (xx >= 0x10) {
            xx >>= 4;
            r <<= 2;
        }
        if (xx >= 0x8) {
            r <<= 1;
        }
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1; // Seven iterations should be enough
        uint256 r1 = x / r;
        return (r < r1 ? r : r1);
    }

```
