import 'package:flutter/material.dart';
import 'wallet.dart';

class Topup extends StatelessWidget {
  final double currentBalance;
  final Wallet wallet;
  final Function(double) updateBalance; // Callback untuk memperbarui saldo

  Topup({Key? key, required this.currentBalance, required this.wallet, required this.updateBalance}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _nominalController = TextEditingController();

    void _topUp() {
  double nominal = double.tryParse(_nominalController.text) ?? 0.0;

  if (nominal <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nominal tidak valid')),
    );
    return;
  }

  // Melakukan top up saldo
  bool success = wallet.topUp(nominal);

  if (success) {
    double newBalance = currentBalance + nominal;
    updateBalance(newBalance);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Top Up berhasil')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Top Up gagal. Silakan coba lagi.')),
    );
  }
}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top ke',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration:const  InputDecoration(
                labelText: 'Nominal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dari Saldo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Rp. ${currentBalance.toStringAsFixed(2)}',
              style:const  TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _topUp,
              child:const  Text('Top Up'),
            ),
          ],
        ),
      ),
    );
  }
}
