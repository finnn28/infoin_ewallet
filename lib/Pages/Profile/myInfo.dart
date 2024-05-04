import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infoin_ewallet/Provider/userProfile.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  late String _name;
  late String _email;
  late int _phoneNumber;

  @override
  void initState() {
    super.initState();
    var userProfile = Provider.of<UserProfile>(context, listen: false);
    _name = userProfile.name ?? '';
    _email = userProfile.email ?? '';
    _phoneNumber = userProfile.phoneNumber ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<UserProfile>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  userProfile.avatarImage = File(pickedFile.path);
                }
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: userProfile.avatarImage != null
                    ? FileImage(userProfile.avatarImage!)
                    : AssetImage('assets/images/img_ellipse_17.png')
                        as ImageProvider<Object>,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: _email,
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: _phoneNumber.toString(),
              decoration: InputDecoration(labelText: 'Phone Number'),
              onChanged: (value) {
                setState(() {
                  _phoneNumber = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  userProfile.name = _name;
                  userProfile.email = _email;
                  userProfile.phoneNumber = _phoneNumber;
                  userProfile.saveProfile();
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
