import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/transaksi.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';
import 'package:provider/provider.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  int _selectedIndex = 1;

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

  @override
  Widget build(BuildContext context) {
    var transaksi = Provider.of<TransaksiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Riwayat'),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Filter'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: transaksi.filterOptions.map((String option) {
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            transaksi.filterTransactions(option);
                            Navigator.pop(context);
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
        itemCount: transaksi.filteredTransaction.length,
        itemBuilder: (context, index) {
          var transaction = transaksi.filteredTransaction[transaksi.filteredTransaction.length - 1 - index];
          var amountText = transaction['type'] == 'Pemasukan' ? '+${transaction['amount']}' : '-${transaction['amount']}';
          var amountColor = transaction['type'] == 'Pemasukan' ? Colors.green : null;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 1),
            decoration: BoxDecoration(
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