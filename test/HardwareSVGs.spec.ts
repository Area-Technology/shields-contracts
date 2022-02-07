import { HardwareGenerator, HardwareSVGs1 } from '../typechain'
import { ethers, waffle } from 'hardhat'
import { expect } from './shared/expect'
import snapshotGasCost from './shared/snapshotGasCost'
import deployHardwareGenerator from './shared/deployHardwareGenerator'
import fs from 'fs'

describe('HardwareGenerator', async () => {
  let hardwares: HardwareGenerator

  describe('constructor', () => {
    it('deployment gas', async () => {
      const asGasSnapshot = true
      await deployHardwareGenerator(asGasSnapshot)
    })

    it('bytecode size', async () => {
      const contract = (await deployHardwareGenerator()) as HardwareGenerator
      expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
    })
  })

  describe('IHardwareSVGs deployment', () => {
    for (let i = 1; i <= 38; i++) {
      it(`HardwareSVGs${i} has gas`, async () => {
        await snapshotGasCost((await ethers.getContractFactory(`HardwareSVGs${i}`)).deploy())
      })

      it(`HardwareSVGs${i} has bytecode`, async () => {
        const contract = await (await ethers.getContractFactory(`HardwareSVGs${i}`)).deploy()
        expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
      })
    }
  })

  describe('SVG Generation', () => {
    it('returns the correct hardware svg string', async () => {
      hardwares = (await deployHardwareGenerator()) as HardwareGenerator
      const hardware = await hardwares.generateHardware(0)
      expect(hardware).toMatchSnapshot()
      const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 220 264">${hardware.svgString}</svg>`
      fs.writeFileSync('./test/__snapshots__/svgs/hardware.svg', svg)
    })
  })
})
