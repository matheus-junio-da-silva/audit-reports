# Context: Unipool.setParams

**Contract:** `Unipool` (Inherits: IUnipool, CheckContract, Ownable, LPTokenWrapper, ILPTokenWrapper)
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
- **Reads:** yetiToken
- **Writes:** duration, uniToken, yetiToken

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYETIToken.TMP_140(uint256) = HIGH_LEVEL_CALL, dest:yetiToken(IYETIToken), function:balanceOf, arguments:['TMP_139']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.EXPRESSION - checkContract(_yetiTokenAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_uniTokenAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - uniToken = IERC20(_uniTokenAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - yetiToken = IYETIToken(_yetiTokenAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - duration = _duration"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _notifyRewardAmount(yetiToken.balanceOf(address(this)),_duration)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - YETITokenAddressChanged(_yetiTokenAddress)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - UniTokenAddressChanged(_uniTokenAddress)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_10["10: NodeType.EXPRESSION - onlyOwner()"]
    Node_10 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/LPRewards/Unipool.sol` on lines **96** to **118**

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
        duration = _duration;

        _notifyRewardAmount(yetiToken.balanceOf(address(this)), _duration);

        emit YETITokenAddressChanged(_yetiTokenAddress);
        emit UniTokenAddressChanged(_uniTokenAddress);

        _renounceOwnership();
    }

```
