# Context: TroveManagerTester.getCollGasCompensation

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getCollGasCompensation(address,uint256) returns (uint256)`
**Method Selector ID:** `0xb9a9aaa5`
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
    Node_1["1: NodeType.VARIABLE - tokens = new address()(1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - tokens(0) = _token"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - amounts = new uint256()(1)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - amounts(0) = _amount"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - totalColl = newColls(tokens,amounts)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - compensation = _getCollGasCompensation(totalColl)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - ans = compensation.amounts(0)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - ans"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/CDPManagerTester.sol` on lines **87** to **99**

```solidity
    function getCollGasCompensation(address _token, uint _amount) external pure returns (uint) {
        address[] memory tokens = new address[](1);
        tokens[0] = _token;

        uint[] memory amounts = new uint[](1);
        amounts[0] = _amount;

        newColls memory totalColl = newColls(tokens, amounts);

        newColls memory compensation = _getCollGasCompensation(totalColl);
        uint ans = compensation.amounts[0];
        return ans;
    }

```
