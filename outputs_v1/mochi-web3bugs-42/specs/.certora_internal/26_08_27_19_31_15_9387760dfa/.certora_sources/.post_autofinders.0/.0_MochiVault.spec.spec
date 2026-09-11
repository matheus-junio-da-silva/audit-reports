// ============================================================
// file: MochiVault.spec
// verified contract: MochiVault.sol
// total properties: 3
// categories: S4.1.G10, S4.2.G1 (H-08 probe)
// items NOT applicable: S4.1.G1/G2/G3/G5/G8/G9/G11, S4.2.G4
// items requiring manual models: S4.1.G4/G6/G7, S4.2.G3
// ============================================================

use builtin rule sanity;

methods {
    function initialize(address) external;
    function asset() external returns (address) envfree;
    function lastDeposit(uint256) external returns (uint256) envfree;
    function deposit(uint256, uint256) external;
}

rule initialize_cannot_succeed_twice(env e1, env e2, address a, address b) {
    initialize@withrevert(e1, a);
    bool firstReverted = lastReverted;

    initialize@withrevert(e2, b);
    bool secondReverted = lastReverted;

    assert !firstReverted => secondReverted,
        "after one successful initialization every later initialization must revert";
}

rule initialize_can_succeed(env e, address a) {
    initialize@withrevert(e, a);
    bool reverted = lastReverted;

    satisfy !reverted, "initialization must be reachable in some initial state";
}

// H-08 probe: deposit(_id, 0) at MochiVault.sol:158-176 writes lastDeposit[_id] = block.timestamp
// regardless of the deposited amount. A zero-amount deposit must not move the wait latch.
rule deposit_zero_does_not_refresh_lastDeposit(env e, uint256 id) {
    uint256 before = lastDeposit(id);
    require e.block.timestamp > before;

    deposit@withrevert(e, id, 0);
    bool reverted = lastReverted;

    assert reverted => true;
    assert !reverted => lastDeposit(id) == before,
        "a zero-amount deposit must not refresh the withdraw wait";
}