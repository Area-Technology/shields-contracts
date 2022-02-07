import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { DeployFunction } from 'hardhat-deploy/types'
import fs from 'fs'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts()
  const { deploy } = hre.deployments
  const EmblemWeaver = await hre.ethers.getContract('EmblemWeaver')

  await deploy('Shields', {
    from: deployer,
    args: [
      'Shields',
      'SHIELDS',
      EmblemWeaver.address,
      '0x42aaEEe1201EC5D1f3a3DCcc23AB8c01391d182d',
      '0x5e14ed9dCeE22ba758E8de482301028b261c4a14',
    ],
    log: true,
    autoMine: true, // speed up deployment on local network (ganache, hardhat), no effect on live networks
    maxFeePerGas: hre.ethers.BigNumber.from('95000000000'),
  })
}
export default func
func.id = 'deploy_Shields' // id required to prevent reexecution
func.tags = ['Shields']
