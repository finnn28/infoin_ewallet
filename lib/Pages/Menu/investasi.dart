import 'package:flutter/material.dart';

class Investasi extends StatefulWidget {
  const Investasi({super.key});

  @override
  State<Investasi> createState() => _InvestasiState();
}

class _InvestasiState extends State<Investasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investasi'),
      ),
    );
  }
}

