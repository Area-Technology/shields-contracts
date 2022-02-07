import {
  ShieldBadgeSVGs,
  FrameGenerator,
  FieldGenerator,
  HardwareGenerator,
  Shields,
  ShieldsTest,
  ShieldsGasTest,
  FieldSVGs1,
  HardwareSVGs1,
  EmblemWeaverTest,
} from '../typechain'
import { ethers, waffle } from 'hardhat'
import { BigNumber, BigNumberish, ContractTransaction } from 'ethers'
import { extractJSONFromURI } from './shared/extractJSONFromURI'
import { expect } from './shared/expect'
import snapshotGasCost from './shared/snapshotGasCost'
import encodeColors from './shared/encodeColors'
import deployFieldGenerator from './shared/deployFieldGenerator'
import deployHardwareGenerator from './shared/deployHardwareGenerator'
import deployTestFieldGenerator from './shared/deployTestFieldGenerator'
import deployTestHardwareGenerator from './shared/deployTestHardwareGenerator'
import deployFrameGenerator from './shared/deployFrameGenerator'
import { fieldColors, titles } from './shared/colors'
import { buildShield } from './shared/buildShield'
import { printSVGToSnapshots } from './shared/printSVGToSnapshots'
import fs from 'fs'
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/dist/src/signers'

const MINT_FEE = BigNumber.from(ethers.utils.parseEther('0.1'))

const HERALDIC_FIELD = 1
const HERALDIC_HARDWARE = 0

const MYTHIC_FIELD = 0
const MYTHIC_HARDWARE = 96

// Deploying all 60 Contracts can be taxing for quick tests. Unskip these tests for big changes
// that could effect logic pertaining to full SVG spectrum.
describe('EmblemWeaver', async () => {
  let wallet: SignerWithAddress
  let owner: SignerWithAddress
  let makerAcct: SignerWithAddress
  let granteeAcct: SignerWithAddress
  let emblemWeaver: EmblemWeaverTest
  let frameGenerator: FrameGenerator
  let fieldGenerator: FieldGenerator
  let hardwareGenerator: HardwareGenerator
  let shieldBadgeSVGsGenerator: ShieldBadgeSVGs
  let shields: Shields
  let makerBadgeRecipient: string
  let granteeBadgeRecipient: string

  beforeEach(async () => {
    let wallets: any
    ;[wallet, owner, makerAcct, granteeAcct, ...wallets] = await ethers.getSigners()

    frameGenerator = (await deployFrameGenerator()) as FrameGenerator
    hardwareGenerator = (await deployHardwareGenerator()) as HardwareGenerator
    fieldGenerator = (await deployFieldGenerator()) as FieldGenerator
    shieldBadgeSVGsGenerator = (await (await ethers.getContractFactory('ShieldBadgeSVGs')).deploy()) as ShieldBadgeSVGs

    emblemWeaver = (await (
      await ethers.getContractFactory('EmblemWeaverTest')
    ).deploy(
      fieldGenerator.address,
      hardwareGenerator.address,
      frameGenerator.address,
      shieldBadgeSVGsGenerator.address
    )) as EmblemWeaverTest
  })

  describe('constructor', () => {
    it('deployment gas', async () => {
      await snapshotGasCost(
        await (
          await ethers.getContractFactory('EmblemWeaver')
        ).deploy(
          fieldGenerator.address,
          hardwareGenerator.address,
          frameGenerator.address,
          shieldBadgeSVGsGenerator.address
        )
      )
    })

    it('has bytecode size', async () => {
      expect(((await emblemWeaver.provider.getCode(emblemWeaver.address)).length - 2) / 2).to.matchSnapshot()
    })
  })

  describe.skip('SVG generation', async () => {
    let frame: number
    let field: number
    let hardware: number
    let shieldBadge: number
    let built: boolean
    let colors: [BigNumberish, BigNumberish, BigNumberish, BigNumberish]

    beforeEach(async () => {
      field = 1
      hardware = 17
      frame = 0
      shieldBadge = 0
      built = true
      colors = encodeColors([...fieldColors])
    })

    it('all field SVGs deploy correctly', async () => {
      for (let i = 0; i <= 299; i++) {
        let j // write files with prepended 0's to keep numerical order (10's / 100's)
        if (i < 10) {
          j = `00${i}`
        } else if (i < 100) {
          j = `0${i}`
        } else {
          j = `${i}`
        }

        const shield = { field: i, hardware, frame, colors, shieldBadge, built }
        const { svg, fieldTitle } = await emblemWeaver.generateSVGTest(shield)
        printSVGToSnapshots('fields', `${j}_${fieldTitle}`, svg)
      }
    })

    it('all hardware SVGs deploy correctly', async () => {
      for (let i = 0; i <= 120; i++) {
        let j // write files with prepended 0's to keep numerical order (10's / 100's)
        if (i < 10) {
          j = `00${i}`
        } else if (i < 100) {
          j = `0${i}`
        } else {
          j = `${i}`
        }

        const shield = { field, hardware: i, frame, colors, shieldBadge, built }
        const { svg, hardwareTitle } = await emblemWeaver.generateSVGTest(shield)
        printSVGToSnapshots('hardware', `${j}_${hardwareTitle}`, svg)
      }
    })

    it('all frame SVGs deploy correctly', async () => {
      for (let i = 0; i <= 5; i++) {
        let j // write files with prepended 0's to keep numerical order (10's / 100's)
        if (i < 10) {
          j = `00${i}`
        } else if (i < 100) {
          j = `0${i}`
        } else {
          j = `${i}`
        }

        const shield = { field, hardware, frame: i, colors, shieldBadge, built }
        const { svg, frameTitle } = await emblemWeaver.generateSVGTest(shield)
        printSVGToSnapshots('frames', `${j}_${frameTitle}`, svg)
      }
    })
  })
})
