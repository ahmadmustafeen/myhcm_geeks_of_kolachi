// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Users {
    address private owner;
    uint8 private id;
    string[] private availablePositions;

    constructor() {
        owner = msg.sender;
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
        require(msg.sender == owner, "Admin previliges required.");
        bool doesListContainElement = false;
        for (uint256 i = 0; i < availablePositions.length; i++) {
            if (compareStrings(availablePositions[i], position)) {
                doesListContainElement = true;
                break;
            }
        }
        for (uint8 j = 0; j < users.length; j++)
            require(
                walletAddress != users[j].WalletAddress,
                "Cannot add two person with same wallet address"
            );

        if (!doesListContainElement) availablePositions.push(position);

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

    function EditUser(string memory firstName, string memory lastName)
        public
        returns (userDataType memory)
    {
        userDataType memory userFound;
        uint8 index;
        for (uint8 i = 0; i < users.length; i++) {
            if (users[i].WalletAddress == msg.sender) {
                userFound = users[i];
                index = i;
            }
        }
        userFound = userDataType({
            firstName: firstName,
            lastName: lastName,
            position: userFound.position,
            employeeId: userFound.employeeId,
            WalletAddress: userFound.WalletAddress
        });
        users[index] = userFound;

        return users[index];
    }

    function EditAnyUser(
        string memory firstName,
        string memory lastName,
        address walletAddress
    ) public returns (userDataType memory) {

        require(msg.sender == owner,"This function is available only for admin");

        userDataType memory userFound;
        uint8 index;
        for (uint8 i = 0; i < users.length; i++) {
            if (users[i].WalletAddress == walletAddress) {
                userFound = users[i];
                index = i;
            }
        }
        userFound = userDataType({
            firstName: firstName,
            lastName: lastName,
            position: userFound.position,
            employeeId: userFound.employeeId,
            WalletAddress: userFound.WalletAddress
        });
        users[index] = userFound;

        return users[index];
    }
}
