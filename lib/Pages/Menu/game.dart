import 'package:flutter/material.dart';

void main() {
  runApp(Game());
}

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      theme: ThemeData(
        primaryColor: Colors.yellow, // Warna kuning
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> pilihan = [
    'Pilihan 1',
    'Pilihan 2',
    'Pilihan 3',
    'Pilihan 4',
    'Pilihan 5',
    'Pilihan 6'
  ];

  String? pilihanTerakhir;

  void togglePilihan(String item) {
    setState(() {
      if (pilihanTerakhir == item) {
        pilihanTerakhir = null;
      } else {
        pilihanTerakhir = item;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Game'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        children: pilihan.map((pilihan) {
          return PilihanItem(
            pilihan: pilihan,
            dipilih: pilihan == pilihanTerakhir,
            onTap: () => togglePilihan(pilihan),
          );
        }).toList(),
      ),
    );
  }
}

class PilihanItem extends StatelessWidget {
  final String pilihan;
  final bool dipilih;
  final VoidCallback onTap;

  const PilihanItem({
    required this.pilihan,
    required this.dipilih,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: dipilih ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            pilihan,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
