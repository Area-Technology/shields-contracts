// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../interfaces/IShields.sol';
import '../interfaces/IFrameGenerator.sol';
import '../interfaces/IFieldGenerator.sol';
import '../interfaces/IHardwareGenerator.sol';
import '../EmblemWeaver.sol';

/// @dev Generate Shield Metadata
contract EmblemWeaverTest is EmblemWeaver {
    constructor(
        IFieldGenerator _fieldGenerator,
        IHardwareGenerator _hardwareGenerator,
        IFrameGenerator _frameGenerator,
        IShieldBadgeSVGs _shieldBadgeSVGGenerator
    ) EmblemWeaver(_fieldGenerator, _hardwareGenerator, _frameGenerator, _shieldBadgeSVGGenerator) {}

    function generateSVGTest(IShields.Shield memory shield)
        external
        view
        returns (
            string memory svg,
            string memory fieldTitle,
            string memory hardwareTitle,
            string memory frameTitle
        )
    {
        IFieldSVGs.FieldData memory field = fieldGenerator.generateField(shield.field, shield.colors);
        IHardwareSVGs.HardwareData memory hardware = hardwareGenerator.generateHardware(shield.hardware);
        IFrameSVGs.FrameData memory frame = frameGenerator.generateFrame(shield.frame);

        svg = string(generateSVG(field.svgString, hardware.svgString, frame.svgString));
        fieldTitle = field.title;
        hardwareTitle = hardware.title;
        frameTitle = frame.title;
    }
}
