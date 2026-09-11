# Context: MochiVault.mint

**Contract:** `MochiVault` (Inherits: IERC3156FlashLender, IMochiVault, Initializable)
**Signature:** `mint(address,address) returns (uint256)`
**Method Selector ID:** `0xee1fe2ad`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** asset, details, engine
- **Writes:** details

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochiNFT.TMP_58(uint256) = HIGH_LEVEL_CALL, dest:TMP_56(IMochiNFT), function:mint, arguments:['TMP_57', '_recipient']  `
- `IMochiEngine.TMP_56(IMochiNFT) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:nft, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - id = engine.nft().mint(address(asset),_recipient)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - details(id).debtIndex = liveDebtIndex()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - details(id).status = Status.Idle"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - details(id).referrer = _referrer"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - id"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVault.sol` on lines **146** to **154**

```solidity
    function mint(address _recipient, address _referrer)
        public
        returns (uint256 id)
    {
        id = engine.nft().mint(address(asset), _recipient);
        details[id].debtIndex = liveDebtIndex();
        details[id].status = Status.Idle;
        details[id].referrer = _referrer;
    }

```
