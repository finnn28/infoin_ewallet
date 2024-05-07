import 'package:flutter/material.dart';

class Pulsa extends StatefulWidget {
  const Pulsa({Key? key}) : super(key: key);

  @override
  State<Pulsa> createState() => _PulsaState();
}

class _PulsaState extends State<Pulsa> {
  String _selectedNominal = '5.000';

  final List<String> _nominals = [
    '5.000',
    '10.000',
    '15.000',
    '20.000',
    '25.000',
    '50.000',
    '100.000'
  ];

  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembelian Pulsa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Nomor HP',
                hintText: 'Masukkan nomor HP',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Nominal Pulsa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: _nominals.map((String nominal) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedNominal = nominal;
                      });
                    },
                    child: Card(
                      color: _selectedNominal == nominal
                          ? Colors.blue
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            nominal,
                            style: TextStyle(
                              fontSize: 18,
                              color: _selectedNominal == nominal
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = _phoneNumberController.text;
                String selectedNominal = _selectedNominal;
                print('Nomor HP: $phoneNumber, Nominal Pulsa: $selectedNominal');
              },
              child: Text('Beli Pulsa'),
            ),
          ],
        ),
      ),
    );
  }
}