# Context: dummyUniV2Router.setup

**Contract:** `dummyUniV2Router` (Inherits: BoringOwnable, BoringOwnableData, IsYETIRouter)
**Signature:** `setup(address,address,address)`
**Method Selector ID:** `0x77b8b1c7`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(msg.sender == owner, "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** JOERouter, JOERouterAddress, path, yetiToken, yusdToken

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
    Node_0 --> Node_9
    Node_1["1: NodeType.EXPRESSION - JOERouterAddress = _JOERouter"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - JOERouter = IRouter(_JOERouter)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - path = new address()(2)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - yusdToken = IERC20(_yusdToken)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - yetiToken = IERC20(_yetiToken)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - path(0) = _yusdToken"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - path(1) = _yetiToken"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - transferOwnership(address(0),true,true)"]
    Node_9["9: NodeType.EXPRESSION - onlyOwner()"]
    Node_9 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/YUSDToYETIRouters/dummyUniV2Router.sol` on lines **17** to **27**

```solidity
    function setup(address _JOERouter, address _yusdToken, address _yetiToken) external onlyOwner {
        JOERouterAddress = _JOERouter;
        JOERouter = IRouter(_JOERouter);
        path = new address[](2);
        yusdToken = IERC20(_yusdToken);
        yetiToken = IERC20(_yetiToken);
        path[0] = _yusdToken;
        path[1] = _yetiToken;
        // Renounce ownership
        transferOwnership(address(0), true, true);
    }

```
