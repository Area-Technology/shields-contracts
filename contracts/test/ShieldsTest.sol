// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../Shields.sol';
import '../interfaces/IFieldSVGs.sol';
import '../interfaces/IHardwareSVGs.sol';
import '../interfaces/IFrameSVGs.sol';
import '../interfaces/IShieldBadgeSVGs.sol';

/// @dev Generate Customizable Shields
contract ShieldsTest is Shields {
    constructor(
        string memory name_,
        string memory symbol_,
        IEmblemWeaver _emblemWeaver,
        address _makerBadgeRecipient,
        address _granteeBadgeRecipient
    ) Shields(name_, symbol_, _emblemWeaver, _makerBadgeRecipient, _granteeBadgeRecipient) {}

    function getNextId() external view returns (uint256) {
        return _nextId;
    }

    function setNextId(uint256 nextId) external {
        _nextId = nextId;
    }
}
