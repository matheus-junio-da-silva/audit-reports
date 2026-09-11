// ============================================================
// file: USDM.spec
// verified contract: USDM.sol
// rules: 1 (burn caller-scope)
// GOV-LINKED RULES REMOVED (manual_model_required): mint_rejects_non_minter /
//   mint_configured_minter_can_mint. The mint gate is
//   require(msg.sender == address(engine.minter()), "!minter") (usdm.sol:22),
//   a 1-hop linked authority on the ambient engine. Same CVL address-correlation
//   limit as MochiProfileV0 ATTEMPT-2 (false violations) -> not automatic.
// ============================================================

methods {
    function balanceOf(address) external returns (uint256) envfree;
    function burn(uint256) external;
}

rule burn_affects_only_msgsender_balance(env e, uint256 amount) {
    address who = e.msg.sender;
    address other;
    require who != other;
    require amount <= balanceOf(who);

    uint256 beforeWho = balanceOf(who);
    uint256 beforeOther = balanceOf(other);

    burn@withrevert(e, amount);
    bool reverted = lastReverted;

    assert !reverted => balanceOf(who) == beforeWho - amount
                            && balanceOf(other) == beforeOther,
        "burn must only reduce the caller's own balance";
}
