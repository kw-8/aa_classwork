// arguments keyword
function sum(arguments) {
    // let nums = [...arguments];
    let nums = Array.from(arguments);
    console.log(nums)
    let sum = 0;
    nums.forEach((el) => sum += el, sum) 
    
    console.log(sum);
  } 

// sum(1, 2, 3, 4) // === 10;
// sum(1, 2, 3, 4, 5) // === 15;



// ... rest operator
function sum2(...nums) {

  let sum = 0;
  nums.forEach((el) => sum += el, sum)

  console.log(sum);
}

// sum2(1, 2, 3, 4) // === 10;
// sum2(1, 2, 3, 4, 5) // === 15;

