class LunchBox {
  constructor(deets) {
    this.owner  = deets.owner;
    this.material = deets.madeOf;
    this.shape  = deets.shape;
    this.color  = deets.color;
    this.snacks = [];
    this.healthy_snacks = [];
  }

  acquireSnack(snack) {
    this.snacks.push(snack);
    for (let i = 0; i < this.snacks.length; i++) {
      this.snacks[i].isInLunchBox = true;
    }
  }

  findHealthySnacks() {
    for (let i = 0; i < this.snacks.length; i++) {
      if (this.snacks[i].checkForHealthy()) {
        this.healthy_snacks.push(this.snacks[i].type)
      }
    }
    return this.healthy_snacks
  }
}

module.exports = LunchBox;
