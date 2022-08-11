// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/// @title Sistema de votación.


contract sistemaVotacion {
    
    struct Votante {
        uint pesoVoto; 
        bool isVoto;  // True = La persona ya voto
        address delegado; 
        uint indiceVoto;  
    }

    
    struct Candidato {
        bytes32 nombreCandidato;
        uint contadorVotos;
    }

    address public adminVotacion;

    
    mapping(address => Votante) public votantes;

    //Array que contiene los candidatos
    Candidato[] public candidatos;

    /// Añade las direcciones de los candidatos del input a un array de candidatos.
    constructor(bytes32[] memory nombresCandidatos) {
        adminVotacion = msg.sender;
        votantes[adminVotacion].pesoVoto = 1;

        
        for (uint i = 0; i < nombresCandidatos.length; i++) {
            
            candidatos.push(Candidato({
                nombreCandidato: nombresCandidatos[i],
                contadorVotos: 0
            }));
        }
    }


    function darDerechoAVotar(address voter) external {
        
        //Validaciones sobre el votante que se le da derecho
        require(
            msg.sender == adminVotacion,
            "Solo adminVotacion puede dar el derecho de indiceVoto."
        );
        require(
            !votantes[voter].isVoto,
            "El votante ya voto (isVoto = true)."
        );
        require(votantes[voter].pesoVoto == 0);
        votantes[voter].pesoVoto = 1;
    }

    

    /// Suma un voto al candidato seleccionado
    function Votar(uint proposal) external {
        Votante storage sender = votantes[msg.sender];
        require(sender.pesoVoto != 0, "Has no right to indiceVoto");
        require(!sender.isVoto, "Already isVoto.");
        sender.isVoto = true;
        sender.indiceVoto = proposal;


        candidatos[proposal].contadorVotos += sender.pesoVoto;
    }

    
    // Mira todo el array de candidatos y cuenta cual es el que tiene mas votos
    function candidatoGanador() public view
            returns (uint candidatoGanador_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < candidatos.length; p++) {
            if (candidatos[p].contadorVotos > winningVoteCount) {
                winningVoteCount = candidatos[p].contadorVotos;
                candidatoGanador_ = p;
            }
        }
    }

    
    //Llama la función que cuenta los votos de los candidatos y devuelve el adress
    // del candidato que gano.
    function nomCandidatoGanador() external view
            returns (bytes32 nomCandidatoGanador_)
    {
        nomCandidatoGanador_ = candidatos[candidatoGanador()].nombreCandidato;
    }
}