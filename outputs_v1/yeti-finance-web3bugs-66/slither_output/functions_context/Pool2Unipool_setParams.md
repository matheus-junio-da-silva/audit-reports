# Context: Pool2Unipool.setParams

**Contract:** `Pool2Unipool` (Inherits: IUnipool, CheckContract, Ownable, LPTokenWrapper, ILPTokenWrapper)
**Signature:** `setParams(address,address,uint256)`
**Method Selector ID:** `0x509db2f6`
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
- **Writes:** uniToken, yetiToken

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
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - checkContract(_yetiTokenAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_uniTokenAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - uniToken = IERC20(_uniTokenAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - yetiToken = IYETIToken(_yetiTokenAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - YETITokenAddressChanged(_yetiTokenAddress)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - UniTokenAddressChanged(_uniTokenAddress)"]
    Node_7["7: NodeType.EXPRESSION - onlyOwner()"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/LPRewards/Pool2Unipool.sol` on lines **95** to **120**

```solidity
    function setParams(
        address _yetiTokenAddress,
        address _uniTokenAddress,
        uint _duration
    )
        external
        override
        onlyOwner
    {
        checkContract(_yetiTokenAddress);
        checkContract(_uniTokenAddress);

        uniToken = IERC20(_uniTokenAddress);
        yetiToken = IYETIToken(_yetiTokenAddress);
        //duration = _duration;

        // This function must be commented out as it assumes an allocation already exists
        // for this pool immediately after creation. 
        //_notifyRewardAmount(yetiToken.getLpRewardsEntitlement(), _duration);

        emit YETITokenAddressChanged(_yetiTokenAddress);
        emit UniTokenAddressChanged(_uniTokenAddress);

        // this must be done in setReward
        //_renounceOwnership();
    }

```
