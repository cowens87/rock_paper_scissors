class Librarian {
  constructor(name, library = {}) {
    this.name = name;
    this.library = library;
  };
  
  greetPatron(patronName, morning = false) {
    if(morning === true ) {
      return `Good morning, ${patronName}!`
    }
    return `Hello, ${patronName}!`
  };

  findBook(bookTitle) {
    var nestedBooks = Object.values(this.library.shelves);
    for (var i = 0; i < nestedBooks.length; i++) {
      for (var j = 0; j < nestedBooks[i].length; j++) {
        if (nestedBooks[i][j].title === bookTitle) {
          nestedBooks[i].splice(j, 1);
          return `Yes, we have ${bookTitle}`
        }
      }
    }
    return `Sorry, we do not have ${bookTitle}`
  };

  calculateLateFee(daysLate) {
    return Math.ceil(daysLate * 0.25);
  }
}


module.exports = Librarian;