# Context: SynthFactory.createSynth

**Contract:** `SynthFactory` (Inherits: Ownable, Context, ProtocolConstants, ISynthFactory)
**Signature:** `createSynth(IERC20Extended) returns (ISynth)`
**Method Selector ID:** `0xcf62480d`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          _checkOwner();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS, synths
- **Writes:** synths

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(synths[IERC20(token)] == ISynth(_ZERO_ADDRESS),SynthFactory::createSynth: Already Created)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Synth.HIGH_LEVEL_CALL, dest:synth(Synth), function:transferOwnership, arguments:['TMP_205']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_6
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(synths(IERC20(token)) == ISynth(_ZERO_ADDRESS),SynthFactory::createSynth: Already Created)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - synth = new Synth(token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - synth.transferOwnership(owner())"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - synths(IERC20(token)) = synth"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - synth"]
    Node_6["6: NodeType.EXPRESSION - onlyOwner()"]
    Node_6 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/synths/SynthFactory.sol` on lines **20** to **38**

```solidity
    function createSynth(IERC20Extended token)
        external
        override
        onlyOwner
        returns (ISynth)
    {
        require(
            synths[IERC20(token)] == ISynth(_ZERO_ADDRESS),
            "SynthFactory::createSynth: Already Created"
        );

        Synth synth = new Synth(token);

        synth.transferOwnership(owner());

        synths[IERC20(token)] = synth;

        return synth;
    }

```
