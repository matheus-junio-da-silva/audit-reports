# Context: MochiVault.flashFee

**Contract:** `MochiVault` (Inherits: IERC3156FlashLender, IMochiVault, Initializable)
**Signature:** `flashFee(address,uint256) returns (uint256)`
**Method Selector ID:** `0xd9d98ce4`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** asset
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_token == address(asset),!supported)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_token == address(asset),!supported)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - (_amount * 1337) / 1000000"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVault.sol` on lines **345** to **354**

```solidity
    function flashFee(address _token, uint256 _amount)
        public
        view
        override
        returns (uint256)
    {
        //should return 0.1337% * _amount;
        require(_token == address(asset), "!supported");
        return (_amount * 1337) / 1000000;
    }

```
