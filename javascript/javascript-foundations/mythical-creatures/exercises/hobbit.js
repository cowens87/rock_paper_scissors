class Hobbit {
  constructor(deets) {
    this.name = deets.name;
    this.age  = 0;
    this.adult = false;
    this.old = false;
  }

  celebrateBirthday() {
    this.age += 1
  }

  timeTravel(age, hobbit) {
    hobbit.age = age
    if (age > 100) {
      this.old = true;
    } else if (age > 32) {
      this.adult = true;
    }
  }
}

module.exports = Hobbit;