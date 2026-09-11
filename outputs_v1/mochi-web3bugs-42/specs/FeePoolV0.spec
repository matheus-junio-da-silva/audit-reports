// ============================================================
// file: FeePoolV0.spec
// verified contract: FeePoolV0.sol
// status: manual_model_required (NOT submitted to the prover)
// rationale: all admin setter rules (changecrvVoterRewardPool/changeTreasuryRatio/changevMochiRatio) are gated by engine().governance() (FeePoolV0.sol:57-77) - 1-hop linked authority; CVL cannot correlate engine() address with an ambient instance (M ochiProfileV0 ATTEMPT-2 fals-dofindings); reclassified manual_model_required. distributeMochi/sendToTreasury/updateReserve are permissionless by design (not AC findings; S4.1.G6 applies to admin setter surface only).
// ============================================================

// no rules derived: every verifiable AC claim requires linked-contract
// models (1-hop governance or multi-hop engine/vaultFactory/nft), which CVL
// cannot resolve soundly without a harness (see property plan evidence).
