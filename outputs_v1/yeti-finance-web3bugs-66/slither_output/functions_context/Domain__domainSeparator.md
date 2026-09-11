# Context: Domain._domainSeparator

**Contract:** `Domain` (Inherits: None)
**Signature:** `_domainSeparator() returns (bytes32)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DOMAIN_SEPARATOR_CHAIN_ID, _DOMAIN_SEPARATOR
- **Writes:** None

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
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - chainId = chainid()()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDASSEMBLY - "]
    Node_4 --> Node_6
    Node_6["6: NodeType.IF - chainId == DOMAIN_SEPARATOR_CHAIN_ID"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.RETURN - _DOMAIN_SEPARATOR"]
    Node_8["8: NodeType.RETURN - _calculateDomainSeparator(chainId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/Domain.sol` on lines **38** to **41**

```solidity
    function _domainSeparator() internal view returns (bytes32) {
        uint256 chainId; assembly {chainId := chainid()}
        return chainId == DOMAIN_SEPARATOR_CHAIN_ID ? _DOMAIN_SEPARATOR : _calculateDomainSeparator(chainId);
    }

```
