import { HardhatRuntimeEnvironment } from 'hardhat/types'
import { DeployFunction } from 'hardhat-deploy/types'
import fs from 'fs'
import { Shields } from '../typechain'

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts()
  const { deploy } = hre.deployments
  const shields = (await hre.ethers.getContract('Shields')) as Shields

  console.log(
    await shields.transferOwnership('0x42aaEEe1201EC5D1f3a3DCcc23AB8c01391d182d', {
      maxFeePerGas: hre.ethers.BigNumber.from('300000000000'),
    })
  )
}
export default func
func.id = 'shields_premint' // id required to prevent reexecution
func.tags = ['Shields']
