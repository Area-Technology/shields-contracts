import { Shields } from '../../typechain'
import { BigNumber, BigNumberish, ContractTransaction } from 'ethers'
import { ethers } from 'hardhat'

type ShieldBuilt = {
  tx: ContractTransaction
  tokenId: string
}

export async function buildShield(
  shields: Shields,
  params: {
    field: number
    hardware: number
    frame: number
    colors: [BigNumberish, BigNumberish, BigNumberish, BigNumberish]
    fee: BigNumber
    to: string
  }
): Promise<ShieldBuilt> {
  const mintTx = await (
    await shields.mint(params.to, 1, { value: BigNumber.from(ethers.utils.parseEther('0.15')) })
  ).wait()
  const tokenId = mintTx.events![0].args!.tokenId
  const tx = await shields.build(params.field, params.hardware, params.frame, params.colors, tokenId, {
    value: params.fee,
  })
  return { tx, tokenId }
}
