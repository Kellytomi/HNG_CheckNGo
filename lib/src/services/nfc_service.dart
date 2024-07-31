import 'package:checkngo/src/utils/custom_exception.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  Future<void> writeTag(String data) async {
    final isAvailable = await NfcManager.instance.isAvailable();
    if (!isAvailable) {
      throw CustomException(
          'Trouble detecting the NFC service. Make sure this device is NFC enabled, or go to device settings and turn on NFC.');
    }

    var successful = false;
    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          try {
            var ndef = Ndef.from(tag);
            if (ndef == null) {
              throw CustomException('Tnot NDEF formatted');
            }
            var message = NdefMessage([
              NdefRecord.createText(data),
            ]);
            await ndef.write(message);
            successful = true;
            await NfcManager.instance.stopSession();
          } catch (e) {
            await NfcManager.instance
                .stopSession(errorMessage: "Failed to write tag");
            rethrow;
          }
        },
        onError: (e) {
          throw e;
        },
      );
      if (!successful) {
        await writeTag(data);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> readTag(Function(String) onRead) async {
    final isAvailable = await NfcManager.instance.isAvailable();
    if (!isAvailable) {
      throw CustomException(
          'Trouble detecting the NFC service. Make sure this device is NFC enabled, or go to device settings and turn on NFC.');
    }

    var successful = false;

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
          successful = true;
          await NfcManager.instance.stopSession();
        } catch (e) {
          await NfcManager.instance
              .stopSession(errorMessage: "Failed to read tag");
          onRead("Failed to read tag");
          rethrow;
        }
      });

      if (!successful) {
        await readTag(onRead);
      }
    } catch (e) {
      rethrow;
    }
  }
}
