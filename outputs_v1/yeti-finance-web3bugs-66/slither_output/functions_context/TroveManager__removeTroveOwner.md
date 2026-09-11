# Context: TroveManager._removeTroveOwner

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_removeTroveOwner(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** TroveOwners, Troves
- **Writes:** TroveOwners, Troves

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(troveStatus != Status.nonExistent && troveStatus != Status.active,TM: trove !exists or !active)`
- require/assert: `require(bool,string)(index <= idxLast,TM: index must be > last index)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_610(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['length', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - troveStatus = Troves(_borrower).status"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(troveStatus != Status.nonExistent && troveStatus != Status.active,TM: trove !exists or !active)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - index = Troves(_borrower).arrayIndex"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - length = TroveOwnersArrayLength"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - idxLast = length.sub(1)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(index <= idxLast,TM: index must be > last index)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - addressToMove = TroveOwners(idxLast)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - TroveOwners(index) = addressToMove"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - Troves(addressToMove).arrayIndex = index"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - TroveIndexUpdated(addressToMove,index)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - TroveOwners.pop()"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **671** to **689**

```solidity
    function _removeTroveOwner(address _borrower, uint TroveOwnersArrayLength) internal {
        Status troveStatus = Troves[_borrower].status;
        // It’s set in caller function `_closeTrove`
        require(troveStatus != Status.nonExistent && troveStatus != Status.active, "TM: trove !exists or !active");

        uint128 index = Troves[_borrower].arrayIndex;
        uint length = TroveOwnersArrayLength;
        uint idxLast = length.sub(1);

        require(index <= idxLast, "TM: index must be > last index");

        address addressToMove = TroveOwners[idxLast];

        TroveOwners[index] = addressToMove;
        Troves[addressToMove].arrayIndex = index;
        emit TroveIndexUpdated(addressToMove, index);

        TroveOwners.pop();
    }

```
