/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("module.exports = Asteroid;\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst { inherits, scale, randomVec } = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Asteroid(options) {\n  this.pos = options[\"pos\"];\n  //                dir         length from 0 to 10\n  this.vel = randomVec(2);\n  this.radius = 50;\n  this.color = \"grey\";\n}\n\ninherits(Asteroid, MovingObject);\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("module.exports = Game;\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game(options = {}) {\n  this.DIM_X = options['DIM_X'] || 400;\n  this.DIM_Y = options['DIM_Y'] || 400;\n  this.NUM_ASTEROIDS = options['NUM_ASTEROIDS'] || 5;\n  this.asteroids = [];\n  this.addAsteroids();\n}\nGame.prototype.randomPosition = function() {\n  return [Math.random() * this.DIM_X, Math.random() * this.DIM_Y]\n}\n\nGame.prototype.addAsteroids = function() {\n  for (let i=0;i<this.NUM_ASTEROIDS;i++) {\n    this.asteroids.push( new Asteroid({ pos: this.randomPosition(), game: this }))\n  }\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y); //this.DIM_X, this.DIM_Y\n  this.asteroids.forEach((asteroid) => {\n    asteroid.draw(ctx);\n  }\n  );\n}\n\nGame.prototype.moveObjects = function(ctx) {\n  this.asteroids.forEach((asteroid) => {\n    asteroid.pos = this.wrap(asteroid.move());\n    // console.log(asteroid.pos);\n    asteroid.draw(ctx);\n  }\n  );\n}\n\nGame.prototype.wrap = function(pos) {\n  // js modulo doesn't correct negative numbers\n  return [(pos[0] + this.DIM_X) % this.DIM_X,\n          (pos[1] + this.DIM_Y) % this.DIM_Y]; // % this.DIM_Y\n}\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("module.exports = GameView;\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction GameView(ctx) {\n  console.log('In game view object')\n  this.game = new Game();// Game.call()\n  console.log('Created game view object')\n  this.context = ctx;\n}\n\nGameView.prototype.start = function() {\n  setInterval(() => { \n    // debugger\n    this.game.moveObjects(this.context); this.game.draw(this.context)\n  }, 20);\n}\n\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("document.addEventListener(\"DOMContentLoaded\", function () {\n  \n  const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n  const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n  const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n  const Canvas = document.getElementById(\"game-canvas\");\n  const ctx = Canvas.getContext(\"2d\");\n  let circle = new MovingObject({ pos:  [1,2],\n                                  radius: 20,\n                                  color: \"black\"});\n  let asteroid = new Asteroid({ pos: [10,20]});\n  let gv = new GameView(ctx);\n  // console.log()\n  gv.start();\n  // ctx.render();\n  circle.draw(ctx);\n  asteroid.draw(ctx);\n  \n  window.MovingObject = MovingObject;\n  \n  console.log(\"Webpack is working!\");\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("module.exports = MovingObject;\n__webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction MovingObject(options) {\n  this.pos = options[\"pos\"];\n  this.vel = options[\"vel\"];\n  this.radius = options[\"radius\"];\n  this.color = options[\"color\"];\n  this.game = options[\"game\"];\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  // debugger\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,            // start angle radians\n    2 * Math.PI,  // end angle radians\n    false         // counterclockwise?\n  );\n\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n  // debugger\n  return [\n    this.pos[0] + this.vel[0],\n    this.pos[1] + this.vel[1]\n  ];\n}\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function surrogate() {}\n    surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [Math.floor(vec[0] * m), Math.floor(vec[1] * m)];\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;