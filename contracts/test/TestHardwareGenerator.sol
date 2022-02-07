// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../interfaces/IHardwareGenerator.sol';
import '../interfaces/IHardwareSVGs.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

/// @dev Test Hardware Generator with less SVGs / less deploy overhead
contract TestHardwareGenerator is IHardwareGenerator {
    using Strings for uint16;

    IHardwareSVGs immutable hardwareSVGs1;
    // needed to scrounge for a MYTHIC hardware
    IHardwareSVGs immutable hardwareSVGs29;

    struct TestHardwardSVGs {
        IHardwareSVGs hardwareSVGs1;
        IHardwareSVGs hardwareSVGs29;
    }

    constructor(TestHardwardSVGs memory svgs) {
        hardwareSVGs1 = svgs.hardwareSVGs1;
        hardwareSVGs29 = svgs.hardwareSVGs29;
    }

    function callHardwareSVGs(IHardwareSVGs target, uint16 hardware)
        internal
        view
        returns (IHardwareSVGs.HardwareData memory)
    {
        bytes memory functionSelector = abi.encodePacked('hardware_', uint16(hardware).toString(), '()');

        bool success;
        bytes memory result;
        (success, result) = address(target).staticcall(abi.encodeWithSelector(bytes4(keccak256(functionSelector))));

        return abi.decode(result, (IHardwareSVGs.HardwareData));
    }

    function generateHardware(uint16 hardware) external view override returns (IHardwareSVGs.HardwareData memory) {
        if (hardware <= 5) {
            return callHardwareSVGs(hardwareSVGs1, hardware);
        }

        // needed to scrounge for a MYTHIC hardware
        if (hardware == 96 || hardware == 97) {
            return callHardwareSVGs(hardwareSVGs29, hardware);
        }

        revert('invalid hardware selection');
    }
}
