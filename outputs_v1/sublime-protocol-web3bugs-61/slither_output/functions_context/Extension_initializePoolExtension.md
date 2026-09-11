# Context: Extension.initializePoolExtension

**Contract:** `Extension` (Inherits: IExtension, Initializable)
**Signature:** `initializePoolExtension(uint256)`
**Method Selector ID:** `0xb5a70cea`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** extensions, poolFactory
- **Writes:** extensions

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(extensions[msg.sender].repaymentInterval == 0,Extension::initializePoolExtension - already initialized)`
- require/assert: `require(bool,string)(_poolFactory.poolRegistry(msg.sender),Repayments::onlyValidPool - Invalid Pool)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPoolFactory.TMP_1357(bool) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:poolRegistry, arguments:['msg.sender']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _poolFactory = poolFactory"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(extensions(msg.sender).repaymentInterval == 0,Extension::initializePoolExtension - already initialized)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_poolFactory.poolRegistry(msg.sender),Repayments::onlyValidPool - Invalid Pool)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - extensions(msg.sender).repaymentInterval = _repaymentInterval"]
```

### Source Mapping
Declared in: `contracts/Pool/Extension.sol` on lines **68** to **73**

```solidity
    function initializePoolExtension(uint256 _repaymentInterval) external override {
        IPoolFactory _poolFactory = poolFactory;
        require(extensions[msg.sender].repaymentInterval == 0, 'Extension::initializePoolExtension - already initialized');
        require(_poolFactory.poolRegistry(msg.sender), 'Repayments::onlyValidPool - Invalid Pool');
        extensions[msg.sender].repaymentInterval = _repaymentInterval;
    }

```
