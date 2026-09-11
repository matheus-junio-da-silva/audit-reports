# Context: WBQI.unwrapFor

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `unwrapFor(address,address,uint256)`
**Method Selector ID:** `0x261c80b6`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** Qtoken
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_99(bool) = HIGH_LEVEL_CALL, dest:Qtoken(IERC20), function:transfer, arguments:['_to', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsAPorSP()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _burn(msg.sender,_amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - Qtoken.transfer(_to,_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WBQI.sol` on lines **163** to **174**

```solidity
    function unwrapFor(address _to, address _from, uint _amount) external override {
        _requireCallerIsAPorSP();
        // accumulateRewards(msg.sender);
        // _MasterChefJoe.withdraw(_poolPid, _amount);

        // msg.sender is either Active Pool or Stability Pool
        // each one has the ability to unwrap and burn WAssets they own and
        // send them to someone else
        // userInfo[_to].amount=userInfo[_to].amount-_amount;
        _burn(msg.sender, _amount);
        Qtoken.transfer(_to, _amount);
    }

```
