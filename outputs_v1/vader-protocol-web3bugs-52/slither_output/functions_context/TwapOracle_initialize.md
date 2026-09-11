# Context: TwapOracle.initialize

**Contract:** `TwapOracle` (Inherits: Ownable, Context)
**Signature:** `initialize(address,address)`
**Method Selector ID:** `0x485cc955`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          _checkOwner();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** USDV, VADER
- **Writes:** USDV, VADER

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(VADER == address(0),TwapOracle::initialize: Vader already set)`
- require/assert: `require(bool,string)(USDV == address(0),TwapOracle::initialize: USDV already set)`
- require/assert: `require(bool,string)(_usdv != address(0),TwapOracle::initialize: can not set to a zero address)`
- require/assert: `require(bool,string)(_vader != address(0),TwapOracle::initialize: can not set to a zero address)`

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
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(VADER == address(0),TwapOracle::initialize: Vader already set)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(USDV == address(0),TwapOracle::initialize: USDV already set)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_usdv != address(0),TwapOracle::initialize: can not set to a zero address)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_vader != address(0),TwapOracle::initialize: can not set to a zero address)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - VADER = _vader"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - USDV = _usdv"]
    Node_7["7: NodeType.EXPRESSION - onlyOwner()"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/twap/TwapOracle.sol` on lines **198** to **215**

```solidity
    function initialize(address _usdv, address _vader) external onlyOwner {
        require(
            VADER == address(0),
            "TwapOracle::initialize: Vader already set"
        );
        require(USDV == address(0), "TwapOracle::initialize: USDV already set");
        require(
            _usdv != address(0),
            "TwapOracle::initialize: can not set to a zero address"
        );
        require(
            _vader != address(0),
            "TwapOracle::initialize: can not set to a zero address"
        );

        VADER = _vader;
        USDV = _usdv;
    }

```
