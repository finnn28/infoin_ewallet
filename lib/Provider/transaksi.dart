import 'package:flutter/material.dart';

class TransaksiProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _transactions = [
    // {
    //   'name': 'Bank BRI',
    //   'type': 'Pemasukan',
    //   'category': 'Top Up',
    //   'amount': 'Rp 100.000',
    //   'date': '30 Apr 2024, 15:47',
    //   'avatar': 'assets/images/img_ellipse_17.png'
    // },
    // {
    //   'name': 'Jane Smith',
    //   'type': 'Pengeluaran',
    //   'category': 'Transfer',
    //   'amount': 'Rp 50.000',
    //   'date': '20 Apr 2024, 15:47',
    //   'avatar': 'assets/images/img_ellipse_17.png'
    // },
    // {
    //   'name': 'Alfamart',
    //   'type': 'Pemasukan',
    //   'category': 'Top Up',
    //   'amount': 'Rp 100.000',
    //   'date': '10 Apr 2024, 15:47',
    //   'avatar': 'assets/images/img_ellipse_17.png'
    // },
  ];

  TransaksiProvider() {
    filterTransactions(selectedFilterOption);
  }

  void addTransaction(Map<String, dynamic> value) {
    _transactions.add(value);
    notifyListeners();
  }
  List<Map<String, dynamic>> get transactions => _transactions;

  set transactions(List<Map<String, dynamic>> value) {
    _transactions = value;
    notifyListeners();
  }
  List<Map<String, dynamic>> _filteredTransaction = [];
  List<Map<String, dynamic>> get filteredTransaction => _filteredTransaction;

  List<String> _filterOptions = ['Semua', 'Pemasukan', 'Pengeluaran'];
  List<String> get filterOptions => _filterOptions;

  String selectedFilterOption = 'Semua';


  void filterTransactions(String filter) {
    selectedFilterOption = filter;
    if (filter == 'Semua') {
        _filteredTransaction = transactions;
    } else {
      _filteredTransaction = transactions.where((transaction) => transaction['type'] == filter).toList();
    }
    notifyListeners();
  }

}
