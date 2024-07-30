import 'package:checkngo/src/views/nfc_scan_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDialogs {
  static Future<T?> showAlertDialog<T>(BuildContext context,
      {required Widget child,
      bool isDismissible = true,
      Color? backgroundColor}) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (innerContext) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Dialog(
              insetPadding: const EdgeInsets.all(20.0),
              backgroundColor: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                  minWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [child],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showSuccessDialog({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    return showAlertDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Completed',
              style: GoogleFonts.montserrat(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24.0),
            SvgPicture.asset('assets/success.svg'),
            const SizedBox(height: 26.0),
            Text(
              'NFC tag reading has been completed. Click ‘Proceed’  to continue',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: const Color(0xFF4B5563),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> showErrorDialog({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    return showAlertDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Error',
              style: GoogleFonts.montserrat(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24.0),
            SvgPicture.asset('assets/error.svg'),
            const SizedBox(height: 26.0),
            Text(
              'Device could not read NFC Tag',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: const Color(0xFF4B5563),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> showNFCScan({
    required BuildContext context,
  }) {
    return showAlertDialog(
      context,
      child: NfcScanContent(),
    );
  }
}
