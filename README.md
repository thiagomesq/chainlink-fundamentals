# Chainlink Fundamentals: Foundry Token Shop

## Quickstart

Follow the steps below to initialize this project after cloning the repository:

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/chainlink-fundamentals.git
    cd chainlink-fundamentals
    ```

2.  Install dependencies:
    ```bash
    forge install
    ```

3.  Compile the contracts:
    ```bash
    forge build
    ```

4.  Run the tests:
    ```bash
    forge test
    ```

5.  (Optional) Set up environment variables for blockchain network integration (RPC_URL, PRIVATE_KEY).

## Summary

The **Foundry Token Shop** project is a decentralized application (dApp) that implements a smart contract for selling an ERC20 token. Developed with the Foundry framework, the project explores essential blockchain concepts such as creating ERC20 tokens, access control, and, most importantly, integration with **Chainlink Price Feeds** to securely and decentrally obtain real-world asset price data (ETH/USD).

## Description

### Motivation
The purpose of this project is to demonstrate how smart contracts can use Chainlink oracles to price goods or services in a stable currency (like USD) while accepting payments in a volatile cryptocurrency (like ETH). This solves a common problem in dApps where price fluctuations can affect the economic viability of the service.

### Tools and Technologies
- **Foundry**: A framework for developing, testing, and deploying smart contracts.
- **Solidity**: The programming language for smart contracts.
- **Chainlink Price Feeds**: To obtain decentralized ETH/USD price data.
- **OpenZeppelin Contracts**: For secure implementations of standards like ERC20, Ownable, and AccessControl.

### Project Structure
The project is organized as follows:
- `src/`: Contains the smart contracts:
    - `MyERC20.sol`: A custom ERC20 token with access control for the minting function.
    - `TokenShop.sol`: The contract that sells `MyERC20` in exchange for ETH, using a Chainlink Price Feed for price calculation.
- `script/`: Scripts for deploying and interacting with the contracts (`DeployMyERC20.s.sol`, `DeployTokenShop.s.sol`, `Interactions.s.sol`).
- `test/`: Contains the test scripts to validate the functionality of the contracts.
- `foundry.toml`: Foundry configuration file.

### Development
1.  **Planning**: We defined the requirements for the token shop:
    - Create an ERC20 token (`MyERC20`).
    - A shop contract (`TokenShop`) that can mint this token.
    - The shop must sell tokens at a fixed price in USD but accept ETH.
    - The shop needs a mechanism to withdraw the accumulated ETH funds.

2.  **Contract Implementation**:
    - We developed `MyERC20.sol` using the ERC20 and AccessControl standards from OpenZeppelin.
    - We developed `TokenShop.sol`, which integrates Chainlink's `AggregatorV3Interface` to query the ETH price.
    - We implemented the calculation logic to convert the received ETH amount into the correct quantity of tokens to be minted.

3.  **Testing**:
    - We wrote unit and integration tests using Foundry to validate all functionality, including token purchases and fund withdrawals.

4.  **Deployment**:
    - We created scripts in `script/` to automate the deployment of contracts and the configuration of permissions (granting the `MINTER_ROLE` to the `TokenShop`).

5.  **Documentation**:
    - We prepared this README to guide developers.
    - We added explanatory comments in the code.

This project is an excellent introduction to using Chainlink Oracles in a practical scenario and to developing dApps with Foundry.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

## Makefile Commands

This project uses a `Makefile` to simplify common tasks.

### Main Commands

-   **Set up the environment (install dependencies and compile):**
    ```shell
    make all
    ```
-   **Compile the contracts:**
    ```shell
    make build
    ```
-   **Run the tests:**
    ```shell
    make test
    ```
-   **Format the code:**
    ```shell
    make format
    ```
-   **Start a local node (Anvil):**
    ```shell
    make anvil
    ```

### Deployment and Interaction Commands

To run the commands below, you can specify the network. The default is the local Anvil network. To use Sepolia, add `ARGS="--network sepolia"` to the end of the command.

-   **Deploy the `MyERC20` contract:**
    ```shell
    make deploy
    ```
-   **Deploy the `TokenShop` contract:**
    ```shell
    make deployTokenShop
    ```
-   **Check if `TokenShop` has the `MINTER_ROLE` permission:**
    ```shell
    make checkHasRole
    ```
-   **Mint tokens directly from the `MyERC20` contract (requires permission):**
    ```shell
    make mint
    ```
-   **Buy (mint) tokens through the `TokenShop` (by sending ETH):**
    ```shell
    make mintWithTokenShop
    ```
-   **Withdraw ETH funds from the `TokenShop` contract:**
    ```shell
    make withdraw
    ```
-   **Example of usage with the Sepolia network:**
    ```shell
    make deploy ARGS="--network sepolia"
    ```

## Quickstart

Siga os passos abaixo para inicializar este projeto após clonar o repositório:

1.  Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/chainlink-fundamentals.git
    cd chainlink-fundamentals
    ```

2.  Instale as dependências:
    ```bash
    forge install
    ```

3.  Compile os contratos:
    ```bash
    forge build
    ```

4.  Execute os testes:
    ```bash
    forge test
    ```

