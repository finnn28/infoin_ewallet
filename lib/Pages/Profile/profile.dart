import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Profile/help.dart';
import 'package:infoin_ewallet/Pages/Profile/myInfo.dart';
import 'package:infoin_ewallet/Pages/Profile/setting.dart';
import 'package:infoin_ewallet/Pages/upgrade.dart';
import 'package:infoin_ewallet/Provider/userProfile.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/riwayat');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/pesan');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      default:
        throw Exception('Invalid index');
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<UserProfile>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/img_ellipse_17.png'),
          ),
          SizedBox(height: 20),
          Text(
            '${userProfile.name}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Upgrade()),
                  );
                },
                child: Text('Verifikasi Ke Premium'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('My Info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyInfo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Setting'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
