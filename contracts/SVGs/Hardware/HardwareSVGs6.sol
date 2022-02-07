// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../../interfaces/IHardwareSVGs.sol';
import '../../interfaces/ICategories.sol';

/// @dev Experimenting with a contract that holds huuuge svg strings
contract HardwareSVGs6 is IHardwareSVGs, ICategories {
    function hardware_23() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Pocketwatch',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><path d="M110 174.16A27.16 27.16 0 1 0 82.84 147 27.16 27.16 0 0 0 110 174.16Z" fill="url(#h23-a)" id="h23-t"/></defs><defs><linearGradient gradientUnits="userSpaceOnUse" id="h23-d" x1="4.5" x2="4.5" y1="3.26" y2="7.94"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h23-e" x1="4.5" x2="4.5" y1="2.62" y2="6.37"><stop offset="0" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h23-b" x1="110" x2="110" y1="111.39" y2="92.61"><stop offset="0" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" gradientUnits="userSpaceOnUse" id="h23-m" x1="106" x2="114" y1="159.5" y2="159.5"><stop offset="0" stop-color="gray"/><stop offset=".5" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" gradientUnits="userSpaceOnUse" id="h23-n" x1="107.54" x2="111.89" y1="153.5" y2="153.5"><stop offset="0" stop-color="gray"/><stop offset=".24" stop-color="#4b4b4b"/><stop offset=".68" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient id="h23-o" x1="110" x2="110" xlink:href="#h23-b" y1="106" y2="103"/><linearGradient gradientUnits="userSpaceOnUse" id="h23-c" x1="106" x2="114" y1="104.5" y2="104.5"><stop offset="0" stop-color="#fff"/><stop offset=".5" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h23-p" xlink:href="#h23-c" y1="148.59" y2="148.59"/><linearGradient id="h23-q" x1="110" x2="110" xlink:href="#h23-d" y1="91.62" y2="95.87"/><linearGradient id="h23-r" x1="110" x2="110" xlink:href="#h23-e" y1="90.62" y2="94.3"/><linearGradient id="h23-u" x1="110" x2="110" xlink:href="#h23-b" y1="172.93" y2="121.07"/><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h23-v" x1="110" x2="110" xlink:href="#h23-d" y1="102.51" y2="134.66"/><linearGradient id="h23-w" x1="109.76" x2="120.59" xlink:href="#h23-b" y1="147.74" y2="136.91"/><radialGradient cx=".5" cy=".75" id="h23-f" r="1"><stop offset="0" stop-color="gray"/><stop offset=".55" stop-color="#fff"/><stop offset=".64" stop-color="#4b4b4b"/><stop offset="1" stop-color="gray"/></radialGradient><radialGradient cx=".5" cy=".25" id="h23-j" r="1" xlink:href="#h23-f"/><radialGradient cx=".5" cy=".25" id="h23-g" r="1"><stop offset="0" stop-color="gray"/><stop offset=".55" stop-color="#fff"/><stop offset=".64" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></radialGradient><radialGradient cx=".5" cy=".75" id="h23-k" r="1" xlink:href="#h23-g"/><radialGradient cx="0" cy="264" gradientTransform="matrix(82.077 0 0 -82.077 110.4 21784.57)" gradientUnits="userSpaceOnUse" id="h23-l" r="1"><stop offset="0" stop-color="#4b4b4b"/><stop offset=".55" stop-color="#fff"/><stop offset=".62" stop-color="#4b4b4b"/><stop offset=".7" stop-color="gray"/></radialGradient><radialGradient cx=".5" cy=".25" id="h23-a" r="1"><stop offset="0" stop-color="gray" stop-opacity="0"/><stop offset=".55" stop-color="#fff" stop-opacity=".8"/><stop offset=".64" stop-color="gray" stop-opacity="0"/><stop offset=".76" stop-color="#fff"/></radialGradient><clipPath id="h23-h"><path d="M160 72v75a50 50 0 0 1-100 0V72Z" fill="none"/></clipPath><symbol id="h23-s" viewBox="0 0 9 9"><path d="M4.5 0A4.5 4.5 0 0 0 .76 7a4.5 4.5 0 0 1 1.51-1.39A2.47 2.47 0 0 1 2 4.5 2.5 2.5 0 1 1 4.5 7a2.5 2.5 0 0 0-2.23 1.39A4.44 4.44 0 0 0 4.5 9a4.5 4.5 0 0 0 0-9Z" fill="url(#h23-d)"/><path d="M4.5 1A3.5 3.5 0 0 0 1 4.5a3.46 3.46 0 0 0 .46 1.7 4.5 4.5 0 0 1 .81-.59A2.47 2.47 0 0 1 2 4.5 2.5 2.5 0 1 1 4.5 7a2.48 2.48 0 0 0-1.6.6 3.46 3.46 0 0 0 1.6.4 3.5 3.5 0 0 0 0-7Z" fill="url(#h23-e)"/><path d="M4.5 7a2.43 2.43 0 0 0-2.23 1.39 4.73 4.73 0 0 0 .85.37l.2-.98L4.5 7Z"/></symbol><filter id="h23-i"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter></defs><g clip-path="url(#h23-h)" filter="url(#h23-i)"><path d="M110 93.86a8.14 8.14 0 1 0 8.14 8.14 8.15 8.15 0 0 0-8.14-8.14Zm0 15.29a7.14 7.14 0 1 1 7.14-7.15 7.15 7.15 0 0 1-7.14 7.14Z" fill="url(#h23-f)"/><path d="M110 91.86A10.14 10.14 0 1 0 120.14 102 10.16 10.16 0 0 0 110 91.86Zm0 19.29a9.14 9.14 0 1 1 9.14-9.15 9.16 9.16 0 0 1-9.14 9.14Z" fill="url(#h23-j)"/><path d="M110 110.64a8.64 8.64 0 1 1 8.64-8.64 8.65 8.65 0 0 1-8.64 8.64Z" fill="none" stroke="url(#h23-b)" stroke-width="1.5"/><path d="M110 178.16A31.16 31.16 0 1 0 78.84 147 31.16 31.16 0 0 0 110 178.16Z" fill="url(#h23-g)"/><path d="M110 176.16A29.16 29.16 0 1 0 80.84 147 29.16 29.16 0 0 0 110 176.16Z" fill="url(#h23-k)"/><path d="M110 174.16A27.16 27.16 0 1 0 82.84 147 27.16 27.16 0 0 0 110 174.16Z" fill="url(#h23-l)"/><path d="M110,120.843A27.184,27.184,0,0,1,137.145,147.5c.002-.167.012-.333.012-.5a27.1571,27.1571,0,0,0-54.3142,0c0,.167.01.333.0127.5A27.1833,27.1833,0,0,1,110,120.843Z"/><path d="M113 107h-6l-1-1v-3l1-1h6l1 1v3Z" fill="url(#h23-m)"/><path d="M112.5 114h-5v-2.17l1-.8V110l-1-1.32V107h5v1.7l-1 1.3v1.02l1 .81Z" fill="url(#h23-n)"/><path d="M107.71 106h-.91v-3h.91Zm1.83-3h-.91v3h.91Zm1.83 0h-.91v3h.91Zm1.83 0h-.91v3h.91Z" fill="url(#h23-o)"/><path d="m113 102 1 1h-8l1-1Zm0 5 1-1h-8l1 1Z" fill="url(#h23-c)"/><path d="m107.5 114-1.5 2.09a11.25 11.25 0 0 0 8 0l-1.5-2.09Z" fill="url(#h23-p)"/><path d="M110 87.86a4.5 4.5 0 0 0-4.5 4.5 4.46 4.46 0 0 0 .05.54 10.04 10.04 0 0 1 1.97-.72 2.5 2.5 0 1 1 2.48 2.68h-.05a7.09 7.09 0 0 0-3.08.73 4.5 4.5 0 1 0 3.13-7.73Z" fill="url(#h23-q)"/><path d="M110 88.86a3.5 3.5 0 0 0-3.5 3.5l.01.13a9.94 9.94 0 0 1 1-.31 2.5 2.5 0 1 1 2.49 2.68l-2.08.3a3.47 3.47 0 0 0 2.08.7 3.5 3.5 0 0 0 0-7Z" fill="url(#h23-r)"/><use height="9" transform="translate(105.5 82.86)" width="9" xlink:href="#h23-s"/><use height="9" transform="translate(105.5 77.86)" width="9" xlink:href="#h23-s"/><use height="9" transform="translate(105.5 72.86)" width="9" xlink:href="#h23-s"/><path d="M110 94.86a6.58 6.58 0 0 0-3.14.72 4.1 4.1 0 0 0 1.7 1.04l.28-.96 1.16-.8Z"/><use xlink:href="#h23-t"/><use height="9" transform="translate(105.5 67.86)" width="9" xlink:href="#h23-s"/><path d="M110 121.07v4.64m-12.97-1.17 2.32 4.02m-11.81 5.47 4.02 2.32M84.06 147h4.65m-1.17 12.97 4.02-2.32m5.47 11.81 2.32-4.02m10.65 7.5v-4.65m12.97 1.17-2.32-4.02m11.81-5.47-4.02-2.32m7.5-10.65h-4.65m1.17-12.97-4.02 2.32m-5.47-11.81-2.32 4.02" fill="none" stroke="url(#h23-u)"/><path d="M110 169.75A22.75 22.75 0 1 0 87.25 147 22.75 22.75 0 0 0 110 169.75Z" fill="url(#h23-v)"/><path d="M126 145.5c-1.25 0-2.27 1.05-3.18.98l-11.43-.87-.87-8.43c-.07-.92.98-1.98.98-3.18 0-1.62-1-1.8-1.5-3.69-.52 1.93-1.5 2.22-1.5 3.69 0 1.36 1.05 2.27.98 3.18l-.96 9.5a1.67 1.67 0 0 0 1.8 1.8l12.5-.96c.84-.06 2.1.98 3.18.98 1.59 0 1.97-1.04 3.69-1.5-1.78-.53-2.36-1.5-3.69-1.5Z"/><path d="M126 144.5c-1.25 0-2.27 1.05-3.18.98l-11.43-.87-.87-8.43c-.07-.92.98-1.98.98-3.18 0-1.62-1-1.8-1.5-3.69-.52 1.93-1.5 2.22-1.5 3.69 0 1.36 1.05 2.27.98 3.18l-.96 9.5a1.67 1.67 0 0 0 1.8 1.8l12.5-.96c.84-.06 2.1.98 3.18.98 1.59 0 1.97-1.04 3.69-1.5-1.78-.53-2.36-1.5-3.69-1.5Z" fill="url(#h23-w)"/><use xlink:href="#h23-t"/></g>'
                    )
                )
            );
    }

    function hardware_24() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Anvil',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><filter id="h24-a" name="shadow"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter><linearGradient gradientUnits="userSpaceOnUse" id="h24-b" x1="81.77" x2="81.77" y1="117.71" y2="101.94"><stop offset="0" stop-color="gray"/><stop offset="0.2" stop-color="#4b4b4b"/><stop offset="0.8" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h24-c" x1="118.07" x2="118.07" y1="99.55" y2="161.5"><stop offset="0" stop-color="gray"/><stop offset="0.5" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h24-d" x1="118.06" x2="118.06" y1="162" y2="99.05"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient id="h24-e" x1="83" x2="137" xlink:href="#h24-c" y1="159.21" y2="159.21"/><linearGradient gradientUnits="userSpaceOnUse" id="h24-f" x1="110" x2="110" y1="132" y2="156.92"><stop offset="0" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h24-g" x1="110" x2="110" xlink:href="#h24-c" y1="157.42" y2="131.5"/><linearGradient gradientUnits="userSpaceOnUse" id="h24-h" x1="85" x2="135" y1="99.55" y2="99.55"><stop offset="0" stop-color="#fff"/><stop offset="0.5" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h24-i" x1="134" x2="151" xlink:href="#h24-f" y1="102.55" y2="102.55"/><linearGradient id="h24-j" x1="84.64" x2="135.36" xlink:href="#h24-h" y1="156.14" y2="156.14"/></defs><g filter="url(#h24-a)"><path d="M68.87,102v2c16.6,7.32,25.8,15,25.8,32,0-14.79-5.48-28.23-8.19-34Z" fill="url(#h24-b)"/><path d="M87.5,161.5v-4.64c4-.91,7.67-12.3,7.67-20.89,0-11.64-3.4-19.15-6.13-25.18-1.82-4-3.4-7.51-3.53-11.24h49v3h16.13v5.38c-12.9.25-25.8,9.88-25.8,28.09,0,8.59,3.72,20,7.67,20.89v4.64Z" fill="url(#h24-c)" stroke="url(#h24-d)"/><polygon fill="url(#h24-e)" points="137 162 83 162 85 156.42 135 156.42 137 162"/><path d="M110,132c-8.47,0-10.35,24.92-10.35,24.92h20.7S118.47,132,110,132Z" fill="url(#h24-f)" stroke="url(#h24-g)"/><polygon fill="url(#h24-h)" points="134 100.05 86 100.05 85 99.05 135 99.05 134 100.05"/><polygon fill="url(#h24-i)" points="150 103.05 134 103.05 135 102.05 151 102.05 150 103.05"/><path d="M135.36,157.42l-.36-1H119.82s-3-1.57-9.82-1.57-9.85,1.57-9.85,1.57H85l-.36,1Z" fill="url(#h24-j)"/></g>'
                    )
                )
            );
    }

    function hardware_25() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Crozier',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient gradientUnits="userSpaceOnUse" id="h25-a" x2="9" y1="3" y2="3"><stop offset="0" stop-color="#4b4b4b"/><stop offset="0.5" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 16478.4)" gradientUnits="userSpaceOnUse" id="h25-b" x2="9" y1="16477.4" y2="16477.4"><stop offset="0" stop-color="#fff"/><stop offset="0.5" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><clipPath id="h25-c"><path d="M60 72v75a50 50 0 0 0 50 50 50 50 0 0 0 50-50V72Z" fill="none"/></clipPath><filter id="h25-d" name="shadow"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter><linearGradient gradientUnits="userSpaceOnUse" id="h25-e" x1="109.6" x2="109.6" y1="199.99" y2="86.57"><stop offset="0" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h25-f" x1="109.78" x2="109.78" xlink:href="#h25-e" y1="95.99" y2="199.99"/><linearGradient id="h25-g" x1="81.98" x2="137.75" xlink:href="#h25-e" y1="170.82" y2="115.05"/><linearGradient gradientUnits="userSpaceOnUse" id="h25-h" x1="107.47" x2="107.47" y1="134.1" y2="120.06"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient id="h25-i" x1="101.49" x2="101.49" xlink:href="#h25-h" y1="146.88" y2="132.4"/><linearGradient id="h25-j" x1="125.18" x2="125.18" xlink:href="#h25-h" y1="102.84" y2="86.8"/><linearGradient id="h25-k" x1="129.5" x2="141.41" xlink:href="#h25-h" y1="116.1" y2="116.1"/><linearGradient id="h25-l" x1="119.03" x2="130.05" xlink:href="#h25-h" y1="136.11" y2="136.11"/><linearGradient id="h25-m" x1="101.92" x2="101.92" xlink:href="#h25-h" y1="95.69" y2="86.57"/><linearGradient id="h25-n" x1="92.89" x2="77.79" xlink:href="#h25-h" y1="108.42" y2="108.42"/><linearGradient id="h25-o" x1="92.52" x2="86.41" xlink:href="#h25-h" y1="128.13" y2="128.13"/><symbol id="h25-p" viewBox="0 0 9 4"><polygon fill="url(#h25-a)" points="7 4 2 4 0 2 9 2 7 4"/><polygon fill="url(#h25-b)" points="7 0 2 0 0 2 9 2 7 0"/></symbol></defs><g clip-path="url(#h25-c)"><g filter="url(#h25-d)"><path d="M132.051,115.014a24.09,24.09,0,0,0-2.859-10.331l.011.011C125,96.9,127.27,86.8,127.27,86.8c-3.187,4.334-4.152,10.65-4.152,10.65C112.5,90.379,98.705,94.819,94.244,86.572c1.613,6.147,5.887,8.377,5.887,8.377h0c-8.351,3.893-10.989,14.058-22.347,16.149a36.667,36.667,0,0,0,10.237.458,23.382,23.382,0,0,0-.309,3.777c.012,6.75,4.3,12.193-1.3,19.168a9.434,9.434,0,0,0,6.11-5.492C96.452,134.1,106.672,136.7,102.555,142c-1.369,1.762-6.5.544-7.408-2.475-.669,4.925,4.8,8.7,9.9,4.519,5.376-4.408-2.711-14.005-2.711-14.005-5.041-2.771-9.623-7.785-9.445-14.5.281-10.624,8.265-17.334,16.555-17.4,8.87-.067,17.557,8.043,17.512,17.428-.025,5.261-3,10.814-6.034,15.048-5.319,7.37-12.79,15.331-12.82,28.843V199.99h4.781l0-41.708c0-5.748,2.113-10.648,4.957-15.123,5.3-6.929,12.2-5.595,12.2-5.595l-5.955-2.911a62.271,62.271,0,0,0,5.956-9.766v.008c3.124-6.422,5.554-9.933,11.361-10.885C138.027,112.135,132.051,115.014,132.051,115.014Z" fill="url(#h25-e)"/><path d="M129.2,116.485c0-13.672-9.9-20.493-19.2-20.493-10.1,0-19.636,7.1-19.636,19.629,0,14.666,15.63,18.4,15.63,18.4,5.475-.863,10.38-11.177,1.842-13.966,6.47,5.192-.3,12-5.392,9.329-5.041-2.771-9.057-7.134-8.88-13.849.281-10.624,7.6-16.723,15.885-16.785a16.945,16.945,0,0,1,16.809,16.817c-.026,5.261-2.862,9.97-5.9,14.2-5.319,7.37-13.224,14.793-13.254,28.305l.008,41.91H110V159.633C110,138.807,129.2,130.573,129.2,116.485Z" fill="url(#h25-f)"/><path d="M110,198.34V159.63c0-20.82,19.2-29.06,19.2-43.14,0-13.68-9.89-20.5-19.2-20.5-10.1,0-19.64,7.1-19.64,19.63,0,14.67,15.73,18,15.73,18" fill="none" stroke="url(#h25-g)"/><path d="M107.84,120.06c10,1,6,15.16-1.85,14l-4.83-1.62c5.65,3.22,15.88-6.71,6.68-12.34" fill="url(#h25-h)"/><path d="M95.15,139.52c0,2.13,1.27,5.22,5.16,5.22,7.2,0,6.6-9.68.85-12.34L106,134c3.1,2.79,2.81,8.48-1,11.28-5.31,3.91-11.5,0-9.85-5.78" fill="url(#h25-i)"/><use height="4" transform="matrix(1.33, 0, 0, -1.33, 103.78, 164.67)" width="9" xlink:href="#h25-p"/><use height="4" transform="matrix(1.33, 0, 0, -1.33, 103.78, 174.67)" width="9" xlink:href="#h25-p"/><path d="M127.27,86.8c-3.91,4.17-4.19,10.61-4.19,10.61a18.25,18.25,0,0,0,2,5.43s-1.21-10.42,2.16-16" fill="url(#h25-j)"/><path d="M141.41,114c-6.21-.65-11.91,5.33-11.91,5.33a15.78,15.78,0,0,1,2.55-4.33C135.66,111.9,140,112.71,141.41,114Z" fill="url(#h25-k)"/><path d="M130.05,137.56a19.45,19.45,0,0,0-11-.58,10.08,10.08,0,0,1,5.06-2.33S128.14,135,130.05,137.56Z" fill="url(#h25-l)"/><path d="M94.24,86.57c1.17,5.79,11.69,8.92,15.36,8.92-6.33.66-9.47-.54-9.47-.54C94.58,93,94.24,86.57,94.24,86.57Z" fill="url(#h25-m)"/><path d="M77.79,111.1c6.19-.18,12.26-3,15.1-6.39-3.18,5.68-4.87,6.85-4.87,6.85C83.79,113.09,77.79,111.1,77.79,111.1Z" fill="url(#h25-n)"/><path d="M86.41,134.5c5.74-4.71,4.94-9.53,4.56-12.74A34.69,34.69,0,0,1,92.52,129C91.93,133.37,86.82,134.43,86.41,134.5Z" fill="url(#h25-o)"/></g></g>'
                    )
                )
            );
    }
}