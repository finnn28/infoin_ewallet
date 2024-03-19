import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/upgrade.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: Text("Hi, Jono")),
                Expanded(child: ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Upgrade()),
            );
          }, child: const Text("UPGRADE", style: TextStyle(color: Colors.red),))),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Icon(Icons.abc)),
                Expanded(child: Icon(Icons.abc)),
                Expanded(child: Icon(Icons.abc)),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Center(child: Text("Bayar"))),
                Expanded(child: Center(child: Text("Transfer"))),
                Expanded(child: Center(child: Text("Top Up"))),
              ],
            ),
          ],
        ),
      )
    );
  }
}