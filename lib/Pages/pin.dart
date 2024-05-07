import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/userProfile.dart';
import 'package:provider/provider.dart';

class PinDialog extends StatefulWidget {
  final VoidCallback onPinEntered;

  const PinDialog({Key? key, required this.onPinEntered}) : super(key: key);

  @override
  _PinDialogState createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  late TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var pinFromProvider = Provider.of<UserProfile>(context, listen: false).pin;
    return AlertDialog(
      title: Text('Masukkan PIN'),
      content: TextFormField(
        controller: _pinController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        obscureText: true,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            String enteredPin = _pinController.text;
            if (enteredPin == pinFromProvider.toString()) {
              widget.onPinEntered();
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('PIN salah. Silakan coba lagi.'),
                ),
              );
            }
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}

