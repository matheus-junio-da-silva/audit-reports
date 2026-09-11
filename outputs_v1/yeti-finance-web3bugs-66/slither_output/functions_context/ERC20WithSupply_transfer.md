# Context: ERC20WithSupply.transfer

**Contract:** `ERC20WithSupply` (Inherits: ERC20, Domain, IERC20)
**Signature:** `transfer(address,uint256) returns (bool)`
**Method Selector ID:** `0xa9059cbb`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balanceOf
- **Writes:** balanceOf

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(srcBalance >= amount,ERC20: balance too low)`
- require/assert: `require(bool,string)(to != address(0),ERC20: no zero address)`

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
    Node_1["1: NodeType.IF - amount != 0 || msg.sender == to"]
    Node_1 --> Node_2
    Node_1 --> Node_9
    Node_2["2: NodeType.VARIABLE - srcBalance = balanceOf(msg.sender)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(srcBalance >= amount,ERC20: balance too low)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - msg.sender != to"]
    Node_4 --> Node_5
    Node_4 --> Node_8
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(to != address(0),ERC20: no zero address)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - balanceOf(msg.sender) = srcBalance - amount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - balanceOf(to) += amount"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - Transfer(msg.sender,to,amount)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/ERC20.sol` on lines **34** to **48**

```solidity
    function transfer(address to, uint256 amount) public returns (bool) {
        // If `amount` is 0, or `msg.sender` is `to` nothing happens
        if (amount != 0 || msg.sender == to) {
            uint256 srcBalance = balanceOf[msg.sender];
            require(srcBalance >= amount, "ERC20: balance too low");
            if (msg.sender != to) {
                require(to != address(0), "ERC20: no zero address"); // Moved down so low balance calls safe some gas

                balanceOf[msg.sender] = srcBalance - amount; // Underflow is checked
                balanceOf[to] += amount;
            }
        }
        emit Transfer(msg.sender, to, amount);
        return true;
    }

```
