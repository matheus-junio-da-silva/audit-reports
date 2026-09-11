# Context: WJLPRouter.constructor

**Contract:** `WJLPRouter` (Inherits: IYetiRouter)
**Signature:** `constructor(address,address,address,address,address)`
**Method Selector ID:** `0x5607425a`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** WJLP
- **Writes:** JLPAddress, WJLP, WJLPAddress, activePoolAddress, joeZapper, yusdTokenAddress

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_26(bool) = HIGH_LEVEL_CALL, dest:TMP_22(IERC20), function:approve, arguments:['TMP_23', 'TMP_25']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - activePoolAddress = _activePoolAddress"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - JLPAddress = _JLPAddress"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - WJLPAddress = _WJLPAddress"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - WJLP = IWAsset(_WJLPAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - joeZapper = IJoeZapper(_joeZapperAddress)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - yusdTokenAddress = _yusdTokenAddress"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - IERC20(_WJLPAddress).approve(address(WJLP),2 ** 256 - 1)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Routers/WJLPRouter.sol` on lines **21** to **36**

```solidity
    constructor(
        address _activePoolAddress,
        address _JLPAddress,
        address _WJLPAddress,
        address _joeZapperAddress,
        address _yusdTokenAddress
    ) public {
        activePoolAddress = _activePoolAddress;
        JLPAddress = _JLPAddress;
        WJLPAddress = _WJLPAddress;
        WJLP = IWAsset(_WJLPAddress);
        joeZapper = IJoeZapper(_joeZapperAddress);
        yusdTokenAddress = _yusdTokenAddress;
        // Approve the WJLP contract to take any of this contract's JLP tokens.
        IERC20(_WJLPAddress).approve(address(WJLP), 2**256 - 1);
    }

```
