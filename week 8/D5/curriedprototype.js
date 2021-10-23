Function.prototype.curry = function (numArgs) {
  const arr = [];
  let func = this;

  return function _curry(arg) {
    arr.push(arg);
    console.log(arr);
    if (arr.length < numArgs) {
      return _curry;
    } else {
      console.log(arr);
      func(...arr);
    }
  };
}


// Function.prototype.curry = function (numArgs) {
//   const arr = [];
//   let func = this;

//   return function _curry(arg){
//     if (arr.length < numArgs) {
//       arr.push(arg);
//       console.log(arr);
//       if (arr.length == numArgs) {
//         console.log("last one");
//         return arr; //func(...arr);
//       }
//       else {
//         return _curry;
//       } 
//     }
//   };
// }

// addThree.curry(3) -->  1 2 3 -> addThree(args= 1 2 3)
function addThree(n1, n2, n3) {
  console.log(n1 + n2 + n3);
}


Function.prototype.currySolution = function (numArgs) {
  const args = [];
  const fn = this;

  function _curriedFn(arg) {
    args.push(arg);
    console.log(args)
    if (args.length === numArgs) {
      return fn(...args);
    } else {
      return _curriedFn;
    }
  }

  return _curriedFn;
};