methods {
    function getTeamWallet() external returns (address) envfree;
    function setYetiAddress(address) external;
    function sendUnallocatedYETI(address,uint256) external;
    function updateTeamAddress(address) external;
}

rule setYetiAddress_rejects_non_team(env e, address yeti) {
    require e.msg.sender != getTeamWallet();
    require e.msg.sender != 0;

    setYetiAddress@withrevert(e, yeti);
    bool reverted = lastReverted;

    assert reverted, "TA: a caller that is not the team wallet must not set the YETI address";
}

rule setYetiAddress_team_can_set(env e, address yeti) {
    require e.msg.sender == getTeamWallet();
    require e.msg.sender != 0;

    setYetiAddress@withrevert(e, yeti);
    bool reverted = lastReverted;

    satisfy !reverted, "TA: the team wallet must be able to set the YETI address";
}

rule sendUnallocatedYETI_rejects_non_team(env e, address to, uint256 amount) {
    require e.msg.sender != getTeamWallet();
    require e.msg.sender != 0;

    sendUnallocatedYETI@withrevert(e, to, amount);
    bool reverted = lastReverted;

    assert reverted, "TA: a caller that is not the team wallet must not sweep unallocated YETI";
}

rule updateTeamAddress_rejects_non_team(env e, address newTeamWallet) {
    require e.msg.sender != getTeamWallet();
    require e.msg.sender != 0;

    updateTeamAddress@withrevert(e, newTeamWallet);
    bool reverted = lastReverted;

    assert reverted, "TA: a caller that is not the team wallet must not rotate the team wallet";
}

rule updateTeamAddress_team_can_update(env e, address newTeamWallet) {
    require e.msg.sender == getTeamWallet();
    require e.msg.sender != 0;
    require newTeamWallet != 0;

    updateTeamAddress@withrevert(e, newTeamWallet);
    bool reverted = lastReverted;

    satisfy !reverted, "TA: the team wallet must be able to rotate authority to a non-zero wallet";
}