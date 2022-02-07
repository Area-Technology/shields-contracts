import { ethers } from 'hardhat'
import { FieldGenerator, FieldSVGs1 } from '../../typechain'
import { fieldColors, titles } from './colors'
import snapshotGasCost from './snapshotGasCost'

export default async function deployTestFieldGenerator(asGasSnapshot?: boolean) {
  const fieldSVGs1 = (await (await ethers.getContractFactory('FieldSVGs1')).deploy()) as FieldSVGs1
  const fieldSVGs2 = (await (await ethers.getContractFactory('FieldSVGs2')).deploy()) as FieldSVGs1

  const svgs = {
    fieldSVGs1: fieldSVGs1.address,
    fieldSVGs2: fieldSVGs2.address,
  }

  if (!!asGasSnapshot) {
    await snapshotGasCost((await ethers.getContractFactory('TestFieldGenerator')).deploy(fieldColors, titles, svgs))
  }

  const contract = (await (
    await ethers.getContractFactory('TestFieldGenerator')
  ).deploy(fieldColors, titles, svgs)) as FieldGenerator
  return contract
}
