# Context: Vault.depositForMember

**Contract:** `Vault` (Inherits: None)
**Signature:** `depositForMember(address,address,uint256)`
**Method Selector ID:** `0xbf58d0ef`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** FACTORY
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)((iFACTORY(FACTORY).isSynth(synth)),Not Synth)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iFACTORY.TMP_1202(bool) = HIGH_LEVEL_CALL, dest:TMP_1201(iFACTORY), function:isSynth, arguments:['synth']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)((iFACTORY(FACTORY).isSynth(synth)),Not Synth)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - getFunds(synth,amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _deposit(synth,member,amount)"]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **81** to **85**

```solidity
    function depositForMember(address synth, address member, uint amount) public {
        require((iFACTORY(FACTORY).isSynth(synth)), "Not Synth"); // Only Synths
        getFunds(synth, amount);
        _deposit(synth, member, amount);
    }

```
