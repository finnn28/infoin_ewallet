import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Widget/customButton.dart';

class TransactionSuccessPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;

  TransactionSuccessPage({required this.transactionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi Berhasil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundImage: AssetImage(transactionData['avatar']),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              transactionData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Kategori: ${transactionData['category']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Nominal: ${transactionData['amount']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal: ${transactionData['date']}',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            CustomButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            }, text: "Selesai")
          ],
        ),
      ),
    );
  }
}
