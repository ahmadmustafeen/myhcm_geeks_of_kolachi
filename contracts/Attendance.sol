// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// once deployed, 
// 1-people can mark their attendance.
// 2-people can view their own attendance.


contract Attendance {
    struct entry {
        address walletAddress;
        uint256 dateStamp;
    }
    entry[] public entries;
    event Entry(
        address walletAddress,
        uint256 dateStamp
    );

    function markAttendance () public {
        entries.push(entry({walletAddress:msg.sender,dateStamp:block.timestamp}));
        emit Entry(msg.sender, block.timestamp);
    }

    function fetchAttendance () view public returns(entry[] memory) {
        return entries;
    }



}