# Context: TroveManagerTester.getEDC

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getEDC(address) returns (address[], uint256[], uint256)`
**Method Selector ID:** `0xa8bee0e7`
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
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (colls,YUSDdebt) = _getCurrentTroveState(_troveAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - (colls.tokens,colls.amounts,YUSDdebt)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/CDPManagerTester.sol` on lines **82** to **85**

```solidity
    function getEDC(address _troveAddress) external view returns (address[] memory, uint[] memory, uint) {
        (newColls memory colls, uint YUSDdebt) = _getCurrentTroveState(_troveAddress);
        return (colls.tokens, colls.amounts, YUSDdebt);
    }

```
