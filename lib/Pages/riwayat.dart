import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  int _selectedIndex = 1;

  // Contoh data transaksi
  final List<Map<String, dynamic>> transactions = [
    {
      'name': 'Bank BRI',
      'type': 'Pemasukan',
      'category': 'Top Up',
      'amount': 'Rp 100.000',
      'date': '30 Apr 2024, 15:47',
      'avatar': 'assets/images/img_ellipse_17.png'
    },
    {
      'name': 'Jane Smith',
      'type': 'Pengeluaran',
      'category': 'Transfer',
      'amount': 'Rp 50.000',
      'date': '20 Apr 2024, 15:47',
      'avatar': 'assets/images/img_ellipse_17.png'
    },
    {
      'name': 'Alfamart',
      'type': 'Pemasukan',
      'category': 'Top Up',
      'amount': 'Rp 100.000',
      'date': '10 Apr 2024, 15:47',
      'avatar': 'assets/images/img_ellipse_17.png'
    },
  ];

  // Filtered transactions
  List<Map<String, dynamic>> filteredTransactions = [];

  // Filter options
  List<String> filterOptions = ['Semua', 'Pemasukan', 'Pengeluaran'];
  String selectedFilterOption = 'Semua';

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/riwayat');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/pesan');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      default:
        throw Exception('Invalid index');
    }
  }

  // Method to filter transactions
  void _filterTransactions(String filter) {
    setState(() {
      selectedFilterOption = filter;
      if (filter == 'Semua') {
        filteredTransactions = transactions;
      } else {
        filteredTransactions = transactions.where((transaction) => transaction['type'] == filter).toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Riwayat'),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Filter'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filterOptions.map((String option) {
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            _filterTransactions(option);
                            Navigator.pop(context); // Close the dialog
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTransactions.length,
        itemBuilder: (context, index) {
          var transaction = filteredTransactions[index];
          var amountText = transaction['type'] == 'Pemasukan' ? '+${transaction['amount']}' : '-${transaction['amount']}';
          var amountColor = transaction['type'] == 'Pemasukan' ? Colors.green : null;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 5)
                )
              ]
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(transaction['avatar']),
              ),
              title: Text(transaction['name']),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${transaction['category']}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text('${transaction['date']}'),
                    ],
                  ),
                  Text(amountText,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: amountColor),),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}