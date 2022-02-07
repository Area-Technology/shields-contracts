// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.9;

import '../../interfaces/IHardwareSVGs.sol';
import '../../interfaces/ICategories.sol';

/// @dev Experimenting with a contract that holds huuuge svg strings
contract HardwareSVGs10 is IHardwareSVGs, ICategories {
    function hardware_38() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Quatrefoil and Three Books in Chief',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient id="h38-a" x1="0" x2="0" y1="1" y2="0"><stop offset="0" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h38-0" x1="0" x2="0" y1="0" y2="1"><stop offset="0" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="h38-b" x1="0" x2="0" xlink:href="#h38-0" y1="0" y2="1"></linearGradient><linearGradient id="h38-c" x1="0" x2="0" xlink:href="#h38-0" y1="-.3" y2="1.2"/><linearGradient id="h38-d" x1="0" x2="1" y1="0" y2="0"><stop offset="0" stop-color="gray"/><stop offset="0.35" stop-color="#fff"/><stop offset="0.5" stop-color="#4b4b4b"/><stop offset="0.65" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h38-e" x1="18.64" x2="18.64" y1="28.17" y2="54.39"><stop offset="0.2" stop-color="gray"/><stop offset="0.8" stop-color="#fff"/></linearGradient><linearGradient id="h38-f" x1="41.28" x2="41.28" xlink:href="#h38-e" y1="3" y2="34.28"/><linearGradient id="h38-g" x1="55.02" x2="33.28" xlink:href="#h38-e" y1="18.64" y2="18.64"/><linearGradient id="h38-h" x1="18.64" x2="18.64" xlink:href="#h38-e" y1="33.28" y2="55.02"/><linearGradient id="h38-i" xlink:href="#h38-0"/><linearGradient id="h38-j" x1="0" x2="0" xlink:href="#h38-0" y1="1" y2="0"/><linearGradient id="h38-k" x1="87.36" x2="87.36" xlink:href="#h38-e" y1="131.36" y2="162.64"/><linearGradient id="h38-l" x1="110" x2="110" xlink:href="#h38-e" y1="111.25" y2="137.47"/><linearGradient id="h38-m" x1="110" x2="110" xlink:href="#h38-e" y1="132.36" y2="110.62"/><linearGradient id="h38-n" x1="73.62" x2="95.36" xlink:href="#h38-e" y1="147" y2="147"/><linearGradient id="h38-o" xlink:href="#h38-0" y1="1.5" y2="-.2"/><symbol id="h38-p" viewBox="0 0 23.78 15.73"><polygon points="23.78 5.91 23.78 4.03 22.78 4.16 22.78 2.41 1 2.41 1 4.16 0 4.03 0 5.91 1 5.91 1 11.16 0 11.04 0 12.92 1 12.92 1 14.67 9.58 14.67 9.58 15.73 14.2 15.73 14.2 14.67 22.78 14.67 22.78 12.92 23.78 12.92 23.78 11.04 22.78 11.16 22.78 5.91 23.78 5.91"/><polygon fill="url(#h38-a)" points="23.78 4.91 23.78 3.16 22.78 3.16 22.78 1.41 1 1.41 1 3.16 0 3.16 0 4.91 1 4.91 1 10.16 0 10.16 0 11.92 1 11.92 1 13.67 9.79 13.67 9.58 14.73 14.2 14.73 13.99 13.67 22.78 13.67 22.78 11.92 23.78 11.92 23.78 10.16 22.78 10.16 22.78 4.91 23.78 4.91"/><path d="M2.81,11.28,1.54,13.13V1.41L2.81,0Zm18.16,0,1.27,1.85V1.41L21,0Z" fill="url(#h38-b)"/><path d="M13.29,13.13l.22,1.06H10.27l.22-1.06H1.54l1.27-1.85H21l1.27,1.85Z" fill="url(#h38-c)"/><path d="M14.79,0C13,0,12.36.65,11.89,1.41,11.43.65,10.77,0,9,0L2.81,0V11.28H8.74c1.75,0,2.8.43,3.15,1.45.35-1,1.4-1.45,3.15-1.45H21V0Z" fill="url(#h38-d)"/></symbol><symbol id="h38-s" viewBox="0 0 55.02 55.02"><path d="M31.28,38.75A12.64,12.64,0,0,1,6,38.75c0-4.12,3.08-10.52,3.11-10.58L4,33.28a15.48,15.48,0,0,0-1,5.47,15.64,15.64,0,0,0,31.28,0,15.48,15.48,0,0,0-1-5.47l-5.11-5.11S31.28,34.68,31.28,38.75Z" fill="url(#h38-e)"/><path d="M38.75,6a12.64,12.64,0,0,1,0,25.28c-4,0-10.57-3.11-10.58-3.11l5.11,5.11a15.48,15.48,0,0,0,5.47,1A15.64,15.64,0,0,0,38.75,3a15.48,15.48,0,0,0-5.47,1L28.17,9.11S34.68,6,38.75,6Z" fill="url(#h38-f)"/><path d="M55,18.64c0-9.83-4.3-14.16-5.34-15.07A18.58,18.58,0,0,0,38.75,0Q38,0,37.22.06L33.28,4a15.48,15.48,0,0,1,5.47-1,15.64,15.64,0,0,1,0,31.28,15.48,15.48,0,0,1-5.47-1l3.94,3.94c.51,0,1,.06,1.53.06a18.58,18.58,0,0,0,10.93-3.57C50.73,32.79,55,28.46,55,18.64Z" fill="url(#h38-g)"/><path d="M18.64,55c9.82,0,14.15-4.29,15.07-5.34a18.58,18.58,0,0,0,3.57-10.93c0-.52,0-1-.06-1.53l-3.94-3.94a15.48,15.48,0,0,1,1,5.47A15.64,15.64,0,0,1,3,38.75a15.48,15.48,0,0,1,1-5.47L.06,37.22Q0,38,0,38.75A18.53,18.53,0,0,0,3.57,49.67C4.47,50.71,8.8,55,18.64,55Z" fill="url(#h38-h)"/></symbol></defs><path d="M110,108.62A40.38,40.38,0,1,0,150.38,149,40.43,40.43,0,0,0,110,108.62Zm14.26,60.48c0,7-7.29,12.65-14.26,12.65s-14.26-5.67-14.26-12.65c0-4.11,4.73-12.57,4.73-12.57s-6.62,5.11-10.57,5.11A12.66,12.66,0,0,1,77.25,149c0-7,5.68-13.64,12.65-13.64,6.71,0,10.56,2.11,10.57,2.11s-3.11-4.53-3.11-8.57a12.64,12.64,0,1,1,25.28,0c0,3.86-3.11,8.56-3.11,8.57s3.78-2.11,10.57-2.11c7,0,12.65,6.67,12.65,13.64a12.66,12.66,0,0,1-12.65,12.64c-4,0-10.56-5.11-10.57-5.11S124.26,165,124.26,169.1Zm16.56-35.31a18.48,18.48,0,0,0-10.72-3.43c-.51,0-1,0-1.52.06h0c0-.5.06-1,.06-1.52a18.48,18.48,0,0,0-3.43-10.72A34.59,34.59,0,0,1,140.82,133.79Zm-46-15.61a18.48,18.48,0,0,0-3.43,10.72c0,.51,0,1,.06,1.52-.5,0-1-.06-1.52-.06a18.48,18.48,0,0,0-10.72,3.43A34.59,34.59,0,0,1,94.79,118.18Zm-15.61,46a18.48,18.48,0,0,0,10.72,3.43c.51,0,1,0,1.52-.06h0c0,.51-.06,1-.06,1.52a18.48,18.48,0,0,0,3.43,10.72A34.59,34.59,0,0,1,79.18,164.21Zm46,15.61a18.48,18.48,0,0,0,3.43-10.72c0-.51,0-1-.06-1.52.5,0,1,.06,1.52.06a18.48,18.48,0,0,0,10.72-3.43A34.59,34.59,0,0,1,125.21,179.82Z"/><use height="15.73" transform="translate(98.11 80.24)" width="23.78" xlink:href="#h38-p"/><use height="15.73" transform="translate(123.11 80.24)" width="23.78" xlink:href="#h38-p"/><use height="15.73" transform="translate(73.11 80.24)" width="23.78" xlink:href="#h38-p"/><circle cx="110" cy="147" fill="none" r="35.88" stroke="url(#h38-i)" stroke-width="3"/><circle cx="110" cy="147" fill="none" r="38.88" stroke="url(#h38-j)" stroke-width="3"/><path d="M100.47,156.53s-6.62,3.11-10.57,3.11a12.64,12.64,0,1,1,0-25.28c4,0,10.56,3.11,10.57,3.11h0l-5.11-5.11a15.47,15.47,0,0,0-5.46-1,15.64,15.64,0,1,0,0,31.28,15.47,15.47,0,0,0,5.46-1l5.11-5.11Z" fill="url(#h38-k)"/><path d="M110,111.25A15.65,15.65,0,0,0,94.36,126.9a15.47,15.47,0,0,0,1,5.46l5.11,5.11c0-.05-3.11-6.53-3.11-10.57a12.64,12.64,0,1,1,25.28,0c0,3.86-3.11,10.56-3.11,10.57l5.11-5.11a15.47,15.47,0,0,0,1-5.46A15.65,15.65,0,0,0,110,111.25Z" fill="url(#h38-l)"/><path d="M128.64,126.9A18.51,18.51,0,0,0,125.06,116c-.92-1.06-5.26-5.34-15.06-5.34s-14.16,4.3-15.07,5.34a18.59,18.59,0,0,0-3.57,10.94c0,.51,0,1,.06,1.52l3.94,3.94a15.47,15.47,0,0,1-1-5.46,15.64,15.64,0,1,1,31.28,0,15.47,15.47,0,0,1-1,5.46l3.94-3.94h0C128.62,127.92,128.64,127.41,128.64,126.9Z" fill="url(#h38-m)"/><use height="55.02" transform="translate(91.36 128.36)" width="55.02" xlink:href="#h38-s"/><path d="M74.25,147A15.65,15.65,0,0,1,89.9,131.36a15.47,15.47,0,0,1,5.46,1l-3.94-3.94c-.5,0-1-.06-1.52-.06A18.59,18.59,0,0,0,79,131.93c-1,.92-5.34,5.25-5.34,15.07S77.9,161.14,79,162.06a18.51,18.51,0,0,0,10.94,3.58c.51,0,1,0,1.52-.06h0l3.94-3.94a15.47,15.47,0,0,1-5.46,1A15.65,15.65,0,0,1,74.25,147Z" fill="url(#h38-n)"/><path d="M145.75,147a15.65,15.65,0,0,1-15.65,15.64,15.47,15.47,0,0,1-5.46-1,15.47,15.47,0,0,1,1,5.46,15.64,15.64,0,1,1-31.28,0,15.47,15.47,0,0,1,1-5.46,15.47,15.47,0,0,1-5.46,1,15.64,15.64,0,1,1,0-31.28,15.47,15.47,0,0,1,5.46,1,15.47,15.47,0,0,1-1-5.46,15.64,15.64,0,1,1,31.28,0,15.47,15.47,0,0,1-1,5.46,15.47,15.47,0,0,1,5.46-1A15.65,15.65,0,0,1,145.75,147ZM110,184.38A37.38,37.38,0,1,1,147.38,147,37.39,37.39,0,0,1,110,184.38Z" fill="none" stroke="url(#h38-o)" stroke-width="2"/>'
                    )
                )
            );
    }

    function hardware_39() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Keyhole',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><radialGradient cx=".5" cy=".25" id="h39-a" r="1"><stop offset="0" stop-color="gray"/><stop offset="0.5" stop-color="#fff"/><stop offset="0.6" stop-color="#4b4b4b"/><stop offset="1" stop-color="gray"/></radialGradient><filter id="h39-b" name="shadow"><feDropShadow dx="0" dy="4" stdDeviation="0"/></filter><linearGradient id="h39-0" x1="0" x2="0" y1="1" y2="0"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient id="h39-c" x1="0" x2="0" xlink:href="#h39-0" y1="0" y2="1"/><linearGradient id="h39-d" x1="0" x2="0" xlink:href="#h39-0" y1="1" y2="0"/><symbol id="h39-j" viewBox="0 0 4.92 5.92"><path d="M2.46,5.92A2.46,2.46,0,1,0,0,3.46,2.46,2.46,0,0,0,2.46,5.92Z"/><path d="M2.46,4.92A2.46,2.46,0,1,0,0,2.46,2.46,2.46,0,0,0,2.46,4.92Z" fill="url(#h39-a)"/><path d="M2.81.75H2.1V4.16h.71Z"/></symbol></defs><g filter="url(#h39-b)"><path d="M134.47,102.53H85.53v58.94h48.94Z" fill="url(#h39-c)" stroke="url(#h39-d)"/><rect fill="url(#h39-c)" height="48.94" stroke="url(#h39-d)" width="38.94" x="90.53" y="107.53"/><path d="M123.84,151.19H96.15v2h27.69Z"/><path d="M116.29,113.35H103.71a7,7,0,0,1-7,7v30.28h26.63V120.37A7,7,0,0,1,116.29,113.35Z" fill="url(#h39-c)" stroke="url(#h39-d)"/><path d="M104.32,144.56l4-13.86a4.13,4.13,0,0,1-2.56-3.81,4.22,4.22,0,1,1,8.43,0,4.12,4.12,0,0,1-2.55,3.81l4,13.86Z" stroke="url(#h39-d)"/><use height="5.92" transform="translate(94.23 110.89)" width="4.92" xlink:href="#h39-j"/><use height="5.92" transform="matrix(-1, 0, 0, 1, 125.77, 110.89)" width="4.92" xlink:href="#h39-j"/><path d="M129,108H91v2H129Z"/></g>'
                    )
                )
            );
    }

    function hardware_40() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Pitcher',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient gradientUnits="userSpaceOnUse" id="h40-a" x1="100.75" x2="119.25" y1="96.49" y2="96.49"><stop offset="0" stop-color="gray"/><stop offset=".2" stop-color="#4b4b4b"/><stop offset=".8" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient id="h40-e" x1="98.9" x2="121.1" xlink:href="#h40-a" y1="170.71" y2="170.71"/><linearGradient id="h40-f" x1="90.28" x2="129.72" xlink:href="#h40-a" y1="94.11" y2="94.11"/><linearGradient gradientUnits="userSpaceOnUse" id="h40-g" x1="85.64" x2="131.75" y1="135.94" y2="135.94"><stop offset="0" stop-color="gray"/><stop offset=".5" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientTransform="matrix(1 0 0 -1 0 264)" gradientUnits="userSpaceOnUse" id="h40-b" x1="138.92" x2="138.92" y1="126.93" y2="185.54"><stop offset="0" stop-color="#fff"/><stop offset=".5" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h40-h" x1="137.43" x2="137.43" y1="138.48" y2="85.94"><stop offset="0" stop-color="#4b4b4b"/><stop offset=".5" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient id="h40-i" x1="139.29" x2="139.29" xlink:href="#h40-b" y1="136.29" y2="83.78"/><radialGradient cx=".5" cy=".25" id="h40-c" r="1"><stop offset="0" stop-color="gray"/><stop offset=".5" stop-color="#fff"/><stop offset=".6" stop-color="#4b4b4b"/><stop offset="1" stop-color="gray"/></radialGradient><radialGradient cx=".5" cy=".2" id="h40-k" r=".8" xlink:href="#h40-c"/><symbol id="h40-j" viewBox="0 0 5.54 5.54"><path d="M2.77 5.54A2.77 2.77 0 1 0 0 2.77a2.77 2.77 0 0 0 2.77 2.77Z" fill="url(#h40-c)"/></symbol><filter id="h40-d"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter></defs><g filter="url(#h40-d)"><path d="M119.2 86.22c-1.77-2-5.23-3.37-9.2-3.37s-7.43 1.37-9.2 3.38l-.05 15.77v8.13h18.5V102Z" fill="url(#h40-a)"/><path d="M115.93 169.65a3.63 3.63 0 0 0 3.64-3.77 3.72 3.72 0 0 0-3.52-3.88l-6.05-1.71-6.05 1.71a3.72 3.72 0 0 0-3.52 3.88 3.63 3.63 0 0 0 3.64 3.77c0 4.6-.74 7.89-5.17 10l11.1 1.48 11.1-1.47c-4.43-2.12-5.17-5.42-5.17-10Z" fill="url(#h40-e)"/><path d="M126.97 89.29c-3.28-.79-3.78-3.07-3.78-3.07H96.81s-.5 2.28-3.78 3.07l-2.75 3.37a22.97 22.97 0 0 1 10.47 9.34h18.5a22.97 22.97 0 0 1 10.47-9.34Z" fill="url(#h40-f)"/><path d="m115.94 170.65-.01-1h-11.86l-.01 1Z"/><path d="M131.67 92.66H85.64a7.24 7.24 0 0 1 6.57-3.37h35.58c4.85 0 3.88 3.37 3.88 3.37Zm-7 87H95.33a5.8 5.8 0 0 0-5.05 2.94h39.44a5.8 5.8 0 0 0-5.05-2.94Z" fill="url(#h40-g)"/><path d="M130.47 137.58s-6.97-2.8 5.14-18.01c5.05-6.53 11.07-14.25 11.07-22.97 0-8.24-5.27-10.16-7.42-10.16-7.37 0-6.78 6.52-6.78 6.57l-1.63.65s-2.1-9.38 9.15-9.38c7.55 0 9.36 8.12 9.36 11.62 0 10.4-6.92 18.17-11.99 24.62-9.26 11.76-8.17 14.4-7.16 16.07Z" fill="url(#h40-b)"/><path d="M130.65 138c-4.68-1.46-2.6-9.03 5.16-18.68 5.22-6.49 10.87-13.83 10.87-22.72 0-7.16-4.12-10.16-7.42-10.16-5.75 0-7.37 4.77-7.3 6.27" fill="none" stroke="url(#h40-h)"/><path d="M130.94 93.2c-.68-2.23 1.1-8.92 8.89-8.92 6.39 0 9.26 6.32 9.26 11.67 0 10.22-6.37 17.99-11.5 24.29-9.11 11.2-8.84 13.62-7.2 15.74" fill="none" stroke="url(#h40-i)"/><use height="5.54" transform="translate(130.47 90.41)" width="5.54" xlink:href="#h40-j"/><path d="M119.25 105.73h-18.5s-10.47 4.7-10.47 18.01S103.95 162 103.95 162h12.1s13.67-24.96 13.67-38.26-10.47-18.01-10.47-18.01Z" fill="url(#h40-k)"/><use height="5.54" transform="translate(128.94 133.33)" width="5.54" xlink:href="#h40-j"/></g>'
                    )
                )
            );
    }

    function hardware_41() public pure returns (HardwareData memory) {
        return
            HardwareData(
                'Piston',
                HardwareCategories.STANDARD,
                string(
                    abi.encodePacked(
                        '<defs><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 16414.61)" gradientUnits="userSpaceOnUse" id="h41-a" x2="4" y1="16399.3" y2="16399.3"><stop offset="0" stop-color="#4b4b4b"/><stop offset="0.5" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient gradientUnits="userSpaceOnUse" id="h41-b" x1="3.95" x2="-0.07" y1="15.3" y2="15.3"><stop offset="0" stop-color="#4b4b4b"/><stop offset="1" stop-color="#fff"/></linearGradient><filter id="h41-c" name="shadow"><feDropShadow dx="0" dy="2" stdDeviation="0"/></filter><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 264)" id="h41-d" x1="110.01" x2="110.01" xlink:href="#h41-a" y1="89.82" y2="151.85"/><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 264)" id="h41-e" x1="93.87" x2="126.13" xlink:href="#h41-a" y1="90.32" y2="90.32"/><linearGradient gradientUnits="userSpaceOnUse" id="h41-f" x1="93.87" x2="126.14" y1="150.04" y2="150.04"><stop offset="0" stop-color="#fff"/><stop offset="0.5" stop-color="gray"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 264)" gradientUnits="userSpaceOnUse" id="h41-g" x1="94" x2="126" y1="118.93" y2="118.93"><stop offset="0" stop-color="gray"/><stop offset="0.5" stop-color="#fff"/><stop offset="1" stop-color="gray"/></linearGradient><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 264)" id="h41-h" x1="93" x2="127" xlink:href="#h41-f" y1="170.5" y2="170.5"/><linearGradient gradientUnits="userSpaceOnUse" id="h41-i" x1="93.3" x2="122.84" y1="106.09" y2="106.09"><stop offset="0" stop-color="gray"/><stop offset="0.24" stop-color="#4b4b4b"/><stop offset="0.68" stop-color="#fff"/><stop offset="1" stop-color="#4b4b4b"/></linearGradient><linearGradient gradientTransform="matrix(1, 0, 0, -1, 0, 264)" id="h41-j" x1="93.4" x2="126.6" xlink:href="#h41-f" y1="148.73" y2="148.73"/><linearGradient id="h41-k" x1="110" x2="110" xlink:href="#h41-b" y1="175.69" y2="148.31"/><linearGradient id="h41-l" x1="110" x2="110" xlink:href="#h41-b" y1="151.9" y2="172.1"/><linearGradient id="h41-m" x1="110.13" x2="110.13" xlink:href="#h41-b" y1="104.43" y2="109.57"/><symbol id="h41-n" viewBox="0 0 4 30.61"><path d="M4,1H0V29.61H4Z" fill="url(#h41-a)"/><path d="M4,27.61H0v1H4Z"/><path d="M3,30.61H1l-1-1H4ZM3,0H1L0,1H4Z" fill="url(#h41-b)"/></symbol></defs><g filter="url(#h41-c)"><rect height="7" width="32" x="94" y="96"/><use height="30.61" transform="translate(121.13 146.57)" width="4" xlink:href="#h41-n"/><use height="30.61" transform="translate(94.87 146.57)" width="4" xlink:href="#h41-n"/><path d="M114.88,136.43h0V112.15h-9.74v24.28c0,11.91-11.26,14.08-11.26,14.08v22.67l1,1h30.27l1-1V150.51S114.88,148.34,114.88,136.43ZM110,173.18A11.18,11.18,0,1,1,121.18,162,11.18,11.18,0,0,1,110,173.18Z" fill="url(#h41-d)"/><path d="M93.87,173.18l1,1h30.26l1-1Z" fill="url(#h41-e)"/><polygon fill="url(#h41-f)" points="125.13 149.57 126.14 150.5 93.87 150.5 94.87 149.57 125.13 149.57"/><path d="M119.68,149.27h0c-3.61-2.91-7.47-5.13-7.47-14.68V112.15h-4.44v22.44c0,9.55-3.86,11.77-7.47,14.68h0a16,16,0,1,0,19.36,0Zm-9.55,24.29A11.56,11.56,0,1,1,121.69,162,11.56,11.56,0,0,1,110.13,173.56Z" fill="url(#h41-g)"/><path d="M109.87,175.46,96.42,162.88a13.46,13.46,0,0,0,26.91,0Z"/><path d="M127,94H93l1-1h32Z" fill="url(#h41-h)"/><path d="M127,101H93v-1h34Zm0-3H93v1h34Zm0-4H93v3h34Zm0,8v15c0,4.11-5.87-3.85-17-3.85s-17,8-17,3.85V102Zm-14.94,5a1.94,1.94,0,1,0-1.93,1.94A1.93,1.93,0,0,0,112.06,107Z" fill="url(#h41-i)"/><path d="M110,112.15c-9.46,0-15.12,6.47-16.6,5.89,1.85,2,5.55-4.89,16.6-4.89S124.75,120,126.6,118C125.12,118.62,119.46,112.15,110,112.15Z" fill="url(#h41-j)"/><path d="M110,173.69A11.69,11.69,0,1,1,121.69,162,11.7,11.7,0,0,1,110,173.69Z" fill="none" stroke="url(#h41-k)" stroke-width="4"/><path d="M100,162H93.86v-.5H100Zm20,0h6.14v-.5H120Z"/><path d="M110,171.6a9.6,9.6,0,1,1,9.6-9.6A9.62,9.62,0,0,1,110,171.6Z" fill="none" stroke="url(#h41-l)"/><circle cx="110.13" cy="107" r="2.07" stroke="url(#h41-m)"/></g>'
                    )
                )
            );
    }
}