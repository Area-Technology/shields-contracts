import { ethers } from 'hardhat'
import { FieldGenerator, FieldSVGs1 } from '../../typechain'
import { fieldColors, titles } from './colors'
import snapshotGasCost from './snapshotGasCost'

export default async function deployFieldGenerator(asGasSnapshot?: boolean) {
  const fieldSVGs1 = (await (await ethers.getContractFactory('FieldSVGs1')).deploy()) as FieldSVGs1
  const fieldSVGs2 = (await (await ethers.getContractFactory('FieldSVGs2')).deploy()) as FieldSVGs1
  const fieldSVGs3 = (await (await ethers.getContractFactory('FieldSVGs3')).deploy()) as FieldSVGs1
  const fieldSVGs4 = (await (await ethers.getContractFactory('FieldSVGs4')).deploy()) as FieldSVGs1
  const fieldSVGs5 = (await (await ethers.getContractFactory('FieldSVGs5')).deploy()) as FieldSVGs1
  const fieldSVGs6 = (await (await ethers.getContractFactory('FieldSVGs6')).deploy()) as FieldSVGs1
  const fieldSVGs7 = (await (await ethers.getContractFactory('FieldSVGs7')).deploy()) as FieldSVGs1
  const fieldSVGs8 = (await (await ethers.getContractFactory('FieldSVGs8')).deploy()) as FieldSVGs1
  const fieldSVGs9 = (await (await ethers.getContractFactory('FieldSVGs9')).deploy()) as FieldSVGs1
  const fieldSVGs10 = (await (await ethers.getContractFactory('FieldSVGs10')).deploy()) as FieldSVGs1
  const fieldSVGs11 = (await (await ethers.getContractFactory('FieldSVGs11')).deploy()) as FieldSVGs1
  const fieldSVGs12 = (await (await ethers.getContractFactory('FieldSVGs12')).deploy()) as FieldSVGs1
  const fieldSVGs13 = (await (await ethers.getContractFactory('FieldSVGs13')).deploy()) as FieldSVGs1
  const fieldSVGs14 = (await (await ethers.getContractFactory('FieldSVGs14')).deploy()) as FieldSVGs1
  const fieldSVGs15 = (await (await ethers.getContractFactory('FieldSVGs15')).deploy()) as FieldSVGs1
  const fieldSVGs16 = (await (await ethers.getContractFactory('FieldSVGs16')).deploy()) as FieldSVGs1
  const fieldSVGs17 = (await (await ethers.getContractFactory('FieldSVGs17')).deploy()) as FieldSVGs1
  const fieldSVGs18 = (await (await ethers.getContractFactory('FieldSVGs18')).deploy()) as FieldSVGs1
  const fieldSVGs19 = (await (await ethers.getContractFactory('FieldSVGs19')).deploy()) as FieldSVGs1
  const fieldSVGs20 = (await (await ethers.getContractFactory('FieldSVGs20')).deploy()) as FieldSVGs1
  const fieldSVGs21 = (await (await ethers.getContractFactory('FieldSVGs21')).deploy()) as FieldSVGs1
  const fieldSVGs22 = (await (await ethers.getContractFactory('FieldSVGs22')).deploy()) as FieldSVGs1
  const fieldSVGs23 = (await (await ethers.getContractFactory('FieldSVGs23')).deploy()) as FieldSVGs1
  const fieldSVGs24 = (await (await ethers.getContractFactory('FieldSVGs24')).deploy()) as FieldSVGs1

  const svgs = {
    fieldSVGs1: fieldSVGs1.address,
    fieldSVGs2: fieldSVGs2.address,
    fieldSVGs3: fieldSVGs3.address,
    fieldSVGs4: fieldSVGs4.address,
    fieldSVGs5: fieldSVGs5.address,
    fieldSVGs6: fieldSVGs6.address,
    fieldSVGs7: fieldSVGs7.address,
    fieldSVGs8: fieldSVGs8.address,
    fieldSVGs9: fieldSVGs9.address,
    fieldSVGs10: fieldSVGs10.address,
    fieldSVGs11: fieldSVGs11.address,
    fieldSVGs12: fieldSVGs12.address,
    fieldSVGs13: fieldSVGs13.address,
    fieldSVGs14: fieldSVGs14.address,
    fieldSVGs15: fieldSVGs15.address,
    fieldSVGs16: fieldSVGs16.address,
    fieldSVGs17: fieldSVGs17.address,
    fieldSVGs18: fieldSVGs18.address,
    fieldSVGs19: fieldSVGs19.address,
    fieldSVGs20: fieldSVGs20.address,
    fieldSVGs21: fieldSVGs21.address,
    fieldSVGs22: fieldSVGs22.address,
    fieldSVGs23: fieldSVGs23.address,
    fieldSVGs24: fieldSVGs24.address,
  }

  if (!!asGasSnapshot) {
    await snapshotGasCost((await ethers.getContractFactory('FieldGenerator')).deploy(fieldColors, titles, svgs))
  }

  const contract = (await (
    await ethers.getContractFactory('FieldGenerator')
  ).deploy(fieldColors, titles, svgs)) as FieldGenerator
  return contract
}
