import 'dart:isolate';
import 'dart:math';

typedef Greet = String Function(String name); //การกำหนด type function

void main(List<String> args) {
  final sayHi = (String name) => "Hello $name"; //annonymous

  final sayHello = (String name) {
    return "Hello $name";
  }; // anonymous

  int sum(a, b) => a + b; //fat arrow function

  print(sayHi("Netty"));
  print("Annonymous Function: ${sayHello("Netty")}");
  print("Fat Arrow Function: ${sum(10, 20)}");

  welcome(sayHi, "Ning");

  //closure
  print("---------Closure---------");
  const multiplier = 10;
  const list = [1, 2, 3];
  final result = list.map((x) {
    return x * multiplier;
  });
  print(result);
  final result2 = list.map((y) => y * multiplier);
  print(result2);

  //Method Collection
  print("---------Method Collection---------");
  for (var x in list) {
    print(x * multiplier);
  }

  list.forEach((x) => print(x * multiplier)); //ใช้ annonymous function
  list.forEach((x) {
    if (x == 2) {
      print("This is two");
    }
    print(x * multiplier);
  });
  list.forEach(print);

  print("---------Iterable---------");
  //final List<int> doubles = list.map((value) => value * 2); //เกิดปัญหาว่า list เป็น Iterable เพราะไม่ได้ถูกกำหนดให้เป็น List
  final List<int> doubles = list.map((value) => value * 2).toList();
  print(doubles);

  print("---------Generics---------");

  //Define Function by Generic
  List<R> transform<R, T>(List<T> item, R Function(T) f) {
    //transform<R, T> หมายถึงค่าที่รับเข้ามาแล้วส่งออกไป
    /**
     * ตัวอย่างเช่น
     * List<int> transformIntToInt(List<int> item, int Function(int) f)
     * List<String> transformIntToString(List<int> item, String Function(int) f)
     */
    final result1 = <R>[];
    for (var i in item) {
      result1.add(f(i));
    }
    return result1;
  }

  const l2 = [1.0, 2.0, 3.0];
  final doubles1 = transform<int, int>(list, (value) => value * 2);
  print(doubles1);
  final strings = transform<String, double>(l2, (value) => "Number $value");//ส่งค่าเป้น string
  print(strings);

  List<int> doubleItem(List<int> item) {
    final result = <int>[];
    for (var i in item) {
      result.add(i * 2);
    }
    return result;
  }

  print("---------Where and FirstWhere---------");
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final even = numbers.where((value) => value % 2 ==0); // value จะเป็น list หรือ collection ตัวแรกเสมอ
  print(even);

  final odd = numbers.firstWhere((value) => value % 2 != 0 , orElse: () => -1);
  print(odd);

  print("---------Reduce Method---------");
  final sum1 = numbers.reduce((value, element) => value + element); // value จะเป็น list หรือ collection ตัวแรกเสมอ
  /** วิธีการดำเนินการ
   *  value : 1 3 6 10 15 21 28 36 45 55
   *  elements : 2,3,4,5,6,7,8,9,10
   */
  print("Sum: $sum1");

  //การหาค่าสูงสุด (Maximum)
  print('3. Maximum Example:');
  const scores = [85, 92, 78, 95, 88];
  final maxScore = scores.reduce((value, element) => 
    value > element ? value : element);
  print('Scores: $scores');
  print('Maximum score: $maxScore\n'); // 95

  print('5. String Concatenation:');
  const words = ['Hello', 'Dart', 'Programming', 'World'];
  final sentence = words.reduce((value, element) => '$value $element');
  print('Words: $words');
  print('Sentence: $sentence\n'); // Hello Dart Programming World

  // การใช้กับ Map - หาผลรวมของค่า
  print('8. Map Values Sum:');
  const prices = {'apple': 10, 'banana': 5, 'orange': 8};
  final totalPrice = prices.values.reduce((value, element) => value + element);
  print('Prices: $prices');
  print('Total price: $totalPrice\n'); // 23

  print("---------Combinning functional operators---------");
  const emails = [
    'abs@abc.com',
    'me@example.ac.th',
    'john@gmail.com',
    'katy@yahoo.com'
  ];

  const knowDomain = ['gmail.com','yahoo.com'];
  final unknowDomain = emails.map((email) => email.split('@').last).where((domain) => !knowDomain.contains(domain));
  //email = ['abc.com', 'example.ac.th', 'gmail.com', 'yahoo.com']
  //email.split('@') = [['abs', 'abc.com'], ['me', 'example.ac.th'], ['john', 'gmail.com'], ['katy', 'yahoo.com']]
  //.last = ['abc.com', 'example.ac.th', 'gmail.com', 'yahoo.com']
  //.where = ทำการ fillter ตามเงื่อนไขภายในคือ !knowDomain.contains(domain) ถ้าไม่อยู่ใน knowDomain จะถูกเก็บไว้ใน unknowDomain
  print(unknowDomain);

  //กรณีสร้าง generic
  final unknowDomain2 = getUnknownDomains(emails, knowDomain);
}

void sayHi(String name) {
  print("Hi $name");


}

