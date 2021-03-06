// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let newGrid = [];
  for (i = 0; i < 8; i++) {
    newGrid.push(new Array(8));
  }
  newGrid[3][4] = new Piece("black");
  newGrid[4][3] = new Piece("black");
  newGrid[3][3] = new Piece("white");
  newGrid[4][4] = new Piece("white");
  return newGrid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let valid = true;
  pos.forEach(el => {if (el < 0 || el > 7) valid = false;});
    return valid;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  // debugger;
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error("Not valid pos!");
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.grid[pos[0]][pos[1]] == null) {
    return false
  }
  else if (this.grid[pos[0]][pos[1]].color === color) {
    return true;
  }
  else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.grid[pos[0]][pos[1]] == null) {
    return false
  }
  else return true;
  
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  // debugger;
  let i = dir[0];
  let j = dir[1];
  let newPos = [pos[0] + i, pos[1] + j]
  if (!this.isValidPos(newPos)) return [];
  if (!this.isOccupied(newPos)) return [];
  if (this.isMine(newPos, color)) {
    return piecesToFlip;
  } else {
    piecesToFlip.push(newPos);
  }
    return this._positionsToFlip(newPos, color, dir, piecesToFlip);
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos) || !this.isValidPos(pos)) return false;
  let flipped = [];
  Board.DIRS.forEach(dir => {
    flipped = flipped.concat(this._positionsToFlip(pos, color, dir));
  });
  if (flipped.length === 0) {
    return false;
  } else {
    return true;
  }
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid move!");
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);

  let flipped;
  Board.DIRS.forEach(dir => {
    flipped = this._positionsToFlip(pos, color, dir);
    flipped.forEach(pos => {
      this.getPiece(pos).flip();
    });
  });
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let results = [];
  for (i=0; i < 8; i++) {
    for (j=0; j < 8; j++) {
      if (this.validMove([i,j], color)) {
        results.push([i,j]);
      }
    }
  }
  return results;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length === 0) {
    return false;
  } else {
    return true;
  }
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (!this.hasMove("white") && !this.hasMove("black")) {
    return true;
  } else {
    return false;
  }
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE