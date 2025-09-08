const globalScope = "I am a global variable";
var num = 1;

void main(List<String> args) {
  printName("Nety", 21);

  int sum(x , y) => x+y;
  print(sum(5, 10));

  void foo(int b){
    print(globalScope);
    print(b);
  }

  print("Inner function");
  foo(6);

  printStart();
  printStart();
  printStart();

  print(num);
}

int sum2(int x , int y){
  return x + y;
}

void sayHi(){
  print("Hi!");
}

//function arguments
void printName(String name ,int age){
  print("My name is $name and I am $age years old");
}

String sayHello([String name = "Guest"]){
  return "Hello $name";
}

/* Named parameters  ในกรณีีที่ไม่มี null safety
String namePosition({String name, int age}){
  return "My name is $name and I am $age years old";
}
*/

void printInfo({required String name, required int age}) {
  print("Name: $name, Age: $age");
}


void printsum(x,y) => x + y;

void printStart(){
  print("*"*num);
  num++;
}

  const appName = "MyApp";   // global constant (library scope)
  var counter = 0;           // global mutable (try to avoid)

  void foo() {
    final local = 123;       // local to foo
    counter++;               // reads/writes global
    print(appName);          // reads global

    if (true) {
      var inBlock = 42;      // block scope
      print(inBlock);
    }
    // print(inBlock); // ERROR: not in scope here
  }

/* //How to declare a function
Type nameFunction(Parameter){
  //function body
  return value;
} */

//How to declare

/** Function
 *  What is function
 *  function เป็นการเขียนโค้ดในรูปแบบที่สามารถนำกลับมาใช้ใหม่ได้ เพื่อลดการทำซ้ำ และลดการเขียนโค้ดแบบ structure
 *  function arguments
 *  arguments คือ ข้อมูลที่ถูกส่งไปยังฟังก์ชันเมื่อฟังก์ชันถูกเรียกใช้งาน
 *  
 *  return value
 *  return value คือ ข้อมูลที่ฟังก์ชันส่งกลับเมื่อฟังก์ชันถูกเรียกใช้งาน โดยใช้คำว่า return
 *  โดยฟังก์ชันจะต้องมีการกำหนด type ของฟังก์ชันที่เราต้องการ return
 *  ตัวอย่างเช่น
 *  1.return int = int Namemethod(parametor)
 *  2.return String = String Namemethod(parametor)
 *
 *  Named And positional parameters
 *  เป็นการกำหนดพารามิเตอร์ให้กับฟังก์ชัน โดยสามารถระบุชื่อพารามิเตอร์ได้ เพื่อให้การเรียกใช้งานฟังก์ชันนั้นชัดเจนและเข้าใจง่ายขึ้น
 *  โดยการใข้จะใช้ {} ใน parameter เพื่อกำหนดชื่อพารามิเตอร์ ซึ่งจะมีปัญหาใน null safety
 *  ตัวอย่างเช่น
 *  void printInfo({required String name, required int age}) {
 *    print("Name: $name, Age: $age");
 *  }
 *
 * ในกรณีที่มี Null safety
 *  จะใช้ {required} ในการกำหนดพารามิเตอร์ที่จำเป็นต้องมีค่า
 * 
 *  default value
 *  เป็นการประกาศค่าเริ่มต้นของ parameter ในกรณีที่ไม่มีการส่งค่าเข้ามา
 *  not null safety
 *  void printInfo({String name = "Unknown", int age = 0}) {
 *    print("Name: $name, Age: $age");
 *  }
 *
 *  null safety
 *  ในกรณีที่มี Null safety จะต้องกำหนดค่าเริ่มต้นให้กับพารามิเตอร์ที่เป็น nullable
 *  void printInfo({String? name, int? age}) {
 *    print("Name: ${name ?? "Unknown"}, Age: ${age ?? 0}");
 *  }
 * 
 *  fat Arrow function
 *  เป็นการเขียนฟังก์ชันในรูปแบบสั้นๆ โดยใช้ => แทนการใช้ {} แบละ return
 *  ตัวอย่างเช่น
 *  int add(int a, int b) => a + b;
 *
 *  global and local scope
 *  global scope คือ ขอบเขตของตัวแปรที่สามารถเข้าถึงได้จากทุกที่ในโปรแกรม จะเป็นการประกาศนอกฟังก์ชัน
 *  local scope คือ ขอบเขตของตัวแปรที่สามารถเข้าถึงได้เฉพาะภายในฟังก์ชันหรือบล็อกที่ประกาศเท่านั้น
 * 
 *   Inner function
 *   เป็นฟังก์ชันที่ถูกประกาศภายในฟังก์ชันอื่น ซึ่งสามารถเข้าถึงตัวแปรและพารามิเตอร์ของฟังก์ชันภายนอกได้
 *   ตัวอย่างเช่น
 *   void outerFunction() {
 *     int outerVariable = 10;
 *
 *     void innerFunction() {
 *       print("Outer variable: $outerVariable");
 *     }
 *
 *     innerFunction();
 *   }
 *
 *  global mutable and function with side effects
 *  global mutable คือ ตัวแปรที่สามารถเปลี่ยนค่าได้จากทุกที่ในโปรแกรม
 *  function with side effects คือ ฟังก์ชันที่มีการเปลี่ยนแปลงค่าของตัวแปรภายนอกหรือมีผลกระทบต่อสถานะของโปรแกรม
 *  ซึ่งสามารถแก้ไขได้โดยการหลีกเลี่ยงการใช้ตัวแปร global mutable และพยายามเขียนฟังก์ชันที่ไม่มี side effects อย่างการใช้ const
 */
