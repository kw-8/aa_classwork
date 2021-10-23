class Clock {
  constructor() {
    let d = new Date()
    d = d[Symbol.toPrimitive]('string');
    this.hour = d.slice(16,18);
    this.minute = d.slice(19,21);
    this.second = d.slice(22,24);

    this.printTime();

    // save this (context)
    let that = this;

    // all callbacks (between {}) have global context
    let callback = function () {
      that._tick();
      that.printTime();
    }
    setInterval(callback, 1000);

    // // alternative method: defining function in an argument
    // setInterval(function () {
    //   that._tick();
    //   that.printTime();
    // }, 1000);
    
  }

  printTime() {
    console.log(`${this.hour}:${this.minute}:${this.second}`);
  }

  _tick() {
    this.second++;
    if (this.second === 60) {
      this.second = 0;
      this.minute++;
    }
    if (this.minute === 60) {
      this.minute = 0;
      this.hour++;
    }
    if (this.hour === 24) {
      this.hour = 0;
    }

  }
}

////////////// reader adds numbers
const readLine = require("readline");
const reader = readLine.createInterface({
  input: process.stdin,
  output: process.stdout
});
function addNumbers(sum, numsLeft, completionCallback) {
  let getNums = (numStrings) => {
    sum += parseInt(numStrings);
    console.log(sum);
    addNumbers(sum, numsLeft - 1, completionCallback);
  };

  if (numsLeft > 0) {
    reader.question("Give me a number: ", getNums);
  } else {
    completionCallback(sum);
    reader.close();
  }
}
  


// bubble sort with user input
function absurdBubbleSort(arr, sortCompletionCallback) {
  let outerBubbleSortLoop = function(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

// don't need to declare reader again
function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2} ? `, (answer) => {
    if (answer === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

//
function innerBubbleSortLoop (arr, i, madeAnySwaps, outerBubbleSortLoop) {
  
  if (i < arr.length-1) { // make swaps if VVV
    askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
  if (i === arr.length-1) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}


// Function Calling
Function.prototype.myBind = function (context) {
  return () => {
    Function.prototype.apply(this, [context])
  }
}


// myThrottle 
Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;
  
  return () => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout(() => tooSoon = false, interval);
      this();
    }
  }
}


// myDebounce
Function.prototype.myDebounce = function (interval) {
  let timeout = interval;

  return () => {
    if (this) {
      // timeout = interval;
      setTimeout(() => timeout = interval, interval);
      this();
    }
  }
}



class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}
  
  const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};
searchBar.search = searchBar.search.myDebounce(500);

queryForHelloWorld();



// let c = new Clock();
// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// askIfGreaterThan(5, 2, console.log);

// innerBubbleSortLoop([1,3,2], 1, false, () => {console.log('inside outer loop')});
// absurdBubbleSort([3, 2, 1], function(arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }

// const turnOn = function() {
//   console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

// class Neuron {
//   fire() {
//     console.log("Firing!");
//   }
// }

// const neuron = new Neuron();
// // When we create a new Neuron,
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

// // You can use clearInterval to stop the firing:
// // clearInterval(interval);

// // Using Function#myThrottle, we should be able to throttle
// // the #fire function of our neuron so that it can only fire
// // once every 500ms:

// neuron.fire = neuron.fire.myThrottle(500);

// // const interval = setInterval(() => {
// //   neuron.fire();
// // }, 10);

// // // This time, if our Function#myThrottle worked correctly,
// // // the Neuron#fire function should only be able to execute
// // // every 500ms, even though we're still trying to invoke it
// // // every 10ms!

// // // If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// // class Neuron {
// //   constructor() {
// //     this.fire = this.fire.myThrottle(500);
// //   }

// //   fire() {
// //     console.log("Firing!");
// //   }
// // }
