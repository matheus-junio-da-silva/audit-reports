// ============================================================
// file: RebasingGToken.spec
// verified contract: RebasingGToken.sol
// total properties: 7
// categories:
//   S4.1.G9  whitelist-gated supply (mint/burn/burnAll)
//   S4.2.G1  owner-only setController (inherited from GToken)
//   S4.1.G4  transferFrom insufficient-allowance revert
//   S4.2.G4  transferFrom exact allowance consumption
//   witnesses for whitelisted mint, owner setController, transferFrom
// items NOT applicable: G2, G7, G8, G10, G11, S4.2.G3
//   (see property-plan)
// items requiring manual models: none; GToken.sol abstract base is
//   folded into this proof (setController rule inherited).
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;
    function whitelist(address) external returns (bool) envfree;
    function allowance(address, address) external returns (uint256) envfree;
    function balanceOfBase(address) external returns (uint256) envfree;
    function totalSupplyBase() external returns (uint256) envfree;

    function setController(address) external;
    function mint(address, uint256, uint256) external;
    function burn(address, uint256, uint256) external;
    function burnAll(address) external;
    function transferFrom(address, address, uint256) external returns (bool);
}

rule supply_mutations_reject_non_whitelisted(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:mint(address,uint256,uint256).selector
          || f.selector == sig:burn(address,uint256,uint256).selector
          || f.selector == sig:burnAll(address).selector)
} {
    require !whitelist(e.msg.sender);

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "PWRD supply mutation requires whitelist membership (S4.1.G9)";
}

rule set_controller_rejects_non_owner(env e, address newController) {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    setController@withrevert(e, newController);
    bool reverted = lastReverted;

    assert reverted,
        "only the owner may retarget the token controller (S4.2.G1)";
}

rule transfer_from_rejects_insufficient_allowance(env e,
                                                  address from,
                                                  address to,
                                                  uint256 amount) {
    require e.msg.sender != from;
    require allowance(from, e.msg.sender) < amount;

    transferFrom@withrevert(e, from, to, amount);
    bool reverted = lastReverted;

    assert reverted,
        "a transferFrom with insufficient allowance must revert (S4.1.G4)";
}

rule transfer_from_consumes_allowance(env e,
                                      address from,
                                      address to,
                                      uint256 amount) {
    require e.msg.sender != from;
    require to != 0;
    require balanceOfBase(from) >= amount;

    uint256 before = allowance(from, e.msg.sender);
    require before >= amount;

    transferFrom@withrevert(e, from, to, amount);
    bool reverted = lastReverted;

    assert !reverted
           => to_mathint(allowance(from, e.msg.sender))
              == to_mathint(before) - to_mathint(amount),
        "a successful transferFrom consumes exactly the approved amount (S4.2.G4)";
}

rule transfer_from_is_reachable(env e, address from, address to, uint256 amount) {
    require e.msg.sender != from;
    require to != 0;
    require to != currentContract;
    require totalSupplyBase() == 0;
    require balanceOfBase(from) >= amount;
    require allowance(from, e.msg.sender) >= amount;

    transferFrom@withrevert(e, from, to, amount);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an authorized transferFrom must be reachable (witness)";
}

rule mint_whitelisted_is_reachable(env e, address account, uint256 factor, uint256 amount) {
    require whitelist(e.msg.sender);
    require account != 0;
    require amount > 0;

    mint@withrevert(e, account, factor, amount);
    bool reverted = lastReverted;

    satisfy !reverted,
        "a whitelisted mint must be reachable (witness)";
}

rule set_controller_owner_is_reachable(env e, address newController) {
    address ownerBefore = owner();
    require e.msg.sender == ownerBefore;
    require newController != 0;

    setController@withrevert(e, newController);
    bool reverted = lastReverted;

    satisfy !reverted,
        "an owner-granted setController must be reachable (witness)";
}