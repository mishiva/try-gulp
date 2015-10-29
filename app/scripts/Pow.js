

class Pow {
  constructor(x = 0, n = 0) {
    this.x = x;
    this.n = n;
    this._resetResult()
  }

  calc(x = this.x, n = this.n) {
    this._resetResult();
    for (var i = 0; i < n; i++) {
      this.result *= x;
    };
    return this.result;
  }

  log() {
    console.log(`Result=${this.result}, x=${this.x}, n=${this.n}`);
  }

  _resetResult() {
    this.result = 1;
  }
}

export {Pow};
