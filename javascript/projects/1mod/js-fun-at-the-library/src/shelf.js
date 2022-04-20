function shelfBook(book, shelf) {
  if (shelf.length < 3) { 
    shelf.unshift(book);
  }
}

function unshelfBook(title, shelf) { 
  for (var i = 0; i < shelf.length; i++) {
  if (shelf[i].title === title) {
      shelf.splice(i,1);
    }
  }  
}

function listTitles(shelf) {
  var listOfTitles = [];
  for (var i = 0; i < shelf.length; i++) {
    listOfTitles.push(shelf[i].title);
  }
  console.log(listOfTitles.join(', '));
  return listOfTitles.join(', ');
}

function searchShelf(shelf, title) {
  for(var i = 0; i < shelf.length; i++) {
    if(title === shelf[i].title) {
      return true
    }
  }
  return false
}


module.exports = {
  shelfBook,
  unshelfBook,
  listTitles,
  searchShelf
};