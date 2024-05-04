import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infoin_ewallet/Pages/bayar.dart';
import 'package:infoin_ewallet/Pages/transfer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infoin_ewallet/Pages/topup.dart';
import 'package:infoin_ewallet/Pages/wallet.dart';
import 'package:infoin_ewallet/Provider/userProfile.dart';
import 'package:infoin_ewallet/Widget/bottomNavigation.dart';
import 'package:provider/provider.dart';

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
    var user = Provider.of<UserProfile>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 225, 225),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Hi, ${user.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 23, 10),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Center(
                              child: Image.asset(
                            'assets/images/img_image_1.png',
                            height: 50,
                            alignment: Alignment.centerLeft,
                          )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 17),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Saldo",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rp.100.000",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Bayar()),
                            );
                          },
                          child: SvgPicture.asset(
                              'assets/images/img_bx_bx_scan.svg'),
                        )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Transfer(
                                    currentBalance: 0.0,
                                    wallet: Wallet(),
                                    updateBalance: (double) {},
                                  ),
                                  // Gantilah Walet() dengan objek wallet yang sesuai
                                ),
                              );
                            },
                          child: SvgPicture.asset(
                              'assets/images/img_transaction_1.svg'),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TopUp(
                                    currentBalance: 0.0,
                                    wallet: Wallet(),
                                    updateBalance: (double) {},
                                  ),
                                  // Gantilah Walet() dengan objek wallet yang sesuai
                                ),
                              );
                            },
                          child: SvgPicture.asset(
                              'assets/images/img_mdi_wallet_plus_outline.svg'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Bayar()),
                            );
                          },
                          child: Center(child: Text("Bayar")),
                        )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Transfer(
                                    currentBalance: 0.0,
                                    wallet: Wallet(),
                                    updateBalance: (double) {},
                                  ),
                                  // Gantilah Walet() dengan objek wallet yang sesuai
                                ),
                              );
                            },
                            child: const Center(
                              child: Text(
                                "Transfer",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TopUp(
                                    currentBalance: 0.0,
                                    wallet: Wallet(),
                                    updateBalance: (double) {},
                                  ),
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
                    SizedBox(
                      height: 35,
                    ),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
