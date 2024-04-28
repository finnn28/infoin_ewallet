import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Auth/login.dart';
import 'package:infoin_ewallet/Pages/home.dart';
import 'package:infoin_ewallet/Pages/pesan.dart';
import 'package:infoin_ewallet/Pages/profile.dart';
import 'package:infoin_ewallet/Pages/riwayat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Infoin_E-Wallet",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/home': (context) => const Home(),
        '/riwayat': (context) => const Riwayat(),
        '/profile': (context) => const Profile(),
        '/pesan': (context) => const Pesan(),
      },
    );
  }
}