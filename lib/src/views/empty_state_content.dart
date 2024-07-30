import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyStateContent extends StatelessWidget {
  const EmptyStateContent({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/empty_state.svg'),
          const SizedBox(height: 24.62),
          Text(
            // 'There is currently no log history. Start checking visitors in by writing to NFC tags.',
            text,
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: kFontColor3,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
