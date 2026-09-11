# Context: Repayments.repay

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `repay(address,uint256)`
**Method Selector ID:** `0x22867d78`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          // On the first call to nonReentrant, _notEntered will be true
          require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
  
          // Any calls to nonReentrant after this point will fail
          _status = _ENTERED;
  
          _;
  
          // By storing the original value once again, a refund is triggered (see
          // https://eips.ethereum.org/EIPS/eip-2200)
          _status = _NOT_ENTERED;
      }
  ```
- `isPoolInitialized`
  ```solidity
  modifier isPoolInitialized(address _poolID) {
          require(repayConstants[_poolID].numberOfTotalRepayments != 0, 'Pool is not Initiliazed');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** repayConstants
- **Writes:** None

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
    Node_1["1: NodeType.VARIABLE - _asset = repayConstants(_poolID).repayAsset"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _amountRepaid = _repay(_poolID,_amount,false)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _transferTokens(msg.sender,_poolID,_asset,_amountRepaid)"]
    Node_4["4: NodeType.EXPRESSION - nonReentrant()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - isPoolInitialized(_poolID)"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **317** to **322**

```solidity
    function repay(address _poolID, uint256 _amount) external payable nonReentrant isPoolInitialized(_poolID) {
        address _asset = repayConstants[_poolID].repayAsset;
        uint256 _amountRepaid = _repay(_poolID, _amount, false);

        _transferTokens(msg.sender, _poolID, _asset, _amountRepaid);
    }

```
