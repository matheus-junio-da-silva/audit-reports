# Context: PoolFactory._deploy

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_deploy(uint256,bytes32,bytes) returns (address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(bytecode.length != 0,Create2: bytecode length is zero)`
- require/assert: `require(bool,string)(addr != address(0),Create2: Failed on deploy)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(bytecode.length != 0,Create2: bytecode length is zero)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - addr = create2(uint256,uint256,uint256,uint256)(amount,bytecode + 0x20,mload(uint256)(bytecode),salt)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDASSEMBLY - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(addr != address(0),Create2: Failed on deploy)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - addr"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **404** to **415**

```solidity
    function _deploy(
        uint256 amount,
        bytes32 salt,
        bytes memory bytecode
    ) internal returns (address addr) {
        require(bytecode.length != 0, 'Create2: bytecode length is zero');
        // solhint-disable-next-line no-inline-assembly
        assembly {
            addr := create2(amount, add(bytecode, 0x20), mload(bytecode), salt)
        }
        require(addr != address(0), 'Create2: Failed on deploy');
    }

```
