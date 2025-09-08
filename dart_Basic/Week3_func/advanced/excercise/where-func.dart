void main(List<String> args) {
  const list = [1,2,3,4];
  final keepValue =[];

  final result = list.where((value) => value % 2 != 0).forEach(keepValue.add);
  //print(result);
  print(keepValue);

  print("Use Build Generic function");

  final odd = where<int>(list, (value) => value % 2 !=0);
  print(odd);
}

//กรณีใช้ generic
List<T> where<T>(List<T> items , bool Function(T) f){
  var result = <T>[];
  for (var element in items) {
    if(f(element)){
      result.add(element);
    }
  }
  return result;
}