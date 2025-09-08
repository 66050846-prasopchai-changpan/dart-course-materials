import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;

  void printValue(){
    print('Area : ${area}, Perimeter : ${perimeter}');
  }
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
  double get perimeter => 4 * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
  double get perimeter => 2 * pi * radius;
}

void printValue(Shape shape){
  print(shape.area);
  print(shape.perimeter);
}

void main() {
  final List<Shape> list = [
    Square(2),
    Circle(3)
  ];
  list.forEach((x) => printValue(x));//กรณีที่สร้างผ่าน method ที่รับค่าจาก Class Shape โดยตรง

  list.forEach((shape) => shape.printValue());//รับค่าจาก method ของ Class Shape
}