/** functions as first class objects */
void welcome(String Function(String) greet, String name) {
  //String Function(String) เป้นการกำหรดค่าที่จะรับมาจากฟังก์ชันให้เป็น String โดย Function(ภายในจะเป็นค่าที่ฟังก์ชันรับมา)
  print(greet(name));
  print("Welcom to Dart");
}

//use function type
void welcome2(Greet greet, String name) {
  print(greet(name));
  print("Welcom to Dart");
}

Iterable<String> getUnknownDomains(Iterable<String> emails, Iterable<String> knowDomain) {
  var results = <String>[];
  for(var email in emails) {
    var domain = email.split('@').last;
    if(!knowDomain.contains(domain)) {
      results.add(domain);
    }
  }
  return results;
}

/** Advanced function
 *  Annonymous function
 *  เป็นฟังก์ชันที่ไม่มีชื่อ และสามารถประกาศได้ทุกที่ที่ต้องการ โดยใช้ {} หรือ => 
 *  ตัวอย่างเช่น
 *  var sum = (int a, int b) {
 *    return a + b;
 *  };
 *  Anonymous function vs Fat Arrow function
 *  Annonymous function จะแตกต่างจาก Fat Arrow function ตรงที่
 *  Fat Arrow function จะใช้ => แทนการใช้ {} มีการกำหนดค่าของ type function อย่างเช่น int string void เป็นฟังก์ชันที่เหมาะสมกับการเขียนเพียงบรรทัดเดียวแบบสั้นๆ
 *  Anonymous function สามารถเขียนได้หลายบรรทัด สามารถใช้ if-else, for loop, while loop ได้ 
 * 
 *  functions as first class objects
 *  เป็นการเรียกใช้ฟังก์ชันที่สามารถส่งผ่านเป็น arguments ให้กับฟังก์ชันอื่น หรือสามารถคืนค่าฟังก์ชันเป็นผลลัพธ์ได้
 *  
 *  function type
 *  เป็นการกำหนดฟังก์ขันโดยมีการประกาศฟังก์ชันเพื่อแทนใน arguments เพื่อช่วยให้สามามารถอ่านโค้ดได้ง่ายและ clean
 *  ตัวอย่างเช่น
 *  typedef int MathOperation(int a, int b);
 *  MathOperation sum = (a, b) => a + b;
 *  typedef Greet = String Function(String name);
 *  Greet sayHi = (name) => "Hi $name";
 * 
 *
 *  closure
 *  เป็นฟังก์ชันที่เอาไว้ใช้งานภายในฟังก์ชันอื่น โดยสามารถเข้าถึงตัวแปรที่อยู่ใน scope ของฟังก์ชันแม่ได้
 *  ตัวอย่างเช่น
 *  int Function(int) makeIncrementer(int incrementBy) {
 *    return (int i) => i + incrementBy;
 *  }
 * 
 *  Method Collection
 *  เป็นการเรียกใช้ฟังก์ขันที่มีอยู่แล้วแทนการเขียนแบบหลายบรรทัด
 *  ตัวอย่างเช่น
 *  forEach ex. list.foreach(function());
 *  Map : เป็นคำสั่งที่นิยมใช้ในการแปลงข้อมูลใน list หรือ collection อื่นๆ ex. list.map(function()); // เป็นการแปลง list ให้เป็น map เพื่อใช้ในการทำอะไรซักอย่าง
 *  Iterable and toList()
 *  Iterable เป็นประเภทข้อมูลที่สามารถวนซ้ำได้ เช่น List, Set, Map ซึ่งจะมีปัญหาในการใช้งานบางอย่างใน null safety
 *  ตัวอย่างเช่น
 *  final List<int> doubles = list.map((value) => value * 2); // ทำให้เกิดปัญหาว่า list เป็น Iterable เพราะไม่ได้ถูกกำหนดให้เป็น List
 *  แก้ไขได้โดยการใช้ toList()
 *  toList() เป็นการแปลง Iterable ให้เป็น List
 *
 *  Generics
 *    เป็นการกำหนดประเภทข้อมูลที่สามารถใช้งานได้กับหลายประเภท โดยไม่ต้องระบุประเภทข้อมูลที่แน่นอน ช่วยในการลดการเขียนโค้ดที่ซ้ำซ้อน โดยการใช้ <Characters>
 *    ตัวอย่างเช่น
 *    List<T> เป็นการกำหนด List ที่สามารถเก็บข้อมูลได้ทุกประเภท
 * 
 *  Where and FirstWhere
 *  Where : เป็นเหมือนการ loop วนหา element ที่ตรงตามเงื่อนไข
 *  FirstWhere : เป็นการหาค่าแรกที่ตรงตามเงื่อนไข โดยจะมี error หากไม่พบค่าจะใช้ orElse
 * 
 *  reduce method
 *  เป็นการลดค่าของ List ให้เหลือเพียงค่าเดียว โดยการนำค่าทุกค่ามาทำการรวมกัน เป็นเหมือนการ loop ผ่านฟังก์ชันเพื่อลดการเขียน
 *  ตัวอย่างเช่น
 *  final sum = numbers.reduce((value, element) => value + element);
 */

