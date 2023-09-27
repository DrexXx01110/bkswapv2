// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IBKCommon {
    function setOperator(address[0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D] memory _operators, bool _isOperator) external; 
    
    function pause() external;

    function unpause() external;

    function rescueETH(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external;
    
    function rescueERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE, 0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external;
}
