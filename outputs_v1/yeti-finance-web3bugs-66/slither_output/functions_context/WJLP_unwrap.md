# Context: WJLP.unwrap

**Contract:** `WJLP` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `unwrap(uint256)`
**Method Selector ID:** `0xde0e9a3e`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** JLP, _MasterChefJoe, _poolPid
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['JLP', 'msg.sender', '_amount'] `
- `IMasterChefJoeV2.HIGH_LEVEL_CALL, dest:_MasterChefJoe(IMasterChefJoeV2), function:withdraw, arguments:['_poolPid', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _sendJoeReward(msg.sender,msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _userUpdate(msg.sender,_amount,false)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _MasterChefJoe.withdraw(_poolPid,_amount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _burn(msg.sender,_amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - JLP.safeTransfer(msg.sender,_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WJLP.sol` on lines **173** to **188**

```solidity
    function unwrap(uint _amount) external override {
        // Claim pending reward for unwrapper
        _sendJoeReward(msg.sender, msg.sender);

        // Decrease rewards by the same amount user is unwrapping. Ensures they have enough reward balance. 
        _userUpdate(msg.sender, _amount, false);

        // Withdraw LP tokens from Master chef contract
        _MasterChefJoe.withdraw(_poolPid, _amount);
        
        // Rid of WJLP tokens from wallet 
        _burn(msg.sender, _amount);

        // Transfer withdrawn JLP tokens to withdrawer. 
        JLP.safeTransfer(msg.sender, _amount);
    }

```
