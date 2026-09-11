# Context: DutchAuctionLiquidator.settleLiquidation

**Contract:** `DutchAuctionLiquidator` (Inherits: ILiquidator)
**Signature:** `settleLiquidation(uint256,uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** auctions, engine
- **Writes:** auctions

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(auction.boughtAt == 0,liquidated)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochiVault.TMP_51(IERC20) = HIGH_LEVEL_CALL, dest:vault(IMochiVault), function:asset, arguments:[]  `
- `IMochiEngine.TMP_46(IUSDM) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:usdm, arguments:[]  `
- `IMochiEngine.TMP_49(IUSDM) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:usdm, arguments:[]  `
- `IMochiEngine.TMP_55(IFeePool) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:feePool, arguments:[]  `
- `IUSDM.TMP_57(bool) = HIGH_LEVEL_CALL, dest:TMP_54(IUSDM), function:transferFrom, arguments:['msg.sender', 'TMP_56', 'liquidationFee']  `
- `IMochiEngine.TMP_54(IUSDM) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:usdm, arguments:[]  `
- `IERC20.TMP_52(bool) = HIGH_LEVEL_CALL, dest:asset(IERC20), function:transfer, arguments:['msg.sender', '_collateral']  `
- `IUSDM.TMP_48(bool) = HIGH_LEVEL_CALL, dest:TMP_46(IUSDM), function:transferFrom, arguments:['msg.sender', 'TMP_47', '_repaid']  `
- `IUSDM.HIGH_LEVEL_CALL, dest:TMP_49(IUSDM), function:burn, arguments:['_repaid']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - auction = auctions(_auctionId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(auction.boughtAt == 0,liquidated)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - vault = IMochiVault(auction.vault)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - engine.usdm().transferFrom(msg.sender,address(this),_repaid)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - engine.usdm().burn(_repaid)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - asset = vault.asset()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - auction.boughtAt = block.number"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - asset.transfer(msg.sender,_collateral)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - liquidationFee = currentLiquidationFee(_auctionId)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - engine.usdm().transferFrom(msg.sender,address(engine.feePool()),liquidationFee)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - Settled(_auctionId,_repaid + liquidationFee)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/liquidator/DutchAuctionLiquidator.sol` on lines **94** to **117**

```solidity
    function settleLiquidation(
        uint256 _auctionId,
        uint256 _collateral,
        uint256 _repaid
    ) internal {
        Auction storage auction = auctions[_auctionId];
        require(auction.boughtAt == 0, "liquidated");
        IMochiVault vault = IMochiVault(auction.vault);
        //repay the debt first
        engine.usdm().transferFrom(msg.sender, address(this), _repaid);
        engine.usdm().burn(_repaid);
        IERC20 asset = vault.asset();
        auction.boughtAt = block.number;
        asset.transfer(msg.sender, _collateral);
        //transfer liquidation fee to feePool
        uint256 liquidationFee = currentLiquidationFee(_auctionId);
        engine.usdm().transferFrom(
            msg.sender,
            address(engine.feePool()),
            liquidationFee
        );

        emit Settled(_auctionId, _repaid + liquidationFee);
    }

```
