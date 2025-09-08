import 'package:equatable/equatable.dart';
class Point extends Equatable {
  final int x;
  final int y;

  const Point(this.x, this.y);

  // @override
  // String toString() => 'Point($x, $y)';
  // bool operator ==(covariant Point other) { //covariant เป็นเหมือนการตรวจสอบ type ว่าเป็น object เหมือนกันไหมก่อนจะเทียบ
  //   return x == other.x && y == other.y;
  // }

  @override
  bool? get stringify => true; //ทำให้ toString() ทำงาน
  
  @override
  List<Object?> get props => [x, y]; //ทำการ return ค่า x และ y
}

void main(List<String> args) {
  const list = [Point(1, 2), Point(3, 4), Point(5, 6)];
  print(list);//กรณียังไม่ได้ override toString() [Instance of 'Point', Instance of 'Point', Instance of 'Point']
  print(Point(1, 2) == Point(1, 2)); //true
}