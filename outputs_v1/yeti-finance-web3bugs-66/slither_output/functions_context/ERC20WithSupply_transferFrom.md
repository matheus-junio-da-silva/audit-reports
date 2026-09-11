# Context: ERC20WithSupply.transferFrom

**Contract:** `ERC20WithSupply` (Inherits: ERC20, Domain, IERC20)
**Signature:** `transferFrom(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x23b872dd`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** allowance, balanceOf
- **Writes:** allowance, balanceOf

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(srcBalance >= amount,ERC20: balance too low)`
- require/assert: `require(bool,string)(spenderAllowance >= amount,ERC20: allowance too low)`
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
    Node_1["1: NodeType.IF - amount != 0"]
    Node_1 --> Node_2
    Node_1 --> Node_14
    Node_2["2: NodeType.VARIABLE - srcBalance = balanceOf(from)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(srcBalance >= amount,ERC20: balance too low)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - from != to"]
    Node_4 --> Node_5
    Node_4 --> Node_13
    Node_5["5: NodeType.VARIABLE - spenderAllowance = allowance(from)(msg.sender)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - spenderAllowance != type()(uint256).max"]
    Node_6 --> Node_7
    Node_6 --> Node_9
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(spenderAllowance >= amount,ERC20: allowance too low)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - allowance(from)(msg.sender) = spenderAllowance - amount"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - require(bool,string)(to != address(0),ERC20: no zero address)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - balanceOf(from) = srcBalance - amount"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - balanceOf(to) += amount"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - Transfer(from,to,amount)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/ERC20.sol` on lines **55** to **80**

```solidity
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        // If `amount` is 0, or `from` is `to` nothing happens
        if (amount != 0) {
            uint256 srcBalance = balanceOf[from];
            require(srcBalance >= amount, "ERC20: balance too low");

            if (from != to) {
                uint256 spenderAllowance = allowance[from][msg.sender];
                // If allowance is infinite, don't decrease it to save on gas (breaks with EIP-20).
                if (spenderAllowance != type(uint256).max) {
                    require(spenderAllowance >= amount, "ERC20: allowance too low");
                    allowance[from][msg.sender] = spenderAllowance - amount; // Underflow is checked
                }
                require(to != address(0), "ERC20: no zero address"); // Moved down so other failed calls safe some gas

                balanceOf[from] = srcBalance - amount; // Underflow is checked
                balanceOf[to] += amount;
            }
        }
        emit Transfer(from, to, amount);
        return true;
    }

```
