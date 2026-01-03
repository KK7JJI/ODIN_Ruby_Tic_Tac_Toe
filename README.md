# ODIN_Ruby_Tic_Tac_Toe
TOP Ruby Project: Tic Tac Toe

# ODIN_Ruby_Tic_Tac_Toe
## TOP Ruby Project: Tic Tac Toe

### Setup notes:
First clone this repository.
To run the application navigate to the /bin directory of the project and make
the run.sh script found there executible:

```chmod +x run.sh```

Once this file is executible the game is initiated by:

```./run.sh [args]```

(@Windows users, sorry, no help is offered.  run.sh is a bash script which
should run on most linux and macos systems.)

### Instructions
From the /bin directory in the project. \

```./run.sh [args]```\

valid args include:

```--manual_setup  - game presents options for player names, preferred tokens, and number of matches to be played.```

``` -n              - n = number of matches to be played.  Setup defaults to 1 human and 1 computer player, player 1 and player 2 respectively.```

If no argument is given manual game setup is assumed.

Manual setup example:

```
user:a542 Fri Jan 02 19:43:28 $ ./run.sh
File: tic_tac_toe.rb, Running method: run
---------------------------------------------
Player Setup:
 Enter a name for each human player
 Leave the name field blank for computer players

 Player token names will default to X and O
 unless a alternative value is entered.
 Tokens may only be 1 character in length.

 A match may consist of 1 to N
 individual tic tac toe games
 enter a number to set the match.
---------------------------------------------

How many matches should we play (number)?: 2
Player 1 Name (enter = computer):Paul
Paul token name (enter = X:)

Player 2 Name (enter = computer):
Player 2 token name (enter = O:)


------------------------------
Starting New Game, Tic Tac Toe
------------------------------
Paul vs. Computer
```

The game consists of `matches` and `sets`.  A `match` is a single round of tic
tac toe which will end either with a winning player or a draw if all available
positions are filled without a winner being decided.  Winning a `match` requires
three player tokens in a row on the horizontal, the vertical, or the diagonal.
To win a `set` the player must win a majority of `matches` played.  In the event
that players win an equal number of `matches` in a `set` a tie is declared and
the game ends.

Players select positions during a match by entering an integer number from
0 - 8 where 0 represents the upper left corner and 8 represents the lower right
corner.  Numbering proceeds left to right and top to bottom.  The board is
layed out as:
```
┌─┬─┬─┐
│0│1│2│
├─┼─┼─┤
│3│4│5│
├─┼─┼─┤
│6│7│8│
└─┴─┴─┘
```


A Sample round of play in a match looks like:

```
=====================================
BEGIN MATCH: 1
=====================================

┌─┬─┬─┐
│ │ │ │
├─┼─┼─┤
│ │ │ │
├─┼─┼─┤
│ │ │ │
└─┴─┴─┘

Round 1

Tic Tac Toe board positions:
Select one: (0-8)
┌─┬─┬─┐
│0│1│2│
├─┼─┼─┤
│3│4│5│
├─┼─┼─┤
│6│7│8│
└─┴─┴─┘
┌─┬─┬─┐
│ │ │ │
├─┼─┼─┤
│ │ │ │
├─┼─┼─┤
│ │ │ │
└─┴─┴─┘

Paul: 4
┌─┬─┬─┐
│ │ │ │
├─┼─┼─┤
│ │X│ │
├─┼─┼─┤
│ │ │ │
└─┴─┴─┘
```

By default player 1 is 'X' and player 2 is 'O'.  Alternatives can be selected
for fun.  If an alternative is entered the application will use the upper case
version of the first character of the input string.  i.e. `paul` will
became `P`.

### NOTES:
I think this game as designed could have been much simpler, however it was an
educational exercise and so I tried to employ concepts developed through the TOP
ruby course.  Originally the project was intended to employ an object oriented
design while adhering to Sandy Metz's basic rules:

-Class should be no more than 100 lines\
-One class per file\
-Methods should be no more than 5 lines\
-Pass no more than 4 parameters

I failed on the 5 line methods opting instead to follow Rubocode's guidance on
splitting up / refactoring methods.  Honestly, I think a strict adherance to
5 lines really fragments things.  The spirit of keeping methods small did push
me into some options like creating handles and heredoc constants to move some
code out of a method and perhaps making it "easier" to read.  I did quite a
bit of experimenting with service classes, and included mixins to try and sort
out code as well while controlling line counts.

Anyway the tic tac toe model I settled on is based on a `game`; the `game`
has `players`; the `game` has `matches`; each `match` has a `board`; each
`board` has `positions`; each `position` can accept a `player token` typically
named "X" or "O".  A player can place a token, play a set (of matches), play a
match, etc.  I ended up with 23 files

I did **not** delve deeply into error trapping in this exercise.  I did enforce
valid user inputs when selecting a position in which to place a token (0-8),
however it is certainly possible to end the program unexpectely followed by the
normal stack trace.
