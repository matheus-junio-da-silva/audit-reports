# Context: DefaultPool.setAddresses

**Contract:** `DefaultPool` (Inherits: YetiCustomBase, BaseMath, IDefaultPool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `setAddresses(address,address,address,address)`
**Method Selector ID:** `0x4a945f8d`
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
- **Writes:** activePoolAddress, troveManagerAddress, whitelist, whitelistAddress, yetiFinanceTreasury

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
    Node_0 --> Node_13
    Node_1["1: NodeType.EXPRESSION - checkContract(_troveManagerAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_activePoolAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(_whitelistAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - checkContract(_yetiTreasuryAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - troveManagerAddress = _troveManagerAddress"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - activePoolAddress = _activePoolAddress"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - whitelist = IWhitelist(_whitelistAddress)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - whitelistAddress = _whitelistAddress"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - yetiFinanceTreasury = _yetiTreasuryAddress"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - TroveManagerAddressChanged(_troveManagerAddress)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - ActivePoolAddressChanged(_activePoolAddress)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_13["13: NodeType.EXPRESSION - onlyOwner()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/DefaultPool.sol` on lines **46** to **67**

```solidity
    function setAddresses(
        address _troveManagerAddress,
        address _activePoolAddress,
        address _whitelistAddress, 
        address _yetiTreasuryAddress
    ) external onlyOwner {
        checkContract(_troveManagerAddress);
        checkContract(_activePoolAddress);
        checkContract(_whitelistAddress);
        checkContract(_yetiTreasuryAddress);

        troveManagerAddress = _troveManagerAddress;
        activePoolAddress = _activePoolAddress;
        whitelist = IWhitelist(_whitelistAddress);
        whitelistAddress = _whitelistAddress;
        yetiFinanceTreasury = _yetiTreasuryAddress;

        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit ActivePoolAddressChanged(_activePoolAddress);

        _renounceOwnership();
    }

```
