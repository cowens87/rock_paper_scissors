class Chef {
  constructor(chefName, restaurant = {}) {
    this.name = chefName;
    this.restaurant = restaurant;
  }

  greetCustomer(name, morning = false) {
    if(morning === true) { return `Good morning, ${name}!`; }
    return `Hello, ${name}!`;
  }

  checkForFood(item) {
    if(this.restaurant.menus[item.type].includes(item)) {
      return `Yes, we're serving ${item.name} today!`
    }
    return `Sorry, we aren't serving ${item.name} today.`;
  }
}

module.exports = Chef;