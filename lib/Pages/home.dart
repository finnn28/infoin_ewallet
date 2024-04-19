import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infoin_ewallet/Pages/upgrade.dart';
import 'package:flutter_svg/flutter_svg.dart';
import  'package:infoin_ewallet/Pages/Topup.dart';
import 'package:infoin_ewallet/Pages/wallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _currentAdIndex = 0;
  List<String> _advertisementImages = [
    'assets/images/img_rectangle_4.png',
    'assets/images/ads2.jpeg',
    'assets/images/ads3.png',
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentAdIndex = (_currentAdIndex + 1) % _advertisementImages.length;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 450,
              child: Image.asset(
                'assets/images/img_rectangle_3.png',
                height: 5,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "Hi, Niki",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Upgrade()),
                              );
                            },
                            child: const Text(
                              "UPGRADE",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Image.asset(
                      'assets/images/img_image_1.png',
                      height: 50,
                      alignment: Alignment.centerLeft,
                    )),
                    const Padding(
                      padding: EdgeInsets.only(right: 17),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("Saldo"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Rp.100.000"),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                              'assets/images/img_bx_bx_scan.svg'),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                              'assets/images/img_transaction_1.svg'),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                              'assets/images/img_mdi_wallet_plus_outline.svg'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Center(child: Text("Bayar"))),
                        const Expanded(child: Center(child: Text("Transfer"))),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Topup(currentBalance: 0.0, wallet: Wallet(), updateBalance: (double) {  },),
                                   // Gantilah Walet() dengan objek wallet yang sesuai
                                  
                                ),
                              );
                            },
                            child: const Center(
                              child: Text(
                                "Top Up",
                                
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 55),
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_bi_phone.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Pulsa")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_akar_icons_phone.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Telpon")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_flash_1.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Listrik")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_ion_game_controller.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Game")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_mdi_charity.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Donasi")
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_umbrella_1.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Asuransi")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_shield_variant.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Investasi")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_healthy_living_1.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("BPJS")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/img_dashboard_2.svg')),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text("Lainnya")
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        _advertisementImages[_currentAdIndex],
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
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