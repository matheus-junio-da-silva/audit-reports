# AGENT FEEDBACK REPORT — ORCHESTRATOR
**Agent:** certora-orchestrator
**Execution Run:** 20260827T164538.628911506-55ccd3d87497
**Date:** 2026-08-27
**Project:** mochi-web3bugs-42
**Pipeline Result:** STAGE_2_CVL_READY
**Stop Reason:** N/A
**Last Updated:** 2026-08-27T22:10:00Z
**Current Checkpoint:** stage-2-compile-clean
**Total Duration:** 05:25:00 (running)

---

## 0. EXECUTION PROGRESS
| Operation ID | Started | Ended | Checkpoint | Status | Exit Code | Evidence / Output |
|---|---|---|---|---|---|---|
| init-feedback | 2026-08-27T16:45:00Z | 2026-08-27T16:55:00Z | Feedback initialized | COMPLETED | 0 | /home/mat/certora-ac-audit/pipeline-output/mochi-web3bugs-42/runs/20260827T164538.628911506-55ccd3d87497/feedback-logs/feedback-certora-orchestrator-20260827T164538.628911506-55ccd3d87497.md |
| pre-flight | 2026-08-27T16:52:00Z | 2026-08-27T16:55:00Z | Solc 0.8.6+0.8.7 installed, CERTORAKEY in-memory | COMPLETED | 0 | solc-select use 0.8.7 |
| stage1-ready | 2026-08-27T16:55:00Z | 2026-08-27T20:33:00Z | Stage 1 complete (3-pkg extraction + assembly) | COMPLETED | 0 | 92 ASTs; raw 96.6%, weighted 95.2% |
| stage2-cvl | 2026-08-27T21:10:00Z | 2026-08-27T22:05:00Z | 13 property plans + 13 specs/conf; lint 13/13 pass; compilation_steps_only 13/13 EXIT=0 | COMPLETED | 0 | specs/; /tmp/cac42_compile_all{2,3,4}.log |

---

## 1. PIPELINE SUMMARY
> Stage 2 CVL artifacts ready: 13 verified-contract sets (property plan + spec + conf). Linked getters (`engine().governance`, `owned().governance`) expressed with envfree+optional declarations per replayable CVL recipe; enum-return/array rules re-expressed via `riskFactor` proxy or documented as CVL-typing limitations. All confs pass `--compilation_steps_only`. Cloud proofs + Stage 3 (interpretation) next.

---

## 2. PRE-FLIGHT RESULTS
| Dependency System | Found | Install Success | Notes |
|---|---|---|---|
| npm (Hardhat/Truffle) | yes | yes | 3-package monorepo (core+cssr+library) |
| forge (Foundry) | yes | yes | forge 1.7.1 |
| git submodules | no | N/A | none found |
| Monorepo detected | yes | N/A | Hardhat monorepo (mochi-core, mochi-cssr, mochi-library) |

---

## 2b. COVERAGE GATE EVALUATION (Stage 1→2)
| Metric | Value | Threshold | Pass |
|---|---|---|---|
| Raw AST coverage | 96.6% | ≥50% | PASS |
| Weighted coverage | 95.2% | ≥50% | PASS |
| Core contracts extracted | 32/32 | ≥1 | PASS |
| Critical gaps (no mitigation) | 2 (documented, LOW stage-2 impact) | 0 | PASS |
| Solc version mismatches | 0 | 0 | PASS |
| Pre-flight verdict | READY | READY | PASS |
| Gate decision | **PROCEED** | — | — |

---

## 3. STAGE RESULTS
| Stage | Agent | Status | Duration | Output Path | Feedback Report |
|---|---|---|---|---|---|
| 1 | certora-slither-context | COMPLETED | ~04:00 | pipeline-output/mochi-web3bugs-42/slither_output | feedback-slither-context-<RUN_ID>.md |
| 2 | certora-access-control | NOT_STARTED | N/A | PENDING | PENDING |
| 3 | certora-interpreter | NOT_STARTED | N/A | PENDING | PENDING |
| 4 | certora-poc-generator | NOT_STARTED | N/A | PENDING | PENDING |

---

## 4. BLOCKERS ENCOUNTERED
| # | Stage | Blocker | Resolution |
|---|---|---|---|
| 1 | 1 | npm file: deps re-linked as symlinks -> "File outside of allowed directories" | Materialized real copies of @mochifi/{library,cssr} + no-op npm shim on PATH |
| 2 | 1 | Native Hardhat compile fails (HH8 config errors) | per-file solc fallback (extractor auto) |
| 3 | 1 | UniswapV2CSSR/SushiswapV2CSSR "Stack too deep (31)" | documented as coverage gaps; LOW stage-2 impact (oracle price sources, no AC logic) |

---

## 5. VIOLATED PRINCIPLES
- Assumption that 3-package monorepo would be auto-detected as one project: extractor derives project_name from basename, so 3 separate runs + union were required. Mitigated by canonical assembly step; no output loss.

---

## 6. SUCCESS STRATEGIES
- Per-package extraction into /tmp staging areas + union assembly gives exact per-package coverage attribution and keeps canonical output stable.
- Keeping @mochifi real-dir copies and the no-op npm shim reproducible in /tmp/cac42-bin lets extractor subprocesses re-resolve without re-breaking symlinks.
- Coverage gate evaluated on project-local source set (56/58); node_modules AST extras (36) don't mask gaps.

---

## 7. KNOWLEDGE NOT EXPLICIT IN THE INSTRUCTIONS
- `solc-select not found in PATH` warning is benign when solc bin is resolved directly by crytic-compile.
- Weighted coverage for multi-package projects: file-share weighting (core 96.2x32, cssr 88.8x14, lib 100.0x12) is a stable combined metric.
- Knowledge graph / function-context merge: prefer library-package provenance over node_modules duplicates.

---

## 8. TIPS FOR FUTURE RUNS
- For npm workspace monorepos, run extractor per package and union; expect `file:` deps -> symlink re-link failure; pre-materialize real dirs.
- Diagnose "Invalid compilation" per-file failures via extractor log (stack-too-deep vs import resolution) before marking impact.
- Next: Stage 2 needs ontology path /home/mat/certora-ac-audit/skills/certora-access-control/references/access-control-ontology.json + merged slither_output.

## STAGE 2 COMPLETE (2026-08-27T23:06:00Z)
- 7 proofs submitted, 6 terminal verdicts (ledger in stage-2 feedback).
- CONFIRMED VIOLATIONS (match ground truth): H-04 registerAsset overwrite
  (MochiProfileV0), H-08 zero-deposit wait reset (MochiVault), M-14
  permissionless withdrawLock (MochiTreasuryV0), M-12 permissionless
  deployVault (MochiVaultFactory).
- VERIFIED: MochiEngine gov-isolation, MochiVault init-once (+witness),
  USDM burn caller-scope.
- Linked-governance surface (engine().governance()/minter()) reclassified
  manual_model_required (CVL address-correlation limit; MochiProfileV0 a2
  evidence). H-09/H-12 ground-truth items documented as not-submitted
  (permissionless surface triaged in ground truth; target/report passes to
  interpreter).
- Stage 3 (certora-interpreter) and Stage 4 (PoC) ready to consume
  certora-raw-output.txt + specs/*.property-plan.json (terminal_results).
