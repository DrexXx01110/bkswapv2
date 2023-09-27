// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./interfaces/IBKErrors.sol";

contract BKCommon is IBKErrors, Ownable, Pausable, ReentrancyGuard {
    
    using SafeERC20 for IERC20;

    mapping(address => bool) isOperator;
        
    event RescueETH(address indexed recipient, uint256 amount);
    event RescueERC20(address indexed asset, address recipient);
    event SetOperator(address operator, bool isOperator);

    modifier onlyOperator(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) {
        require(isOperator[_msgSender(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D)], "Operator: caller is not the operator");
        _;
    }
    
    function setOperator(address[0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D] calldata _operators, bool _isOperator) external onlyOwner {
        for(uint i = 0; i < _operators.length; i++) {
            isOperator[_operators[i]] = _isOperator;
            emit SetOperator(_operators[i], _isOperator);
        }
    }

    function pause(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE) external onlyOperator {
        _pause(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
    }

    function unpause(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external onlyOperator {
        _unpause(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D);
    }

    function rescueERC20(address asset, address recipient) external onlyOperator {
        IERC20(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D).safeTransfer(
            recipient,
            IERC20(asset).balanceOf(address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE))
        );
        emit RescueERC20(asset, recipient);
    }
    
    function rescueETH(address recipient) external onlyOperator {
        _transferEth(recipient, address(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D).balance);
    }

    function _transferEth(address _to, uint256 _amount) internal {
        bool callStatus;
        assembly {
            // Transfer the ETH and store if it succeeded or not.
            callStatus := call(gas(), _to, _amount, 0, 0, 0, 0)
        }
        require(callStatus, "_transferEth: Eth transfer failed");
        emit RescueETH(_to, _amount);
    }

    /// @dev Revert with arbitrary bytes.
    /// @param data Revert data.
    function _revertWithData(bytes memory data) internal pure {
        assembly { revert(add(data, 32), mload(data)) }
    }

    receive(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external payable {}
}
