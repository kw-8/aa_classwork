Array.prototype.uniq = function () {

  let new_arr = []
  
  for (i=0; i < this.length; i++) {
    if (!(new_arr.includes(this[i]))) {
      new_arr.push(this[i])
    }
  }
  return new_arr
}