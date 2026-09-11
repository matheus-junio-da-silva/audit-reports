# Context: Factory.deploySynth

**Contract:** `Factory` (Inherits: None)
**Signature:** `deploySynth(address) returns (address)`
**Method Selector ID:** `0x8e80bddf`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyPOOLS`
  ```solidity
  modifier onlyPOOLS() {
          require(msg.sender == POOLS, "!POOLS");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** getSynth
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(getSynth[token] == address(0),CreateErr)`

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
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(getSynth(token) == address(0),CreateErr)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - newSynth = new Synth(token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - synth = address(newSynth)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _addSynth(token,synth)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - CreateSynth(token,synth)"]
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - onlyPOOLS()"]
    Node_7 --> Node_1
    Node_8["8: NodeType.RETURN - synth"]
```

### Source Mapping
Declared in: `contracts/Factory.sol` on lines **34** to **41**

```solidity
    function deploySynth(address token) external onlyPOOLS returns(address synth) {
        require(getSynth[token] == address(0), "CreateErr");
        Synth newSynth;
        newSynth = new Synth(token);  
        synth = address(newSynth);
        _addSynth(token, synth);
        emit CreateSynth(token, synth);
    }

```
