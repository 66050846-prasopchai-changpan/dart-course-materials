class Credentials {
  final String email;
  final String password;

  Credentials({this.email = '', this.password = ''});

  Credentials copyWith({String? email, String? password}){
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password
    );
  }

  @override
  String toString() {
    return 'Credentials(email: $email, password: $password)';
  }
}

void main(List<String> args) {
  final credentials = Credentials(email: 'test@example.com', password: 'password123');
  //credentials.email = 'new_email@example.com'; //ทำไม่ได้
  print(credentials);

  final updatedCredentials = credentials.copyWith(email: 'new_email@example.com');
  print(updatedCredentials);
  final updatedCredentials2 = credentials.copyWith(password: 'new_password');
  print(updatedCredentials2);
}