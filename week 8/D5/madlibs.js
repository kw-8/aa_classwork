class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// aka Mad Libs
Function.prototype.myBind = function() {
  let that = this;
  let context = Array.from(arguments)[0];
  let args = Array.from(arguments).slice(1);

  return function() {
    // innerArgs = Array.from(arguments)
    // totalArgs = args.concat(innerArgs)
    // return that.apply(context, totalArgs);
    return that.call(context, ...args, ...arguments);
  };
}


const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// const pavlovSays = markov.says.myBind(pavlov, "meow");
// pavlovSays("Mike");
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Kelly", "Martin");
// Pavlov says meow to Markov!
// true

// markov.says.myBind(pavlov)("meow", "me");
// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true
