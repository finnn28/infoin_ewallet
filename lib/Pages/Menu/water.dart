import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  const Water({super.key});

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  late TextEditingController _billNumberController;

  @override
  void initState() {
    super.initState();
    _billNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _billNumberController.dispose();
    super.dispose();
  }

  void _submitPayment() {
    // Implement payment submission logic here
    String billNumber = _billNumberController.text;
    // You can add further logic here like API calls or payment processing
    print('Submitting payment for bill number: $billNumber');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Air'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _billNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Bill Number',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _submitPayment,
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}