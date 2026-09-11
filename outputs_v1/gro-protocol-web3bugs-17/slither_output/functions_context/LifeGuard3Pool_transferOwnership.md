# Context: LifeGuard3Pool.transferOwnership

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `transferOwnership(address)`
**Method Selector ID:** `0xf2fde38b`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** _owner
- **Writes:** _owner

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(newOwner != address(0),Ownable: new owner is the zero address)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(newOwner != address(0),Ownable: new owner is the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - OwnershipTransferred(_owner,newOwner)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _owner = newOwner"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/node_modules/@openzeppelin/contracts/access/Ownable.sol` on lines **63** to **67**

```solidity
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

```
