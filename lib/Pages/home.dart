import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/upgrade.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Indeks item terpilih pada bottom navigation

  // Mengubah halaman yang ditampilkan sesuai dengan indeks terpilih pada bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const Expanded(child: Text("Hi, Niki", style: TextStyle(fontWeight: FontWeight.bold),)),
                Expanded(child: ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Upgrade()),
            );
          }, child: const Text("UPGRADE", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset('assets/images/img_image_1.png', height: 50, alignment: Alignment.centerLeft,)),
                const Padding(padding: EdgeInsets.only(right: 17), child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Saldo"),
                    ),
                    SizedBox(height: 10,),
                    Text("Rp.100.000"),
                  ],
                ),)
              ],
            ),
            const SizedBox(height: 15),
            Expanded(child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(child: SvgPicture.asset('assets/images/img_bx_bx_scan.svg'),),
                    Expanded(child: SvgPicture.asset('assets/images/img_transaction_1.svg'),),
                    Expanded(child: SvgPicture.asset('assets/images/img_mdi_wallet_plus_outline.svg'),),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(child: Center(child: Text("Bayar"))),
                    Expanded(child: Center(child: Text("Transfer"))),
                    Expanded(child: Center(child: Text("Top Up"))),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}