import 'package:flutter/material.dart';

class BPJS extends StatefulWidget {
  const BPJS({super.key});

  @override
  State<BPJS> createState() => _BPJSState();
}

class _BPJSState extends State<BPJS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BPJS'),
      ),
    );
  }
}

