class Snack {
  constructor(type) {
    this.type           = type;
    this.amount         = 100;
    this.isInLunchBox   = false;
    this.cuttingItClose = false;
  }

  deliciousLevel() {
    return 'extra';
  }

  getEaten() {
    this.amount -= 10
    if (this.amount <= (100*0.2)) {
      this.cuttingItClose = true;
    }
  }

  checkForHealthy() {
    if (this.type.toLowerCase().includes('fruit')) {
      return true; 
    } else {
      return false;
    }
  }

}

module.exports = Snack;
