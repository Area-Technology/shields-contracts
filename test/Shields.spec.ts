import {
  ShieldBadgeSVGs,
  FrameGenerator,
  FieldGenerator,
  HardwareGenerator,
  TestFieldGenerator,
  TestHardwareGenerator,
  Shields,
  ShieldsTest,
  ShieldsGasTest,
  FieldSVGs1,
  HardwareSVGs1,
  EmblemWeaver,
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
import fs from 'fs'
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/dist/src/signers'

const parseEther = (amount: string) => {
  return BigNumber.from(ethers.utils.parseEther(amount))
}

const MINT_FEE = parseEther('0.15')

const HERALDIC_FIELD = 1
const MYTHIC_FIELD = 0

const STANDARD_HARDWARE = 0
const SPECIAL_HARDWARE = 96

const SPECIAL_FEE = parseEther('0.08')
const MYTHIC_FEE = parseEther('0.02')
const FRAME_ONE_FEE = parseEther('0.1')
const FRAME_TWO_FEE = parseEther('0.25')
const FRAME_THREE_FEE = parseEther('0.5')
const FRAME_FOUR_FEE = parseEther('1')
const FRAME_FIVE_FEE = parseEther('2')

describe('Shields', async () => {
  let wallet: SignerWithAddress
  let owner: SignerWithAddress
  let makerAcct: SignerWithAddress
  let granteeAcct: SignerWithAddress
  let emblemWeaver: EmblemWeaver
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
    hardwareGenerator = (await deployTestHardwareGenerator()) as HardwareGenerator
    fieldGenerator = (await deployTestFieldGenerator()) as FieldGenerator
    shieldBadgeSVGsGenerator = (await (await ethers.getContractFactory('ShieldBadgeSVGs')).deploy()) as ShieldBadgeSVGs

    emblemWeaver = (await (
      await ethers.getContractFactory('EmblemWeaver')
    ).deploy(
      fieldGenerator.address,
      hardwareGenerator.address,
      frameGenerator.address,
      shieldBadgeSVGsGenerator.address
    )) as EmblemWeaver

    shields = (await (await ethers.getContractFactory('ShieldsTest'))
      .connect(owner)
      .deploy('Shields', 'SHIELDS', emblemWeaver.address, makerAcct.address, granteeAcct.address)) as Shields
    shields.connect(wallet)
  })

  describe('constructor & setup', () => {
    it('deployment gas', async () => {
      await snapshotGasCost(
        await (
          await ethers.getContractFactory('Shields')
        ).deploy('Shields', 'SHIELDS', emblemWeaver.address, makerAcct.address, granteeAcct.address)
      )
    })

    it('has bytecode size', async () => {
      expect(((await shields.provider.getCode(shields.address)).length - 2) / 2).to.matchSnapshot()
    })

    it('initializes', async () => {
      expect(await shields.emblemWeaver()).to.equal(emblemWeaver.address)
      expect(await shields.name()).to.equal('Shields')
      expect(await shields.symbol()).to.equal('SHIELDS')
    })
  })

  describe('setPublicMintPrice', async () => {
    it('sends ether balance to the contract owner', async () => {
      expect(await shields.publicMintPrice()).to.equal(BigNumber.from('0'))

      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      expect(await shields.publicMintPrice()).to.equal(MINT_FEE)

      await shields.connect(owner).setPublicMintPrice(MINT_FEE.mul('2'))
      expect(await shields.publicMintPrice()).to.equal(MINT_FEE.mul('2'))
    })

    it('reverts when called by non-owner address', async () => {
      await expect(shields.connect(wallet).setPublicMintPrice(MINT_FEE)).to.be.revertedWith(
        'Ownable: caller is not the owner'
      )
    })

    it('reverts when publicMint is active', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      await expect(shields.connect(owner).setPublicMintPrice(MINT_FEE)).to.be.revertedWith(
        'Shields: public mint is already active'
      )
    })
  })

  describe('setPublicMintActive', async () => {
    it('sets the publicMintActive parameter to true', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      expect(await shields.publicMintActive()).to.equal(false)
      await shields.connect(owner).setPublicMintActive()
      expect(await shields.publicMintActive()).to.equal(true)
    })

    it('reverts if publicMintPrice not yet set', async () => {
      await expect(shields.connect(owner).setPublicMintActive()).to.be.revertedWith(
        'Shields: public mint price not yet set'
      )
    })
  })

  describe('collectFees', () => {
    beforeEach(async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
    })

    it('sends ether balance to the contract owner', async () => {
      // build shield to send fee
      const field = MYTHIC_FIELD
      const hardware = SPECIAL_HARDWARE
      const colors = encodeColors([fieldColors[0]])
      const frame = 0
      const fee = MYTHIC_FEE.add(SPECIAL_FEE)
      const to = wallet.address

      await buildShield(shields.connect(wallet).connect(wallet), { field, hardware, frame, colors, fee, to })

      const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
      const ownerBalancePrevious = await waffle.provider.getBalance(owner.address)

      await shields.connect(owner).collectFees()

      const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)
      const ownerBalanceUpdated = await waffle.provider.getBalance(owner.address)

      expect(shieldsBalancePrevious.sub(shieldsBalanceUpdated)).to.equal(MINT_FEE.add(fee))
      expect(ownerBalanceUpdated.gt(ownerBalancePrevious))
    })

    it('reverts when called by non-owner address', async () => {
      const field = HERALDIC_FIELD
      const hardware = STANDARD_HARDWARE
      const colors = encodeColors([fieldColors[0], fieldColors[3]])
      const frame = 0
      const fee = BigNumber.from(0)
      const to = wallet.address

      await buildShield(shields.connect(wallet).connect(wallet), { field, hardware, frame, colors, fee, to })

      await expect(shields.connect(wallet).collectFees()).to.be.revertedWith('Ownable: caller is not the owner')
    })
  })

  describe('mint', async () => {
    it('mints a new shield with the correct tokenId', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      let nextId = await shields.getNextId()
      let tx = await (await shields.connect(wallet).mint(wallet.address, 1, { value: MINT_FEE })).wait()

      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())
      expect(await shields.ownerOf(nextId)).to.equal(wallet.address)
      expect(await shields.getNextId()).to.equal(nextId.add(1))
      expect(await shields.totalSupply()).to.equal(nextId)

      nextId = await shields.getNextId()
      tx = await (await shields.connect(wallet).mint(wallet.address, 1, { value: MINT_FEE })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())
      expect(await shields.getNextId()).to.equal(nextId.add(1))
      expect(await shields.totalSupply()).to.equal(nextId)
    })

    it('gas', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      await snapshotGasCost(await shields.connect(wallet).mint(wallet.address, 1, { value: MINT_FEE }))
    })

    it('requires the right minting fee for all mint counts to 5', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      let nextId = await shields.getNextId()
      let tx = await (await shields.connect(wallet).mint(wallet.address, 1, { value: MINT_FEE })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())

      nextId = await shields.getNextId()
      tx = await (await shields.connect(wallet).mint(wallet.address, 2, { value: MINT_FEE.mul(2) })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())

      nextId = await shields.getNextId()
      tx = await (await shields.connect(wallet).mint(wallet.address, 3, { value: MINT_FEE.mul(3) })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())

      nextId = await shields.getNextId()
      tx = await (await shields.connect(wallet).mint(wallet.address, 4, { value: MINT_FEE.mul(4) })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())

      nextId = await shields.getNextId()
      tx = await (await shields.connect(wallet).mint(wallet.address, 5, { value: MINT_FEE.mul(5) })).wait()
      expect(tx.events![0].args!.tokenId.toString()).to.equal(nextId.toString())

      await expect(shields.connect(wallet).mint(wallet.address, 2, { value: MINT_FEE })).to.be.revertedWith(
        'Shields: invalid mint fee'
      )

      await expect(shields.connect(wallet).mint(wallet.address, 3, { value: MINT_FEE.mul(2) })).to.be.revertedWith(
        'Shields: invalid mint fee'
      )

      await expect(shields.connect(wallet).mint(wallet.address, 4, { value: MINT_FEE.mul(5) })).to.be.revertedWith(
        'Shields: invalid mint fee'
      )

      await expect(shields.connect(wallet).mint(wallet.address, 5, { value: MINT_FEE.mul(2) })).to.be.revertedWith(
        'Shields: invalid mint fee'
      )
    })

    it('reverts with mint count greater thtan 5', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      await expect(shields.connect(wallet).mint(wallet.address, 6, { value: MINT_FEE.mul(6) })).to.be.revertedWith(
        'Shields: can only mint up to 5 per transaction'
      )
    })

    it('reverts is public mint is not yet acive', async () => {
      await expect(shields.connect(wallet).mint(wallet.address, 1, { value: MINT_FEE })).to.be.revertedWith(
        'Shields: public mint not active yet'
      )
    })

    it('reverts with insufficient fee', async () => {
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      await expect(shields.connect(wallet).mint(wallet.address, 1, { value: '10' })).to.be.revertedWith(
        'Shields: invalid mint fee'
      )
    })

    it('reverts if mint cap has been reached', async () => {
      const finalId = '5000'
      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      await shields.setNextId(4998)
      await expect(shields.connect(wallet).mint(wallet.address, 4, { value: MINT_FEE.mul(4) })).to.be.revertedWith(
        'Shields: public mint max exceeded'
      )
      const tx = await (await shields.connect(wallet).mint(wallet.address, 3, { value: MINT_FEE.mul(3) })).wait()
      expect(tx.events![2].args!.tokenId.toString()).to.equal(finalId)
    })
  })

  describe('build', async () => {
    let frame: number
    let field: number
    let hardware: number
    let colors: [BigNumberish, BigNumberish, BigNumberish, BigNumberish]
    let fee: BigNumber
    let to: string

    beforeEach(async () => {
      field = HERALDIC_FIELD
      hardware = STANDARD_HARDWARE
      frame = 0
      colors = encodeColors([fieldColors[0], fieldColors[1]])
      fee = BigNumber.from(0)
      to = wallet.address

      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
      shields.connect(wallet)
    })

    it('gas build simple shield', async () => {
      await snapshotGasCost(
        (
          await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        ).tx
      )
    })

    // TODO: write for full SVG deploy tests
    it.skip('gas build more complex shield', async () => {
      field = HERALDIC_FIELD
      hardware = STANDARD_HARDWARE
      colors = encodeColors([fieldColors[0], fieldColors[1], fieldColors[2], fieldColors[3]])
      fee = BigNumber.from(0)
      await snapshotGasCost(
        (
          await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        ).tx
      )
    })

    it('builds the new shield', async () => {
      field = HERALDIC_FIELD
      hardware = STANDARD_HARDWARE
      fee = BigNumber.from(0)
      colors = encodeColors([fieldColors[0], fieldColors[1]])
      const tokenID = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      const shield = await shields.shields(tokenID)
      expect(shield.field).to.equal(HERALDIC_FIELD)
      expect(shield.hardware).to.equal(STANDARD_HARDWARE)
      expect(shield.color1).to.equal(fieldColors[0])
      expect(shield.color2).to.equal(fieldColors[1])
      expect(shield.color3).to.equal(0)
      expect(shield.color4).to.equal(0)
    })

    it('emits the ShieldBuilt event', async () => {
      field = HERALDIC_FIELD
      hardware = STANDARD_HARDWARE
      fee = BigNumber.from(0)
      colors = encodeColors([fieldColors[0], fieldColors[1]])
      const { tokenId, tx } = await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })

      await expect(tx).to.emit(shields, 'ShieldBuilt').withArgs(tokenId, field, hardware, frame, colors, 1)
    })

    it('pulls the build fee into the shields contract', async () => {
      field = MYTHIC_FIELD
      hardware = SPECIAL_HARDWARE
      colors = encodeColors([fieldColors[0]])
      fee = MYTHIC_FEE.add(SPECIAL_FEE)
      const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)
      expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(MINT_FEE.add(fee))
    })

    it('sets the shieldHash to true', async () => {
      const shieldHash1 = ethers.utils.keccak256(
        ethers.utils.defaultAbiCoder.encode(['uint16', 'uint16', 'uint24[4]'], [field, hardware, colors])
      )
      expect(await shields.shieldHashes(shieldHash1)).to.equal(false)
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      expect(await shields.shieldHashes(shieldHash1)).to.equal(true)

      field = 2
      colors = encodeColors([fieldColors[0], fieldColors[3]])
      const shieldHash2 = ethers.utils.keccak256(
        ethers.utils.defaultAbiCoder.encode(['uint16', 'uint16', 'uint24[4]'], [field, hardware, colors])
      )
      expect(await shields.shieldHashes(shieldHash2)).to.equal(false)
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      expect(await shields.shieldHashes(shieldHash2)).to.equal(true)
    })

    it('reverts with insufficient build fee', async () => {
      field = MYTHIC_FIELD
      hardware = SPECIAL_HARDWARE
      colors = encodeColors([fieldColors[0]])
      fee = MYTHIC_FEE

      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: invalid building fee')
    })

    it('reverts if a duplicate shield is built', async () => {
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })

      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: unique Shield already built')
    })

    it('reverts if duplicate shield is built with a different frame', async () => {
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      frame = 1
      fee = FRAME_ONE_FEE
      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: unique Shield already built')
    })

    it('allows a duplicate shield if colors are in different order', async () => {
      await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      colors = encodeColors([fieldColors[1], fieldColors[0]])
      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.not.be.revertedWith('Shields: Snique shield already built')
    })

    // TODO color validation when we know color numbers
    it('reverts if there are duplicate colors', async () => {
      field = 2
      colors = encodeColors([fieldColors[0], fieldColors[0], 0, 0])
      fee = BigNumber.from(0)
      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: all colors must be unique')
    })

    it('reverts if there are too many colors defined for the given field', async () => {
      field = 2
      colors = encodeColors([fieldColors[0], fieldColors[1], fieldColors[2], fieldColors[3]])
      fee = BigNumber.from(0)
      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: max colors exceeded for field')
    })

    it('reverts if nonMaker attempts to build a shield with the three shields hardware', async () => {
      field = HERALDIC_FIELD
      hardware = 120

      colors = encodeColors([fieldColors[0], fieldColors[1]])
      fee = BigNumber.from(0)
      await expect(
        buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
      ).to.be.revertedWith('Shields: Three Shields hardware reserved for Maker Badge')
    })

    // TODO add with full hardware spectrum test deploy
    it.skip('allows maker tokenID to mint shield with hardware 120', async () => {
      field = HERALDIC_FIELD
      hardware = SPECIAL_HARDWARE
      frame = 0
      colors = encodeColors([fieldColors[0], fieldColors[1]])
      fee = MYTHIC_FEE

      const tx = await shields.connect(makerAcct).build(field, hardware, frame, colors, 1, { value: fee })
      const shield = await shields.shields(1)
      expect(shield.hardware).to.equal(120)
    })

    describe('fees', async () => {
      it('charges the correct fee for a heraldic field', async () => {
        field = HERALDIC_FIELD
        fee = parseEther('0')

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for a mythic field', async () => {
        field = MYTHIC_FIELD
        colors = encodeColors([fieldColors[0]])
        fee = MYTHIC_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for a heraldic hardware', async () => {
        hardware = STANDARD_HARDWARE
        fee = parseEther('0')

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for a special hardware', async () => {
        hardware = SPECIAL_HARDWARE
        fee = SPECIAL_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for frame 1', async () => {
        frame = 1
        fee = FRAME_ONE_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for frame 2', async () => {
        frame = 2
        fee = FRAME_TWO_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for frame 3', async () => {
        frame = 3
        fee = FRAME_THREE_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for frame 4', async () => {
        frame = 4
        fee = FRAME_FOUR_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for frame 5', async () => {
        frame = 5
        fee = FRAME_FIVE_FEE

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })

      it('charges the correct fee for many paid types', async () => {
        field = MYTHIC_FIELD
        colors = encodeColors([fieldColors[0]])
        hardware = STANDARD_HARDWARE
        frame = 3
        fee = MYTHIC_FEE.add(FRAME_THREE_FEE)

        const shieldsBalancePrevious = await waffle.provider.getBalance(shields.address)
        await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })
        const shieldsBalanceUpdated = await waffle.provider.getBalance(shields.address)

        expect(shieldsBalanceUpdated.sub(shieldsBalancePrevious)).to.equal(fee.add(MINT_FEE))
      })
    })
  })

  describe('tokenURI', async () => {
    let field: number
    let frame: number
    let hardware: number
    let colors: [BigNumberish, BigNumberish, BigNumberish, BigNumberish]
    let fee: BigNumber
    let to: string

    beforeEach(async () => {
      field = HERALDIC_FIELD
      hardware = STANDARD_HARDWARE
      frame = 1
      colors = encodeColors([fieldColors[0], fieldColors[1], 0, 0])
      fee = FRAME_ONE_FEE
      to = wallet.address

      await shields.connect(owner).setPublicMintPrice(MINT_FEE)
      await shields.connect(owner).setPublicMintActive()
    })

    it('returns proper JSON', async () => {
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      const content = extractJSONFromURI(await shields.tokenURI(tokenId))
      expect(content).to.haveOwnProperty('name').is.a('string')
      expect(content).to.haveOwnProperty('description').is.a('string')
      expect(content).to.haveOwnProperty('image').is.a('string')
      expect(content).to.haveOwnProperty('attributes').is.a('array')
      expect(content.attributes[0]).to.haveOwnProperty('trait_type').to.equal('Field')
      expect(content.attributes[1]).to.haveOwnProperty('trait_type').to.equal('Hardware')
      expect(content.attributes[2]).to.haveOwnProperty('trait_type').to.equal('Status')
      expect(content.attributes[3]).to.haveOwnProperty('trait_type').to.equal('Field Type')
      expect(content.attributes[4]).to.haveOwnProperty('trait_type').to.equal('Hardware Type')
      expect(content.attributes[5]).to.haveOwnProperty('trait_type').to.equal('Frame')
      expect(content.attributes[6]).to.haveOwnProperty('trait_type').to.equal('Color 1')
      expect(content.attributes[7]).to.haveOwnProperty('trait_type').to.equal('Color 2')
    })

    it('returns the correct tokenURI', async () => {
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      const tokenURI = await shields.tokenURI(tokenId)
      expect(tokenURI).toMatchSnapshot()
    })

    it('returns the correct blazon with a frame', async () => {
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      const content = extractJSONFromURI(await shields.tokenURI(tokenId))
      expect(content.name).to.equal('Adorned: Bushing Hammer on radical red and perfect pink Per Pale')
    })

    it('returns the correct blazon without a frame', async () => {
      frame = 0
      fee = parseEther('0')
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      const content = extractJSONFromURI(await shields.tokenURI(tokenId))
      expect(content.name).to.equal('Bushing Hammer on radical red and perfect pink Per Pale')
    })

    it('gas min SVG lookup', async () => {
      field = MYTHIC_FIELD
      hardware = STANDARD_HARDWARE
      frame = 0
      fee = MYTHIC_FEE
      colors = encodeColors([fieldColors[0]])
      const shieldsGasTestFactory = await ethers.getContractFactory('ShieldsGasTest')
      const shieldsGasTest = (await shieldsGasTestFactory.deploy(shields.address)) as ShieldsGasTest
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      await snapshotGasCost(await shieldsGasTest.gasSnapshotTokenURI(tokenId))
    })

    // test this with a max SVG test setup
    it.skip('gas max SVG lookup', async () => {
      field = 299
      hardware = STANDARD_HARDWARE
      colors = encodeColors([fieldColors[0]])
      fee = BigNumber.from(10)
      const shieldsGasTestFactory = await ethers.getContractFactory('ShieldsGasTest')
      const shieldsGasTest = (await shieldsGasTestFactory.deploy(shields.address)) as ShieldsGasTest
      const tokenId = (await buildShield(shields.connect(wallet), { field, hardware, frame, colors, fee, to })).tokenId

      await snapshotGasCost(await shieldsGasTest.gasSnapshotTokenURI(tokenId))
    })

    it('returns the correct tokenURI for unbuilt maker mint badge', async () => {
      const tokenURI = await shields.tokenURI(1)
      const content = extractJSONFromURI(await shields.tokenURI(1))
      expect(content).to.haveOwnProperty('name').is.a('string')
      expect(content).to.haveOwnProperty('description').is.a('string')
      expect(content).to.haveOwnProperty('image').is.a('string')
      expect(content).to.haveOwnProperty('attributes').is.a('array')
      expect(content.name).to.equal('Maker Shield Badge')
      expect(content.attributes[0]).to.haveOwnProperty('trait_type').to.equal('Status')
      expect(content.attributes[0]).to.haveOwnProperty('value').to.equal('Unbuilt')
      expect(tokenURI).toMatchSnapshot()
    })

    it('returns the correct tokenURI for unbuilt standard mint badge', async () => {
      const tokenURI = await shields.tokenURI(6)
      const content = extractJSONFromURI(await shields.tokenURI(6))
      expect(content).to.haveOwnProperty('name').is.a('string')
      expect(content).to.haveOwnProperty('description').is.a('string')
      expect(content).to.haveOwnProperty('image').is.a('string')
      expect(content).to.haveOwnProperty('attributes').is.a('array')
      expect(content.name).to.equal('Shield Badge')
      expect(content.attributes[0]).to.haveOwnProperty('trait_type').to.equal('Status')
      expect(content.attributes[0]).to.haveOwnProperty('value').to.equal('Unbuilt')
      expect(tokenURI).toMatchSnapshot()
    })
  })

  // describe('fieldSVGs', () => {
  //   it.skip('renders each field correctly', async () => {
  //     const colors = encodeColors([0xff007a, 0xc1c1c1])
  //     for (let i = 1; i <= 62; i++) {
  //       let j // write files with prepended 0's to keep numerical order 10's 100's
  //       if (i < 10) {
  //         j = `00${i}`
  //       } else if (i < 100) {
  //         j = `0${i}`
  //       } else {
  //         j = `${i}`
  //       }
  //
  //       const { svg, fieldTitle } = await shields.generateSVGTest(i, 0, 1, colors)
  //       printSVGToSnapshots(`${j}_${fieldTitle}`, svg)
  //     }
  //   })
  // })
})
