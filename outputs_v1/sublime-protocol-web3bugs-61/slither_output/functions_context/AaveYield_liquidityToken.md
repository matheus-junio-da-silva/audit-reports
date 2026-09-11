# Context: AaveYield.liquidityToken

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `liquidityToken(address) returns (address)`
**Method Selector ID:** `0x1391abc7`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** protocolDataProvider, wethGateway
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWETHGateway.TMP_3448(address) = HIGH_LEVEL_CALL, dest:TMP_3447(IWETHGateway), function:getAWETHAddress, arguments:[]  `
- `IProtocolDataProvider.TUPLE_35(address,address,address) = HIGH_LEVEL_CALL, dest:TMP_3449(IProtocolDataProvider), function:getReserveTokensAddresses, arguments:['asset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - asset == address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - aToken = IWETHGateway(wethGateway).getAWETHAddress()"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - (aToken,None,None) = IProtocolDataProvider(protocolDataProvider).getReserveTokensAddresses(asset)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - aToken"]
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **103** to **109**

```solidity
    function liquidityToken(address asset) public view override returns (address aToken) {
        if (asset == address(0)) {
            aToken = IWETHGateway(wethGateway).getAWETHAddress();
        } else {
            (aToken, , ) = IProtocolDataProvider(protocolDataProvider).getReserveTokensAddresses(asset);
        }
    }

```
