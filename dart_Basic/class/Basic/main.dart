import 'back_account.dart';

const welcome = 'Welcome to Dart';
const signIn = 'Sign in';
/*
class BankAccount {
  double balance = 0; // instance variable
  final String accountHolder;
  /*
  BankAccount(double balance){ // constructor
    this.balance = balance; // this เป็นการอ้างอิงถึง instance variable ภายใน class
  }
  */

  //initializer list
  //BankAccount({required String accountHolder, double balance = 0}) : accountHolder = accountHolder, balance = balance; // constructor ที่ใช้ : เพื่อกำหนดค่าเริ่มต้นให้กับ instance variable Dart จะสามารถเข้าใจได้ว่าเราชี้ไปที่ variable ที่ถูกส่งเข้ามาใน constructor ใน class


  //initializer list shorthand
  BankAccount({required this.accountHolder, this.balance = 0});

  void deposit(double amount) {
    // instance method
    balance += amount;
  }

  bool withdraw(double amount) {
    // instance method
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }
}
*/
class Complex {
  //double real; ถ้าไม่มี final constructor จะไม่สามารถสร้าง instance ได้
  final double imaginary;
  final double real;

  const Complex(this.real, this.imaginary);

  // Named constructor
  Complex.zero() : real = 0, imaginary = 0;
  Complex.pure() : real = 0, imaginary = 0;
  Complex.imaginary(this.imaginary) : real = 0;
  Complex.real(this.real) : imaginary = 0;
}

//ตัวอย่างการใช้งาน Named constructor
class Temperature {
  double celsius;
  Temperature(this.celsius);
  Temperature.celsius(this.celsius); //แบบนี้เข้าใจได้ง่ายกว่า
  Temperature.fahrenheit(double fahrenheit)
    : celsius = (fahrenheit - 32) / 1.8; //Better

  double get fahrenheit =>
      celsius * 1.8 + 32; //เป็นเหมือนการดึงค่ามาใช้คำนวนแล้ว return
  set fahrenheit(double fahrenheit) =>
      celsius = (fahrenheit - 32) / 1.8; // เป็นเหมือนการสร้างตัวแปรเก็บค่า

  /** ตอนเรียก
   * final temp1 = Temperature(25); //เข้าใจได้ยาก
   * final temp2 = Temperature.celsius(25); //แบบนี้เข้าใจได้ง่ายกว่า
   * final temp3 = Temperature.fahrenheit(77); //Better
   */
}

class Strings {
  static const welcome = 'Welcome';
  static const signIn = 'Sign in';
  static String greet(String name) => 'Hi, $name';

  void foo(){
    print(welcome);
  }
}

void main(List<String> args) {
  /*
  final bankaccount = BankAccount(accountHolder: 'John Doe', balance: 0);
  //print(bankaccount.balance);
  bankaccount.balance = 100;
  print(bankaccount.balance);

  final bankAccount2 = BankAccount(accountHolder: 'Jane Doe', balance: 200);
  print(bankAccount2.balance);

  bankaccount.deposit(300);
  print(bankaccount.balance);

  bankaccount.withdraw(50);
  print(bankaccount.balance);

  print("---------Instance Method---------");
  final successz = bankaccount.withdraw(500);
  print('success: $successz balance: ${bankaccount.balance}');
  final success2 = bankaccount.withdraw(200);
  print('success: $success2 balance: ${bankaccount.balance}');

  print("---------Const Constructor---------");
  const complex = Complex(1, 2);
  print('Real: ${complex.real}, Imaginary: ${complex.imaginary}');
  const x = 10;
  const list = [Complex(1, 2), Complex(3, 4), Complex(5, 6)];
  list.forEach(
    (element) =>
        print('Real: ${element.real}, Imaginary: ${element.imaginary}'),
  );
  */

  print("---------Named Constructor---------");
  final temp1 = Temperature.celsius(30);
  final temp2 = Temperature.celsius(25);
  final temp3 = Temperature.fahrenheit(77);
  print(temp1.celsius);
  temp1.celsius = 32;
  print(temp1.fahrenheit);
  temp1.fahrenheit = 100;
  print(temp1.fahrenheit);
  final temp = 30;

  print("---------Static Method---------");
  //ไม่มีการเรียกหรือประกาศ Class
  print(Strings.welcome);
  print(Strings.signIn);
  print(Strings.greet('Netty'));

  final s = Strings();
  s.foo();
  print(welcome);

  //import 'back_account.dart';
  final backAccount = BackAccount(100);
  //backAccount._balance; ไม่สามารถเข้าถึงได้ เพราะมีการกำหนดเป็น privatec แล้ว
  backAccount.deposit(50);
  print(backAccount.balance);
}

