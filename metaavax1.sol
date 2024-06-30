// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Contract to manage driving licenses
contract DrivingLicense {
    // Mapping to store the age of each user
    mapping(address => uint) public age;

    // Mapping to store whether a user owns a vehicle
    mapping(address => bool) public ownsVehicle;

    // Function to set the age of a user
    function setAge(uint _age) public {
        // Ensure the age is valid (between 1 and 150)
        require(_age > 0 && _age <= 150, "Invalid age provided.");
        age[msg.sender] = _age;
    }

    // Function to set vehicle ownership status of a user
    function setVehicleOwnership(bool _ownsVehicle) public {
        ownsVehicle[msg.sender] = _ownsVehicle;
    }

    // Function to check eligibility for a driving license
    function checkEligibility() public view returns (bool) {
        // Get the user's age and vehicle ownership status
        uint userAge = age[msg.sender];
        bool vehicleOwnership = ownsVehicle[msg.sender];

        // Ensure the age and vehicle ownership are set
        require(userAge > 0, "Age is not set. Please set your age first.");
        require(vehicleOwnership == true, "Vehicle ownership is not set or false.");

        // Check if the user is eligible for a driving license
        if (userAge >= 18) {
            // User is eligible, return true
            return true;
        } else {
            // User is not eligible, revert with a message
            revert("You are not eligible for a driving license.");
        }
    }
}