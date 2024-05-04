import 'package:flutter/material.dart';

class Listrik extends StatefulWidget {
  const Listrik({super.key});

  @override
  State<Listrik> createState() => _ListrikState();
}

class _ListrikState extends State<Listrik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listrik'),
      ),
    );
  }
}

