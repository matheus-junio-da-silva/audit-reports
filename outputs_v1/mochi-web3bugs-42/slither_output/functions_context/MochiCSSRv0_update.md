# Context: MochiCSSRv0.update

**Contract:** `MochiCSSRv0` (Inherits: ICSSRRouter)
**Signature:** `update(address,bytes) returns (float)`
**Method Selector ID:** `0x02a688ed`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** blueChip, defaultPriceSource, fiatPriceAdapter, priceSource
- **Writes:** lastPrice

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICSSRAdapter.TMP_35(float) = HIGH_LEVEL_CALL, dest:priceAdapter(ICSSRAdapter), function:update, arguments:['_asset', '_data']  `
- `ICSSRAdapter.TMP_29(float) = HIGH_LEVEL_CALL, dest:fiatPriceAdapter(ICSSRAdapter), function:getPrice, arguments:['_asset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - blueChip(_asset)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - fiatPriceAdapter.getPrice(_asset)"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - priceAdapter = ICSSRAdapter(priceSource(_asset))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - address(priceAdapter) == address(0)"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - priceAdapter = ICSSRAdapter(defaultPriceSource)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - price = priceAdapter.update(_asset,_data)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - lastPrice(_asset) = price"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - price"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/MochiCSSRv0.sol` on lines **93** to **107**

```solidity
    function update(address _asset, bytes memory _data)
        external
        override
        returns (float memory price)
    {
        if (blueChip[_asset]) {
            return fiatPriceAdapter.getPrice(_asset);
        }
        ICSSRAdapter priceAdapter = ICSSRAdapter(priceSource[_asset]);
        if (address(priceAdapter) == address(0)) {
            priceAdapter = ICSSRAdapter(defaultPriceSource);
        }
        price = priceAdapter.update(_asset, _data);
        lastPrice[_asset] = price;
    }

```
