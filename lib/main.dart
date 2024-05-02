import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/Auth/login.dart';
import 'package:infoin_ewallet/Pages/home.dart';
import 'package:infoin_ewallet/Pages/pesan.dart';
import 'package:infoin_ewallet/Pages/profile.dart';
import 'package:infoin_ewallet/Pages/riwayat.dart';

void main() {
  runApp(const MainApp());
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  final Duration transitionDuration;
  final Curve curves;

  CustomPageTransitionsBuilder({required this.transitionDuration, required this.curves});

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: curves,
      ),
      child: child,
    );
  }
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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionsBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              curves: Curves.ease,
            )
          },
        ),
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