import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkngo/src/services/nfc_service.dart';

class NFCWritePage extends StatelessWidget {
  const NFCWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nfcService = Provider.of<NFCService>(context, listen: false);
    final visitorIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Write to NFC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: visitorIdController,
              decoration: InputDecoration(labelText: 'Visitor ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (visitorIdController.text.isNotEmpty) {
                  await nfcService.writeTag(visitorIdController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Visitor ID written to NFC tag')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a Visitor ID')),
                  );
                }
              },
              child: const Text('Write to NFC'),
            ),
          ],
        ),
      ),
    );
  }
}
