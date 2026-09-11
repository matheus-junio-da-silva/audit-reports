# Proof of Concept Report — Access Control

## Project: yeti-finance-web3bugs-66 (Yeti Finance, web3bugs dataset #66)
## Date: 2026-08-29

---

### PoC 1: StabilityPool.receiveCollateral caller restriction (web3bugs-66 H-01 / S5-3)
- **File:** `PoC_StabilityPool_receiveCollateral.t.sol`
- **Framework:** Foundry 1.7.1 (commit 4072e48705af9d93e3c0f6e29e93b5e9a40caed8)
- **Compiler:** solc 0.6.11 (pinned, auto_detect_solc=false; matches StabilityPool.sol pragma)
- **Command:**
  `forge test --root pipeline-output/yeti-finance-web3bugs-66/poc --match-path 'PoC_*.t.sol' -vvv`
- **Source:** Formal (Certora) — harness-gated identity rule (IND 1 / IND 2 in vulnerability-report.md), corroborated behaviorally here
- **Ontology Class:** CAC-AC-009 (Trusted callback caller spoofing)
- **Checklist Item:** S4.2.G3 (Callback caller verification)
- **Result:** PASSED (both tests; exploit NOT reproducible on this snapshot)
- **Output:**
  ```
  Ran 2 tests for PoC_StabilityPool_receiveCollateral.t.sol:PoC_StabilityPool_receiveCollateral
  [PASS] test_activePool_authorized_path_reachable() (gas: 22406)
  [PASS] test_attacker_receiveCollateral_reverts() (gas: 7523)
  Suite result: ok. 2 passed; 0 failed; 0 skipped
  ```
- **Conclusion:** The H-01 claim ("receiveCollateral callable by anyone") is **not
  reproducible** against the audited snapshot. The unauthorized test requires the
  attacker call to revert (`"SP: External caller not allowed"`) and passes, proving
  the `_requireCallerIsActivePool()` guard (StabilityPool.sol:1133-1137/1155) is
  effective. The authorized test proves the ActivePool-only path is reachable and
  deterministic. The dataset contest report describes the unpatched behavior; this
  snapshot contains the patch, so the vulnerability is verified absent here.

> Note: the PoC uses empty collateral arrays for the authorized path because the
> accounting update indexes into `whitelist.getIndex`; that whitelist integration
> is out of the minimal isolation scope. The state-determinism assertion plus the
> revert arm fully discharge the caller-restriction claim.

---

## Summary

| PoC | Vulnerability | Source | Result |
|---|---|---|---|
| PoC_1 | H-01: receiveCollateral callable by anyone | Certora (IND 1/2) | PASSED — vulnerability absent, guard confirmed |

Total PoCs: 1
Passed (control-effective arm): 2/2 tests
Failed: 0
Confirmed exploit reproductions: 0

## Pipeline Impact

- Stage 3 classified 0 confirmed vulnerabilities; the H-01 class is
  harness-gated (IND 1). This PoC resolves IND 2: the dataset H-01 is verified
  absent in the audited snapshot, with both an unauthorized-revert test and an
  authorized-reachability test passing under Forge.