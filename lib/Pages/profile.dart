import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/upgrade.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // title: Text('Profil'),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/img_ellipse_17.png'), // Ganti URL dengan URL avatar Anda
          ),
          SizedBox(height: 20),
          Text(
            'Johanes Nicky C. S', // Ganti dengan nama pengguna Anda
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
            title: Text('Informasi Saya'),
            onTap: () {
              // Tambahkan logika untuk navigasi ke halaman informasi saya
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Pengaturan'),
            onTap: () {
              // Tambahkan logika untuk navigasi ke halaman pengaturan
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Bantuan'),
            onTap: () {
              // Tambahkan logika untuk navigasi ke halaman bantuan
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
