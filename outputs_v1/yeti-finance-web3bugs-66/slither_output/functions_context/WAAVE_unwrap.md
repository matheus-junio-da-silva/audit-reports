# Context: WAAVE.unwrap

**Contract:** `WAAVE` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `unwrap(uint256)`
**Method Selector ID:** `0xde0e9a3e`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** aToken
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_65(bool) = HIGH_LEVEL_CALL, dest:aToken(IERC20), function:transfer, arguments:['msg.sender', 'TMP_64']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _burn(msg.sender,_amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - aToken.transfer(msg.sender,_amount * aavePerShare() / 1e18)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WAAVE.sol` on lines **100** to **103**

```solidity
    function unwrap(uint _amount) external override {
        _burn(msg.sender, _amount);
        aToken.transfer(msg.sender, _amount*aavePerShare()/1e18);
    }

```
