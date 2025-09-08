abstract class Widget {}//เป็นเหมือนตัวกลางให้ใช้ร่วมกันได้

class Text extends Widget {
  final String data;
  Text(this.data);
  
}

class Button extends Widget {
  final Widget child;
  final void Function()? onPressed;
  Button({required this.child, this.onPressed});
}

void main(List<String> args) {
  final button = Button(
    child: Text('Click Me'),
    onPressed: () {
      print('Button Pressed');
    },
  );
}