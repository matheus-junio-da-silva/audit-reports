# Context: HintHelpers.setAddresses

**Contract:** `HintHelpers` (Inherits: CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `setAddresses(address,address,address)`
**Method Selector ID:** `0x363bf964`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** sortedTroves, troveManager, whitelist

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
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - checkContract(_sortedTrovesAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_troveManagerAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(_whitelistAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - sortedTroves = ISortedTroves(_sortedTrovesAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - troveManager = ITroveManager(_troveManagerAddress)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - whitelist = IWhitelist(_whitelistAddress)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - SortedTrovesAddressChanged(_sortedTrovesAddress)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - TroveManagerAddressChanged(_troveManagerAddress)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - WhitelistAddressChanged(_troveManagerAddress)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_11["11: NodeType.EXPRESSION - onlyOwner()"]
    Node_11 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/HintHelpers.sol` on lines **31** to **52**

```solidity
    function setAddresses(
        address _sortedTrovesAddress,
        address _troveManagerAddress,
        address _whitelistAddress
    )
        external
        onlyOwner
    {
        checkContract(_sortedTrovesAddress);
        checkContract(_troveManagerAddress);
        checkContract(_whitelistAddress);

        sortedTroves = ISortedTroves(_sortedTrovesAddress);
        troveManager = ITroveManager(_troveManagerAddress);
        whitelist = IWhitelist(_whitelistAddress);

        emit SortedTrovesAddressChanged(_sortedTrovesAddress);
        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit WhitelistAddressChanged(_troveManagerAddress);

        _renounceOwnership();
    }

```
