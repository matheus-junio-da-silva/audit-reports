// ============================================================
// file: UniswapV2TokenAdapter.spec
// verified contract: UniswapV2TokenAdapter.sol
// status: manual_model_required (NOT submitted to the prover)
// reason: every authority-bearing method is guarded by
//   require(msg.sender == owned.governance(), "!gov")
//   where `owned` is an immutable IGovernanceOwned link. The cssr
//   bundle contains NO implementing contract of `governance()` (only
//   the interface, which has no bytecode), so the getter cannot be
//   resolved to a known declaration in any scene, and CVL offers no
//   envfree/optional path (verified empirically: `optional` + missing
//   method aborts the prover with SkipOptionalRules exception).
//   A governance() model would amount to fabricated authority and is
//   explicitly out of scope for the automatic pipeline.
// UniswapV2TokenAdapter guards setToken with require(msg.sender == owned.governance(),'!gov').
// Verdict: UniswapV2TokenAdapter S4.1.G6/S4.2.G1 -> manual_model_required.
// ============================================================

// no rules derived: all state access is gated behind the unrepresentable link
