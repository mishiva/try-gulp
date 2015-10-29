class Pow {
  constructor(x, y) {
    this.x = x;
    this.y = y

  }

  calc(x = this.x, y = this.y) {
    return x * y;
  }

  log() {
    console.log(`${this.x}, ${this.y}`);
  }

  
}

// let pow = new Pow(2, 3);
// pow.log();

// var cc = 'cccc';

// module.exports = Pow;

export {Pow};
