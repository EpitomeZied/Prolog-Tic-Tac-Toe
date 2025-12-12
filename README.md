# Prolog Tic-Tac-Toe 🎮

[![Prolog](https://img.shields.io/badge/Language-Prolog-blue.svg)](https://www.swi-prolog.org/)
[![SWI-Prolog](https://img.shields.io/badge/Prolog-SWI--Prolog-orange.svg)](https://www.swi-prolog.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub Repo](https://img.shields.io/badge/GitHub-EpitomeZied-black.svg)](https://github.com/EpitomeZied)

A **command-line Tic-Tac-Toe game implemented in Prolog**, featuring a **human player vs AI**.  
This project demonstrates **logic programming**, **rule-based reasoning**, and **basic AI decision-making** using Prolog.

> 👤 **Author:** EpitomeZied  
> 🔗 **Repository:** https://github.com/EpitomeZied/Prolog-Tic-Tac-Toe

---

## 📌 Features

- Human vs AI gameplay
- Rule-based AI decision making
- Automatic win, loss, and draw detection
- Input validation for illegal moves
- Clean console-based board display
- Written in pure Prolog

---

## 🧠 AI Strategy

The AI follows a **rule-based strategy**:
1. Plays winning moves when available
2. Blocks the opponent’s winning moves
3. Selects the best available position

The AI logic is designed to be easily extended to:
- Minimax algorithm
- Alpha-Beta pruning
- Multiple difficulty levels

---

## 🛠 Requirements

- **SWI-Prolog** (recommended)

### Install on Ubuntu / Debian
```bash
sudo apt update
sudo apt install swi-prolog
```

### Other platforms
Download from: https://www.swi-prolog.org/

---

## 🚀 Quick Start

### Clone the repository
```bash
git clone https://github.com/EpitomeZied/Prolog-Tic-Tac-Toe.git
cd Prolog-Tic-Tac-Toe
```

### Start Prolog
```bash
swipl
```

### Load the game
```prolog
?- [tictactoe].
```

### Start playing
```prolog
?- start_game.
```

---

## 🎮 How to Play

Board positions are numbered as follows:

```
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
```

- You play as **X**
- AI plays as **O**
- Enter a number between **1 and 9**
- Invalid or occupied moves are rejected automatically

---

## 🧪 Example Run Output

```
?- start_game.

Welcome to Tic-Tac-Toe!
Player: X
AI: O

Current board:
_ | _ | _
---------
_ | _ | _
---------
_ | _ | _

Your move (1-9): 5

Current board:
_ | _ | _
---------
_ | X | _
---------
_ | _ | _

AI is thinking...

Current board:
_ | _ | _
---------
_ | X | _
---------
_ | O | _

Your move (1-9): 1

Current board:
X | _ | _
---------
_ | X | _
---------
_ | O | _

AI is thinking...

Current board:
X | _ | _
---------
_ | X | _
---------
O | O | _

Your move (1-9): 9

X | _ | _
---------
_ | X | _
---------
O | O | X

🎉 You win! Congratulations!
```

---

## 📂 Project Structure

```
Prolog-Tic-Tac-Toe/
├── tictactoe.pl   # Game logic and AI rules
├── README.md      # Project documentation
└── LICENSE        # MIT License
```

---

## 🔮 Future Enhancements

- Minimax-based AI
- Difficulty levels (Easy / Medium / Hard)
- Human vs Human mode
- Unit tests using `plunit`
- Graphical user interface (GUI)

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a new feature branch
3. Commit your changes
4. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.

---

## ⭐ Support

If you find this project helpful or interesting, consider giving it a ⭐ on GitHub!

Made with ❤️ using **Prolog** by **EpitomeZied**
