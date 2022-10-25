// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./Attendance.sol";
import "./Users.sol";
import "./Leaves.sol";


contract Main is Attendance,Users,Leaves{
    //this function is just for testing purpose
    function mainFunction () view public returns(userDataType[] memory){
        return users;
    }







}