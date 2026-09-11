# Context: RCTreasury.refundUser

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `refundUser(address,uint256)`
**Method Selector ID:** `0xeea758f1`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyMarkets`
  ```solidity
  modifier onlyMarkets {
          require(isMarket[msgSender()], "Not authorised");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** isForeclosed, marketBalance, minRentalDayDivisor, totalDeposits, user
- **Writes:** isForeclosed, marketBalance, totalDeposits, user

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeCast.TMP_1667(uint128) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint128(uint256), arguments:['_refund'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_9
    Node_1["1: NodeType.EXPRESSION - marketBalance -= _refund"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - user(_user).deposit += SafeCast.toUint128(_refund)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - totalDeposits += _refund"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogAdjustDeposit(_user,_refund,true)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - isForeclosed(_user) && user(_user).deposit > user(_user).bidRate / minRentalDayDivisor"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - isForeclosed(_user) = false"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - LogUserForeclosed(_user,false)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_9["9: NodeType.EXPRESSION - onlyMarkets()"]
    Node_9 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **447** to **463**

```solidity
    function refundUser(address _user, uint256 _refund)
        external
        override
        onlyMarkets
    {
        marketBalance -= _refund;
        user[_user].deposit += SafeCast.toUint128(_refund);
        totalDeposits += _refund;
        emit LogAdjustDeposit(_user, _refund, true);
        if (
            isForeclosed[_user] &&
            user[_user].deposit > user[_user].bidRate / minRentalDayDivisor
        ) {
            isForeclosed[_user] = false;
            emit LogUserForeclosed(_user, false);
        }
    }

```
