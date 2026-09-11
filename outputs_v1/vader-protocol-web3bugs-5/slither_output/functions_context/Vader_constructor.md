# Context: Vader.constructor

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `constructor()`
**Method Selector ID:** `0x90fa17bb`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _1m, decimals, secondsPerEra
- **Writes:** DAO, _1m, baseline, burnAddress, currentEra, decimals, emissionCurve, maxSupply, name, nextEraTime, secondsPerEra, symbol, totalSupply

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
    Node_1["1: NodeType.EXPRESSION - name = VADER PROTOCOL TOKEN"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - symbol = VADER"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - decimals = 18"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _1m = 10 ** 6 * 10 ** decimals"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - baseline = _1m"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - totalSupply = 0"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - maxSupply = 2 * _1m"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - currentEra = 1"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - secondsPerEra = 1"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - nextEraTime = block.timestamp + secondsPerEra"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - emissionCurve = 900"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - DAO = msg.sender"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - burnAddress = 0x0111011001100001011011000111010101100101"]
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **58** to **72**

```solidity
    constructor() {
        name = 'VADER PROTOCOL TOKEN';
        symbol = 'VADER';
        decimals = 18;
        _1m = 10**6 * 10 ** decimals; //1m
        baseline = _1m;
        totalSupply = 0;
        maxSupply = 2 * _1m;
        currentEra = 1;
        secondsPerEra = 1; //86400;
        nextEraTime = block.timestamp + secondsPerEra;
        emissionCurve = 900;
        DAO = msg.sender;
        burnAddress = 0x0111011001100001011011000111010101100101;
    }

```
