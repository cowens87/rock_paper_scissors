// ~~~~~~~~~~~~~~~~~ global variables ~~~~~~~~~~~~~~~~~~~~~~~~

var savedCovers = [
  new Cover("http://3.bp.blogspot.com/-iE4p9grvfpQ/VSfZT0vH2UI/AAAAAAAANq8/wwQZssi-V5g/s1600/Do%2BNot%2BForsake%2BMe%2B-%2BImage.jpg", "Sunsets and Sorrows", "sunsets", "sorrows")
];
var currentCover;

// ~~~~~~~~~~~~~~~~~ event listeners ~~~~~~~~~~~~~~~~~~~~~~~~

window.addEventListener("click", clickHandler);
window.addEventListener("load", displayRandomCover);
window.addEventListener("dblclick", deleteCover);

// ~~~~~~~~~~~~~~~~~ functions ~~~~~~~~~~~~~~~~~~~~~~~~

function clickHandler(event) {
  if (event.target.className === "make-new-button") {
    viewMakeYourOwnCoverPage();
  } else if (event.target.className === "view-saved-button") {
    showSavedCovers();
  } else if (event.target.className === "home-button") {
    viewHomePage();
  } else if (event.target.className === "random-cover-button") {
    displayRandomCover();
  } else if (event.target.className === "create-new-book-button") {
    returnNewBook(event);
  } else if (event.target.className === "save-cover-button") {
    saveCover(event);
  }
}

function displayNewCover(cover, title, descriptor1, descriptor2) {
  var coverImage = document.querySelector(".cover-image");
  var coverTitle = document.querySelector(".cover-title");
  var coverDescriptor1 = document.querySelector(".tagline-1");
  var coverDescriptor2 = document.querySelector(".tagline-2");
  coverImage.src = cover;
  coverTitle.innerText = title;
  coverDescriptor1.innerText = descriptor1;
  coverDescriptor2.innerText = descriptor2;
}

function displayRandomCover() {
  generateRandomCover();
  displayNewCover(currentCover.cover, currentCover.title, currentCover.tagline1, currentCover.tagline2)
}

function generateRandomCover() {
    currentCover = new Cover(
    covers[getRandomIndex(covers)],
    titles[getRandomIndex(titles)],
    descriptors[getRandomIndex(descriptors)],
    descriptors[getRandomIndex(descriptors)])
}

function getRandomIndex(array) {
  return Math.floor(Math.random() * array.length);
}

function addHidden(className) {
  document.querySelector(className).classList.add("hidden");
}

function removeHidden(className) {
  document.querySelector(className).classList.remove("hidden");
}

function viewMakeYourOwnCoverPage(){
  addHidden(".home-view");
  addHidden(".saved-view");
  addHidden(".random-cover-button");
  addHidden(".save-cover-button");
  removeHidden(".create-new-book-button");
  removeHidden(".view-saved-button")
  removeHidden(".home-button");
  removeHidden(".form-view");
}

function viewSavedCoversPage() {
  addHidden(".home-view");
  addHidden(".form-view");
  addHidden(".random-cover-button");
  addHidden(".save-cover-button");
  addHidden(".create-new-book-button");
  removeHidden(".view-saved-button");
  removeHidden(".home-button");
  removeHidden(".saved-view");
}

function viewHomePage() {
  addHidden(".form-view");
  addHidden(".saved-view");
  addHidden(".home-button");
  addHidden(".create-new-book-button");
  removeHidden(".home-view");
  removeHidden(".random-cover-button");
  removeHidden(".save-cover-button");
}

function returnNewBook(event) {
  event.preventDefault();
  var coverInput = document.querySelector(".user-cover").value;
  var titleInput = document.querySelector(".user-title").value;
  var descriptor1Input = document.querySelector(".user-desc1").value;
  var descriptor2Input = document.querySelector(".user-desc2").value;
  storeInputsInArrays(coverInput, titleInput, descriptor1Input, descriptor2Input);
  createNewCover(coverInput, titleInput, descriptor1Input, descriptor2Input);
  displayNewCover(coverInput, titleInput, descriptor1Input, descriptor2Input);
  viewHomePage();
}

function storeInputsInArrays(coverInput, titleInput, descriptor1Input, descriptor2Input) {
  covers.push(coverInput);
  titles.push(titleInput);
  descriptors.push(descriptor1Input, descriptor2Input);
}

function createNewCover(coverInput, titleInput, descriptor1Input, descriptor2Input) {
  currentCover = new Cover(coverInput, titleInput, descriptor1Input, descriptor2Input)
}

function saveCover() {
  if (!savedCovers.includes(currentCover)) {
    savedCovers.push(currentCover);
  }
}

function showSavedCovers() {
  viewSavedCoversPage();
  var savedCoversSection = document.querySelector(".saved-covers-section");
  savedCoversSection.innerHTML = '';
  for (var i = 0; i < savedCovers.length; i++) {
    savedCoversSection.innerHTML += `
    <article class="mini-cover" id=${savedCovers[i].id}>
      <img class="cover-image" src=${savedCovers[i].cover}>
      <h2 class="cover-title">${savedCovers[i].title}</h2>
      <h3 class="tagline">A tale of <span class="tagline-1">${savedCovers[i].tagline1}</span> and <span class="tagline-2">${savedCovers[i].tagline2}</span></h3>
    </article>
    `
  }
}

function deleteCover(event) {
  if (event.target.closest("article")){
    var parentID = event.target.closest("article").id;
    for (var i = 0; i < savedCovers.length; i++) {
      if (savedCovers[i].id === +parentID) {
        savedCovers.splice([i], 1);
      }
    }
    showSavedCovers();
  }
}