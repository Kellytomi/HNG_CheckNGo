import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkngo/src/services/nfc_service.dart';
import '../models/visitor.dart';

class NFCReadPage extends StatefulWidget {
  const NFCReadPage({super.key, required this.visitor});
  final Visitor visitor;

  @override
  _NFCReadPageState createState() => _NFCReadPageState();
}

class _NFCReadPageState extends State<NFCReadPage> {
  String _nfcData = 'No data';

  @override
  Widget build(BuildContext context) {
    final nfcService = Provider.of<NFCService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan NFC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Scanned Data: $_nfcData'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await nfcService.readTag((data) {
                  setState(() {
                    _nfcData = data;
                  });
                });
              },
              child: const Text('Scan NFC Tag'),
            ),
          ],
        ),
      ),
    );
  }
}
