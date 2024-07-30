import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  Future<void> writeTag(String data) async {
    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          try {
            var ndef = Ndef.from(tag);
            if (ndef == null) {
              throw "Tag is not NDEF formatted";
            }
            var message = NdefMessage([
              NdefRecord.createText(data),
            ]);
            await ndef.write(message);
            await NfcManager.instance.stopSession();
          } catch (e) {
            await NfcManager.instance.stopSession(errorMessage: "Failed to write tag");
            throw e;
          }
        },
      );
    } catch (e) {
      print("Error starting NFC session: $e");
      throw e;
    }
  }

  Future<void> readTag(Function(String) onRead) async {
    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        try {
          var ndef = Ndef.from(tag);
          if (ndef == null) {
            onRead("Tag is not NDEF formatted");
            await NfcManager.instance.stopSession();
            return;
          }
          var message = ndef.cachedMessage;
          if (message == null || message.records.isEmpty) {
            onRead("No NDEF message found");
            await NfcManager.instance.stopSession();
            return;
          }
          String payload = String.fromCharCodes(message.records.first.payload);
          // Assuming the data is stored as plain text, skipping the first 3 bytes (language code)
          onRead(payload.substring(3));
          await NfcManager.instance.stopSession();
        } catch (e) {
          await NfcManager.instance.stopSession(errorMessage: "Failed to read tag");
          onRead("Failed to read tag");
          throw e;
        }
      });
    } catch (e) {
      print("Error starting NFC session: $e");
      throw e;
    }
  }
}
