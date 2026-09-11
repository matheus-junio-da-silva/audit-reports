# Context: Factory._addSynth

**Contract:** `Factory` (Inherits: None)
**Signature:** `_addSynth(address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** arraySynths
- **Writes:** arraySynths, getSynth, isSynth

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
    Node_1["1: NodeType.EXPRESSION - getSynth(_token) = _synth"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - arraySynths.push(_synth)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - isSynth(_synth) = true"]
```

### Source Mapping
Declared in: `contracts/Factory.sol` on lines **57** to **61**

```solidity
    function _addSynth(address _token, address _synth) internal {
        getSynth[_token] = _synth;
        arraySynths.push(_synth); 
        isSynth[_synth] = true;
    }

```
