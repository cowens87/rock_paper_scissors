class Hobbit {
  constructor(deets) {
    this.name = deets.name;
    this.age  = 0;
    this.adult = false;
    this.old = false;
    this.hasRing = false;
  }

  celebrateBirthday() {
    this.age += 1
  }

  timeTravel(age, hobbit) {
    hobbit.age = age;
    if(age > 32) {
      return hobbit.adult = true;
    }
  }

  getRing() { 
    if(this.name === 'Frodo') {
      this.hasRing = true;
      return 'Here is the ring!'
    }
    return 'You can\'t have it!'
  }
}

module.exports = Hobbit;