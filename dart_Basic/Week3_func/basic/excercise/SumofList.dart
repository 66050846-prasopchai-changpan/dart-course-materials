void main(List<String> args) {
  sum([1,2,3,4,5]);
  print(sum([1,2,3,4,5]));
}

double sum(List<double> num){
  double total = 0;
  for (var n in num) {
    total += n;
  }
  return total;
}