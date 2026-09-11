# Context: ERC20Router.route

**Contract:** `ERC20Router` (Inherits: IYetiRouter)
**Signature:** `route(address,address,address,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x40dbf962`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activePoolAddress, traderJoeRouter, yusdTokenAddress
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_startingTokenAddress == yusdTokenAddress,Cannot route from a token other than YUSD)`
- require/assert: `require(bool,string)(amounts[1] >= _minSwapAmount,Did not receive enough tokens to account for slippage)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_31(bool) = HIGH_LEVEL_CALL, dest:TMP_29(IERC20), function:transferFrom, arguments:['_fromUser', 'TMP_30', '_amount']  `
- `IERC20.TMP_33(bool) = HIGH_LEVEL_CALL, dest:TMP_32(IERC20), function:approve, arguments:['traderJoeRouter', '_amount']  `
- `IRouter.TMP_35(uint256[]) = HIGH_LEVEL_CALL, dest:TMP_34(IRouter), function:swapExactTokensForTokens, arguments:['_amount', '1', 'path', 'activePoolAddress', 'block.timestamp']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_startingTokenAddress == yusdTokenAddress,Cannot route from a token other than YUSD)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - path = new address()(2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - path(0) = yusdTokenAddress"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - path(1) = _endingTokenAddress"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - IERC20(yusdTokenAddress).transferFrom(_fromUser,address(this),_amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - IERC20(yusdTokenAddress).approve(traderJoeRouter,_amount)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - amounts = IRouter(traderJoeRouter).swapExactTokensForTokens(_amount,1,path,activePoolAddress,block.timestamp)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(amounts(1) >= _minSwapAmount,Did not receive enough tokens to account for slippage)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - amounts(1)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Routers/ERC20Router.sol` on lines **34** to **63**

```solidity
    function route(
        address _fromUser,
        address _startingTokenAddress,
        address _endingTokenAddress,
        uint256 _amount,
        uint256 _minSwapAmount
    ) public override returns (uint256) {
        require(
            _startingTokenAddress == yusdTokenAddress,
            "Cannot route from a token other than YUSD"
        );
        address[] memory path = new address[](2);
        path[0] = yusdTokenAddress;
        path[1] = _endingTokenAddress;
        IERC20(yusdTokenAddress).transferFrom(_fromUser, address(this), _amount);
        IERC20(yusdTokenAddress).approve(traderJoeRouter, _amount);
        uint256[] memory amounts = IRouter(traderJoeRouter).swapExactTokensForTokens(
            _amount,
            1,
            path,
            activePoolAddress,
            block.timestamp
        );
        require(
            amounts[1] >= _minSwapAmount,
            "Did not receive enough tokens to account for slippage"
        );

        return amounts[1];
    }

```
