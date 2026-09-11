# Context: WBQI._transferFrom

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `_transferFrom(address,address,uint256) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** allowed, balances
- **Writes:** allowed, balances

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
    Node_1["1: NodeType.EXPRESSION - balances(_from) = balances(_from) - _amount"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - allowed(_from)(msg.sender) = allowed(_from)(msg.sender) - _amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - balances(_to) = balances(_to) + _amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(_from,_to,_amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/ERC20_8.sol` on lines **117** to **123**

```solidity
    function _transferFrom(address _from, address _to, uint _amount) internal returns (bool) {
        balances[_from] = balances[_from] - _amount;
        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _amount;
        balances[_to] = balances[_to] + _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }

```