5.  (Opcional) Configure variáveis de ambiente para integração com redes blockchain (RPC_URL, PRIVATE_KEY).

## Resumo

O projeto **Foundry Token Shop** é uma aplicação descentralizada (dApp) que implementa um contrato inteligente para a venda de um token ERC20. Desenvolvido com o framework Foundry, o projeto explora conceitos essenciais de blockchain, como a criação de tokens ERC20, controle de acesso e, principalmente, a integração com os **Price Feeds da Chainlink** para obter dados de preços de ativos do mundo real (ETH/USD) de forma segura e descentralizada.

## Descrição

### Motivação
A proposta deste projeto é demonstrar como contratos inteligentes podem utilizar os oráculos da Chainlink para precificar bens ou serviços em uma moeda estável (como o USD) enquanto aceitam pagamentos em uma criptomoeda volátil (como o ETH). Isso resolve um problema comum em dApps, onde a flutuação de preços pode afetar a viabilidade econômica do serviço.

### Ferramentas e Tecnologias
- **Foundry**: Framework para desenvolvimento, teste e implantação de contratos inteligentes.
- **Solidity**: Linguagem de programação para contratos inteligentes.
- **Chainlink Price Feeds**: Para obter dados de preços ETH/USD de forma descentralizada.
- **OpenZeppelin Contracts**: Para implementações seguras de padrões como ERC20, Ownable e AccessControl.

### Estrutura do Projeto
O projeto está organizado da seguinte forma:
- `src/`: Contém os contratos inteligentes:
    - `MyERC20.sol`: Um token ERC20 customizado com controle de acesso para a função de mint.
    - `TokenShop.sol`: O contrato que vende o `MyERC20` em troca de ETH, usando um Price Feed da Chainlink para o cálculo do preço.
- `script/`: Scripts para implantação e interação com os contratos (`DeployMyERC20.s.sol`, `DeployTokenShop.s.sol`, `Interactions.s.sol`).
- `test/`: Contém os scripts de teste para validar a funcionalidade dos contratos.
- `foundry.toml`: Arquivo de configuração do Foundry.

### Desenvolvimento
1.  **Planejamento**: Definimos os requisitos para a loja de tokens:
    - Criação de um token ERC20 (`MyERC20`).
    - Um contrato de loja (`TokenShop`) que pode emitir (mint) esse token.
    - A loja deve vender tokens a um preço fixo em USD, mas aceitar ETH.
    - A loja precisa de um mecanismo para sacar os fundos em ETH acumulados.

2.  **Implementação dos Contratos**:
    - Desenvolvemos o `MyERC20.sol` usando o padrão ERC20 e AccessControl da OpenZeppelin.
    - Desenvolvemos o `TokenShop.sol`, que integra o `AggregatorV3Interface` da Chainlink para consultar o preço do ETH.
    - Implementamos a lógica de cálculo para converter o valor de ETH recebido para a quantidade correta de tokens a serem emitidos.

3.  **Testes**:
    - Escrevemos testes unitários e de integração utilizando Foundry para validar toda a funcionalidade, incluindo a compra de tokens e o saque de fundos.

4.  **Implantação**:
    - Criamos scripts em `script/` para automatizar o deploy dos contratos e a configuração de permissões (conceder o `MINTER_ROLE` ao `TokenShop`).

5.  **Documentação**:
    - Elaboramos este README para orientar desenvolvedores.
    - Adicionamos comentários explicativos no código.

Este projeto é uma excelente introdução ao uso de Oráculos da Chainlink em um cenário prático e ao desenvolvimento de dApps com Foundry.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

## Comandos do Makefile

Este projeto utiliza um `Makefile` para simplificar as tarefas comuns.

### Comandos Principais

-   **Preparar o ambiente (instalar dependências e compilar):**
    ```shell
    make all
    ```
-   **Compilar os contratos:**
    ```shell
    make build
    ```
-   **Executar os testes:**
    ```shell
    make test
    ```
-   **Formatar o código:**
    ```shell
    make format
    ```
-   **Iniciar um nó local (Anvil):**
    ```shell
    make anvil
    ```

### Comandos de Deploy e Interação

Para executar os comandos abaixo, você pode especificar a rede. O padrão é a rede local Anvil. Para usar a Sepolia, adicione `ARGS="--network sepolia"` ao final do comando.

-   **Fazer deploy do contrato `MyERC20`:**
    ```shell
    make deploy
    ```
-   **Fazer deploy do contrato `TokenShop`:**
    ```shell
    make deployTokenShop
    ```
-   **Verificar se o `TokenShop` tem a permissão de `MINTER_ROLE`:**
    ```shell
    make checkHasRole
    ```
-   **Mintar tokens diretamente pelo contrato `MyERC20` (requer permissão):**
    ```shell
    make mint
    ```
-   **Comprar (mintar) tokens através do `TokenShop` (enviando ETH):**
    ```shell
    make mintWithTokenShop
    ```
-   **Sacar os fundos de ETH do contrato `TokenShop`:**
    ```shell
    make withdraw
    ```
-   **Exemplo de uso com a rede Sepolia:**
    ```shell
    make deploy ARGS="--network sepolia"
    ```
