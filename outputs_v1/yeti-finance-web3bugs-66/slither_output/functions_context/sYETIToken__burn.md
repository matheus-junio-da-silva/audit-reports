# Context: sYETIToken._burn

**Contract:** `sYETIToken` (Inherits: BoringOwnable, BoringOwnableData, Domain, IERC20)
**Signature:** `_burn(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** effectiveYetiTokenBalance, totalSupply, users, yetiToken
- **Writes:** effectiveYetiTokenBalance, totalSupply, users

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(to != address(0),Zero address)`
- require/assert: `require(bool,string)(block.timestamp >= user.lockedUntil,Locked)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYETIToken.TMP_316(bool) = HIGH_LEVEL_CALL, dest:yetiToken(IYETIToken), function:transfer, arguments:['to', 'amount']  `
- `BoringMath.TMP_314(uint128) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.to128(uint256), arguments:['shares'] `
- `BoringMath.TMP_317(uint256) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.sub(uint256,uint256), arguments:['effectiveYetiTokenBalance', 'amount'] `
- `BoringMath128.TMP_315(uint128) = LIBRARY_CALL, dest:BoringMath128, function:BoringMath128.sub(uint128,uint128), arguments:['REF_111', 'TMP_314'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(to != address(0),Zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - user = users(from)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(block.timestamp >= user.lockedUntil,Locked)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - amount = (shares * effectiveYetiTokenBalance) / totalSupply"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - users(from).balance = user.balance.sub(shares.to128())"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - totalSupply -= shares"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - yetiToken.transfer(to,amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - effectiveYetiTokenBalance = effectiveYetiTokenBalance.sub(amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - Transfer(from,address(0),shares)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/sYETIToken.sol` on lines **210** to **226**

```solidity
    function _burn(
        address from,
        address to,
        uint256 shares
    ) internal {
        require(to != address(0), "Zero address");
        User memory user = users[from];
        require(block.timestamp >= user.lockedUntil, "Locked");
        uint256 amount = (shares * effectiveYetiTokenBalance) / totalSupply;
        users[from].balance = user.balance.sub(shares.to128()); // Must check underflow
        totalSupply -= shares;

        yetiToken.transfer(to, amount);
        effectiveYetiTokenBalance = effectiveYetiTokenBalance.sub(amount);

        emit Transfer(from, address(0), shares);
    }

```
