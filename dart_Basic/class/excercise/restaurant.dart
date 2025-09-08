class Restaurant {
  const Restaurant({required this.name,
    required this.cuisine,
    required this.ratings,});
  final String name;
  final String cuisine;
  final List<double> ratings;

  int get numRate => ratings.length;
  double? average(){
    if(ratings.isEmpty){
      return null;
    }
    return ratings.reduce((value , element) => value + element) / numRate;
  }

  double get avg => ratings.isEmpty ? -1 : ratings.reduce((value , element) => value + element) / numRate;
}

void main(List<String> args) {
  const restaurant = Restaurant(
    name: 'The Great Restaurant',
    cuisine: 'Italian',
    ratings: [4.5, 5.0, 4.0],
  );

  print('Restaurant Name: ${restaurant.name}');
  print('Cuisine: ${restaurant.cuisine}');
  print('Total Ratings: ${restaurant.numRate}');
  print('Average Rating: ${restaurant.average()}');
  print('AVG : ${restaurant.avg}');
}
