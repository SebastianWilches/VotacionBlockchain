const ethers = require ('ethers');

const crearBytes32 = async (argsTerminal) => {
    const nombre = argsTerminal[0];
    const bytes = ethers.utils.formatBytes32String(nombre);

    console.log(`Nombre: ${nombre} \nBytes convertido: ${bytes}`);
}

//Recibira los argumentos desde la terminal
crearBytes32(process.argv.slice(2));

