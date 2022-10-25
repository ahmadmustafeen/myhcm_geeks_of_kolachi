// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// once deployed, 
// 1-people can mark their attendance.
// 2-people can view their own attendance.


contract Attendance {
    struct entry {
        uint8 id;
        string name;
        string dateStamp;
    }
    entry[] public entries;
    event Entry(
        uint8 id,
        string name,
        string dateStamp
    );



}