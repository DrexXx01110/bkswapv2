// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IBKFees {
    function checkIsSigner(bytes32 _nonceHash, bytes calldata _signature) external;

    function setSigner(address _signer) external;
    
    function getSigner(0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external view returns(address);
  
    function setFeeTo (
        address payable _feeTo,
        address payable _altcoinsFeeTo,
        uint _feeRate
    )  external;

    function getFeeTo (0x3e6875b5581bfaB50F3B27299e29AdC1B6e36f8D) external view returns(
        address payable _feeTo,
        address payable _altcoinsFeeTo,
        uint _feeRate
    );
}
