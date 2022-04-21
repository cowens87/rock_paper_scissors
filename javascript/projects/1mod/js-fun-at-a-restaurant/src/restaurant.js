function createRestaurant(name) {
  var info = { name: name, menus: { breakfast: [], lunch: [], dinner: [] } };
  return info;
}

function addMenuItem(restaurant, item) {
  if(!restaurant.menus[item.type].includes(item)) {
    return restaurant.menus[item.type].push(item);
  }
}

function removeMenuItem(restaurant, name, type) {
  if(restaurant.menus[type].map(item => item.name).includes(name)) {
    restaurant.menus[type].splice(restaurant.menus[type].findIndex(i => i.name === name), 1);
    return `No one is eating our ${name} - it has been removed from the ${type} menu!`;
  };
  return `Sorry, we don't sell ${name}, try adding a new recipe!`;
}

module.exports = {
  createRestaurant, 
  addMenuItem,
  removeMenuItem
}