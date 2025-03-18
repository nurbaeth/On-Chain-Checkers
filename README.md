# On-Chain Checkers

On-Chain Checkers is a fully decentralized checkers game built on Ethereum using Solidity. Players can create games, make moves, and verify results directly on the blockchain.

## Features
- **Decentralized Gameplay** – Every move is stored and verified on-chain.
- **Fair Play** – Smart contract logic ensures valid moves and turn-based gameplay.
- **Immutable Game History** – No cheating or altering past moves.

## How It Works
1. **Create a Game** – Players initiate a new match by specifying an opponent.
2. **Make Moves** – Players take turns moving their pieces according to checkers rules. 
3. **Win the Game** – The game continues until one player has no valid moves left.

## Deployment 
To deploy the contract, use Hardhat or Remix with a Solidity-compatible Ethereum network.

## Usage
- Call `createGame(address opponent)` to start a match.
- Use `makeMove(uint256 gameId, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY)` to make a move.
- Query `games(gameId)` to check the board state.

## Roadmap
- **King Piece Mechanics** – Implement promotion rules.
- **Jump Captures** – Add logic for forced captures.
- **Frontend UI** – Build an interactive web interface for gameplay.

## License
This project is licensed under the MIT License.

