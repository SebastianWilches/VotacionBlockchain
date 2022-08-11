const ethers = require ('ethers');

const crearString = async (argsTerminal) => {
    const bytes = argsTerminal[0];
    const string = ethers.utils.parseBytes32String(bytes);

    console.log(`Byte: ${bytes} \nString convertido: ${string}`);
}

//Recibira los argumentos desde la terminal
crearString(process.argv.slice(2));


