# Context: ERC20WithSupply._mint

**Contract:** `ERC20WithSupply` (Inherits: ERC20, Domain, IERC20)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balanceOf, totalSupply
- **Writes:** balanceOf, totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(newTotalSupply >= totalSupply,Mint overflow)`

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
    Node_1["1: NodeType.VARIABLE - newTotalSupply = totalSupply + amount"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(newTotalSupply >= totalSupply,Mint overflow)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - totalSupply = newTotalSupply"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - balanceOf(user) += amount"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Transfer(address(0),user,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/ERC20.sol` on lines **139** to **145**

```solidity
    function _mint(address user, uint256 amount) internal {
        uint256 newTotalSupply = totalSupply + amount;
        require(newTotalSupply >= totalSupply, "Mint overflow");
        totalSupply = newTotalSupply;
        balanceOf[user] += amount;
        emit Transfer(address(0), user, amount);
    }

```
