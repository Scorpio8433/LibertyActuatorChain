// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LibertyActuatorToken is ERC20, Ownable {
    bool public governanceActive = false;
    mapping(address => bool) public governanceParticipants;

    event GovernanceActivated(address indexed by);
    event ParticipantAdded(address indexed participant);

    constructor(uint256 initialSupply) ERC20("Liberty Actuator Token", "LARS") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    function activateGovernance() external onlyOwner {
        require(!governanceActive, "Governance already active");
        governanceActive = true;
        emit GovernanceActivated(msg.sender);
    }

    function addParticipant(address participant) external onlyOwner {
        require(governanceActive, "Governance not active");
        governanceParticipants[participant] = true;
        emit ParticipantAdded(participant);
    }

    function isParticipant(address addr) external view returns (bool) {
        return governanceParticipants[addr];
    }
}
