import 'package:flutter/material.dart';
import 'package:infoin_ewallet/Pages/VersiKTP.dart';

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
            const SizedBox(height: 20),
            const Text(
              "Fitur yang Anda dapatkan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Versiktp()));
              },
              child: const Text("Lanjut "),
            )
          ],
        ),
      ),
    );
  }
}