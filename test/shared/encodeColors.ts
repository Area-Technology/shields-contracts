import { ethers } from 'hardhat'
import { BigNumberish } from 'ethers'

export default function encodeColors(
  colors: number[] | BigNumberish[]
): [BigNumberish, BigNumberish, BigNumberish, BigNumberish] {
  let colorArray: [BigNumberish, BigNumberish, BigNumberish, BigNumberish] = [0, 0, 0, 0]

  colors.forEach((color, index) => {
    colorArray[index] = color
  })

  return colorArray
}
