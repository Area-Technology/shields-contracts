// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../../interfaces/IHardwareSVGs.sol';
import '../../interfaces/ICategories.sol';

/// @dev Experimenting with a contract that holds huuuge svg strings
contract HardwareSVGs27 is IHardwareSVGs, ICategories {
    function hardware_91() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Pugin Thistle',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient gradientUnits="userSpaceOnUse" id="h91-a" x1="4.78" x2="49.49" y1="50.4" y2="62.55"><stop offset="0" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientTransform="matrix(-1, 0, 0, 1, 16424.29, 0)" gradientUnits="userSpaceOnUse" id="h91-b" x1="16399.01" x2="16399.01" y2="46.44"><stop offset="0" stop-color="#404040"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientTransform="translate(1.12 -1.11) rotate(0.01)" id="h91-c" x1="35.79" x2="22.79" xlink:href="#h91-a" y1="62.33" y2="45.98"/><linearGradient gradientTransform="translate(1.12 -1.11) rotate(0.01)" id="h91-d" x1="28.31" x2="34.09" xlink:href="#h91-a" y1="53" y2="65.23"/><linearGradient id="h91-e" x1="14.89" x2="29.63" xlink:href="#h91-a" y1="43.47" y2="74.6"/><linearGradient id="h91-f" x1="30.2" x2="8.87" xlink:href="#h91-a" y1="68.79" y2="33.13"/><linearGradient id="h91-g" x1="16388.89" x2="16407.4" xlink:href="#h91-b" y1="43.76" y2="18.04"/><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 16470.66)" gradientUnits="userSpaceOnUse" id="h91-h" x1="40.12" x2="36.15" y1="16418.44" y2="16418.44"><stop offset="0" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><radialGradient cx="48.88" cy="45.94" gradientUnits="userSpaceOnUse" id="h91-i" r="70.72"><stop offset="0.3" stop-color="#f0f0f0"/><stop offset="0.51" stop-color="#6d6d6d"/><stop offset="0.67" stop-color="#dfdfdf"/></radialGradient><filter id="h91-j" name="shadow"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter><linearGradient gradientUnits="userSpaceOnUse" id="h91-k" x1="108.23" x2="111.5" y1="145.35" y2="145.35"><stop offset="0" stop-color="gray"/><stop offset="0.24" stop-color="#4b4b4b"/><stop offset="0.68" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><symbol id="h91-m" viewBox="0 0 26.34 65.15"><path d="M26,0c-1.13,9.22-1.38,16.08-.87,21.33-2-6-4.28-13.63-2.4-19.52-3.55,5.47-.52,17.23.77,23.35C21.4,18.6,17.72,11.74,19.2,4.82c-2.85,6.71.32,14.38,2.05,21.05-2.41-5.59-6.08-11.48-5.36-17.71-2.12,6.34,1.19,13.16,3.4,19.12-2.82-4.77-6.53-9.79-6.49-15.47C11.23,17,14.94,24.4,17.58,29.16c-3.26-4-7-8.24-7.62-13.43C9,21,13,27.32,16.26,31.49c-3.75-3.13-7.69-6.83-8.84-11.63-.39,5.28,4.13,11,8.07,14.35C11.21,32,6.9,28.64,5.18,24.17c.18,5.19,5.07,10.19,9.64,12.62-4.67-1-9.34-4-11.54-8.17.81,5.22,6.06,9.46,11.21,10.88A15.68,15.68,0,0,1,1.75,33.14c1.38,5.14,7,8.66,12.43,9.08A14.51,14.51,0,0,1,.73,37.61C2.66,42.78,9,45.6,14.59,45,9.71,46.69,3.78,45.74.17,42c2.42,5,8.92,7.06,14.42,6C9.8,50,3.93,49.75,0,46.26c3,5.07,10,6.28,15.65,4.54C10.79,53.27,4.58,53.66.14,50.21c4.23,5.85,13.18,5.47,19.09,2C14.12,56.33,6.32,58.47.5,54.5c4.1,4.82,11.07,4.76,16.77,2.37C12.33,59.86,6.18,61.16,1,58c4.17,4.26,10.92,4.1,16.76,2a17.46,17.46,0,0,1-8.12,3.45,19.5,19.5,0,0,0,12-3.19c-3.2,4.4-6.37,4.79-6.37,4.79,1.56.36,5.44-.33,8.2-3.54a6.6,6.6,0,0,1-1.2,3.63C25.49,63,26,60.81,26,56.72L26.34,25S26,15.21,26,0Z" fill="url(#h91-i)"/></symbol><symbol id="h91-l" viewBox="0 0 26.34 65.15"><use height="65.15" width="26.34" xlink:href="#h91-m"/><use height="65.15" transform="translate(9.39 21.3) scale(0.64 0.6)" width="26.34" xlink:href="#h91-m"/></symbol><symbol id="h91-r" viewBox="0 0 40.57 86.66"><path d="M14.85,44.6l24,28.05a6.09,6.09,0,0,1,0,1.61c-.69-1.32-4.15-2.61-6.5-1,0-1.49-1.53-3.15-4.63-2.75-.06-.92-.24-2.34-2.87-2.28.18-1.15-.36-3-2.94-2.86.34-.8.71-3.43-1.53-4a3,3,0,0,0-2.31-3.91,4,4,0,0,0-2.95-4.92c1-1.28.94-2.75-1.4-3.61C14,46.7,13,43.64,7.4,40.83A15.73,15.73,0,0,1,0,33.75C4.71,38.76,12.24,42,14.85,44.6Z" fill="url(#h91-a)"/><path d="M13.07,36.18a26.44,26.44,0,0,1-2.37-6.86c-1.29-6.71-.63-10.57.47-12.87a24.85,24.85,0,0,0,0,9.77c2.08,11.26,8.91,14.68,15.3,15.39a15.38,15.38,0,0,1-5.82-5.48c-1.47-2.38-2.48-3.53-5.77-4.19a4.85,4.85,0,0,1,3.77-.24c-1.76-5.86-2.48-9.63-5.15-12.63a5,5,0,0,1,3.72,1.86,38.48,38.48,0,0,1,.09-6.53c.24-2,0-3.48-2.09-5.63,1-.15,2.43.62,3.38,2.48C19.93,5.87,22.08,2.58,25.18,0A26.69,26.69,0,0,0,20.6,11c.46-.76,2.28-1.66,4.28-1.52-.85.09-2.34,1.53-3.48,3s-1.65,5.68-1,8.55a3.7,3.7,0,0,1,3.17-.94,5.12,5.12,0,0,0-3.17,4.81,16.18,16.18,0,0,0,1.52,7.33,5.61,5.61,0,0,1,1.77-2.87c-.53.6-.59,2.41,0,4.93,1.35,5.76,7,8.27,11.54,9.38a14.7,14.7,0,0,1-1.87-3.57c-.7-1.76-.94-2.58-4.16-4.28a8.93,8.93,0,0,1,3.22.59C31.2,32.2,30.85,29.85,28.27,28a3.44,3.44,0,0,1,3.46,1.82c.23-6,1.17-9.79,2.46-11.73a41.88,41.88,0,0,0-1.29,9c0,8,3.52,14.48,6.39,17h1.28v2.34H38.86a38.86,38.86,0,0,1-14.68-2.63A2.34,2.34,0,0,0,20.79,46a2.43,2.43,0,0,1,.15-3.29,15.51,15.51,0,0,1-6.15-4.15C13.61,37,12.26,37.18,10,37.8A3.3,3.3,0,0,1,13.07,36.18Z" fill="url(#h91-b)"/><path d="M32.94,53.48a10.83,10.83,0,0,1,4.75,9.57c-.53-1.37-2.12-3.89-7.38-7.45-3.12-2.09-5.44-6.38-5.66-8.08C25.48,49.51,28.7,50.56,32.94,53.48Z" fill="url(#h91-c)"/><path d="M24.64,47.52a13,13,0,0,0,5.66,9.16c5.27,3.56,6.85,6.08,7.39,7.45.06-2.52-1.38-6.3-5.62-9.23S26.47,51.88,24.64,47.52Z" fill="url(#h91-d)"/><path d="M38.92,72.5c-5.18-4.51-15-12.19-19.3-20.85C12.35,37.07,6.32,42.33.24,33.51L0,33.75s1.32,3.75,7.4,6.46c5.73,2.55,7,6.13,6.7,8.36,2.35.86,2.46,2.55,1.49,3.82,2.69.76,3.38,2.77,2.92,4.43a3,3,0,0,1,2.18,3.89c2.23.58,2.06,3.1,1.72,3.9a2.52,2.52,0,0,1,2.87,3c2.63-.06,2.85,1.43,2.91,2.34,3.09-.4,4.47,1.09,4.47,2.58,2.35-1.6,5.53-.63,6.2.69A1.42,1.42,0,0,0,38.92,72.5Z" fill="url(#h91-e)"/><path d="M19.05,52.12C23.41,60.75,33.47,68.9,38.92,72.5c0-.42-.06-.85-.06-.85-1.35-1.89-2.19-4.63-1.62-5.9-2.52.29-2.75-1.83-2.86-2.69-2.87.17-3.5-1.6-3.33-3-2.46-.11-3-1.6-2.92-2.92-2.35-.17-2.4-1.6-2.35-2.86a2.47,2.47,0,0,1-2.52-2.92,3,3,0,0,1-2.75-3.1c-2.69-.29-3.77-2.12-5.67-4.7s-5.49-3.53-8.11-4.83A18.48,18.48,0,0,1,.24,33.51C5.91,42.69,11.05,36.27,19.05,52.12Z" fill="url(#h91-f)"/><path d="M14,36.9a4.77,4.77,0,0,0-1-.73,26,26,0,0,1-2.38-6.86c-1.29-6.7-.62-10.57.47-12.87-2.41,8.1,0,26.15,18.08,27.05a16.53,16.53,0,0,1-2.78-1.88,15.43,15.43,0,0,1-5.81-5.48c-1.49-2.38-2.48-3.53-5.77-4.19a5.47,5.47,0,0,1,5.25,1.83,5.5,5.5,0,0,0-1.49-2.07c-1.76-5.86-2.47-9.63-5.14-12.63a8.65,8.65,0,0,1,3.74,4.42,24.07,24.07,0,0,0,0-2.56,37.47,37.47,0,0,1,.09-6.53c.24-2,0-3.48-2.1-5.63,2.71,1.68,2.72,2.88,2.92,3.81a7.45,7.45,0,0,0,.47-1.33C19.86,5.87,22,2.58,25.11,0,12.34,15.19,17.52,45.52,40.27,45.73a8.56,8.56,0,0,1-5.08-2,14.29,14.29,0,0,1-1.88-3.57c-.7-1.76-.94-2.58-4.16-4.28C32.64,37,33,37.66,33,37.66a3.81,3.81,0,0,0-.62-1.24c-1.23-4.22-1.58-6.57-4.16-8.39a5.48,5.48,0,0,1,3.54,3.4,3.93,3.93,0,0,0-.08-1.58c.23-6,1.17-9.79,2.46-11.73C30.26,29.26,32.64,43,40.56,45.73v.71H38.79A39,39,0,0,1,24.1,43.8,2.33,2.33,0,0,0,20.72,46a4.17,4.17,0,0,1,1.45-3.6c-.82.16-1.31.31-1.31.31a15.46,15.46,0,0,1-6.14-4.14c-1.18-1.53-2.53-1.39-4.8-.77C11.63,36.72,12.92,36.53,14,36.9Z" fill="url(#h91-g)"/><path d="M39.34,52.57s-1.48-2.36-3.19-2c1.48.33,2.72,2.51,2.72,4.84A20.34,20.34,0,0,0,39.34,52.57Zm0,5.32s-1.48-2.37-3.19-2c1.48.33,2.72,2.51,2.72,4.84A20.34,20.34,0,0,0,39.34,57.89Zm0,20.64s-1.48-2.37-3.19-2c1.48.33,2.72,2.51,2.72,4.84A22,22,0,0,0,39.34,78.53Zm0,5.32s-1.48-2.37-3.19-2c1.48.32,2.72,2.51,2.72,4.84A22,22,0,0,0,39.34,83.85ZM36.66,29.91c2.91,1.86,3.2,3.17,3.2,3.17l-.57,2.52A7.32,7.32,0,0,0,36.66,29.91ZM37,17.77a10.76,10.76,0,0,1,3.16,4.35c-.22,1.11-.53,2.34-.53,2.34A14.33,14.33,0,0,0,37,17.77Z" fill="url(#h91-h)"/></symbol></defs><g filter="url(#h91-j)"><use height="65.15" transform="translate(84.01 75.89)" width="26.34" xlink:href="#h91-l"/><use height="65.15" transform="matrix(-1, 0, 0, 1, 135.99, 75.89)" width="26.34" xlink:href="#h91-l"/><path d="M110,145a6.46,6.46,0,0,1-1.27-1v-8.49a6.29,6.29,0,0,0-2.63-5.69,4.23,4.23,0,0,1,2.93,1.58v-7a10.71,10.71,0,0,0-2.63-6.69,5.54,5.54,0,0,1,3,2.88V107.78a50.52,50.52,0,0,1,.61-8.66,50.52,50.52,0,0,1,.61,8.66v12.79a5.54,5.54,0,0,1,3-2.88,10.71,10.71,0,0,0-2.63,6.69v7a4.23,4.23,0,0,1,2.93-1.58,6.29,6.29,0,0,0-2.63,5.69V144A3.11,3.11,0,0,1,110,145Zm4.4,10.76a3.91,3.91,0,0,0-2.7.61V154a3.39,3.39,0,0,1,2.7-3.52,3.86,3.86,0,0,0-2.7.6v-4.7h-3.42v4.7a3.84,3.84,0,0,0-2.69-.6,3.36,3.36,0,0,1,2.69,3.47v2.45a3.84,3.84,0,0,0-2.69-.61,3.38,3.38,0,0,1,2.69,3.48V177a3.84,3.84,0,0,0-2.69-.61,3.38,3.38,0,0,1,2.69,3.48v2.45a3.84,3.84,0,0,0-2.69-.61,3.38,3.38,0,0,1,2.69,3.48v1.23a1.48,1.48,0,0,1-2-.61c1.4,2.52,3.16,3.48,3.76,5.76.6-2.28,2.36-3.24,3.75-5.76a1.49,1.49,0,0,1-2,.61v-1.18a3.41,3.41,0,0,1,2.7-3.53,3.85,3.85,0,0,0-2.7.61v-2.4a3.41,3.41,0,0,1,2.7-3.53,3.91,3.91,0,0,0-2.7.61V159.3A3.41,3.41,0,0,1,114.4,155.77Z" fill="url(#h91-k)"/><use height="86.66" transform="translate(69.44 99.92)" width="40.57" xlink:href="#h91-r"/><use height="86.66" transform="matrix(-1, 0, 0, 1, 150.56, 99.92)" width="40.57" xlink:href="#h91-r"/></g>'
                    )
                )
            );
    }

    function hardware_92() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Gauntlet',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient gradientTransform="matrix(1 0 0 -1 0 16399.46)" gradientUnits="userSpaceOnUse" id="h92-e" x1=".34" x2="33.04" y1="16388.11" y2="16388.11"><stop offset="0" stop-color="#fff"/><stop offset=".5" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h92-f" x1="0" x2="1" y1="0" y2="0"><stop offset="0" stop-color="gray"/><stop offset=".25" stop-color="#4b4b4b"/><stop offset=".7" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h92-a" x1="-.49" x2="7.41" y1="4.86" y2="3.47"><stop offset="0" stop-color="gray"/><stop offset=".2" stop-color="#4b4b4b"/><stop offset=".8" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h92-o" x1="92.93" x2="92.93" xlink:href="#h92-a" y1="150.07" y2="166.2"/><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h92-p" x1="92.69" x2="92.69" xlink:href="#h92-a" y1="145.09" y2="161.21"/><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h92-q" x1="92.45" x2="92.45" xlink:href="#h92-a" y1="140.1" y2="156.23"/><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" id="h92-r" x1="92.24" x2="92.24" xlink:href="#h92-a" y1="135.36" y2="151.49"/><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" gradientUnits="userSpaceOnUse" id="h92-b" x1="110" x2="110" y1="79.35" y2="98.54"><stop offset="0" stop-color="#696969"/><stop offset=".5" stop-color="#fff"/><stop offset="1" stop-color="#696969"/></linearGradient><linearGradient id="h92-t" x1="131.84" x2="88.16" xlink:href="#h92-b" y1="90.6" y2="90.6"/><clipPath id="h92-i"><path d="M95.93 106.27a26.4 26.4 0 0 1 1.26-8.39C98.6 93.77 100 86.71 100.54 85c3.11-2.38 4.94-1 6 1.37-2.3 9.72-2.18 10.77-2.51 14.21s-1.06 9.5-1.06 9.5Z" fill="none"/></clipPath><clipPath id="h92-l"><path d="M103 110.09s.72-6.07 1.06-9.5.21-4.49 2.51-14.21l.64-3c2.46-2.18 5.31-2.58 7 1.28a149.28 149.28 0 0 0-2 15.7c-.18 3.73-.73 9.55-.73 9.55Z" fill="none"/></clipPath><clipPath id="h92-m"><path d="M111.08 109.9s1-5.79 1.13-9.52A144.72 144.72 0 0 1 114 85.86c1.74-1.68 4.52-2.06 5.7.74-.81 6-.08 10.38-.46 14.46a42.15 42.15 0 0 0 .6 9.39Z" fill="none"/></clipPath><clipPath id="h92-n"><path d="M119.83 110.45a42.15 42.15 0 0 1-.6-9.39c.28-3.07-.06-6.34.1-10.31 2.57-3 5.21-1.48 6-.22.25 7.23 1.35 8.13 1.47 11.64s-.19 7 .65 10a21 21 0 0 1-7.62-1.72Z" fill="none"/></clipPath><symbol id="h92-j" viewBox="0 0 3.44 4.44"><path d="M1.72 1a1.72 1.72 0 1 0 1.72 1.72A1.72 1.72 0 0 0 1.72 1Z"/><path d="M1.72 3.44A1.72 1.72 0 1 0 0 1.72a1.72 1.72 0 0 0 1.72 1.72Z" fill="url(#h92-c)"/></symbol><symbol id="h92-d" viewBox="0 0 7.2 7.64"><path d="M3.6 0C2.55 1.53.63 1.05 0 2.3v5.34h7.2V2.3C6.57 1.05 4.65 1.53 3.6 0Z" fill="url(#h92-a)"/></symbol><symbol id="h92-k" viewBox="0 0 7.2 23.64"><use height="7.64" width="7.2" xlink:href="#h92-d"/><use height="7.64" transform="translate(0 4)" width="7.2" xlink:href="#h92-d"/><use height="7.64" transform="translate(0 8)" width="7.2" xlink:href="#h92-d"/><use height="7.64" transform="translate(0 12)" width="7.2" xlink:href="#h92-d"/><use height="7.64" transform="translate(0 16)" width="7.2" xlink:href="#h92-d"/></symbol><symbol id="h92-s" viewBox="0 0 33.51 15.29"><path d="M.34 10.81c0-4.33 32.41-4.42 32.67-.9.43 5.63-4.58 5-5 3.32a2.75 2.75 0 0 1-4.56.14 3.69 3.69 0 0 1-6-1 3.68 3.68 0 0 1-6.49.39C9.54 15.4 7 14.69 5.86 13a2.42 2.42 0 0 1-2.24 2.29c-1.19.06-3.28-1.23-3.28-4.48Z" fill="url(#h92-e)"/><path d="M.71 12.06C-.67 8.54 0 1.46 2.58.32 5-.71 7.27.89 8.36 3.16A5 5 0 0 1 13 1.38a5.24 5.24 0 0 1 3.91 3.2 4.08 4.08 0 0 1 3.36-2.93c3.4-.4 4.38 3.45 4.38 3.45h.06c1.19-2.17 5.46-3.81 7.15-1.29 4.47 6.68-1.22 12.37-3.81 8.45a2.75 2.75 0 0 1-4.56.14 3.69 3.69 0 0 1-6-1 3.68 3.68 0 0 1-6.49.39c-1.46 2.61-4 1.9-5.14.21a2.42 2.42 0 0 1-2.24 2.29 3.09 3.09 0 0 1-2.91-2.23Z" fill="url(#h92-f)"/></symbol><radialGradient cx=".5" cy=".1" id="h92-c" r="1.1"><stop offset="0" stop-color="gray"/><stop offset=".5" stop-color="#fff"/><stop offset=".6" stop-color="#4b4b4b"/><stop offset="1" stop-color="gray"/></radialGradient><radialGradient cx=".5" cy=".5" id="h92-h" r="1"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#696969"/></radialGradient><filter id="h92-g"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter></defs><g filter="url(#h92-g)"><path d="M91.46 98.76c-.21-1.43 1.64-1.93 2.91-1.85A2.91 2.91 0 0 1 97 99.12a44 44 0 0 1-.21 13.64l-2.35 3.49Z" fill="url(#h92-h)"/><g clip-path="url(#h92-i)"><use height="4.44" transform="matrix(2.63 0 0 2.63 99.28 82.69)" width="3.44" xlink:href="#h92-j"/><use height="23.64" transform="rotate(10.63 -412.2403 575.4692) scale(1.14)" width="7.2" xlink:href="#h92-k"/></g><g clip-path="url(#h92-l)"><use height="4.44" transform="matrix(2.63 0 0 2.63 105.95 81.6)" width="3.44" xlink:href="#h92-j"/><use height="23.64" transform="matrix(1.15 .14 -.14 1.09 105.97 84.56)" width="7.2" xlink:href="#h92-k"/></g><g clip-path="url(#h92-m)"><use height="4.44" transform="matrix(2.63 0 0 2.63 112.35 83.18)" width="3.44" xlink:href="#h92-j"/><use height="23.64" transform="matrix(1.14 .06 -.05 .97 112.44 87.19)" width="7.2" xlink:href="#h92-k"/></g><g clip-path="url(#h92-n)"><use height="4.44" transform="matrix(2.63 0 0 2.63 117.78 87.81)" width="3.44" xlink:href="#h92-j"/><use height="23.64" transform="matrix(1.13 -.08 .07 1 118.27 92.92)" width="7.2" xlink:href="#h92-k"/></g><path d="M89.53 97.8c3.88 3.12 4.6 5.42 4.6 5.42l2.21 5.32-1.11 5.39c-1.4-3.88-4.25-12.26-5.69-16.13Z" fill="url(#h92-o)"/><path d="M89.29 102.79c3.88 3.12 4.6 5.42 4.6 5.42l2.2 5.31-1.09 5.39c-1.4-3.87-4.24-12.26-5.69-16.12Z" fill="url(#h92-p)"/><path d="M89.05 107.78c3.88 3.11 4.59 5.41 4.59 5.41l2.21 5.32-1.11 5.39c-1.4-3.88-4.25-12.26-5.69-16.13Z" fill="url(#h92-q)"/><path d="M88.84 112.52c3.88 3.11 4.6 5.41 4.6 5.41l2.21 5.32-1.11 5.39c-1.4-3.88-4.25-12.26-5.69-16.13Z" fill="url(#h92-r)"/><path d="M95.27 133.15a26.14 26.14 0 0 1 31.07-.72l-5.11 17.74a19.21 19.21 0 0 1-21 0Z" fill="url(#h92-f)"/><use height="15.29" transform="matrix(.96 0 0 1 94.8 121.33)" width="33.51" xlink:href="#h92-s"/><use height="15.29" transform="matrix(1.04 0 0 1 93.38 115.28)" width="33.51" xlink:href="#h92-s"/><use height="15.29" transform="matrix(1.07 0 0 1 92.94 110.38)" width="33.51" xlink:href="#h92-s"/><use height="15.29" transform="matrix(1.07 0 0 1 93.2 104.84)" width="33.51" xlink:href="#h92-s"/><path d="M124 140.15a33.11 33.11 0 0 1-26.81 0c-2.49 8.28-5.74 16.78-8.87 24.85 5.54 8.21 12.62 14.78 21.71 18.71 8.32-4 17.65-9.53 21.9-17.71-2.14-8.14-5.71-17.73-7.93-25.85Z" fill="url(#h92-f)"/><path d="M133.71 164.7a1.37 1.37 0 0 0-1-.92 1.35 1.35 0 0 0-1.29.4A46.3 46.3 0 0 1 110 182.34a46.3 46.3 0 0 1-21.42-18.16 1.35 1.35 0 0 0-1.29-.4 1.35 1.35 0 0 0-.7 2.24A47.66 47.66 0 0 0 110 186.17 47.66 47.66 0 0 0 133.41 166a1.35 1.35 0 0 0 .3-1.3Z" fill="url(#h92-b)"/><path d="M124 140.15a33.11 33.11 0 0 1-26.81 0" fill="none" stroke="url(#h92-f)"/><path d="M131.42 164.18A46.3 46.3 0 0 1 110 182.34a46.3 46.3 0 0 1-21.42-18.16" fill="none" stroke="url(#h92-t)"/><path d="M90 100.21Zm-.47 4.79Zm-.4 4.79Zm-.29 4.73Z"/><use height="4.44" transform="translate(96.01 106.91)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(94.75 113.67)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(123.83 113.67)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(94.4 119.28)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(123.33 119.28)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(94.75 125.07)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(123.13 125.07)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(96.01 130.82)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(122.71 130.82)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(96.01 145.37)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(121.12 145.37)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(104.64 108.94)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(113.8 109.13)" width="3.44" xlink:href="#h92-j"/><use height="4.44" transform="translate(123.83 107.77)" width="3.44" xlink:href="#h92-j"/></g>'
                    )
                )
            );
    }
}
