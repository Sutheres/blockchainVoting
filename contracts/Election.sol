pragma solidity ^0.4.23;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store accounts that have voted
    mapping(address => bool) public voters;

    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    constructor() public {
        addCandidate("Ed Sutherlin");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        //require that they havent voted before
        require(!voters[msg.sender]);

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }

}
