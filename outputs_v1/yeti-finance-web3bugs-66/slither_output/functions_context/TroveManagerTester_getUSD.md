# Context: TroveManagerTester.getUSD

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getUSD(address[],uint256[]) returns (uint256)`
**Method Selector ID:** `0xd283ea04`
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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - coll.tokens = _tokens"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - coll.amounts = _amounts"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - _getUSDColls(coll)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/CDPManagerTester.sol` on lines **105** to **110**

```solidity
    function getUSD(address[] memory _tokens, uint[] memory _amounts) external view returns (uint) {
        newColls memory coll;
        coll.tokens = _tokens;
        coll.amounts = _amounts;
        return _getUSDColls(coll);
    }

```
