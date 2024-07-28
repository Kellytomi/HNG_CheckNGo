import 'package:flutter/material.dart';

import '../models/visitor.dart';

class NFCReadPage extends StatelessWidget {
  const NFCReadPage({super.key, required this.visitor});
  final Visitor visitor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan NFC'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
