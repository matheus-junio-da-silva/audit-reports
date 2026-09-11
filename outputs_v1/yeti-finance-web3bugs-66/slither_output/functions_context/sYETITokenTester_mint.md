# Context: sYETITokenTester.mint

**Contract:** `sYETITokenTester` (Inherits: sYETIToken, BoringOwnable, BoringOwnableData, Domain, IERC20)
**Signature:** `mint(uint256) returns (bool)`
**Method Selector ID:** `0xa0712d68`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** LOCK_TIME, effectiveYetiTokenBalance, totalSupply, users, yetiToken
- **Writes:** effectiveYetiTokenBalance, totalSupply, users

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `BoringMath.TMP_47(uint256) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.add(uint256,uint256), arguments:['effectiveYetiTokenBalance', 'amount'] `
- `IYETIToken.HIGH_LEVEL_CALL, dest:yetiToken(IYETIToken), function:sendToSYETI, arguments:['msg.sender', 'amount']  `
- `BoringMath.TMP_43(uint128) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.to128(uint256), arguments:['shares'] `
- `BoringMath.TMP_45(uint128) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.to128(uint256), arguments:['TMP_44'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - user = users(msg.sender)"]
    Node_1 --> Node_11
    Node_3["3: NodeType.EXPRESSION - user.balance += shares.to128()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - user.lockedUntil = (block.timestamp + LOCK_TIME).to128()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - users(msg.sender) = user"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - totalSupply += shares"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - yetiToken.sendToSYETI(msg.sender,amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - effectiveYetiTokenBalance = effectiveYetiTokenBalance.add(amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - Transfer(address(0),msg.sender,shares)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - true"]
    Node_11["11: NodeType.IF - totalSupply == 0"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - shares = amount"]
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - shares = (amount * totalSupply) / effectiveYetiTokenBalance"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_3
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/sYETIToken.sol` on lines **194** to **208**

```solidity
    function mint(uint256 amount) public returns (bool) {
        User memory user = users[msg.sender];

        uint256 shares = totalSupply == 0 ? amount : (amount * totalSupply) / effectiveYetiTokenBalance;
        user.balance += shares.to128();
        user.lockedUntil = (block.timestamp + LOCK_TIME).to128();
        users[msg.sender] = user;
        totalSupply += shares;

        yetiToken.sendToSYETI(msg.sender, amount);
        effectiveYetiTokenBalance = effectiveYetiTokenBalance.add(amount);

        emit Transfer(address(0), msg.sender, shares);
        return true;
    }

```
