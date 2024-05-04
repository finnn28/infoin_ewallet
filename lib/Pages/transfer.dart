import 'package:flutter/material.dart';
import 'wallet.dart';

class Transfer extends StatefulWidget {
  final double currentBalance;
  final Wallet wallet;
  final Function(double) updateBalance; // Callback untuk memperbarui saldo

  Transfer(
      {Key? key,
      required this.currentBalance,
      required this.wallet,
      required this.updateBalance})
      : super(key: key);

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

  void _cariPenerima() {
    String nomorHP = _nomorHPController.text;
    var penerima = penerimaTransfer.firstWhere(
      (penerima) => penerima['nomorHP'] == nomorHP,
      orElse: () => {'nama': '', 'nomorHP': ''},
    );
    setState(() {
      _namaPenerima = penerima['nama'] ?? '';
    });
  }

  void _transfer() {
    double nominal = double.tryParse(_nominalController.text) ?? 0.0;

    if (nominal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nominal tidak valid')),
      );
      return;
    }

    bool success = widget.wallet.transfer(nominal);

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

  @override
  Widget build(BuildContext context) {
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
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _transfer,
                child: const Text('Transfer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
