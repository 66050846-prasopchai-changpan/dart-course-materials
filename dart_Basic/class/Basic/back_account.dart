class BackAccount {
  double _balance;

  BackAccount(this._balance);

  void deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      return true;
    }
    return false;
  }

  double get balance => _balance;   //ดึงค่า _balance มาใช้งาน
}