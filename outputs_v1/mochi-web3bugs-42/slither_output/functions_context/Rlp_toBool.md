# Context: Rlp.toBool

**Contract:** `Rlp` (Inherits: None)
**Signature:** `toBool(Rlp.Item) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isData(self),Rlp.sol:Rlp:toBool:1)`
- require/assert: `require(bool,string)(len == 1,Rlp.sol:Rlp:toBool:3)`
- require/assert: `require(bool,string)(temp <= 1,Rlp.sol:Rlp:toBool:8)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isData(self),Rlp.sol:Rlp:toBool:1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (rStartPos,len) = _decode(self)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(len == 1,Rlp.sol:Rlp:toBool:3)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ASSEMBLY - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - temp = byte(uint256,uint256)(0,mload(uint256)(rStartPos))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDASSEMBLY - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - require(bool,string)(temp <= 1,Rlp.sol:Rlp:toBool:8)"]
    Node_10 --> Node_12
    Node_12["12: NodeType.IF - temp == 1"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.RETURN - true"]
    Node_14["14: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **235** to **245**

```solidity
    function toBool(Item memory self) internal pure returns (bool) {
        require(isData(self), "Rlp.sol:Rlp:toBool:1");
        (uint256 rStartPos, uint256 len) = _decode(self);
        require(len == 1, "Rlp.sol:Rlp:toBool:3");
        uint temp;
        assembly {
            temp := byte(0, mload(rStartPos))
        }
        require(temp <= 1, "Rlp.sol:Rlp:toBool:8");
        return temp == 1 ? true : false;
    }

```
