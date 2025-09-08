void main(List<String> args) {
  List<String> order = ['margherita', 'pepperoni', 'vegetarian'];
  double total = calculateTotalOrder(order);
  print("Total order amount: \$${total}");
}

double calculateTotalOrder(List<String> order){
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  double total = 0;
  for( var o in order){
    if(pizzaPrices.keys.contains(o)){
      total +=  pizzaPrices[o]!;
    }
  }
  return total;
}