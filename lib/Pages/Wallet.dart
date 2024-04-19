class Wallet {
  double _balance;

  // Konstruktor untuk inisialisasi saldo awal
  Wallet({double initialBalance = 0.0}) : _balance = initialBalance;

  // Metode untuk mendapatkan saldo saat ini
  double get balance => _balance;

  // Metode untuk melakukan top up saldo
  bool topUp(double amount) {
    if (amount <= 0) {
      // Jika nominal tidak valid, top up gagal
      return false;
    } else {
      // Tambahkan jumlah top up ke saldo
      _balance += amount;
      return true;
    }
  }
}
