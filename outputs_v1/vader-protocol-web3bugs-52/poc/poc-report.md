# Proof of Concept Report — Access Control

## Project: Vader Protocol (Web3Bugs #52)
## Date: 2026-08-28

---

### PoC 1: Unrestricted mintSynth (any caller mints synths)
- **File:** `poc/PoC_MintSynth.t.sol`
- **Framework:** Foundry 1.7.1
- **Compiler:** solc 0.8.9
- **Command:** `forge test --root pipeline-output/vader-protocol-web3bugs-52/poc --match-path 'PoC_*.t.sol' --match-test test_exploit -vvv`
- **Source:** Formal (Certora)
- **Ontology Class:** CAC-AC-001 (Unchecked caller / missing access control)
- **Checklist Item:** S4.2.G1
- **Result:** PASSED
- **Output:**
  ```
  Ran 1 test for PoC_MintSynth.t.sol:PoC_MintSynth
  [PASS] test_exploit() (gas: 130240)
  Suite result: ok. 1 passed; 0 failed; 0 skipped
  ```
- **Exploit flow:** Deployer wires pool (`initialize(wrapper, synthFactory, ROUTER)`), seeds a funded native/foreign pair through the router role (`target.mint(...)` as ROUTER). Unauthorized caller `0xA11CE` (not ROUTER) calls `target.mintSynth(foreign, 100e18, ATTACKER, ATTACKER)` and receives freshly minted synthetic tokens (`synth.balanceOf(ATTACKER) > 0`). Assertion on the minted synth amount passed, proving the call succeeded without any router restriction.
- **Conclusion:** Confirmed empirically — `VaderPoolV2.mintSynth` (VaderPoolV2.sol:126) is callable by any address; matches C4 H-13.

### PoC 2: Unrestricted mintFungible (any attacker authors LP liquidity)
- **File:** `poc/PoC_MintFungible.t.sol`
- **Framework:** Foundry 1.7.1
- **Compiler:** solc 0.8.9
- **Command:** `forge test --root pipeline-output/vader-protocol-web3bugs-52/poc --match-path 'PoC_*.t.sol' --match-test test_exploit -vvv`
- **Source:** Formal (Certora)
- **Ontology Class:** CAC-AC-001 (Unchecked caller / missing access control)
- **Checklist Item:** S4.2.G1
- **Result:** PASSED
- **Output:**
  ```
  Ran 1 test for PoC_MintFungible.t.sol:PoC_MintFungible
  [PASS] test_exploit() (gas: 269339)
  Suite result: ok. 1 passed; 0 failed; 0 skipped
  ```
- **Exploit flow:** Deployer wires pool (`initialize(wrapper, synthFactory, ROUTER)`). Unauthorized caller `0xA11CE` calls `target.mintFungible(foreign2, 10e18 native, 500_000e18 foreign, ATTACKER, ATTACKER)` on an uninitialized pair, authoring reserves `(10e18, 500_000e18)` (skewed ratio enabling later price manipulation) and receiving `10e18` LP tokens. Assertions on reserves and `lpToken.balanceOf(ATTACKER)` passed.
- **Conclusion:** Confirmed empirically — `VaderPoolV2.mintFungible` (VaderPoolV2.sol:284) is callable by any address and lets the caller set initial pair liquidity; matches C4 H-14.

---

## Summary

| PoC | Vulnerability | Source | Result |
|---|---|---|---|
| PoC_MintSynth | `mintSynth` missing router restriction | Certora (CAC-AC-001 / S4.2.G1) | PASSED |
| PoC_MintFungible | `mintFungible` missing router restriction | Certora (CAC-AC-001 / S4.2.G1) | PASSED |

Total PoCs: 2
Passed: 2
Failed: 0

**Top-level `forge test` run: 2 tests passed, 0 failed, 0 skipped.**