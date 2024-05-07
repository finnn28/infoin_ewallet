import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Provider/userProfile.dart';
import 'package:provider/provider.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});
  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  String currentPin = "";
  String newPin = "";
  String confirmPin = "";

  @override
  Widget build(BuildContext context) {
    var pinFromProvider = Provider.of<UserProfile>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Current PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              onChanged: (value) {
                setState(() {
                  currentPin = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter New PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              onChanged: (value) {
                setState(() {
                  newPin = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Confirm New PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              onChanged: (value) {
                setState(() {
                  confirmPin = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (currentPin == pinFromProvider.pin.toString()) {
                  if (newPin == confirmPin) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('PIN has been successfully changed.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                pinFromProvider.pin = int.parse(newPin);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('New PIN and Confirm PIN do not match.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Incorrect current PIN.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Change PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
