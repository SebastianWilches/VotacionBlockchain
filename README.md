# Votación blockchain
Aplicativo que simula un sistema de votación electrónico haciendo uso de los smart contracts en el lenguaje de solidity.

## Requisitos
Los requisitos para poder ejecutar el smart contract y los helpers son los siguientes:
| Aplicación | Versión |
| ------ | ------ |
| Node | v16.13.0 |
| Remix | https://remix-project.org |


## ¿Como ejecutarlo?
1.Instale todas las dependencias:
```sh
npm i
```

2.Cargue la carpeta de ```VotacionUD-Remix_Soldity``` a un espacio de trabajo en Remix.  
  
3.Traduzca los nombres de los candidatos a un formato de Byte32 para llenarlo en el array que recibe el input del smart contract en Remix. Para ello ejecute el helper de ````crearBytes32.js```.Tome la siguiente sentencia como ejemplo en la terminal
```sh
node .\crearBytes32.js Sebastian
```
4.Despliegue el smart contract en Remix y simule las votaciones.  
  
5.Traduzca el nombre del candidato ganador que arroja Remix a un formato de String para conocer su identidad. Para ello ejecute el helper de ```convertirBytes32_String.js```.Tome la siguiente sentencia como ejemplo en la terminal
```sh
node .\convertirBytes32_String.js 0x57696c636865730000000000000000000000000000000000000000000000000
```

