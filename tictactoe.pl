% ============================================================================
% TIC-TAC-TOE GAME IN PROLOG
% ============================================================================
% Description: A complete implementation of Tic-Tac-Toe where the player 
%              competes against an AI opponent.
% Players: X (Computer), O (Human)
% Board Layout: 
%     1 | 2 | 3
%     ---------
%     4 | 5 | 6
%     ---------
%     7 | 8 | 9
% ============================================================================

% ----------------------------------------------------------------------------
% BOARD CONFIGURATION
% ----------------------------------------------------------------------------
% Define all possible winning lines in their ordered form

% Horizontal lines
ordered_line(1, 2, 3).
ordered_line(4, 5, 6).
ordered_line(7, 8, 9).

% Vertical lines
ordered_line(1, 4, 7).
ordered_line(2, 5, 8).
ordered_line(3, 6, 9).

% Diagonal lines
ordered_line(1, 5, 9).
ordered_line(3, 5, 7).

% ----------------------------------------------------------------------------
% LINE PERMUTATIONS
% ----------------------------------------------------------------------------
% Generate all permutations of ordered lines to check winning conditions

line(A, B, C) :- ordered_line(A, B, C).
line(A, B, C) :- ordered_line(A, C, B).
line(A, B, C) :- ordered_line(B, A, C).
line(A, B, C) :- ordered_line(B, C, A).
line(A, B, C) :- ordered_line(C, A, B).
line(A, B, C) :- ordered_line(C, B, A).

% ----------------------------------------------------------------------------
% BOARD STATE PREDICATES
% ----------------------------------------------------------------------------

% Check if a square is occupied
full(Position) :- x(Position).
full(Position) :- o(Position).

% Check if a square is empty
empty(Position) :- \+(full(Position)).

% Check if all squares are occupied
all_full :- 
    full(1), full(2), full(3), 
    full(4), full(5), full(6), 
    full(7), full(8), full(9).

% ----------------------------------------------------------------------------
% UTILITY PREDICATES
% ----------------------------------------------------------------------------

% Check equality
same(A, A).

% Check inequality
different(A, B) :- \+(same(A, B)).

% ----------------------------------------------------------------------------
% AI STRATEGY
% ----------------------------------------------------------------------------

% Main move selection predicate
move(Position) :- rule1(Position).

% Fallback strategy: select best available position
move(Position) :- 
    good(Position), 
    empty(Position), 
    !.

% Position priority (corners > center > edges)
good(5).  % Center (highest priority after forced moves)
good(1).  % Top-left corner
good(3).  % Top-right corner
good(7).  % Bottom-left corner
good(9).  % Bottom-right corner
good(2).  % Top edge
good(4).  % Left edge
good(6).  % Right edge
good(8).  % Bottom edge

% ----------------------------------------------------------------------------
% STRATEGIC RULES
% ----------------------------------------------------------------------------

% Rule 1: Block opponent or complete winning line
% Priority 1: Block opponent's winning move (two O's in a line)
rule1(Position) :- 
    line(A, B, Position), 
    o(A), 
    o(B), 
    empty(Position), 
    !.

% Priority 2: Complete own winning line (two X's in a line)
rule1(Position) :- 
    line(A, B, Position), 
    x(A), 
    x(B), 
    empty(Position), 
    !.

% Priority 3: Take center if available
rule1(5) :- empty(5).

% Priority 4: If opponent takes corner, respond with edge
rule1(Position) :- 
    o(Corner), 
    Corner \= 2, Corner \= 4, Corner \= 6, Corner \= 8, 
    rule2(Position).

% Rule 2: Select an edge position
rule2(Position) :- 
    empty(Position), 
    Position \= 1, Position \= 3, Position \= 7, Position \= 9.

% ----------------------------------------------------------------------------
% GAME STATE MANAGEMENT
% ----------------------------------------------------------------------------

% Check if computer has won
done :- 
    ordered_line(A, B, C), 
    x(A), x(B), x(C), 
    write('I won.'), nl.

% Check if game is a draw
done :- 
    all_full, 
    write('Draw.'), nl.

% Clear the board
clear :- 
    retractall(x(_)), 
    retractall(o(_)).

% ----------------------------------------------------------------------------
% PLAYER INPUT
% ----------------------------------------------------------------------------

% Get and validate player move
getmove :- 
    repeat, 
    write('Please enter a move (1-9): '), 
    read(Position), 
    empty(Position), 
    assert(o(Position)).

% ----------------------------------------------------------------------------
% COMPUTER MOVE
% ----------------------------------------------------------------------------

% Make computer move
makemove :- 
    move(Position), 
    !, 
    assert(x(Position)).

makemove :- all_full.

% ----------------------------------------------------------------------------
% BOARD DISPLAY
% ----------------------------------------------------------------------------

% Print individual square
printsquare(Position) :- o(Position), write(' o ').
printsquare(Position) :- x(Position), write(' x ').
printsquare(Position) :- empty(Position), write('   ').

% Print entire board
printboard :- 
    printsquare(1), write('|'), printsquare(2), write('|'), printsquare(3), nl,
    write('-----------'), nl,
    printsquare(4), write('|'), printsquare(5), write('|'), printsquare(6), nl,
    write('-----------'), nl,
    printsquare(7), write('|'), printsquare(8), write('|'), printsquare(9), nl.

% ----------------------------------------------------------------------------
% GAME INITIALIZATION
% ----------------------------------------------------------------------------

% Generate random position (1-9)
random_position(Position) :- random(1, 10, Position).

% Main game entry point
play :- 
    random(1, 11, RandomValue), 
    (RandomValue >= 5), 
    !, 
    start.

play :- computer_first.

% Computer goes first
computer_first :- 
    clear, 
    random_position(Position), 
    assert(x(Position)), 
    printboard, 
    repeat, 
    getmove, 
    respond.

% Player goes first
start :- 
    clear, 
    repeat, 
    getmove, 
    respond.

% ----------------------------------------------------------------------------
% GAME RESPONSE LOGIC
% ----------------------------------------------------------------------------

% Check if player won
respond :- 
    ordered_line(A, B, C), 
    o(A), o(B), o(C), 
    printboard, 
    write('You won!'), nl.

% Computer makes move and checks game state
respond :- 
    makemove, 
    printboard, 
    done.

% ============================================================================
% USAGE INSTRUCTIONS
% ============================================================================
% To start the game, query: ?- play.
% Enter moves as numbers 1-9 corresponding to board positions.
% ============================================================================
