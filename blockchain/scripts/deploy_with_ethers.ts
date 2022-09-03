import { deploy } from './ethers-lib'

(async () => {
    try {
        const result = await deploy('SampleERC20', ['testToken', 'TST'])
        console.log(`address: ${result.address}`)
    } catch (e) {
        console.log(e.message)
    }
  })()