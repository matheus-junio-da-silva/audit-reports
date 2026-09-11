// ============================================================
// file: MochiEngine.spec
// verified contract: MochiEngine.sol
// total properties: 5
// categories: S4.1.G6, S4.2.G1
// items NOT applicable: S4.1.G1/G2/G3/G4/G5/G8/G9/G10/G11, S4.2.G3/G4
// items requiring manual models: S4.1.G7
// ============================================================

use builtin rule sanity;

methods {
    function governance() external returns (address) envfree;

    function changeGovernance(address) external;
    function changeTreasury(address) external;
    function changeOperationWallet(address) external;
}

rule changeGovernance_rejects_non_governance(env e, address newGovernance) {
    address gov = governance();
    require e.msg.sender != gov;

    changeGovernance@withrevert(e, newGovernance);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change the governance address";
}

rule changeTreasury_rejects_non_governance(env e, address newTreasury) {
    address gov = governance();
    require e.msg.sender != gov;

    changeTreasury@withrevert(e, newTreasury);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change the treasury address";
}

rule changeOperationWallet_rejects_non_governance(env e, address newOperationWallet) {
    address gov = governance();
    require e.msg.sender != gov;

    changeOperationWallet@withrevert(e, newOperationWallet);
    bool reverted = lastReverted;

    assert reverted, "a non-governance account must not change the operation wallet";
}

rule changeGovernance_governance_can_change(env e, address newGovernance) {
    require e.msg.sender == governance();

    changeGovernance@withrevert(e, newGovernance);
    bool reverted = lastReverted;

    satisfy !reverted, "governance must be able to change the governance address";
}

rule governance_changes_only_through_changeGovernance(method f)
filtered { f -> f.contract == currentContract
               && f.selector != sig:changeGovernance(address).selector } {
    env e;
    calldataarg args;
    address govBefore = governance();

    f@withrevert(e, args);
    bool reverted = lastReverted;

    assert !reverted => governance() == govBefore,
        "no method other than changeGovernance may change the governance address";
}