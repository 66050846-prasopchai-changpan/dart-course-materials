import 'package:equatable/equatable.dart';

class Point extends Equatable {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];//จำเป็นต้องมีถ้าหากต้องการใช้ Equatable


  @override
  bool get stringify => true;

  Point operator +(Point other){
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int factor){
    return Point(x * factor, y * factor);
  }
}

void main() {
  // make this compile by overriding the + operator
  print(Point(1, 1) + Point(2, 0)); // should print: Point(3, 1)
  // make this compile by overriding the * operator
  print(Point(2, 1) * 5); // should print: Point(10, 5)
}