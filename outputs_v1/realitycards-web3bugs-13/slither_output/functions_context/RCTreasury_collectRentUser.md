# Context: RCTreasury.collectRentUser

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `collectRentUser(address,uint256) returns (uint256)`
**Method Selector ID:** `0xa4a5734f`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** globalPause, user
- **Writes:** isForeclosed, user

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! globalPause,Global pause is enabled)`
- require/assert: `assert(bool)(_timeToCollectTo != 0)`
- require/assert: `assert(bool)(user[_user].deposit == 0)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeCast.TMP_1750(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['newTimeLastCollectedOnForeclosure'] `
- `SafeCast.TMP_1755(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['_timeToCollectTo'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! globalPause,Global pause is enabled)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - assert(bool)(_timeToCollectTo != 0)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - user(_user).lastRentCalc < _timeToCollectTo"]
    Node_3 --> Node_4
    Node_3 --> Node_19
    Node_4["4: NodeType.VARIABLE - rentOwedByUser = rentOwedUser(_user,_timeToCollectTo)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - rentOwedByUser > 0 && rentOwedByUser > user(_user).deposit"]
    Node_5 --> Node_6
    Node_5 --> Node_15
    Node_6["6: NodeType.VARIABLE - previousCollectionTime = user(_user).lastRentCalc"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - timeUsersDepositLasts = ((_timeToCollectTo - previousCollectionTime) * uint256(user(_user).deposit)) / rentOwedByUser"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - rentOwedByUser = uint256(user(_user).deposit)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - newTimeLastCollectedOnForeclosure = previousCollectionTime + timeUsersDepositLasts"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _increaseMarketBalance(rentOwedByUser,_user)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - user(_user).lastRentCalc = SafeCast.toUint64(newTimeLastCollectedOnForeclosure)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - assert(bool)(user(_user).deposit == 0)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - isForeclosed(_user) = true"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - LogUserForeclosed(_user,true)"]
    Node_14 --> Node_17
    Node_15["15: NodeType.EXPRESSION - _increaseMarketBalance(rentOwedByUser,_user)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - user(_user).lastRentCalc = SafeCast.toUint64(_timeToCollectTo)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - LogAdjustDeposit(_user,rentOwedByUser,false)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.RETURN - newTimeLastCollectedOnForeclosure"]
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **703** to **745**

```solidity
    function collectRentUser(address _user, uint256 _timeToCollectTo)
        public
        override
        returns (uint256 newTimeLastCollectedOnForeclosure)
    {
        require(!globalPause, "Global pause is enabled");
        assert(_timeToCollectTo != 0);
        if (user[_user].lastRentCalc < _timeToCollectTo) {
            uint256 rentOwedByUser = rentOwedUser(_user, _timeToCollectTo);

            if (rentOwedByUser > 0 && rentOwedByUser > user[_user].deposit) {
                // The User has run out of deposit already.
                uint256 previousCollectionTime = user[_user].lastRentCalc;

                /*
            timeTheirDepsitLasted = timeSinceLastUpdate * (usersDeposit/rentOwed)
                                  = (now - previousCollectionTime) * (usersDeposit/rentOwed)
            */
                uint256 timeUsersDepositLasts =
                    ((_timeToCollectTo - previousCollectionTime) *
                        uint256(user[_user].deposit)) / rentOwedByUser;
                /*
            Users last collection time = previousCollectionTime + timeTheirDepsitLasted
            */
                rentOwedByUser = uint256(user[_user].deposit);
                newTimeLastCollectedOnForeclosure =
                    previousCollectionTime +
                    timeUsersDepositLasts;
                _increaseMarketBalance(rentOwedByUser, _user);
                user[_user].lastRentCalc = SafeCast.toUint64(
                    newTimeLastCollectedOnForeclosure
                );
                assert(user[_user].deposit == 0);
                isForeclosed[_user] = true;
                emit LogUserForeclosed(_user, true);
            } else {
                // User has enough deposit to pay rent.
                _increaseMarketBalance(rentOwedByUser, _user);
                user[_user].lastRentCalc = SafeCast.toUint64(_timeToCollectTo);
            }
            emit LogAdjustDeposit(_user, rentOwedByUser, false);
        }
    }

```
