import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { DeployFunction } from 'hardhat-deploy/types'
import fs from 'fs'

const JSON_PATH = 'deploySVGs/deployedSVGs.json'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts()
  const { deploy } = hre.deployments

  const deploymentArchive = JSON.parse(fs.readFileSync(JSON_PATH, { encoding: 'utf8' }))

  const colorHex = [
    0xff007a, 0x6c28a2, 0xfe7fff, 0xd3d3d3, 0x323232, 0x78503c, 0x007fff, 0xb5000a, 0xff6b00, 0xffb300, 0x006351,
    0xceff00,
  ]

  const colorNames = [
    'Pink',
    'Ultraviolet',
    'Rose',
    'Gray',
    'Onyx',
    'Brown',
    'Sky',
    'Crimson',
    'Citrine',
    'Gold',
    'Evergreen',
    'Hi-Vis',
  ]

  await deploy('FieldGenerator', {
    from: deployer,
    args: [colorHex, colorNames, deploymentArchive.fields],
    log: true,
    autoMine: true, // speed up deployment on local network (ganache, hardhat), no effect on live networks
    maxFeePerGas: hre.ethers.BigNumber.from('95000000000'),
  })
}
export default func
func.id = 'deploy_FieldGenerator' // id required to prevent reexecution
func.tags = ['Shields']
