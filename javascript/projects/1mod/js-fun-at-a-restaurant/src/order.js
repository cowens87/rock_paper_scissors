function takeOrder(order, orders) {
  if(orders.length < 3) {
    return orders.push(order);
  }
}

function refundOrder(orderNum, orders) {
  var index = orders.findIndex(order => order.orderNumber === orderNum);
  return orders.splice(index, 1);
}

function listItems(orders) {
  return orders.map(order => order.item).join(', ');
}

function searchOrder(orders, itemName) {
  if(orders.find(order => order.item === itemName)) {
    return true;
  }
  return false;
}

module.exports = {
  takeOrder,
  refundOrder,
  listItems,
  searchOrder
}