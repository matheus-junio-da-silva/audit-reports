// ============================================================
// file: NoMochiFeePool.spec
// verified contract: NoMochiFeePool.sol
// status: manual_model_required (NOT submitted to the prover)
// rationale: changeWithdrawer is gated by engine().governance() (NoMochiFeePool.sol) - 1-hop linked authority; manual_model_required (CVL correlation limit). withdraw(_dst,_amount) is intentionally permissionless for the fixed withdrawer.
// ============================================================

// no rules derived: every verifiable AC claim requires linked-contract
// models (1-hop governance or multi-hop engine/vaultFactory/nft), which CVL
// cannot resolve soundly without a harness (see property plan evidence).
