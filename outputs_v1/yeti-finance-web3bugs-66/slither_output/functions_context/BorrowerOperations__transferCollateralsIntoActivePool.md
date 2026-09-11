# Context: BorrowerOperations._transferCollateralsIntoActivePool

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_transferCollateralsIntoActivePool(address,address[],uint256[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
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
    Node_1["1: NodeType.VARIABLE - amountsLen = _amounts.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < amountsLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - collAddress = _colls(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - amount = _amounts(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _singleTransferCollateralIntoActivePool(_from,collAddress,amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - ++ i"]
    Node_9 --> Node_5
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1024** to **1039**

```solidity
    function _transferCollateralsIntoActivePool(
        address _from,
        address[] memory _colls,
        uint256[] memory _amounts
    ) internal {
        uint256 amountsLen = _amounts.length;
        for (uint256 i; i < amountsLen; ++i) {
            address collAddress = _colls[i];
            uint256 amount = _amounts[i];
            _singleTransferCollateralIntoActivePool(
                _from,
                collAddress,
                amount
            );
        }
    }

```
