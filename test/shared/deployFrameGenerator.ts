import { ethers } from 'hardhat'
import { FrameGenerator, FrameSVGs1 } from '../../typechain'
import snapshotGasCost from './snapshotGasCost'

export default async function deployFrameGenerator(asGasSnapshot?: boolean) {
  const frameSVGs1 = (await (await ethers.getContractFactory('FrameSVGs1')).deploy()) as FrameSVGs1
  const frameSVGs2 = (await (await ethers.getContractFactory('FrameSVGs2')).deploy()) as FrameSVGs1

  if (!!asGasSnapshot) {
    await snapshotGasCost(
      (
        await ethers.getContractFactory('FrameGenerator')
      ).deploy({ frameSVGs1: frameSVGs1.address, frameSVGs2: frameSVGs2.address })
    )
  }

  const contract = (await (
    await ethers.getContractFactory('FrameGenerator')
  ).deploy({ frameSVGs1: frameSVGs1.address, frameSVGs2: frameSVGs2.address })) as FrameGenerator
  return contract
}
