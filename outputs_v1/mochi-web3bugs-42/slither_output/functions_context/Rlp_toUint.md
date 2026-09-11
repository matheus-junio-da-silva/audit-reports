# Context: Rlp.toUint

**Contract:** `Rlp` (Inherits: None)
**Signature:** `toUint(Rlp.Item) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isData(self),Rlp.sol:Rlp:toUint:1)`
- require/assert: `require(bool,string)(len <= 32,Rlp.sol:Rlp:toUint:3)`
- require/assert: `require(bool,string)(len != 0,Rlp.sol:Rlp:toUint:4)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isData(self),Rlp.sol:Rlp:toUint:1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (rStartPos,len) = _decode(self)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(len <= 32,Rlp.sol:Rlp:toUint:3)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(len != 0,Rlp.sol:Rlp:toUint:4)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.ASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - data = mload(uint256)(rStartPos) / 256 ** 32 - len"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDASSEMBLY - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - data"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **219** to **229**

```solidity
    function toUint(Item memory self) internal pure returns (uint) {
        require(isData(self), "Rlp.sol:Rlp:toUint:1");
        (uint256 rStartPos, uint256 len) = _decode(self);
        require(len <= 32, "Rlp.sol:Rlp:toUint:3");
        require(len != 0, "Rlp.sol:Rlp:toUint:4");
        uint data;
        assembly {
            data := div(mload(rStartPos), exp(256, sub(32, len)))
        }
        return data;
    }

```
