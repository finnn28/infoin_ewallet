import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/wallet.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum PaymentMethod { bankTransfer, creditCard, alfamart, indomaret }
enum Bank { BRI, BCA, Mandiri, BNI, other }

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  TextEditingController _nominalController = TextEditingController();
  PaymentMethod _selectedPaymentMethod = PaymentMethod.bankTransfer;
  Bank _selectedBank = Bank.BRI; // Bank default yang dipilih

  void _topUp() {
    double nominal = double.tryParse(_nominalController.text) ?? 0.0;

    if (nominal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nominal tidak valid')),
      );
      return;
    }

    // Melakukan top up saldo berdasarkan metode pembayaran yang dipilih
    bool success = false;
    switch (_selectedPaymentMethod) {
      case PaymentMethod.bankTransfer:
        // Logika untuk top up melalui transfer bank
        // Top up menggunakan bank _selectedBank
        success = Provider.of<WalletProvider>(context, listen: false).increaseBalance(nominal);
        break;
      case PaymentMethod.creditCard:
        // Logika untuk top up melalui kartu kredit
        break;
      case PaymentMethod.alfamart:
        // Logika untuk top up melalui Alfamart
        break;
      case PaymentMethod.indomaret:
        // Logika untuk top up melalui Indomaret
        break;
    }

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Top Up berhasil')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Top Up gagal. Silakan coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Metode Pembayaran',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<PaymentMethod>(
              value: _selectedPaymentMethod,
              onChanged: (PaymentMethod? value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
              items: PaymentMethod.values.map((PaymentMethod method) {
                return DropdownMenuItem<PaymentMethod>(
                  value: method,
                  child: Text(method == PaymentMethod.bankTransfer ? 'Bank Transfer' : method == PaymentMethod.creditCard ? 'Kartu Kredit' : method == PaymentMethod.alfamart ? 'Alfamart' : method == PaymentMethod.indomaret ? 'Indomaret' : method.toString().split('.').last),
                );
              }).toList(),
            ),
            if (_selectedPaymentMethod == PaymentMethod.bankTransfer)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Pilih Bank',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Bank>(
                    value: _selectedBank,
                    onChanged: (Bank? value) {
                      setState(() {
                        _selectedBank = value!;
                      });
                    },
                    items: Bank.values.map((Bank bank) {
                      return DropdownMenuItem<Bank>(
                        value: bank,
                        child: Text(bank.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            const Text(
              'Nominal Top Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nominal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _topUp,
                child: const Text('Top Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
