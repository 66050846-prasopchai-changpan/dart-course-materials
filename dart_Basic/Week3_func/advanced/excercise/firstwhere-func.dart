import 'dart:io';
void main(List<String> args) {
  const list = [1,2,3,4];
  int num = int.parse(stdin.readLineSync()!);
  final result = firstWhere(list, (value) => value == num, orElse: () => -1);
  print(result);
}

T firstWhere<T>(List<T> item , bool Function(T) f ,{required  Function() orElse}){
  for(var items in item){
    if(f(items)){
      return items;
    }
  }
  return orElse();
}