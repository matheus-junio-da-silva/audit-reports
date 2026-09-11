# Context: MochiVault.increase

**Contract:** `MochiVault` (Inherits: IERC3156FlashLender, IMochiVault, Initializable)
**Signature:** `increase(uint256,uint256,uint256,address,bytes)`
**Method Selector ID:** `0xcc3d63db`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
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
    Node_1["1: NodeType.IF - _id == type()(uint256).max"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _id = mint(msg.sender,_referrer)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _deposits > 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - deposit(_id,_deposits)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _borrows > 0"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - borrow(_id,_borrows,_data)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVault.sol` on lines **113** to **130**

```solidity
    function increase(
        uint256 _id,
        uint256 _deposits,
        uint256 _borrows,
        address _referrer,
        bytes memory _data
    ) external {
        if (_id == type(uint256).max) {
            // mint if _id is -1
            _id = mint(msg.sender, _referrer);
        }
        if (_deposits > 0) {
            deposit(_id, _deposits);
        }
        if (_borrows > 0) {
            borrow(_id, _borrows, _data);
        }
    }

```