/** Class
 *  Class : เป็นพื้นฐานของการเขียนโปรแกรมเชิงวัตถุ (OOP)
 *  เนื้อหาใน Basic
 *  1.create class
 *  2.class constructor(const & named)
 *  3.member variable and method
 *  4.getter and setter
 *  5.static keyword
 *  6.making things private
 *
 *  เนื้อหาใน Advanced
 *  1.class inheritance
 *  2.more advanced topics
 * 
 *  Class : เป็นการรวมกลุ่มของข้อมูล (member variable) และพฤติกรรม (method) ที่เกี่ยวข้องกันไว้ด้วยกัน โดย class จะมีการ
 *  ใส่ Data เข้าไปบางอย่าง สำหรับ manipulating that Data  ซึ่งเป็นพื้นฐานของ OOP they can encapsulate the state of 
 *  our program.
 *
 *  instance methods : เป็น method ที่ถูกเรียกใช้งานผ่าน instance ของ class
 *
 * class constructor : เป็น Method ที่ชื่อคล้ายกับ class และถูกเรียกใช้งานเมื่อมีการสร้าง instance ของ class
 * โดยในการรับค่าจาก method constructor จะมีการกำหนด parameter เพื่อรับค่าที่ต้องการส่งเข้าไป เพื่อกันการซ้ำกันหรือผิดพลาดจะใช้ this. เพื่อชี้ไปยัง instance variable ภายใน class
 *
 *  initializer list เป็นวิธีการเขียนค่า constructor ที่ใช้ : เพื่อกำหนดค่าเริ่มต้นให้กับ instance variable
 *  มีการเขียนทั้งหมด 2 วิธี 1 ใช้ : 
 *  ตัวอย่างเช่น
 *   BankAccount({required String accountHolder, double balance = 0}) : accountHolder = accountHolder, balance = balance; // constructor ที่ใช้ : เพื่อกำหนดค่าเริ่มต้นให้กับ instance variable Dart จะสามารถเข้าใจได้ว่าเราชี้ไปที่ variable ที่ถูกส่งเข้ามาใน constructor ใน class
 *  2.ใช้ this กำหนดผ่าน parameter
 *  ตัวอย่างเช่น
 *  BankAccount({required this.accountHolder, this.balance = 0}) //ใช้this เพื่อกำหนดให้เข้าถึง instance variable ภายใน class
 * 
 *  Class with immutable member
 *  เป็นการสร้าง class ที่มี member variable ที่ไม่สามารถเปลี่ยนแปลงค่าได้ (immutable) ex. final , const
 *
 *  const constructor
 *  เป็นการกำหนด constructor ที่ไม่สามารถเปลี่ยนแปลงค่าได้ (immutable) โดยใช้คำว่า const โดยการรับค่านั้นจะต้องเป็น final
 *
 *   Named constructor
 *  เป็นการสร้าง constructor ที่มีชื่อเฉพาะ โดยสามารถกำหนดชื่อได้ตามต้องการ ซึ่งช่วยให้การสร้าง instance ของ class มีความชัดเจนและเข้าใจง่ายขึ้น
 * โดยจะใช้ .(Name) หลัง constructor
 * 
 * getter and setter
 *  เป็นการกำหนด method สำหรับเข้าถึงและปรับปรุงค่า instance variable ภายใน class เป็นการเขียนแบบไม่ต้องใช้ () ในการเรียกใช้
 * เหมือนการเรียกใช้ propoty มาใช้งานแทน
 * getter เป็นเหมือนการดึงค่ามาประมวลผลภายในฟังก์ชัน ใช้ get
 * setter เป็นเหมือนการปรับปรุงค่าภายในฟังก์ชัน ใช้ set
 * 
 * static method and variable
 * เป็นการประกาศค่า static ใน class เหมือนกับ global แต่ต่างกันที่การประกาศ การใช้งานก็เหมือนกันถ้าหากใช้ static ใน class
 * ก็จะสามารถเรียกใช้ได้ตรงๆเลย ไม่ต้องทำการประกาศหรือ new class ใหม่
 * 
 */
