import { FrameGenerator, FrameSVGs1 } from '../typechain'
import { ethers, waffle } from 'hardhat'
import { expect } from './shared/expect'
import snapshotGasCost from './shared/snapshotGasCost'
import deployFrameGenerator from './shared/deployFrameGenerator'
import fs from 'fs'

describe('FrameGenerator', async () => {
  let frames: FrameGenerator

  describe('constructor', () => {
    it('deployment gas', async () => {
      const asGasSnapshot = true
      await deployFrameGenerator(asGasSnapshot)
    })

    it('bytecode size', async () => {
      const contract = (await deployFrameGenerator()) as FrameGenerator
      expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
    })
  })

  describe('IFrameSVGs deployment', () => {
    for (let i = 1; i <= 2; i++) {
      it(`FrameSVGs${i} has gas`, async () => {
        await snapshotGasCost((await ethers.getContractFactory(`FrameSVGs${i}`)).deploy())
      })

      it(`FrameSVGs${i} has bytecode`, async () => {
        const contract = await (await ethers.getContractFactory(`FrameSVGs${i}`)).deploy()
        expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
      })
    }
  })

  describe('SVG Generation', () => {
    it('returns the correct frame svg string', async () => {
      frames = (await deployFrameGenerator()) as FrameGenerator
      const frame = await frames.generateFrame(3)
      expect(frame).toMatchSnapshot()
      const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 220 264">${frame.svgString}</svg>`
      fs.writeFileSync('./test/__snapshots__/svgs/frame.svg', svg)
    })
  })
})
