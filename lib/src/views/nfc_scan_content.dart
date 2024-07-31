import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NfcScanContent extends StatelessWidget {
  const NfcScanContent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30.16),
          Lottie.asset(
            'assets/animations/nfc.json',
            height: 120.0,
            width: 120.0,
          ),
          const SizedBox(height: 24.08),
          Text(
            'Please bring an NFC Tag close to device',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: const Color(0xFF4B5563),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
