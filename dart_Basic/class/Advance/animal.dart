class Animal {//super class

  final int age;

  Animal({required this.age});
  void sleep() => print('Sleeping...');
  void eat() => print('Eating...');
  void move() => print('Moving...');
}

class Dog extends Animal {//sub class
  Dog({required int age}):super(age:age);//เป็นการยืม attributes จาก super class ถ้าหากมีการ extends ต้องทำการ super constructor class มาด้วย
  void bark() => print('Woof! Woof!');
  @override//เพื่อทำการ override method sleep() ของ super class
  void sleep(){
    super.sleep();//เรียกใช้ method sleep() ของ super class
    print('Dog is sleeping...');
  }
}

class Cow extends Animal{
  Cow({required int age}):super(age:age);
  void moo() => print('Moo! Moo!');
}

class CleverDog extends Dog{
  CleverDog({required int age}):super(age:age);
  void fetch() => print('Fetching the ball...');
}

void main(List<String> args) {
  final animal = Animal(age: 5);
  animal.sleep();

  final dog = Dog(age: 3);
  dog.bark();
  dog.eat();//เรียกใช้ของ Class Animal
  dog.sleep();//เรียกใช้ของ Class Dog ที่มีการ override method sleep() ของ Class Animal

  // final cow = Cow(age: 4);
  // cow.moo();
  // cow.move();//เรียกใช้ของ Class Animal
  // cow.sleep();//เรียกใช้ของ Class Animal

  // final cleverDog = CleverDog(age: 2);
  // cleverDog.bark();//เรียกใช้ของ Class Dog
  // cleverDog.fetch();

}

/** Inheritance
 *  เป็นลักษณะการสืบทอดคุณสมบัติและพฤติกรรมจากคลาสแม่ (superclass) ไปยังคลาสลูก (subclass)
 *  โดย Class ลูกจะสามารถใช้ attributes และ method ของ Class แม่ได้
 *
 *  super constructor
 *  เป็นการเรียกใช้ constructor ของ super class ใน subclass โดยต้องใช้ super() เพื่อเรียกใช้ constructor ของ super class
 *  ในกรณีที่ super class มี constructor ที่ต้องการ parameter โดยจะใช้ super() เพื่อส่งค่า parameter ไปยัง constructor ของ super class
 *  ตัวอย่างเช่น
 *  Dog({required int age}):super(age:age); แปลว่า parameter age จะถูกส่งไปยัง constructor ของ super class Animal
 *  ที่ต้องมีเพราะป้องกันการเข้าถึงตัวแปรที่ไม่ได้รับการกำหนดค่า
 *
 *  method overriding
 *  เป็นการประกาศ method ใน class ลูกที่มีชื่อและพารามิเตอร์เหมือนกับ method ใน class แม่
 *  โดย class ลูกจะสามารถกำหนดพฤติกรรมใหม่ให้กับ method นั้นได้ ถ้าหากลูกยังต้องการ method ของ class แม่อยู่
 *  ในกรณีที่ลูกต้องการเรียกใช้ method ของ class แม่ สามารถใช้ super.methodName() เพื่อเรียกใช้ได้
 *  สามารถใช้ super.methodName() เพื่อเรียกใช้ method ของ class แม่ได้
 *
 *  Abstract Class
 *  เป็นคลาสที่ไม่สามารถสร้างอ็อบเจ็กต์ได้โดยตรง แต่สามารถสืบทอดไปยังคลาสลูกได้
 *  โดยจะต้องมีการประกาศ abstract method ที่ไม่มีการกำหนดพฤติกรรมในคลาสแม่
 *  และคลาสลูกจะต้องทำการ override abstract method นั้นเพื่อกำหนดพฤติกรรม
 *
 *  Interfaces implementation and extends
 *  การ implement และ extends interfaces มีข้อแตกต่างกันตรงที่
 *  implement จะเป้นการสร้าง abstract class ใหม่ที่มีการกำหนดพฤติกรรมของ method ใน interfaces นั้นๆ สามารถเรียกใช้ได้หลาย class พร้อมกัน
 *  เหมือนเป็นการเรียกใช้ method ที่สร้างไว้ (ในกรณีที่มีการ implement method ใน class ที่ implement interfaces นั้นจะต้องทำการ override)
 *  ส่วน extends จะเป็นการสืบทอดคุณสมบัติและพฤติกรรมจาก interfaces แม่ไปยัง interfaces ลูก
 *  ซึ่งจะสามารถเข้าถึงและเรียกใช้ของแม่ได้ แต่จะสามารถสืบทอด Class แม่ได้เพียงหนึ่งเดียวเท่านั้น
 *
 * Object Class
 * Object คือ รากของลำดับชั้นคลาส ใน Dart: ถ้าคุณไม่ extends อะไรเลย คลาสของคุณจะ extends Object โดยปริยาย
 *
 * toString() Method
 * เป็น method ที่ใช้ในการแสดงผลข้อมูลของอ็อบเจ็กต์ในรูปแบบสตริง เพื่อแทนการเรียกผ่าน object ตรงๆ
 * 
 *  ==
 *  เนื่องจาก dart ไม่สามารถเปรียบเทียบ object ได้โดนตรงดังนั้นจึงจำเป็นต้องใช้ == operator ที่ทำการ override method ของ class นั้นๆ
 *  เพื่อทำการเปรียบเทียบค่าใน object แทน
 *
 * Equatable
 *  เป็น package ที่ช่วยในการเปรียบเทียบ object โดยไม่ต้อง override == และ hashCode เอง
 *  มี Stringify   แทนการทำงานของ toString()
 *  เพียงแค่ทำการ extends Equatable และ implement props() เท่านั้น
 *
 * Composition
 *  เป็นแนวทางการออกแบบที่เน้นการสร้างคลาสใหม่โดยการรวมคลาสที่มีอยู่แล้วเข้าด้วยกัน
 *  แทนที่จะใช้การสืบทอด (inheritance) ซึ่งอาจทำให้เกิดความซับซ้อน
 *  Composition ช่วยให้สามารถสร้างอ็อบเจ็กต์ที่มีพฤติกรรมใหม่ได้โดยการรวมพฤติกรรมจากหลายๆ คลาส
 * ความสัมพันธ์แบบ Has-A
 * 
 * factory constructors
 * คือ constructor ที่ถูกกำหนดให้เป็น factory ซึ่งสามารถคืนค่าเป็น instance ของ class ที่ต้องการได้
 * instance คือ อ็อบเจ็กต์ที่ถูกสร้างจาก class นั้นๆไม่ผ่าน this
 *
 *  CopyObject
 * เป็น method ที่ใช้ในการสร้างสำเนาของอ็อบเจ็กต์ โดยไม่ทำให้เกิดการเปลี่ยนแปลงในอ็อบเจ็กต์ต้นฉบับ ใช้เพื่ออัพเดทค่าทางอ้อม
 * ผ่านสำเนา แบบ immutable
 *
 * cascade operator
 * เป็น operator ที่ช่วยให้สามารถเรียกใช้ method หรือ property ของอ็อบเจ็กต์หลายๆ ตัวได้ในบรรทัดเดียว
 * โดยไม่ต้องทำการสร้างตัวแปรชั่วคราว
 * ตัวอย่างเช่น
 * animal..eat()..sleep();
 */