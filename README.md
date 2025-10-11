# Tic-Tac-Toe Game in Prolog

## Description

This project is a complete implementation of the classic Tic-Tac-Toe game using Prolog. The game allows a human player to compete against an AI opponent. The player uses 'O' and the computer uses 'X'. The game is played on a standard 3x3 grid.

## Features

- Interactive human vs. computer gameplay.
- AI opponent with strategic move selection.
- Text-based user interface for easy play in the console.
- Win, lose, and draw conditions with appropriate notifications.
- Input validation to ensure valid moves.
- Clear display of the game board after each move.

## How to Play

1. Start the Prolog interpreter.
2. Load the game file with the command: `[tictactoe].`
3. Start the game by running: `start_game.`
4. The board positions are numbered from 1 to 9 as follows:

   ```
    1 | 2 | 3
   -----------
    4 | 5 | 6
   -----------
    7 | 8 | 9
   ```

5. When prompted, enter the number corresponding to the square where you want to place your mark (`O`).
6. The AI will make its move automatically (`X`).
7. The game will indicate if there is a winner or if the game ends in a draw.
8. After game end, you can restart by running: `start_game.` again.

## Requirements

- SWI-Prolog or any ANSI-compliant Prolog interpreter.
- Console or terminal environment for text input and output.

## Code Structure

- The game logic is contained in `tictactoe.pl`.
- Winning conditions and board state validations are implemented.
- AI uses simple strategic logic for competitive gameplay.
- Board display and user interaction occur in the console.

## Future Improvements

- Add color to the console output for better experience.
- Highlight winning lines.
- Implement a graphical user interface (GUI).
- Enhance AI with advanced algorithms.

## Author

Developed by [mahmoudabozied4](https://github.com/mahmoudabozied4).

## License

This project is open source and available under the MIT License.
