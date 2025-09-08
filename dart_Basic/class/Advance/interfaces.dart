abstract class InterfacesA {
  void methodA();
}

abstract class InterfacesB {
  void methodB();
}

class MyClass implements InterfacesA , InterfacesB {// ทำการ implement method ของ interface ทั้งสอง

  @override
  void methodA() {
    // TODO: implement methodA
  }

  @override
  void methodB() {
    // TODO: implement methodB
  }

}

abstract class Base{
  void foo();//abstract method
  void bar() => print("bar");//non-abstract method
}
class Derived implements Base{
  @override
  void foo() {}

  @override//ต้องทำการ override เพราะใน Base มีการ implement method bar ทำให้ไม่สามารถเรียกใช้ได้
  void bar() {
  }
}
