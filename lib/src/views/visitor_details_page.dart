import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/utils/date_formatter.dart';
import 'package:checkngo/src/views/custom_card.dart';
import 'package:checkngo/src/views/jagged_line_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorDetailsPage extends StatelessWidget {
  const VisitorDetailsPage({super.key, required this.visitor});
  final Visitor visitor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visitor\'s Details')),
      body: SafeArea(
        child: Padding(
          padding: commonPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  visitor.fullname,
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    color: const Color(0xFF2A2A2A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 11.14),
                Text(
                  'Status: Checked ${visitor.status.name}',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.05,
                    color: visitor.status.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 28.13),
                CustomCard(
                  child: Column(
                    children: [
                      Padding(
                        padding: _cardPadding,
                        child: Column(
                          children: [
                            const SizedBox(height: 46.0),
                            if (visitor.email != null) ...[
                              _ContactTile(
                                leftText: 'Email address',
                                rightText: visitor.email!,
                              ),
                              const SizedBox(height: 18.6),
                            ],
                            _ContactTile(
                              leftText: 'Phone number',
                              rightText: visitor.phone,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      CustomPaint(
                        size: const Size(double.infinity, 2.0),
                        painter: JaggedLinePainter(),
                      ),
                      const SizedBox(height: 46.0),
                      Padding(
                        padding: _cardPadding,
                        child: Column(
                          children: [
                            _DateTimeText(
                              text: VisitorStatus.checkIn.name,
                              date: visitor.checkedInAt,
                            ),
                            if (visitor.checkedOutAt != null) ...[
                              const SizedBox(height: 18.6),
                              _DateTimeText(
                                text: VisitorStatus.checkOut.name,
                                date: visitor.checkedOutAt!,
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (visitor.visitReason != null) ...[
                        const SizedBox(height: 46.0),
                        CustomPaint(
                          size: const Size(double.infinity, 2.0),
                          painter: JaggedLinePainter(),
                        ),
                        const SizedBox(height: 19.0),
                        Padding(
                          padding: _cardPadding,
                          child: _ContactTile(
                            leftText: 'Reason for visit',
                            rightText: visitor.visitReason!,
                          ),
                        ),
                      ],
                      const SizedBox(height: 46.0),
                    ],
                  ),
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: commonPadding.copyWith(bottom: 24.0, top: 8.0),
        child: ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({required this.leftText, required this.rightText});
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            leftText,
            style: GoogleFonts.montserrat(
              fontSize: 14.0,
              color: kFontColor2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Text(
            rightText,
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: kFontColor3,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _DateTimeText extends StatelessWidget {
  const _DateTimeText({required this.date, required this.text});
  final DateTime date;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Checked $text',
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            color: kFontColor2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Text(
                date.vDateFormat,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: kFontColor3,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                date.vTimeFormat,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: kFontColor3,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const _cardPadding = EdgeInsets.symmetric(horizontal: 19.0);
