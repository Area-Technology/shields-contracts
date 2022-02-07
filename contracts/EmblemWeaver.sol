// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import './interfaces/ICategories.sol';
import './interfaces/IFrameGenerator.sol';
import './interfaces/IFieldGenerator.sol';
import './interfaces/IHardwareGenerator.sol';
import './interfaces/IShieldBadgeSVGs.sol';
import './interfaces/IFrameSVGs.sol';
import './interfaces/IShields.sol';
import '@openzeppelin/contracts/utils/Strings.sol';
import 'base64-sol/base64.sol';

/// @dev Generate Shield Metadata
contract EmblemWeaver {
    using Strings for uint8;

    IFieldGenerator public immutable fieldGenerator;
    IHardwareGenerator public immutable hardwareGenerator;
    IFrameGenerator public immutable frameGenerator;
    IShieldBadgeSVGs public immutable shieldBadgeSVGGenerator;

    constructor(
        IFieldGenerator _fieldGenerator,
        IHardwareGenerator _hardwareGenerator,
        IFrameGenerator _frameGenerator,
        IShieldBadgeSVGs _shieldBadgeSVGGenerator
    ) {
        fieldGenerator = _fieldGenerator;
        hardwareGenerator = _hardwareGenerator;
        frameGenerator = _frameGenerator;
        shieldBadgeSVGGenerator = _shieldBadgeSVGGenerator;
    }

    function generateShieldURI(IShields.Shield memory shield) external view returns (string memory) {
        IFieldSVGs.FieldData memory field = fieldGenerator.generateField(shield.field, shield.colors);
        IHardwareSVGs.HardwareData memory hardware = hardwareGenerator.generateHardware(shield.hardware);
        IFrameSVGs.FrameData memory frame = frameGenerator.generateFrame(shield.frame);

        string memory name = generateTitle(field.title, hardware.title, frame.title, shield.colors);
        bytes memory attributes = generateAttributesJSON(field, hardware, frame, shield.colors);

        return
            string(
                abi.encodePacked(
                    'data:application/json;base64,',
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name,
                                '", "description":"A unique Shield, designed and built on-chain. 1 of 5000.", "image": "data:image/svg+xml;base64,',
                                Base64.encode(bytes(generateSVG(field.svgString, hardware.svgString, frame.svgString))),
                                '", "attributes": ',
                                attributes,
                                '}'
                            )
                        )
                    )
                )
            );
    }

    function generateShieldBadgeURI(IShields.ShieldBadge shieldBadge) external view returns (string memory) {
        string memory badgeTitle;

        if (shieldBadge == IShields.ShieldBadge.MAKER) {
            badgeTitle = 'Maker ';
        } else if (shieldBadge == IShields.ShieldBadge.STANDARD) {
            badgeTitle = '';
        }

        return
            string(
                abi.encodePacked(
                    'data:application/json;base64,',
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                badgeTitle,
                                'Shield Badge',
                                '", "description":"An unused Shield Badge. Can be used to build 1 Shield.", "image": "data:image/svg+xml;base64,',
                                Base64.encode(bytes(shieldBadgeSVGGenerator.generateShieldBadgeSVG(shieldBadge))),
                                '", "attributes": [{"trait_type": "Status", "value":"Unbuilt"}]}'
                            )
                        )
                    )
                )
            );
    }

    function generateTitle(
        string memory fieldTitle,
        string memory hardwareTitle,
        string memory frameTitle,
        uint24[4] memory colors
    ) internal view returns (string memory) {
        bytes memory frameString = '';
        if (bytes(frameTitle).length > 0) {
            frameString = abi.encodePacked(frameTitle, ': ');
        }
        return
            string(abi.encodePacked(frameString, hardwareTitle, ' on ', generateColorTitleSnippet(colors), fieldTitle));
    }

    function generateColorTitleSnippet(uint24[4] memory colors) internal view returns (string memory) {
        bytes memory colorTitle = bytes(fieldGenerator.colorTitle(colors[0]));
        if (colors[1] > 0) {
            colorTitle = abi.encodePacked(
                colorTitle,
                colors[2] > 0 ? ' ' : ' and ',
                fieldGenerator.colorTitle(colors[1])
            );
        }
        if (colors[2] > 0) {
            colorTitle = abi.encodePacked(
                colorTitle,
                colors[3] > 0 ? ' ' : ' and ',
                fieldGenerator.colorTitle(colors[2])
            );
        }
        if (colors[3] > 0) {
            colorTitle = abi.encodePacked(colorTitle, ' and ', fieldGenerator.colorTitle(colors[3]));
        }
        colorTitle = abi.encodePacked(colorTitle, ' ');
        return string(colorTitle);
    }

    function generateSVG(
        string memory fieldSVG,
        string memory hardwareSVG,
        string memory frameSVG
    ) internal pure returns (bytes memory svg) {
        svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 220 264">',
            fieldSVG,
            hardwareSVG,
            frameSVG,
            '</svg>'
        );
    }

    function generateAttributesJSON(
        IFieldSVGs.FieldData memory fieldData,
        IHardwareSVGs.HardwareData memory hardwareData,
        IFrameSVGs.FrameData memory frameData,
        uint24[4] memory colors
    ) internal view returns (bytes memory attributesJSON) {
        attributesJSON = abi.encodePacked(
            '[{"trait_type":"Field", "value":"',
            fieldData.title,
            '"}, {"trait_type":"Hardware", "value":"',
            hardwareData.title,
            '"}, {"trait_type":"Status", "value":"Built',
            '"}, {"trait_type":"Field Type", "value":"',
            getFieldTypeString(fieldData.fieldType),
            '"}, {"trait_type":"Hardware Type", "value":"',
            getHardwareTypeString(hardwareData.hardwareType),
            conditionalFrameAttribute(frameData.title),
            colorAttributes(colors)
        );
    }

    function getFieldTypeString(ICategories.FieldCategories category) internal pure returns (string memory typeString) {
        if (category == ICategories.FieldCategories.MYTHIC) {
            typeString = 'Mythic';
        } else {
            typeString = 'Heraldic';
        }
    }

    function getHardwareTypeString(ICategories.HardwareCategories category)
        internal
        pure
        returns (string memory typeString)
    {
        if (category == ICategories.HardwareCategories.SPECIAL) {
            typeString = 'Special';
        } else {
            typeString = 'Standard';
        }
    }

    function conditionalFrameAttribute(string memory frameTitle) internal pure returns (bytes memory frameAttribute) {
        if (bytes(frameTitle).length > 0) {
            frameAttribute = abi.encodePacked('"}, {"trait_type":"Frame", "value":"', frameTitle);
        } else {
            frameAttribute = '';
        }
    }

    function colorAttributes(uint24[4] memory colors) private view returns (bytes memory colorArributes) {
        colorArributes = abi.encodePacked(
            '"}, {"trait_type":"Color 1", "value":"',
            fieldGenerator.colorTitle(colors[0]),
            conditionalColorAttribute(colors[1], 2),
            conditionalColorAttribute(colors[2], 3),
            conditionalColorAttribute(colors[3], 4),
            '"}]'
        );
    }

    function conditionalColorAttribute(uint24 color, uint8 nColor) private view returns (bytes memory colorArribute) {
        if (color != 0) {
            colorArribute = abi.encodePacked(
                '"}, {"trait_type":"Color ',
                nColor.toString(),
                '", "value":"',
                fieldGenerator.colorTitle(color)
            );
        } else {
            colorArribute = '';
        }
    }
}
