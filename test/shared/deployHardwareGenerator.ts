import { ethers } from 'hardhat'
import { HardwareGenerator, HardwareSVGs1 } from '../../typechain'
import snapshotGasCost from './snapshotGasCost'

export default async function deployHardwareGenerator(asGasSnapshot?: boolean) {
  const hardwareSVGs1 = (await (await ethers.getContractFactory('HardwareSVGs1')).deploy()) as HardwareSVGs1
  const hardwareSVGs2 = (await (await ethers.getContractFactory('HardwareSVGs2')).deploy()) as HardwareSVGs1
  const hardwareSVGs3 = (await (await ethers.getContractFactory('HardwareSVGs3')).deploy()) as HardwareSVGs1
  const hardwareSVGs4 = (await (await ethers.getContractFactory('HardwareSVGs4')).deploy()) as HardwareSVGs1
  const hardwareSVGs5 = (await (await ethers.getContractFactory('HardwareSVGs5')).deploy()) as HardwareSVGs1
  const hardwareSVGs6 = (await (await ethers.getContractFactory('HardwareSVGs6')).deploy()) as HardwareSVGs1
  const hardwareSVGs7 = (await (await ethers.getContractFactory('HardwareSVGs7')).deploy()) as HardwareSVGs1
  const hardwareSVGs8 = (await (await ethers.getContractFactory('HardwareSVGs8')).deploy()) as HardwareSVGs1
  const hardwareSVGs9 = (await (await ethers.getContractFactory('HardwareSVGs9')).deploy()) as HardwareSVGs1
  const hardwareSVGs10 = (await (await ethers.getContractFactory('HardwareSVGs10')).deploy()) as HardwareSVGs1
  const hardwareSVGs11 = (await (await ethers.getContractFactory('HardwareSVGs11')).deploy()) as HardwareSVGs1
  const hardwareSVGs12 = (await (await ethers.getContractFactory('HardwareSVGs12')).deploy()) as HardwareSVGs1
  const hardwareSVGs13 = (await (await ethers.getContractFactory('HardwareSVGs13')).deploy()) as HardwareSVGs1
  const hardwareSVGs14 = (await (await ethers.getContractFactory('HardwareSVGs14')).deploy()) as HardwareSVGs1
  const hardwareSVGs15 = (await (await ethers.getContractFactory('HardwareSVGs15')).deploy()) as HardwareSVGs1
  const hardwareSVGs16 = (await (await ethers.getContractFactory('HardwareSVGs16')).deploy()) as HardwareSVGs1
  const hardwareSVGs17 = (await (await ethers.getContractFactory('HardwareSVGs17')).deploy()) as HardwareSVGs1
  const hardwareSVGs18 = (await (await ethers.getContractFactory('HardwareSVGs18')).deploy()) as HardwareSVGs1
  const hardwareSVGs19 = (await (await ethers.getContractFactory('HardwareSVGs19')).deploy()) as HardwareSVGs1
  const hardwareSVGs20 = (await (await ethers.getContractFactory('HardwareSVGs20')).deploy()) as HardwareSVGs1
  const hardwareSVGs21 = (await (await ethers.getContractFactory('HardwareSVGs21')).deploy()) as HardwareSVGs1
  const hardwareSVGs22 = (await (await ethers.getContractFactory('HardwareSVGs22')).deploy()) as HardwareSVGs1
  const hardwareSVGs23 = (await (await ethers.getContractFactory('HardwareSVGs23')).deploy()) as HardwareSVGs1
  const hardwareSVGs24 = (await (await ethers.getContractFactory('HardwareSVGs24')).deploy()) as HardwareSVGs1
  const hardwareSVGs25 = (await (await ethers.getContractFactory('HardwareSVGs25')).deploy()) as HardwareSVGs1
  const hardwareSVGs26 = (await (await ethers.getContractFactory('HardwareSVGs26')).deploy()) as HardwareSVGs1
  const hardwareSVGs27 = (await (await ethers.getContractFactory('HardwareSVGs27')).deploy()) as HardwareSVGs1
  const hardwareSVGs28 = (await (await ethers.getContractFactory('HardwareSVGs28')).deploy()) as HardwareSVGs1
  const hardwareSVGs29 = (await (await ethers.getContractFactory('HardwareSVGs29')).deploy()) as HardwareSVGs1
  const hardwareSVGs30 = (await (await ethers.getContractFactory('HardwareSVGs30')).deploy()) as HardwareSVGs1
  const hardwareSVGs31 = (await (await ethers.getContractFactory('HardwareSVGs31')).deploy()) as HardwareSVGs1
  const hardwareSVGs32 = (await (await ethers.getContractFactory('HardwareSVGs32')).deploy()) as HardwareSVGs1
  const hardwareSVGs33 = (await (await ethers.getContractFactory('HardwareSVGs33')).deploy()) as HardwareSVGs1
  const hardwareSVGs34 = (await (await ethers.getContractFactory('HardwareSVGs34')).deploy()) as HardwareSVGs1
  const hardwareSVGs35 = (await (await ethers.getContractFactory('HardwareSVGs35')).deploy()) as HardwareSVGs1
  const hardwareSVGs36 = (await (await ethers.getContractFactory('HardwareSVGs36')).deploy()) as HardwareSVGs1
  const hardwareSVGs37 = (await (await ethers.getContractFactory('HardwareSVGs37')).deploy()) as HardwareSVGs1
  const hardwareSVGs38 = (await (await ethers.getContractFactory('HardwareSVGs38')).deploy()) as HardwareSVGs1

  const svgs = {
    hardwareSVGs1: hardwareSVGs1.address,
    hardwareSVGs2: hardwareSVGs2.address,
    hardwareSVGs3: hardwareSVGs3.address,
    hardwareSVGs4: hardwareSVGs4.address,
    hardwareSVGs5: hardwareSVGs5.address,
    hardwareSVGs6: hardwareSVGs6.address,
    hardwareSVGs7: hardwareSVGs7.address,
    hardwareSVGs8: hardwareSVGs8.address,
    hardwareSVGs9: hardwareSVGs9.address,
    hardwareSVGs10: hardwareSVGs10.address,
    hardwareSVGs11: hardwareSVGs11.address,
    hardwareSVGs12: hardwareSVGs12.address,
    hardwareSVGs13: hardwareSVGs13.address,
    hardwareSVGs14: hardwareSVGs14.address,
    hardwareSVGs15: hardwareSVGs15.address,
    hardwareSVGs16: hardwareSVGs16.address,
    hardwareSVGs17: hardwareSVGs17.address,
    hardwareSVGs18: hardwareSVGs18.address,
    hardwareSVGs19: hardwareSVGs19.address,
    hardwareSVGs20: hardwareSVGs20.address,
    hardwareSVGs21: hardwareSVGs21.address,
    hardwareSVGs22: hardwareSVGs22.address,
    hardwareSVGs23: hardwareSVGs23.address,
    hardwareSVGs24: hardwareSVGs24.address,
    hardwareSVGs25: hardwareSVGs25.address,
    hardwareSVGs26: hardwareSVGs26.address,
    hardwareSVGs27: hardwareSVGs27.address,
    hardwareSVGs28: hardwareSVGs28.address,
    hardwareSVGs29: hardwareSVGs29.address,
    hardwareSVGs30: hardwareSVGs30.address,
    hardwareSVGs31: hardwareSVGs31.address,
    hardwareSVGs32: hardwareSVGs32.address,
    hardwareSVGs33: hardwareSVGs33.address,
    hardwareSVGs34: hardwareSVGs34.address,
    hardwareSVGs35: hardwareSVGs35.address,
    hardwareSVGs36: hardwareSVGs36.address,
    hardwareSVGs37: hardwareSVGs37.address,
    hardwareSVGs38: hardwareSVGs38.address,
  }

  if (!!asGasSnapshot) {
    await snapshotGasCost((await ethers.getContractFactory('HardwareGenerator')).deploy(svgs))
  }

  const contract = (await (await ethers.getContractFactory('HardwareGenerator')).deploy(svgs)) as HardwareGenerator
  return contract
}
