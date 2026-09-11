# Context: LiquityBaseTester.createCollExample

**Contract:** `LiquityBaseTester` (Inherits: LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `createCollExample() returns (address[], uint256[])`
**Method Selector ID:** `0x6f675184`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

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
    Node_1["1: NodeType.EXPRESSION - tokens = new address()(2)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - amounts = new uint256()(2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - tokens(0) = address(1)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - tokens(1) = address(2)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - amounts(0) = 1e18"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - amounts(1) = 2e18"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (tokens,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/LiquityBaseTester.sol` on lines **24** to **31**

```solidity
    function createCollExample() external pure returns (address[] memory tokens, uint[] memory amounts) {
        tokens = new address[](2);
        amounts = new uint[](2);
        tokens[0] = address(1);
        tokens[1] = address(2);
        amounts[0] = 1e18;
        amounts[1] = 2e18;
    }

```
