# Context: GovernanceTester.update

**Contract:** `GovernanceTester` (Inherits: None)
**Signature:** `update(uint256)`
**Method Selector ID:** `0x82ab890a`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == gov, 'Only Governance should be able to hit');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** gov
- **Writes:** value

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - value = _value"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - valueUpdated(gov,msg.sender,_value)"]
    Node_3["3: NodeType.EXPRESSION - onlyGov()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/mocks/GovernanceTester.sol` on lines **20** to **23**

```solidity
    function update(uint256 _value) public onlyGov {
        value = _value;
        emit valueUpdated(gov, msg.sender, _value);
    }

```
