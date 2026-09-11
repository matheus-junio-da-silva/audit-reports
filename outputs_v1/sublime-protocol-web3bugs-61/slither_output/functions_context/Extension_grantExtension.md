# Context: Extension.grantExtension

**Contract:** `Extension` (Inherits: IExtension, Initializable)
**Signature:** `grantExtension(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** extensions, poolFactory
- **Writes:** extensions

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRepayment.HIGH_LEVEL_CALL, dest:_repayment(IRepayment), function:instalmentDeadlineExtended, arguments:['_pool']  `
- `IPoolFactory.TMP_1393(address) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:repaymentImpl, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _poolFactory = poolFactory"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _repayment = IRepayment(_poolFactory.repaymentImpl())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - extensions(_pool).hasExtensionPassed = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - extensions(_pool).extensionVoteEndTime = block.timestamp"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _repayment.instalmentDeadlineExtended(_pool)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - ExtensionPassed(_pool)"]
```

### Source Mapping
Declared in: `contracts/Pool/Extension.sol` on lines **159** to **169**

```solidity
    function grantExtension(address _pool) internal {
        IPoolFactory _poolFactory = poolFactory;
        IRepayment _repayment = IRepayment(_poolFactory.repaymentImpl());

        extensions[_pool].hasExtensionPassed = true;
        extensions[_pool].extensionVoteEndTime = block.timestamp; // voting is over

        _repayment.instalmentDeadlineExtended(_pool);

        emit ExtensionPassed(_pool);
    }

```
