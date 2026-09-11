# Context: MochiVault.liquidate

**Contract:** `MochiVault` (Inherits: IERC3156FlashLender, IMochiVault, Initializable)
**Signature:** `liquidate(uint256,uint256,uint256)`
**Method Selector ID:** `0x20dc2088`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `updateDebt`
  ```solidity
  modifier updateDebt(uint256 _id) {
          accrueDebt(_id);
          _;
      }
  ```

### State Variables Interaction
- **Reads:** asset, debts, details, engine
- **Writes:** debts, details

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == address(engine.liquidator()),!liquidator)`
- require/assert: `require(bool,string)(engine.nft().asset(_id) == address(asset),!asset)`
- require/assert: `require(bool,string)(_liquidatable(details[_id].collateral,price,currentDebt(_id)),healthy)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICSSRRouter.TMP_174(float) = HIGH_LEVEL_CALL, dest:TMP_172(ICSSRRouter), function:getPrice, arguments:['TMP_173']  `
- `IMochiNFT.TMP_168(address) = HIGH_LEVEL_CALL, dest:TMP_167(IMochiNFT), function:asset, arguments:['_id']  `
- `CheapERC20.LIBRARY_CALL, dest:CheapERC20, function:CheapERC20.cheapTransfer(IERC20,address,uint256), arguments:['asset', 'msg.sender', '_collateral'] `
- `IMochiEngine.TMP_163(ILiquidator) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:liquidator, arguments:[]  `
- `IMochiEngine.TMP_172(ICSSRRouter) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:cssr, arguments:[]  `
- `IMochiEngine.TMP_167(IMochiNFT) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:nft, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_9
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == address(engine.liquidator()),!liquidator)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(engine.nft().asset(_id) == address(asset),!asset)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - price = engine.cssr().getPrice(address(asset))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_liquidatable(details(_id).collateral,price,currentDebt(_id)),healthy)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - debts -= _usdm"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - details(_id).collateral -= _collateral"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - details(_id).debt -= _usdm"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - asset.cheapTransfer(msg.sender,_collateral)"]
    Node_9["9: NodeType.EXPRESSION - updateDebt(_id)"]
    Node_9 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVault.sol` on lines **277** to **296**

```solidity
    function liquidate(
        uint256 _id,
        uint256 _collateral,
        uint256 _usdm
    ) external override updateDebt(_id) {
        require(msg.sender == address(engine.liquidator()), "!liquidator");
        require(engine.nft().asset(_id) == address(asset), "!asset");
        float memory price = engine.cssr().getPrice(address(asset));
        require(
            _liquidatable(details[_id].collateral, price, currentDebt(_id)),
            "healthy"
        );

        debts -= _usdm;

        details[_id].collateral -= _collateral;
        details[_id].debt -= _usdm;

        asset.cheapTransfer(msg.sender, _collateral);
    }

```
