import { FieldGenerator, FieldSVGs1 } from '../typechain'
import { ethers, waffle } from 'hardhat'
import { expect } from './shared/expect'
import snapshotGasCost from './shared/snapshotGasCost'
import fs from 'fs'
import encodeColors from './shared/encodeColors'
import { fieldColors, titles } from './shared/colors'
import { BigNumber, BigNumberish } from 'ethers'
import deployFieldGenerator from './shared/deployFieldGenerator'

describe('FieldSVGs', async () => {
  let fields: FieldGenerator
  let fieldSVGs1: FieldSVGs1

  describe('constructor', () => {
    it('deployment gas', async () => {
      const asGasSnapshot = true
      await deployFieldGenerator(asGasSnapshot)
    })

    it('bytecode size', async () => {
      const contract = await deployFieldGenerator()
      expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
    })
  })

  describe('IFieldSVGs deployment', () => {
    for (let i = 1; i <= 24; i++) {
      it(`FieldSVGs${i} has gas`, async () => {
        await snapshotGasCost((await ethers.getContractFactory(`FieldSVGs${i}`)).deploy())
      })

      it(`FieldSVGs${i} has bytecode`, async () => {
        const contract = await (await ethers.getContractFactory(`FieldSVGs${i}`)).deploy()
        expect(((await contract.provider.getCode(contract.address)).length - 2) / 2).to.matchSnapshot()
      })
    }
  })

  describe.skip('SVG Generation', () => {
    beforeEach(async () => {
      const fieldSVGs1 = (await (await ethers.getContractFactory('FieldSVGs1')).deploy()) as FieldSVGs1
      const fieldSVGs2 = (await (await ethers.getContractFactory('FieldSVGs2')).deploy()) as FieldSVGs1
      const contract = await (
        await ethers.getContractFactory('FieldGenerator')
      ).deploy(fieldColors, titles, fieldSVGs1.address, fieldSVGs2.address)
    })

    it('returns the correct field_one_color svg string', async () => {
      const color: [BigNumberish, BigNumberish, BigNumberish, BigNumberish] = [
        BigNumber.from(0xdeadbe),
        BigNumber.from(0xdeadbe),
        BigNumber.from(0xdeadde),
        BigNumber.from(0xddadbe),
      ]

      const svg = await fields.generateField(0, color)
      expect(svg).toMatchSnapshot()
    })

    it('returns the correct field_two_colors svg string', async () => {
      const color = encodeColors([0xdeadbe, 0xc1c1c1])

      const svg = await fields.generateField(2, color)
      expect(svg).toMatchSnapshot()
    })

    it('returns the correct field_three_colors svg string', async () => {
      const color = encodeColors([0xdeadbe, 0xc1c1c1, 0xf234ab])

      const svg = await fields.generateField(293, color)
      expect(svg).toMatchSnapshot()
    })

    it('returns the correct field_four_colors svg string', async () => {
      const color = encodeColors([0xdeadbe, 0xc1c1c1, 0xf234ab, 0x889933])

      const svg = await fields.generateField(299, color)
      expect(svg).toMatchSnapshot()
    })
  })
})
