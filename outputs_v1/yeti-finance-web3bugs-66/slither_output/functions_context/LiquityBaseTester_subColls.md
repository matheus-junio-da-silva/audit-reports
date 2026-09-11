# Context: LiquityBaseTester.subColls

**Contract:** `LiquityBaseTester` (Inherits: LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `subColls(address[],uint256[],address[],uint256[])`
**Method Selector ID:** `0x5b908b69`
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
    Node_1["1: NodeType.VARIABLE - diff = _subColls(newColls(_tokens1,_amounts1),_tokens2,_amounts2)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - Sum(diff.tokens,diff.amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/LiquityBaseTester.sol` on lines **77** to **81**

```solidity
    function subColls(address[] memory _tokens1, uint[] memory _amounts1,
        address[] memory _tokens2, uint[] memory _amounts2) external {
        newColls memory diff = _subColls(newColls(_tokens1, _amounts1), _tokens2, _amounts2);
        emit Sum(diff.tokens, diff.amounts);
    }

```
