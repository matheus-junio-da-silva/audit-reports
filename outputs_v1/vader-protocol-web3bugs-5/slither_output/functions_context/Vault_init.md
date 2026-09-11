# Context: Vault.init

**Contract:** `Vault` (Inherits: None)
**Signature:** `init(address,address,address,address,address)`
**Method Selector ID:** `0x359ef75b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** FACTORY, POOLS, ROUTER, USDV, VADER, erasToEarn, inited, minGrantTime, minimumDepositTime

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(inited == false)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool)(inited == false)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - inited = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - POOLS = _pool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - VADER = _vader"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - USDV = _usdv"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - ROUTER = _router"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - FACTORY = _factory"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - POOLS = _pool"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - erasToEarn = 100"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - minimumDepositTime = 1"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - minGrantTime = 2592000"]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **45** to **57**

```solidity
    function init(address _vader, address _usdv, address _router, address _factory, address _pool) public {
        require(inited == false);
        inited = true;
        POOLS = _pool;
        VADER = _vader;
        USDV = _usdv;
        ROUTER = _router;
        FACTORY = _factory;
        POOLS = _pool;
        erasToEarn = 100;
        minimumDepositTime = 1;
        minGrantTime = 2592000;     // 30 days
    }

```
