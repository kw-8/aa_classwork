// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30

function curriedSum(num) {
  const numbers = [];

    return function _curriedNum(newNum) {
      if (numbers.length < num - 1) {
        numbers.push(newNum);
        console.log(" Updated sum: " + numbers);
        return _curriedNum;
      } else {
        numbers.push(newNum);
        return "Total sum: " + numbers.reduce((a, b) => a + b, 0);
      }
  } 
}
