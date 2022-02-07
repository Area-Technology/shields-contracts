import web3Utils from 'web3-utils'
import { ethers } from 'hardhat'
import { ContractFactory } from 'ethers'

export const SALT = '0x0000000000000000000000000000000000000000000000000000000000000000'
export const SINGLETON_FACTORY_ADDRESS = '0xce0042B868300000d44A59004Da54A005ffdcf9f'
export const SINGLETON_FACTORY_INTERFACE = new ethers.utils.Interface([
  'function deploy(bytes memory _initCode, bytes32 _salt)',
])

export type DeployedSVGs = {
  [contractName: string]: string
}

export type DeployedContracts = {
  [svgType: string]: DeployedSVGs
}

export type DeployedContractReceipt = {
  contractName: string
  address: string
  transactionHash?: string
}

export type DeployStatus = {
  deployed: boolean
  contractFactory: ContractFactory
  receipt: DeployedContractReceipt
}

export function constructDeploymentArchive(
  svgType: string,
  receipt: DeployedContractReceipt,
  deployedContracts: DeployedContracts
): DeployedContracts {
  svgType = `${svgType.toLowerCase()}s`
  deployedContracts[svgType][lowercaseFirst(receipt.contractName)] = receipt.address
  return deployedContracts
}

export function computeAddress(initcode: string): string {
  const codeHash = web3Utils.soliditySha3({ t: 'bytes', v: initcode })
  if (!codeHash) {
    throw 'No codehash'
  }
  const addressAsBytes32 = web3Utils.soliditySha3(
    { t: 'uint8', v: 255 }, // 0xff
    { t: 'address', v: SINGLETON_FACTORY_ADDRESS },
    { t: 'bytes32', v: SALT },
    { t: 'bytes32', v: codeHash }
  )
  return `0x${addressAsBytes32!.slice(26, 66)}`
}

function lowercaseFirst(str: string): string {
  return str[0].toLowerCase() + str.slice(1)
}
