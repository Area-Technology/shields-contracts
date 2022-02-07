import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { DeployFunction } from 'hardhat-deploy/types'
import fs from 'fs'

const JSON_PATH = 'deploySVGs/deployedSVGs.json'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts()
  const { deploy } = hre.deployments

  const svgDeploymentArchive = JSON.parse(fs.readFileSync(JSON_PATH, { encoding: 'utf8' }))

  await deploy('HardwareGenerator', {
    from: deployer,
    args: [svgDeploymentArchive.hardwares],
    log: true,
    autoMine: true, // speed up deployment on local network (ganache, hardhat), no effect on live networks
    maxFeePerGas: hre.ethers.BigNumber.from('110000000000'),
  })
}
export default func
func.id = 'deploy_HardwareGenerator' // id required to prevent reexecution
func.tags = ['Shields']
