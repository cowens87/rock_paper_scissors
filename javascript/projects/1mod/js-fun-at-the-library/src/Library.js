function createLibrary(libName) {
  var deets = {
    name: libName,
    shelves: {
      fantasy: [],
      fiction: [], 
      nonFiction: []
    }
  };
  return deets
}

function addBook(library, book) {
  library.shelves[`${book.genre}`].push(book);
}

function checkoutBook(library, title, genre) {
  var books = library.shelves[genre]
  for (var i = 0; i < books.length; i++) {
    if(books[i].title === title) {
      books.splice(i,1);
      return `You have now checked out ${title} from the ${library.name}`;
    }
  };
  return (`Sorry, there are currently no copies of ${title} available at the ${library.name}`);
}

module.exports = {
  createLibrary,
  addBook,
  checkoutBook
};