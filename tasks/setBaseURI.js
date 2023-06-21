module.exports = async function (taskArgs, hre) {
	let contract = await ethers.getContract(taskArgs.contract)
	const tx = await contract.setBaseURI(
        "ipfs://QmZr2AE1Rgxd9sQB7DWucKanSVZRjwFooBzM6grHb3GuJw/"
    )
	
	console.log(`[${hre.network.name}] setMinDstGas tx hash ${tx.hash}`)
	await tx.wait()
}