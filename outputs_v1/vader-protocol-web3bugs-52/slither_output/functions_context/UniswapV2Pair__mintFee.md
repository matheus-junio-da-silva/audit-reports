# Context: UniswapV2Pair._mintFee

**Contract:** `UniswapV2Pair` (Inherits: UniswapV2ERC20, IUniswapV2Pair, IUniswapV2ERC20)
**Signature:** `_mintFee(uint112,uint112) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factory, kLast, totalSupply
- **Writes:** kLast

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Math.TMP_127(uint256) = LIBRARY_CALL, dest:Math, function:Math.sqrt(uint256), arguments:['TMP_126'] `
- `IUniswapV2Factory.TMP_121(address) = HIGH_LEVEL_CALL, dest:TMP_120(IUniswapV2Factory), function:feeTo, arguments:[]  `
- `Math.TMP_128(uint256) = LIBRARY_CALL, dest:Math, function:Math.sqrt(uint256), arguments:['_kLast'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - feeTo = IUniswapV2Factory(factory).feeTo()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - feeOn = feeTo != address(0)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _kLast = kLast"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - feeOn"]
    Node_4 --> Node_5
    Node_4 --> Node_17
    Node_5["5: NodeType.IF - _kLast != 0"]
    Node_5 --> Node_6
    Node_5 --> Node_16
    Node_6["6: NodeType.VARIABLE - rootK = Math.sqrt(uint256(_reserve0) * _reserve1)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - rootKLast = Math.sqrt(_kLast)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - rootK > rootKLast"]
    Node_8 --> Node_9
    Node_8 --> Node_15
    Node_9["9: NodeType.VARIABLE - numerator = totalSupply * (rootK - rootKLast)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - denominator = (rootK * 5) + rootKLast"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - liquidity = numerator / denominator"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - liquidity > 0"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - _mint(feeTo,liquidity)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_20
    Node_17["17: NodeType.IF - _kLast != 0"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - kLast = 0"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.RETURN - feeOn"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/UniswapV2Pair.sol` on lines **108** to **129**

```solidity
    function _mintFee(uint112 _reserve0, uint112 _reserve1)
        private
        returns (bool feeOn)
    {
        address feeTo = IUniswapV2Factory(factory).feeTo();
        feeOn = feeTo != address(0);
        uint256 _kLast = kLast; // gas savings
        if (feeOn) {
            if (_kLast != 0) {
                uint256 rootK = Math.sqrt(uint256(_reserve0) * _reserve1);
                uint256 rootKLast = Math.sqrt(_kLast);
                if (rootK > rootKLast) {
                    uint256 numerator = totalSupply * (rootK - rootKLast);
                    uint256 denominator = (rootK * 5) + rootKLast;
                    uint256 liquidity = numerator / denominator;
                    if (liquidity > 0) _mint(feeTo, liquidity);
                }
            }
        } else if (_kLast != 0) {
            kLast = 0;
        }
    }

```
