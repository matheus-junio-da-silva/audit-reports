# Context: YUSDTokenCaller.yusdSendToPool

**Contract:** `YUSDTokenCaller` (Inherits: None)
**Signature:** `yusdSendToPool(address,address,uint256)`
**Method Selector ID:** `0xf1905ecb`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** YUSD
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYUSDToken.HIGH_LEVEL_CALL, dest:YUSD(IYUSDToken), function:sendToPool, arguments:['_sender', '_poolAddress', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - YUSD.sendToPool(_sender,_poolAddress,_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/LUSDTokenCaller.sol` on lines **22** to **24**

```solidity
    function yusdSendToPool(address _sender,  address _poolAddress, uint256 _amount) external {
        YUSD.sendToPool(_sender, _poolAddress, _amount);
    }

```
