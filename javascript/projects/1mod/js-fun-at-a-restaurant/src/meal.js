function nameMenuItem(foodName) {
  return `Delicious ${foodName}`;
}

function createMenuItem(foodName, price, type) {
  var info = {
    name: foodName,
    price: price,
    type: type
  };
  return info;
}

function addIngredients(item, ingredients) {
  if(!ingredients.includes(item)) {
    return ingredients.push(item);
  }
}

function formatPrice(price) {
  return `$${price}`;
}

function decreasePrice(price) {
  return (price - (price * 0.10));
}

function createRecipe(title, ingredients, type) {
  var info = {
    title: title,
    ingredients: ingredients,
    type: type
  };
  return info;
}


module.exports = {
  nameMenuItem,
  createMenuItem,
  addIngredients,
  formatPrice,
  decreasePrice,
  createRecipe
}


