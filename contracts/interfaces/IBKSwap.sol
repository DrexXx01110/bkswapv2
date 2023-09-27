// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IBKSwap {
    function setRegistry(address _bkRegistry) external;

    function bkRegistry(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) view external returns (address); 
    
    function managerCaller(address _caller, bool _isCaller) external;
    
    function isCaller(address _caller) view external returns(bool);
}
