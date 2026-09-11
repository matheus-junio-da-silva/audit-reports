// ============================================================
// file: MochiNFT.spec
// verified contract: MochiNFT.sol
// status: manual_model_required (NOT submitted to the prover)
// rationale: setDescriptor is engine().governance() 1-hop linked; mint() requires msg.sender == engine.vaultFactory().getVault(_asset) (multi-hop) - manual_model_required for both.
// ============================================================

// no rules derived: every verifiable AC claim requires linked-contract
// models (1-hop governance or multi-hop engine/vaultFactory/nft), which CVL
// cannot resolve soundly without a harness (see property plan evidence).
