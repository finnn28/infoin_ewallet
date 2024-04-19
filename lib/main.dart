import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Auth/login.dart';
import 'package:infoin_ewallet/Pages/home.dart';

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
      home: const Login()
    );
  }
}