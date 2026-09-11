# Context: Rlp.toAscii

**Contract:** `Rlp` (Inherits: None)
**Signature:** `toAscii(Rlp.Item) returns (string)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isData(self),Rlp.sol:Rlp:toAscii:1)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isData(self),Rlp.sol:Rlp:toAscii:1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (rStartPos,len) = _decode(self)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - bts = new bytes(len)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _copyToBytes(rStartPos,bts,len)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - str = string(bts)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - str"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **206** to **213**

```solidity
    function toAscii(Item memory self) internal pure returns (string memory) {
        require(isData(self), "Rlp.sol:Rlp:toAscii:1");
        (uint256 rStartPos, uint256 len) = _decode(self);
        bytes memory bts = new bytes(len);
        _copyToBytes(rStartPos, bts, len);
        string memory str = string(bts);
        return str;
    }

```
