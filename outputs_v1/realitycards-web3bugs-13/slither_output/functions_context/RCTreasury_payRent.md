# Context: RCTreasury.payRent

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `payRent(uint256) returns (bool)`
**Method Selector ID:** `0xd9e8843f`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `balancedBooks`
  ```solidity
  modifier balancedBooks {
          _;
          // using >= not == in case anyone sends tokens direct to contract
          require(
              erc20.balanceOf(address(this)) >=
                  totalDeposits + marketBalance + totalMarketPots,
              "Books are unbalanced!"
          );
      }
  ```
- `onlyMarkets`
  ```solidity
  modifier onlyMarkets {
          require(isMarket[msgSender()], "Not authorised");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** globalPause, marketBalance, marketBalanceDiscrepancy, marketPot, totalMarketPots
- **Writes:** marketBalance, marketBalanceDiscrepancy, marketPot, totalMarketPots

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! globalPause,Rentals are disabled)`

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
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! globalPause,Rentals are disabled)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - marketBalance < _amount"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.EXPRESSION - marketBalanceDiscrepancy += _amount - marketBalance"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _amount -= (_amount - marketBalance)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _market = msgSender()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - marketBalance -= _amount"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - marketPot(_market) += _amount"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - totalMarketPots += _amount"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - true"]
    Node_11["11: NodeType.EXPRESSION - balancedBooks()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - onlyMarkets()"]
    Node_12 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **406** to **424**

```solidity
    function payRent(uint256 _amount)
        external
        override
        balancedBooks
        onlyMarkets
        returns (bool)
    {
        require(!globalPause, "Rentals are disabled");
        if (marketBalance < _amount) {
            marketBalanceDiscrepancy += _amount - marketBalance;
            _amount -= (_amount - marketBalance);
        }
        address _market = msgSender();
        marketBalance -= _amount;
        marketPot[_market] += _amount;
        totalMarketPots += _amount;

        return true;
    }

```
