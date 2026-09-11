# Context: TwapOracle.getRate

**Contract:** `TwapOracle` (Inherits: Ownable, Context)
**Signature:** `getRate() returns (uint256)`
**Method Selector ID:** `0x679aefce`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER
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
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - tUSDInUSDV = consult(USDV)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - tUSDInVader = consult(VADER)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - result = tUSDInUSDV / tUSDInVader"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - result"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/twap/TwapOracle.sol` on lines **162** to **167**

```solidity
    function getRate() public view returns (uint256 result) {
        uint256 tUSDInUSDV = consult(USDV);
        uint256 tUSDInVader = consult(VADER);

        result = tUSDInUSDV / tUSDInVader;
    }

```
