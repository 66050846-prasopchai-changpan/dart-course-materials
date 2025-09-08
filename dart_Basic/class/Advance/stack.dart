class Stack<T> {
  final List<T> _elements = [];

  void push(T element) {
    _elements.add(element);
  }

  T pop() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _elements.removeLast();
  }

  T get top {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }
    return _elements.last;
  }

  bool get isEmpty => _elements.isEmpty;

  int get size => _elements.length;

  @override
  String toString() => 'Stack(${_elements.toString()})';
}

void main(List<String> args) {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print(stack); // Stack([1, 2, 3])
}