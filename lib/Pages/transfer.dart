import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/pin.dart';
import 'package:infoin_ewallet/Provider/transaksi.dart';
import 'package:infoin_ewallet/Provider/wallet.dart';
import 'package:infoin_ewallet/Widget/customButton.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import untuk NumberFormat

class Transfer extends StatefulWidget {

  const Transfer({super.key});

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final List<Map<String, String>> penerimaTransfer = [
    {'nama': 'Agus', 'nomorHP': '0812345678'},
    {'nama': 'Rizki', 'nomorHP': '0812345679'},
    {'nama': 'Farhan', 'nomorHP': '0812345680'},
    // Tambahkan penerima transfer lainnya sesuai kebutuhan
  ];

  String? _namaPenerima;
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _nomorHPController = TextEditingController();
  bool _isNomorHPValid = false; // Menyimpan status validasi nomor HP

  void _cariPenerima() {
    String nomorHP = _nomorHPController.text;
    var penerima = penerimaTransfer.firstWhere(
      (penerima) => penerima['nomorHP'] == nomorHP,
      orElse: () => {'nama': '', 'nomorHP': ''},
    );
    setState(() {
      _namaPenerima = penerima['nama'] ?? '';
      _isNomorHPValid = _namaPenerima != null && _namaPenerima!.isNotEmpty; // Mengupdate status validasi nomor HP
    });
  }

  void _transfer() {
    if (!_isNomorHPValid) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PinDialog(
          onPinEntered: () {
            // Memanggil fungsi transfer setelah PIN dimasukkan
            _prosesTransfer();
          },
        );
      },
    );
  }
  
  void _prosesTransfer() {
    double nominal = double.tryParse(_nominalController.text) ?? 0.0;
    Map<String, dynamic> newTransaction = {
      'name': _namaPenerima!,
      'type': 'Pengeluaran',
      'category': 'Transfer',
      'amount': 'Rp ${NumberFormat('#,##0', 'id_ID').format(nominal)}',
      'date': DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now()),
      'avatar': 'assets/images/img_ellipse_17.png'
    };
      if (nominal <= 0 || Provider.of<WalletProvider>(context, listen: false).balance! < nominal) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nominal tidak valid atau saldo tidak cukup')),
        );
        return;
      }

      bool success = Provider.of<WalletProvider>(context, listen: false).decreaseBalance(nominal);

      if (success) {
        Provider.of<TransaksiProvider>(context, listen: false).addTransaction(newTransaction);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transfer berhasil')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transfer gagal. Silakan coba lagi.')),
        );
      }
  }
    


  @override
  Widget build(BuildContext context) {
    var wallet = Provider.of<WalletProvider>(context);
    // Membuat format untuk saldo
    final saldoFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
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
              controller: _nomorHPController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'No HP',
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (_) => _cariPenerima(),
            ),
            if (_namaPenerima != null && _namaPenerima!.isNotEmpty) ...[
              Text(
                'Nama: $_namaPenerima',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
            ],
            const Text(
              'Nominal Transfer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rp. 0',
                border: OutlineInputBorder(),
              ),
              enabled: _isNomorHPValid, // Menonaktifkan jika nomor HP tidak valid
            ),
            Text(
              'Saldo : ${saldoFormat.format(wallet.balance ?? 0)}',
              style: TextStyle(
                fontSize: 16
              )
            ),
            const Spacer(),
            CustomButton(
              onPressed: _transfer,
              text: 'Transfer',
              isEnabled: _isNomorHPValid,
            ),
          ],
        ),
      ),
    );
  }
}
