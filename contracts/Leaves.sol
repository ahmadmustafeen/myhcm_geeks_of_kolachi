// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;



contract Leaves {
    address owner;


    constructor(){
        owner = msg.sender;
    }

    enum STATUS{ PENDING, APPROVED, REJECTED }

    struct leave {
        address WalletAddress;
        string typeOfLeave;
        uint256 date;
        STATUS status;
    }

    leave[] leaves;

    event LeaveCreated (
           address WalletAddress,
            string typeOfLeave,
            uint256 date,
            STATUS status
    );


    function ApplyForLeave (string memory typeofLeave) public returns(string memory){
        //  address WalletAddress;
        emit LeaveCreated(msg.sender, typeofLeave,block.timestamp,STATUS(0));
        leaves.push(leave({WalletAddress:msg.sender,typeOfLeave: typeofLeave,date: block.timestamp,status:STATUS(0)}));
        return "Applied for leave successfull";
    }


    function FetchAllLeaves () view public returns(leave[] memory){
        require(msg.sender==owner,"Admin previlidges required.");
        return leaves;
    }

}
