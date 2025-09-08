class Person {
  Person({required this.name, required this.age});
  final String name;
  final int age;
  // factory Person.fromJson(Map<String , dynamic> json){
  //   return Person(name: json['name'], age: json['age']);
  // }

  factory Person.fromJson(Map<String , Object> json){
    final name = json['name'];
    final age = json['age'];
    if(name is String && age is int){
      return Person(name: name, age: age);
    }
    throw ArgumentError('Invalid JSON');
  }

  // TODO: Implement toJson
  Map<String , Object> toJson(){
    return{
      'name' : name,
      'age' : age
    };
  }
}

void main() {
  final person = Person.fromJson({
    'name': 'Andrea',
    'age': 36,
  });
  final json = person.toJson();
  print(json);
}