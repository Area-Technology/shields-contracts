// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../Shields.sol';

/// @dev Generate Customizable Shields
contract ShieldsGasTest {
    Shields public immutable shields;

    constructor(Shields _shields) {
        shields = _shields;
    }

    function gasSnapshotTokenURI(uint256 tokenId) public view returns (uint256) {
        uint256 gasBefore = gasleft();
        shields.tokenURI(tokenId);
        return gasBefore - gasleft();
    }
}
