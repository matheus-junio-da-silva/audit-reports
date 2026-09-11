// ============================================================
// file: MinterV0.spec
// verified contract: MinterV0.sol
// status: manual_model_required (NOT submitted to the prover)
// rationale: addMinter/removeMinter (exec gates) are engine().governance() 1-hop linked; mint() requires IMochiEngine ownerOf checks (multi-hop: engine.nft().ownerOf(engine.vaultFactory().getVault(asset))) - manual_model_required for both groups.
// ============================================================

// no rules derived: every verifiable AC claim requires linked-contract
// models (1-hop governance or multi-hop engine/vaultFactory/nft), which CVL
// cannot resolve soundly without a harness (see property plan evidence).
