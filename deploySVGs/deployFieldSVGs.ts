import { ethers } from 'hardhat'
import { BigNumber } from 'ethers'
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/dist/src/signers'
import {
  constructDeploymentArchive,
  computeAddress,
  DeployedContractReceipt,
  DeployStatus,
  SALT,
  SINGLETON_FACTORY_ADDRESS,
  SINGLETON_FACTORY_INTERFACE,
} from './helpers'
import fs from 'fs'
import { ContractFactory } from 'ethers'

const JSON_PATH = 'deploySVGs/deployedSVGs.json'
const BATCH_SIZE = 10

async function main() {
  console.log('Deploying SVGs....')

  // declare constants
  const deployer = (await ethers.getSigners())[0]
  const networkName = (await ethers.provider.getNetwork()).name

  console.log(deployer)
  console.log(await ethers.provider.getNetwork())

  // setup JSON file if nonexistant
  if (!fs.existsSync(JSON_PATH) || fs.readFileSync(JSON_PATH).length == 0) {
    fs.writeFileSync(JSON_PATH, JSON.stringify({ fields: {}, hardwares: {}, frames: {} }, null, 2))
  }

  // batch deploy contracts
  await batchDeploySVGs('Field', 24, deployer, networkName)
  await batchDeploySVGs('Hardware', 38, deployer, networkName)
  await batchDeploySVGs('Frame', 2, deployer, networkName)
}

async function batchDeploySVGs(svgType: string, maxContract: number, deployer: SignerWithAddress, networkName: string) {
  for (let i = 1; i <= maxContract; i += BATCH_SIZE) {
    let deploymentArchive = JSON.parse(fs.readFileSync(JSON_PATH, { encoding: 'utf8' }))
    let nonce = await ethers.provider.getTransactionCount(deployer.address)
    console.log(nonce)
    let checkingDeployStatuses: Promise<DeployStatus>[] = []
    let deployingContracts: Promise<DeployedContractReceipt>[] = []

    for (let j = i; j < i + BATCH_SIZE; j++) {
      if (j <= maxContract) {
        checkingDeployStatuses.push(isDeployed(`${svgType}SVGs${j}`))
      }
    }

    const deployStatuses = await Promise.all(checkingDeployStatuses)

    for (let svgContract of deployStatuses) {
      if (svgContract.deployed === true) {
        deploymentArchive = constructDeploymentArchive(svgType, svgContract.receipt, deploymentArchive)
      } else if (svgContract.deployed === false) {
        deployingContracts.push(
          deployContract(svgContract.receipt.contractName, svgContract.contractFactory, nonce++, deployer)
        )
      }
    }

    const receipts = await Promise.all(deployingContracts)

    for (let receipt of receipts) {
      deploymentArchive = constructDeploymentArchive(svgType, receipt, deploymentArchive)
    }
    fs.writeFileSync(JSON_PATH, JSON.stringify(deploymentArchive, null, 2))
  }
}

async function deployContract(
  factoryName: string,
  contractFactory: ContractFactory,
  nonce: number,
  deployer: SignerWithAddress
): Promise<DeployedContractReceipt> {
  console.log(`deploying ${factoryName}...`)
  console.log('nonce', nonce)

  const bytecode = contractFactory.bytecode
  const computedAddress = computeAddress(bytecode)
  const singletonFactoryContract = new ethers.Contract(SINGLETON_FACTORY_ADDRESS, SINGLETON_FACTORY_INTERFACE, deployer)
  const transaction = await singletonFactoryContract.deploy(bytecode, SALT, {
    gasLimit: 6_000_000,
    nonce,
    maxFeePerGas: '95000000000',
  })
  console.log(transaction.hash)
  const txReceipt = await transaction.wait()

  console.log(
    `successfully deployed ${factoryName}!!!\n\taddress:\t${computedAddress}\n\thash:\t\t${txReceipt.transactionHash}\n`
  )
  return { contractName: factoryName, address: computedAddress, transactionHash: txReceipt.transactionHash }
}

async function isDeployed(factoryName: string): Promise<DeployStatus> {
  const contractFactory = await ethers.getContractFactory(factoryName)
  const bytecode = contractFactory.bytecode
  const computedAddress = computeAddress(bytecode)
  const deployedCode = await ethers.provider.getCode(computedAddress)
  let deployed: boolean = false

  if (deployedCode.length > 2) {
    console.log(`${factoryName} already deployed at ${computedAddress}`)
    deployed = true
  }

  return {
    deployed,
    contractFactory: contractFactory,
    receipt: { contractName: factoryName, address: computedAddress },
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
