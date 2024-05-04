import 'package:flutter/material.dart';

class Asuransi extends StatefulWidget {
  const Asuransi({super.key});

  @override
  State<Asuransi> createState() => _AsuransiState();
}

class _AsuransiState extends State<Asuransi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asuransi'),
      ),
    );
  }
}

