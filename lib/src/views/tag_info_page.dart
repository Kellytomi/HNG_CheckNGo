import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/utils/date_formatter.dart';
import 'package:checkngo/src/views/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TagInfoPage extends StatelessWidget {
  const TagInfoPage({
    super.key,
    required this.visitor,
    this.buttonText,
    this.onPressed,
    this.onCancel,
  });
  final Visitor visitor;
  final String? buttonText;
  final Function(BuildContext)? onPressed;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: commonPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCard(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'Tag Information',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: const Color(0xFF2A2A2A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 43.0),
                      SvgPicture.asset(
                        'assets/success.svg',
                        height: 68.89,
                        width: 68.89,
                        colorFilter: const ColorFilter.mode(
                            kSwatchColor, BlendMode.srcIn),
                      ),
                      const SizedBox(height: 43.0),
                      Text(
                        'Status: Checked ${visitor.status.name}',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.06,
                          color: kSwatchColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16.05),
                      _ItemTile(
                          leftText: 'Full Name', rightText: visitor.fullname),
                      _ItemTile(
                          leftText: 'Phone Number', rightText: visitor.phone),
                      if (visitor.email != null)
                        _ItemTile(
                          leftText: 'Email Address',
                          rightText: visitor.email!,
                        ),
                      if (visitor.isCheckedOut)
                        _ItemTile(
                            leftText: 'Date',
                            rightText: visitor.checkedOutAt!.vDateFormat),
                      if (!visitor.isCheckedOut)
                        _ItemTile(
                            leftText: 'Date',
                            rightText: visitor.checkedInAt.vDateFormat),
                      if (visitor.isCheckedOut)
                        _ItemTile(
                            leftText: 'Time',
                            rightText: visitor.checkedOutAt!.vTimeFormat),
                      if (!visitor.isCheckedOut)
                        _ItemTile(
                            leftText: 'Time',
                            rightText: visitor.checkedInAt.vTimeFormat),
                      if (visitor.visitReason != null)
                        _ItemTile(
                          leftText: 'Reason for Visit',
                          rightText: visitor.visitReason!,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 23.0),
                ElevatedButton(
                  onPressed: () => onPressed?.call(context),
                  child: Text(buttonText ?? 'Back to home'),
                ),
                if (onCancel != null)
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.leftText, required this.rightText});
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            leftText,
            style: GoogleFonts.montserrat(
              fontSize: 12.04,
              color: const Color(0xFF6B6B6B),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              rightText,
              style: GoogleFonts.montserrat(
                fontSize: 18.06,
                color: const Color(0xFF2A2A2A),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
