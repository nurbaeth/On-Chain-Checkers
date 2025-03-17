// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OnChainCheckers {
    enum Piece { Empty, White, Black, WhiteKing, BlackKing }
    struct Game {
        address player1;
        address player2;
        Piece[8][8] board;
        bool player1Turn;
        bool active;
    }
    
    mapping(uint256 => Game) public games;
    uint256 public gameCounter;
    
    event GameCreated(uint256 gameId, address player1, address player2);
    event MoveMade(uint256 gameId, address player, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY);

    function createGame(address opponent) external {
        require(opponent != msg.sender, "Cannot play against yourself");
        gameCounter++;
        games[gameCounter] = Game(msg.sender, opponent, _initializeBoard(), true, true);
        emit GameCreated(gameCounter, msg.sender, opponent);
    }
    
    function makeMove(uint256 gameId, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY) external {
        Game storage game = games[gameId];
        require(game.active, "Game is not active");
        require(msg.sender == (game.player1Turn ? game.player1 : game.player2), "Not your turn");
        require(_isValidMove(game, fromX, fromY, toX, toY), "Invalid move");
        
        game.board[toX][toY] = game.board[fromX][fromY];
        game.board[fromX][fromY] = Piece.Empty;
        
        game.player1Turn = !game.player1Turn;
        emit MoveMade(gameId, msg.sender, fromX, fromY, toX, toY);
    }
    
    function _initializeBoard() private pure returns (Piece[8][8] memory board) {
        for (uint8 i = 0; i < 8; i++) {
            for (uint8 j = 0; j < 8; j++) {
                if ((i < 3) && ((i + j) % 2 == 1)) board[i][j] = Piece.Black;
                else if ((i > 4) && ((i + j) % 2 == 1)) board[i][j] = Piece.White;
                else board[i][j] = Piece.Empty;
            }
        }
    }
    
    function _isValidMove(Game storage game, uint8 fromX, uint8 fromY, uint8 toX, uint8 toY) private view returns (bool) {
        // Basic movement validation (diagonal, within bounds, correct piece)
        return true; // Placeholder, needs proper rules implementation
    }
}
