import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  Future<void> readTag(Function(String) onRead) async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        onRead("Tag is not NDEF formatted");
        return;
      }
      var message = ndef.cachedMessage;
      if (message == null) {
        onRead("No NDEF message found");
        return;
      }
      String payload = String.fromCharCodes(message.records.first.payload);
      onRead(payload);
      NfcManager.instance.stopSession();
    });
  }

  Future<void> writeTag(String data) async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        return;
      }
      var message = NdefMessage([
        NdefRecord.createText(data),
      ]);
      await ndef.write(message);
      NfcManager.instance.stopSession();
    });
  }
}
