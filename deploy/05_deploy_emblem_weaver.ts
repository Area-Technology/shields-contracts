import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { DeployFunction } from 'hardhat-deploy/types'
import fs from 'fs'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts()
  const { deploy } = hre.deployments
  const FieldGenerator = await hre.ethers.getContract('FieldGenerator')
  const HardwareGenerator = await hre.ethers.getContract('HardwareGenerator')
  const FrameGenerator = await hre.ethers.getContract('FrameGenerator')
  const ShieldBadgeSVGs = await hre.ethers.getContract('ShieldBadgeSVGs')

  await deploy('EmblemWeaver', {
    from: deployer,
    args: [FieldGenerator.address, HardwareGenerator.address, FrameGenerator.address, ShieldBadgeSVGs.address],
    log: true,
    autoMine: true, // speed up deployment on local network (ganache, hardhat), no effect on live networks
    maxFeePerGas: hre.ethers.BigNumber.from('95000000000'),
  })
}
export default func
func.id = 'deploy_EmblemWeaver' // id required to prevent reexecution
// Question: Should this be renamed to Shields?
func.tags = ['Shields']
