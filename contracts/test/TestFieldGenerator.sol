// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../interfaces/IFieldGenerator.sol';
import '../interfaces/IFieldSVGs.sol';
import '@openzeppelin/contracts/utils/Strings.sol';

/// @dev Test Field Generator with less SVGs / less deploy overhead
contract TestFieldGenerator is IFieldGenerator {
    using Strings for uint16;

    mapping(uint24 => Color) public _colors;

    struct TestFieldSVGs {
        IFieldSVGs fieldSVGs1;
        IFieldSVGs fieldSVGs2;
    }

    IFieldSVGs immutable fieldSVGs1;
    IFieldSVGs immutable fieldSVGs2;

    constructor(
        uint24[] memory __colors,
        string[] memory titles,
        TestFieldSVGs memory svgs
    ) {
        require(__colors.length == titles.length, 'invalid array lengths');
        for (uint256 i = 0; i < __colors.length; i++) {
            _colors[__colors[i]] = Color({title: titles[i], exists: true});
            emit ColorAdded(__colors[i], titles[i]);
        }

        fieldSVGs1 = svgs.fieldSVGs1;
        fieldSVGs2 = svgs.fieldSVGs2;
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
        if (field <= 28) {
            return callFieldSVGs(fieldSVGs1, field, colors);
        }

        if (field <= 50) {
            return callFieldSVGs(fieldSVGs2, field, colors);
        }
        revert('invalid field selection');
    }
}
