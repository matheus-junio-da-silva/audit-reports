# Context: StabilityPoolScript.checkContract

**Contract:** `StabilityPoolScript` (Inherits: CheckContract)
**Signature:** `checkContract(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_account != address(0),Account cannot be zero address)`
- require/assert: `require(bool,string)(size != 0,Account code size cannot be zero)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_account != address(0),Account cannot be zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.ASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - size = extcodesize(uint256)(_account)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDASSEMBLY - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(size != 0,Account code size cannot be zero)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/CheckContract.sol` on lines **11** to **18**

```solidity
    function checkContract(address _account) internal view {
        require(_account != address(0), "Account cannot be zero address");

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(_account) }
        require(size != 0, "Account code size cannot be zero");
    }

```
