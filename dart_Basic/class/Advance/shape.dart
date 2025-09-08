import 'dart:math';

abstract class Shape {
  double get area;
  const Shape();

  factory Shape.fromJson(Map<String, Object?> json) {
    final type = json['type'] as String?;
    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is num) {
          return Square(side.toDouble());
        } else {
          throw UnsupportedError('side must be a number');
        }
      case 'circle':
        final radius = json['radius'];
        if (radius is num) {
          return Circle(radius.toDouble());
        } else {
          throw UnsupportedError('radius must be a number');
        }
      default:
        throw UnsupportedError('shape $type is not supported');
    }
  }
}

class Square extends Shape {
  final double side;
  Square(this.side);

  @override
  double get area => side * side;
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

void main(List<String> args) {
  // final Shape square = Square(5); //เป็นการส่งค่าจาก subclass ไปยัง parent class
  // final Shape circle = Circle(3);

  // final list = [
  //   Square(2),
  //   Circle(3)
  // ];

  // printArea(square);
  // printArea(circle);
  // list.forEach(printArea);

  final shapeJson = [
    {'type': 'square', 'side': 5},   // int ก็ได้
    {'type': 'circle', 'radius': 3}  // int ก็ได้
  ];

  final shapes = shapeJson.map((shapeJson) => Shape.fromJson(shapeJson));
  shapes.forEach(printArea);
}