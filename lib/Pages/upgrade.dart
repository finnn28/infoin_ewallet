import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Upgrade extends StatelessWidget {
  const Upgrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_rounded))),
                const Expanded(child: Text("PREMIUM")),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Center(child: Text("Fitur yang anda dapatkan")))
              ],
            ),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Bebas Biaya Transfer")),
              ],
            ),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Mengatur Limit Keuangan Anda")),
              ],
            ),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Deposit Tanpa Batas")),
              ],
            ),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Bebas Biaya Bulanan")),
              ],
            ),
            const Row(
              children: [
                Expanded(flex: 10, child: Icon(Icons.check)),
                Expanded(flex: 90, child: Text("Promo Menarik")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){}, child: const Text("Lanjut"))
              ],
            )
          ],
        ),
      ),
    );
  }
}