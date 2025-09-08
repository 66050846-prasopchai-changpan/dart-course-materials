class Person {
  final String name;
  final int age;
  final double height;

  Person({required this.name, this.age = 0, this.height = 0});
void printDescription(){
  print('Name: ${name}');
  print('Age: ${age}');
  print('Height: ${height}');
}
}

void main(List<String> args) {
  final person = Person(name: 'Netty', age: 21, height: 160);
  person.printDescription();

  // person.name = 'New Name'; // This will cause an error ห้ามเขียนทับต้องผ่าน constructor
  
}