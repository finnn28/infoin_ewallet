import 'package:flutter/material.dart';

class Promosi extends StatefulWidget {
  const Promosi({Key? key}) : super(key: key);

  @override
  State<Promosi> createState() => _PromosiState();
}

class _PromosiState extends State<Promosi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promosi"),
      ),
      body: ListView(
        children: [
          // Promo pembelian pulsa
          PromoCard(
            title: "Promo Pembelian Pulsa",
            description: "Dapatkan diskon hingga 10% untuk pembelian pulsa!",
            onPressed: () {
              // Implementasi aksi ketika promo pembelian pulsa ditekan
            },
          ),
          // Promo pembelian game
          PromoCard(
            title: "Promo Pembelian Game",
            description: "Beli game favoritmu dengan harga spesial!",
            onPressed: () {
              // Implementasi aksi ketika promo pembelian game ditekan
            },
          ),
          // Promo pembayaran listrik
          PromoCard(
            title: "Promo Pembayaran Listrik",
            description: "Bayar tagihan listrikmu dan dapatkan cashback 5%!",
            onPressed: () {
              // Implementasi aksi ketika promo pembayaran listrik ditekan
            },
          ),
          // Promo pembelian investasi di aplikasi e-wallet
          PromoCard(
            title: "Promo Pembelian Investasi",
            description: "Mulai investasi di e-wallet dan dapatkan bonus investasi!",
            onPressed: () {
              // Implementasi aksi ketika promo pembelian investasi ditekan
            },
          ),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const PromoCard({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
