# Minesweeper callenge

So far, goals achieved

* Ability to support multiple users/accounts
* Ability to select the game parameters: number of rows, columns, and mines
* Ability to start a new game and preserve/resume the old ones
* Persistence
* Detect when game is over
* Ability to 'flag' a cell with a red flag

To do

* Implement an API client library for the API designed above. Ideally, in a different language, of your preference, to the one used for the API
* When a cell with no adjacent mines is revealed, all adjacent squares will be revealed (and repeat)
* Ability to 'flag' a cell with a question mark
* Time tracking

Some comments about Backend design:
So far, just created an entity to persist games, each game has a board. The board was stored as a 2d array. There are 3 arrays to persist decisions done by a gamer.

On array to store the game initialized with all the mines, another array with revealed cells, and another to store flags while gaming.

Gamer cannot see the board with mines placed if the game is not game_over, so it can be resumed.

