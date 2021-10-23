Function.prototype.myBind = function (ctx) {
  return () => this.apply(ctx);
}

// no arrow function
Function.prototype.myBind = function (ctx) {
  let that = this;
  return function () {
    return that.apply(ctx);
  }
}

//call args only
Function.prototype.myBind = function (ctx) {
  let that = this;
  return function (...callArgs) {
    return that.apply(ctx, callArgs);
  }
}

//call args AND bind args
Function.prototype.myBind = function (ctx) {
  let bindArgs = Array.from(arguments).slice(1);
  let that = this;
  return function (...callArgs) {
    let allArgs = callArgs.concat(bindArgs);
    return that.apply(ctx, allArgs);
  }
}