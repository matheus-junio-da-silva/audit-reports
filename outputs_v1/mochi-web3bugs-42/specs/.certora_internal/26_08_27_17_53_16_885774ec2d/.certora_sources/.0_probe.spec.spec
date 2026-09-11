use builtin rule sanity;

methods {
    function engine() external returns (address) envfree;
    function governance() external returns (address) envfree;
    function setDelay(uint256) external;
}

rule probe_gov(env e, uint256 d) {
    address eng = engine();
    require e.msg.sender != eng.governance();
    setDelay@withrevert(e, d);
    bool reverted = lastReverted;
    assert reverted;
}
