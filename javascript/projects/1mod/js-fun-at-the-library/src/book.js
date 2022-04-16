function createTitle(title) {
  return `The ${title}`
}

function buildMainCharacter(name, age, pronouns) {
  var bookCharacter = {
    name: name,
    age: age,
    pronouns: pronouns
  };
  return bookCharacter;
}

function saveReview(review, reviews) {
  if (!reviews.includes(review)) {
    return reviews.push(review);
  }
}

function calculatePageCount(title) {
  return (title.length * 20)
}

function writeBook(title, mainCharacter, genre) {
  var bookInfo = {
    title: title,
    mainCharacter: mainCharacter,
    genre: genre,
    pageCount: calculatePageCount(title)
  };
  return bookInfo
}

function editBook(book) {
  book.pageCount = (calculatePageCount(book.title) * 0.75)
}

module.exports = {
  createTitle,
  buildMainCharacter,
  saveReview,
  calculatePageCount,
  writeBook,
  editBook
}