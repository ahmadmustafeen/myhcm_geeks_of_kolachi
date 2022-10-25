// SPDX-License-Identifier = MIT
pragma solidity ^0.8.0;

contract Users {
    uint8 public id;
    string[] availablePositions;

    constructor() {
        id = 1;
        availablePositions = [
            "ASSOCIATE_SOFTWARE_DEVELOPER",
            "ASSOCIATE_SOFTWARE_ENGINEER",
            "SOFTWARE_DEVELOPER",
            "SOFTWARE_ENGINEER",
            "SENIOR_SOFTWARE_DEVELOPER",
            "SENIOR_SOFTWARE_ENGINEER",
            "HUMAN_RESOURCE",
            "ACCOUNTANT",
            "MARKETING_MANAGER",
            "CO_FOUNDER",
            "CEO",
            "CTO",
            "CFO",
            "COO"
        ];
    }

    struct userDataType {
        uint8 employeeId;
        address WalletAddress;
        string firstName;
        string lastName;
        string position;
    }
    userDataType[] users;

    function compareStrings(string memory a, string memory b)
        public
        pure
        returns (bool)
    {
        return (keccak256(abi.encodePacked((a))) ==
            keccak256(abi.encodePacked((b))));
    }

    function CreateUser(
        string memory firstname,
        string memory lastname,
        string memory position,
        address walletAddress
    ) public returns (string memory) {
        bool doesListContainElement = false;
        for (uint256 i = 0; i < availablePositions.length; i++) {
            if (compareStrings(availablePositions[i], position)) {
                doesListContainElement = true;
                break;
            }
        }
        for(uint8 j=0;j<users.length;j++){
            require(walletAddress != users[j].WalletAddress,"Cannot add two person with same wallet address");
            // if((walletAddress==users[i].WalletAddress)){
            // // if(walletAddress==users[i].WalletAddress){
            //     require(true,"Cannot add two person with same wallet address");
            // }
        }
        if (!doesListContainElement) {
            availablePositions.push(position);
        }
        
        users.push(
            userDataType({
                employeeId: id,
                firstName: firstname,
                lastName: lastname,
                position: position,
                WalletAddress: walletAddress
            })
        );
        id++;
        return firstname;
    }

    function FetchAllUser() public view returns (userDataType[] memory) {
        return users;
    }

    function FetchAllPositions() public view returns (string[] memory) {
        return availablePositions;
    }
}
