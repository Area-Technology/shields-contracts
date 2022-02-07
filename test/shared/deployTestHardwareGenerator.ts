import { ethers } from 'hardhat'
import { HardwareGenerator, HardwareSVGs1 } from '../../typechain'
import snapshotGasCost from './snapshotGasCost'

export default async function deployTestHardwareGenerator(asGasSnapshot?: boolean) {
  const hardwareSVGs1 = (await (await ethers.getContractFactory('HardwareSVGs1')).deploy()) as HardwareSVGs1
  const hardwareSVGs29 = (await (await ethers.getContractFactory('HardwareSVGs29')).deploy()) as HardwareSVGs1

  const svgs = {
    hardwareSVGs1: hardwareSVGs1.address,
    hardwareSVGs29: hardwareSVGs29.address,
  }

  if (!!asGasSnapshot) {
    await snapshotGasCost((await ethers.getContractFactory('TestHardwareGenerator')).deploy(svgs))
  }

  const contract = (await (await ethers.getContractFactory('TestHardwareGenerator')).deploy(svgs)) as HardwareGenerator
  return contract
}
