// ============================================================
// file: USDM.spec
// verified contract: usdm.sol (contract USDM)
// total properties: 3
// categories: S4.1.G4, S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G5/G8/G9/G10/G11, S4.2.G4
// items requiring manual models: S4.1.G7, S4.2.G3
// ============================================================

use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function MochiEngine.minter() external returns (address);

    function balanceOf(address) external returns (uint256) envfree;
    function totalSupply() external returns (uint256) envfree;

    function mint(address, uint256) external;
    function burn(uint256) external;
}

rule mint_rejects_non_minter(env e, address to, uint256 amount) {
    address eng = engine();
    address configuredMinter = eng.minter(e);
    require e.msg.sender != configuredMinter;

    mint@withrevert(e, to, amount);
    bool reverted = lastReverted;

    assert reverted, "a non-minter account must not mint USDM";
}

rule mint_configured_minter_can_mint(env e, address to, uint256 amount) {
    address eng = engine();
    require e.msg.sender == eng.minter(e);

    mint@withrevert(e, to, amount);
    bool reverted = lastReverted;

    satisfy !reverted, "the configured minter must be able to mint USDM";
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