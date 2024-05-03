import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';

class Message {
  final String senderName;
  final String avatar;
  final String date;
  final String messageContent;

  Message({required this.senderName, required this.avatar, required this.date, required this.messageContent});
}

class Pesan extends StatefulWidget {
  const Pesan({Key? key}) : super(key: key);

  @override
  State<Pesan> createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  int _selectedIndex = 2;

  List<Message> messages = [
    Message(
      senderName: "John Doe",
      avatar: "assets/images/img_ellipse_17.png",
      date: "30 Apr 2024, 15:47",
      messageContent: "Transaksi pengeluaran: \$50 untuk belanja bulanan."
    ),
    Message(
      senderName: "Jane Smith",
      avatar: "assets/images/img_ellipse_17.png",
      date: "30 Apr 2024, 15:47",
      messageContent: "Transaksi pemasukan: \$100 dari gaji bulanan."
    ),
    Message(
      senderName: "Promo Company",
      avatar: "assets/images/img_ellipse_17.png",
      date: "30 Apr 2024, 15:47",
      messageContent: "Promo spesial! Dapatkan diskon 50% untuk pembelian pertama Anda."
    ),
  ];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Pesan'),
        centerTitle: true,
        leading: Container(),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 5), 
                  blurRadius: 1, 
                  spreadRadius: 1)
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(messages[index].avatar),
              ),
              title: Text(messages[index].senderName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messages[index].messageContent),
                  Text(messages[index].date, style: TextStyle(fontSize: 12, color: Colors.grey),),
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
