/*
until one of the stacks has all of the rings
*/
function Game() {
  this.stacks = [[1,2,3,4], [], []];
}

Game.prototype.play = function () {
  while (!this.win()) {
    this.promptMove();
  }
}

Game.prototype.promptMove = function () {
  this.stacks.forEach(stack => document.write(`${stack}\n`));
  document.write("-----");
  var startIndex = prompt("From stack number: ");
  var endIndex = prompt("To stack number: ");
  this.move(startIndex, endIndex);
}

Game.prototype.validStack = function (index) {
  if (index < 1 || index > 3) {
    return false;
  } else {
    return true;
  }
}

Game.prototype.move = function (start, end) {
  if (!this.validStack(start) || !this.validStack(end)) {
    return;
  }
  --start;
  --end;
  if (this.stacks[end] && this.stacks[end][0] < this.stacks[start][0]) {
    return;
  }
  this.stacks[end].unshift(this.stacks[start].shift());
}

Game.prototype.win = function () {
  if (this.stacks[this.stacks.length - 1].length === 4) {
    return true;
  } else {
    return false;
  }
} 

let ourGame = new Game();
ourGame.play();
// ourGame.move(1,2);
// console.log(ourGame.stacks);
// ourGame.move(1,3);
// console.log(ourGame.stacks);
// ourGame.move(2,3);
// console.log(ourGame.stacks);
// ourGame.move(1,2);
// console.log(ourGame.stacks);
// console.log(ourGame.win());
// ourGame.move(3,1);
// console.log(ourGame.stacks);
// ourGame.move(3,2);
// console.log(ourGame.stacks);
// ourGame.move(1,2);
// console.log(ourGame.stacks);
// ourGame.move(1,3);
// console.log(ourGame.stacks);
// ourGame.move(2,3);
// console.log(ourGame.stacks);
// ourGame.move(2,1);
// console.log(ourGame.stacks);
// ourGame.move(3,1);
// console.log(ourGame.stacks);
// ourGame.move(2,3);
// console.log(ourGame.stacks);
// ourGame.move(1,2);
// console.log(ourGame.stacks);
// ourGame.move(1,3);
// console.log(ourGame.stacks);
// ourGame.move(2,3);
// console.log(ourGame.stacks);
// console.log(ourGame.win());