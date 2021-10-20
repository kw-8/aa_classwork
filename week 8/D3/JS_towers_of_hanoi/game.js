/*
until one of the stacks has all of the rings
*/
function Game() {
  this.stacks = [[4,3,2,1], [], []];
}

Game.prototype.promptMove = function (start, end) {
  Document.write("make a move");
}