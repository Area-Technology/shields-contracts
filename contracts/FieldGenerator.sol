// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import './interfaces/IFieldGenerator.sol';
import './interfaces/IFieldSVGs.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

/// @dev Generate Field SVG and properties
contract FieldGenerator is IFieldGenerator {
    using Strings for uint16;

    mapping(uint24 => Color) private _colors;

    IFieldSVGs immutable fieldSVGs1;
    IFieldSVGs immutable fieldSVGs2;
    IFieldSVGs immutable fieldSVGs3;
    IFieldSVGs immutable fieldSVGs4;
    IFieldSVGs immutable fieldSVGs5;
    IFieldSVGs immutable fieldSVGs6;
    IFieldSVGs immutable fieldSVGs7;
    IFieldSVGs immutable fieldSVGs8;
    IFieldSVGs immutable fieldSVGs9;
    IFieldSVGs immutable fieldSVGs10;
    IFieldSVGs immutable fieldSVGs11;
    IFieldSVGs immutable fieldSVGs12;
    IFieldSVGs immutable fieldSVGs13;
    IFieldSVGs immutable fieldSVGs14;
    IFieldSVGs immutable fieldSVGs15;
    IFieldSVGs immutable fieldSVGs16;
    IFieldSVGs immutable fieldSVGs17;
    IFieldSVGs immutable fieldSVGs18;
    IFieldSVGs immutable fieldSVGs19;
    IFieldSVGs immutable fieldSVGs20;
    IFieldSVGs immutable fieldSVGs21;
    IFieldSVGs immutable fieldSVGs22;
    IFieldSVGs immutable fieldSVGs23;
    IFieldSVGs immutable fieldSVGs24;

    constructor(
        uint24[] memory __colors,
        string[] memory titles,
        FieldSVGs memory svgs
    ) {
        require(__colors.length == titles.length, 'invalid array lengths');
        for (uint256 i = 0; i < __colors.length; i++) {
            require(__colors[i] != 0, 'FieldGenerator: colors cannot be 0');
            _colors[__colors[i]] = Color({title: titles[i], exists: true});
            emit ColorAdded(__colors[i], titles[i]);
        }

        fieldSVGs1 = svgs.fieldSVGs1;
        fieldSVGs2 = svgs.fieldSVGs2;
        fieldSVGs3 = svgs.fieldSVGs3;
        fieldSVGs4 = svgs.fieldSVGs4;
        fieldSVGs5 = svgs.fieldSVGs5;
        fieldSVGs6 = svgs.fieldSVGs6;
        fieldSVGs7 = svgs.fieldSVGs7;
        fieldSVGs8 = svgs.fieldSVGs8;
        fieldSVGs9 = svgs.fieldSVGs9;
        fieldSVGs10 = svgs.fieldSVGs10;
        fieldSVGs11 = svgs.fieldSVGs11;
        fieldSVGs12 = svgs.fieldSVGs12;
        fieldSVGs13 = svgs.fieldSVGs13;
        fieldSVGs14 = svgs.fieldSVGs14;
        fieldSVGs15 = svgs.fieldSVGs15;
        fieldSVGs16 = svgs.fieldSVGs16;
        fieldSVGs17 = svgs.fieldSVGs17;
        fieldSVGs18 = svgs.fieldSVGs18;
        fieldSVGs19 = svgs.fieldSVGs19;
        fieldSVGs20 = svgs.fieldSVGs20;
        fieldSVGs21 = svgs.fieldSVGs21;
        fieldSVGs22 = svgs.fieldSVGs22;
        fieldSVGs23 = svgs.fieldSVGs23;
        fieldSVGs24 = svgs.fieldSVGs24;
    }

    function colorExists(uint24 color) public view override returns (bool) {
        return _colors[color].exists;
    }

    function colorTitle(uint24 color) public view override returns (string memory) {
        return _colors[color].title;
    }

    function callFieldSVGs(
        IFieldSVGs target,
        uint16 field,
        uint24[4] memory colors
    ) internal view returns (IFieldSVGs.FieldData memory) {
        bytes memory functionSelector = abi.encodePacked('field_', uint16(field).toString(), '(uint24[4])');

        bool success;
        bytes memory result;
        (success, result) = address(target).staticcall(
            abi.encodeWithSelector(bytes4(keccak256(functionSelector)), colors)
        );

        return abi.decode(result, (IFieldSVGs.FieldData));
    }

    function generateField(uint16 field, uint24[4] memory colors)
        external
        view
        override
        returns (IFieldSVGs.FieldData memory)
    {
        if (field <= 27) {
            return callFieldSVGs(fieldSVGs1, field, colors);
        }

        if (field <= 50) {
            return callFieldSVGs(fieldSVGs2, field, colors);
        }

        if (field <= 66) {
            return callFieldSVGs(fieldSVGs3, field, colors);
        }

        if (field <= 89) {
            return callFieldSVGs(fieldSVGs4, field, colors);
        }

        if (field <= 110) {
            return callFieldSVGs(fieldSVGs5, field, colors);
        }

        if (field <= 132) {
            return callFieldSVGs(fieldSVGs6, field, colors);
        }

        if (field <= 150) {
            return callFieldSVGs(fieldSVGs7, field, colors);
        }

        if (field <= 170) {
            return callFieldSVGs(fieldSVGs8, field, colors);
        }

        if (field <= 177) {
            return callFieldSVGs(fieldSVGs9, field, colors);
        }

        if (field <= 193) {
            return callFieldSVGs(fieldSVGs10, field, colors);
        }

        if (field <= 198) {
            return callFieldSVGs(fieldSVGs11, field, colors);
        }

        if (field <= 205) {
            return callFieldSVGs(fieldSVGs12, field, colors);
        }

        if (field <= 211) {
            return callFieldSVGs(fieldSVGs13, field, colors);
        }

        if (field <= 217) {
            return callFieldSVGs(fieldSVGs14, field, colors);
        }

        if (field <= 223) {
            return callFieldSVGs(fieldSVGs15, field, colors);
        }

        if (field <= 227) {
            return callFieldSVGs(fieldSVGs16, field, colors);
        }

        if (field <= 233) {
            return callFieldSVGs(fieldSVGs17, field, colors);
        }

        if (field <= 243) {
            return callFieldSVGs(fieldSVGs18, field, colors);
        }

        if (field <= 262) {
            return callFieldSVGs(fieldSVGs19, field, colors);
        }

        if (field <= 275) {
            return callFieldSVGs(fieldSVGs20, field, colors);
        }

        if (field <= 284) {
            return callFieldSVGs(fieldSVGs21, field, colors);
        }

        if (field <= 289) {
            return callFieldSVGs(fieldSVGs22, field, colors);
        }

        if (field <= 298) {
            return callFieldSVGs(fieldSVGs23, field, colors);
        }

        if (field == 299) {
            return callFieldSVGs(fieldSVGs24, field, colors);
        }

        revert('invalid field selection');
    }
}
