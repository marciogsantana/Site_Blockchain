// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalwaves;

    /*
     * Utilizaremos isso abaixo para gerar um número randômico
     */
    uint256 private seed;


    mapping (address => uint) public accessCount;  // armazena mensagens por conta

    event NewWave(address indexed from, uint256 timestamp, string message);  // evento da transação

    /*
     * Crio um struct Wave.
     * Um struct é basicamente um tipo de dados customizado onde nós podemos customizar o que queremos armazenar dentro dele
     */
    struct Wave {
        address waver; // Endereço do usuário que mandou mensagem
        string message; // Mensagem que o usuário envio
        uint256 timestamp; // Data/hora de quando o usuário mandou mensagem
    }

       /*
     * Declara a variável waves que permite armazenar um array de structs.
     * Isto que me permite armazenar todas asmensagens  que qualquer um tenha me enviado!
     */
    Wave[] waves;

    /*
     * Este é um endereço => uint mapping, o que significa que eu posso associar o endereço com um número!
     * Neste caso, armazenarei o endereço com o últimoo horário que o usuário tchauzinhou.
     */
    mapping(address => uint256) public lastWavedAt;


    constructor() payable {
        console.log("Ueba, eu sou um contrato e eu sou inteligente");
        /*
         * Define a semente inicial
         */
        seed = (block.timestamp + block.difficulty) % 100;
    }

    function wave(string memory _message) public{

         /*
         * Precisamos garantir que o valor corrente de timestamp é ao menos 15 minutos maior que o último timestamp armazenado
         */
        require(
            lastWavedAt[msg.sender] + 15 minutes < block.timestamp,
            "Espere 15m"
        );

        /*
         * Atualiza o timestamp atual do usuário
         */
        lastWavedAt[msg.sender] = block.timestamp;

        totalwaves += 1;  // contador de olas
        console.log("%s remetentes! %s mensagens ", msg.sender, _message);

        /*
         * Aqui é onde eu efetivamenet armazeno o tchauzinho no array.
         */
        waves.push(Wave(msg.sender, _message, block.timestamp));

        /*
         * Gera uma nova semente para o próximo que mandar um tchauzinho
         */
        seed = (block.difficulty + block.timestamp + seed) % 100;

        console.log("# randomico gerado: %d", seed);

        /*
         * Dá 50%  de chance do usuário ganhar o prêmio.
         */
        if (seed <= 50) {
            console.log("%s ganhou!", msg.sender);


        // funcão para mandar dinheiro

        uint256 prizeAmount = 0.0001 ether;  // palavra reservada ether para indicar movimentação financeira
        require(
        prizeAmount <= address(this).balance,   // saldo do proprio contrato
        "Tentando sacar mais dinheiro que o contrato possui."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");  // enviando o dinheiro
         require(success, "Falhou em sacar dinheiro do contrato.");

    
        }

         /*
         * Emite o evento
         */
        emit NewWave(msg.sender, block.timestamp, _message);

        
        
    }

    /*
     * Adicionei uma função getAllWaves que retornará os remetentes.
     * Isso permitirá recuperar os remetentes a partir do nosso site!
     */
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256){

        console.log("Temos %s mensagens no total !", totalwaves); // retorna o contador de olas
        return totalwaves;
    }

    function countAccess() public {   // funcão para contar o numero de olas por carteira
        accessCount[msg.sender]++;
    }

    function getAccessCount(address walletAddress) public view returns (uint) {  // retorna contador por endereço
        return accessCount[walletAddress];
    }
}

