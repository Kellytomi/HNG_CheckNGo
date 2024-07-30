import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NfcScanContent extends StatelessWidget {
  const NfcScanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ready to read',
            style: GoogleFonts.montserrat(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 48.0),
          SvgPicture.asset('assets/scan.svg'),
          const SizedBox(height: 24.0),
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
