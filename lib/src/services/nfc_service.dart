import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  bool _isProcessing = false;
  String _message = '';

  bool get isProcessing => _isProcessing;

  String get message => _message;

  Future<void> startNFCOperation(
      {required NFCOperation nfcOperation, String data = ''}) async {
    try {
      _isProcessing = true;

      final isAvail = await NfcManager.instance.isAvailable();

      if (isAvail) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag nfcTag) async {
            if (nfcOperation == NFCOperation.read) {
              _readFromTag(tag: nfcTag);
            } else if (nfcOperation == NFCOperation.write) {
              _writeToTag(nfcTag: nfcTag, data: data);
            }

            _isProcessing = false;
            await NfcManager.instance.stopSession();
          },
          onError: (e) async {
            _isProcessing = false;
            _message = 'Oops. An error occurred while scanning';
          },
        );
      } else {
        _isProcessing = false;
        _message =
            'Oops. Trouble detecting the NFC service. Make sure this device is NFC enabled, or go to device settings and turn on NFC.';
      }
    } catch (e) {
      _isProcessing = false;
      _message = 'Oops. An error occurred while scanning';
    }
  }

  Future<void> _readFromTag({required NfcTag tag}) async {
    Map<String, dynamic> nfcData = {
      'nfca': tag.data['nfca'],
      'mifareultralight': tag.data['mifareultralight'],
      'ndef': tag.data['ndef']
    };

    String? decodedText;
    if (nfcData.containsKey('ndef')) {
      List<int> payload =
          nfcData['ndef']['cachedMessage']?['records']?[0]['payload'];
        // The first byte indicates the language code length
      final languageCodeLength = payload[0];
        // The text starts after the language code
        decodedText = String.fromCharCodes(payload.sublist(languageCodeLength + 1));
    }

    _message = decodedText ?? 'Oops. No data found on this NFC';
  }

  Future<void> _writeToTag({
    required NfcTag nfcTag,
    required String data,
  }) async {
    NdefMessage message = NdefMessage([NdefRecord.createText(data)]);
    await Ndef.from(nfcTag)?.write(message);
  }
}

enum NFCOperation { read, write }
