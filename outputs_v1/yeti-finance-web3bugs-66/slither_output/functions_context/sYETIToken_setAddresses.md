# Context: sYETIToken.setAddresses

**Contract:** `sYETIToken` (Inherits: BoringOwnable, BoringOwnableData, Domain, IERC20)
**Signature:** `setAddresses(IYETIToken,IERC20)`
**Method Selector ID:** `0x90107afe`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(msg.sender == owner, "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** addressesSet
- **Writes:** addressesSet, yetiToken, yusdToken

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! addressesSet,addresses already set)`

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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! addressesSet,addresses already set)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - yetiToken = _yeti"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - yusdToken = _yusd"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - addressesSet = true"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/sYETIToken.sol` on lines **74** to **79**

```solidity
    function setAddresses(IYETIToken _yeti, IERC20 _yusd) external onlyOwner {
        require(!addressesSet, "addresses already set");
        yetiToken = _yeti;
        yusdToken = _yusd;
        addressesSet = true;
    }

```
