# Análise de gravação e recuperação de informações na Blockchain
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/marciogsantana/hackathon_celo/blob/main/LICENCE) 

# Sobre o projeto

Este projeto tem o objetivo de mostrar e simular
a gravção de mensagens simples na Blockchain,
adicionar fundos no contrato, fazer pagamento para os 
usuário que interagem com o contrato e buscar as informações
na blockchain reinderizando  em um frontend simples


### Funcionamento

O usuário pode simular o envio de mensagens de várias
carteiras, apos a confirmação da transação buscamos as informações
da carteira, a mensagem enviada e o timestamp utilizando o 
evento que foi adicionado no contrato, foi inserido também um
fator simples de aleatoriedade para premiar os usuários que interagem com o contrato


## Layout Front End
![Front1](https://github.com/marciogsantana/imagens/blob/main/site_final_postagem.png) 

## Imagem Etherscan,
![Etherscan](https://github.com/marciogsantana/imagens/blob/main/etherscan.png)  


# Tecnologias utilizadas
## Back end
- Javascript
- NodeJs
- Solidity
- Hardhat
- Alchemy
- Redes de testes Goerli
## Front end
- HTML / CSS / JS / TypeScript
- ReactJS
- React Native
## Iniciar o projeto

# clonar repositório
git clone https://github.com/marciogsantana/Site_Blockchain

```bash

# alterar o arqvuivo .env
inserir as chaves para autenticação

# Na raiz do projeto

# instalar dependências
npm install

# acesar pasta Site 

# cd Site

# instalar dependências
npm install

# fazer deploy do contrato na rede de testes Goerli

npx hardhat run scripts/deploy.js --network goerli

# acessar pasta Site
# cd Site
# executar o comando abaixo
npm start
Acesse http://localhost:3000 para visualizar a página no browser
```

# Autor

Márcio Gomes de Santana

https://www.linkedin.com/in/marcio-gomes-de-santana-05347198/
