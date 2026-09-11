// ============================================================
// file: DepositHandler.spec
// verified contract: DepositHandler.sol
// total properties: 1
// categories:
//   S4.2.G1 owner-only configuration (setDependencies/setFeeToken)
// items NOT applicable: G2, G4, G7, G8, G9, G10, G11, S4.2.G3,
//   S4.2.G4 (see property-plan). depositPwrd/depositGvt are public
//   user entry points by design — token mint authorization is enforced
//   on the Controller side (mintGToken = depositHandler-only) and is
//   verified in Controller.spec.
// items requiring manual models: none.
// ============================================================

use builtin rule sanity;

methods {
    function owner() external returns (address) envfree;

    function setDependencies() external;
    function setFeeToken(uint256) external;
}

rule owner_configuration_setters_reject_non_owner(method f, env e, calldataarg args)
filtered {
    f -> f.contract == currentContract
      && (f.selector == sig:setDependencies().selector
          || f.selector == sig:setFeeToken(uint256).selector)
} {
    address ownerBefore = owner();
    require e.msg.sender != ownerBefore;

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert reverted,
        "owner-only DepositHandler configuration methods revert for non-owners (S4.2.G1)";
}