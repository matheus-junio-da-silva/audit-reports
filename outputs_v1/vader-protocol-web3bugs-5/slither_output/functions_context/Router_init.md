# Context: Router.init

**Contract:** `Router` (Inherits: None)
**Signature:** `init(address,address,address)`
**Method Selector ID:** `0x184b9559`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** POOLS, USDV, VADER, anchorLimit, curatedPoolLimit, inited, insidePriceLimit, outsidePriceLimit, rewardReductionFactor, timeForFullProtection

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(inited == false,inited)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(inited == false,inited)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - inited = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - VADER = _vader"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - USDV = _usdv"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - POOLS = _pool"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - rewardReductionFactor = 1"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - timeForFullProtection = 1"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - curatedPoolLimit = 1"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - anchorLimit = 5"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - insidePriceLimit = 200"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - outsidePriceLimit = 500"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **77** to **89**

```solidity
    function init(address _vader, address _usdv, address _pool) public {
        require(inited == false,  "inited");
        inited = true;
        VADER = _vader;
        USDV = _usdv;
        POOLS = _pool;
        rewardReductionFactor = 1;
        timeForFullProtection = 1;//8640000; //100 days
        curatedPoolLimit = 1;
        anchorLimit = 5;
        insidePriceLimit = 200;
        outsidePriceLimit = 500;
    }

```
