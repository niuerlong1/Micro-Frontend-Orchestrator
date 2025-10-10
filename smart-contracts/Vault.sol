// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 1135
// Optimized logic batch 1465
// Optimized logic batch 2886
// Optimized logic batch 1021
// Optimized logic batch 2670
// Optimized logic batch 1970
// Optimized logic batch 9720
// Optimized logic batch 9510
// Optimized logic batch 8931
// Optimized logic batch 7928
// Optimized logic batch 8174
// Optimized logic batch 2759
// Optimized logic batch 5565
// Optimized logic batch 7119
// Optimized logic batch 6071
// Optimized logic batch 5119
// Optimized logic batch 3251
// Optimized logic batch 1068
// Optimized logic batch 7665
// Optimized logic batch 3438
// Optimized logic batch 5141
// Optimized logic batch 1358