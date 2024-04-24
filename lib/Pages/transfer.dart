import 'package:flutter/material.dart';
import 'wallet.dart';

class Transfer extends StatelessWidget {
  final double currentBalance;
  final Wallet wallet;
  final Function(double) updateBalance; // Callback untuk memperbarui saldo

  Transfer({Key? key, required this.currentBalance, required this.wallet, required this.updateBalance}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _nominalController = TextEditingController();

    void _transfer() {
  double nominal = double.tryParse(_nominalController.text) ?? 0.0;

  if (nominal <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nominal tidak valid')),
    );
    return;
  }

  bool success = wallet.transfer(nominal);

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transfer berhasil')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transfer gagal. Silakan coba lagi.')),
    );
  }
}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transfer ke',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:const  InputDecoration(
                labelText: 'No HP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nominal Transfer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration:const  InputDecoration(
                labelText: 'Rp. 0',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _transfer,
                child:const  Text('Transfer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}