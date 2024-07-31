import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class VisitorLogTile extends StatelessWidget {
  const VisitorLogTile(
      {super.key, required this.visitor, required this.sort, this.onTap});
  final Visitor visitor;
  final SortVisitorBy sort;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 19.06, horizontal: 16.05),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: kBGColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color(0xFFDADADA)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(107, 110, 113, 0.33),
              offset: Offset(0.5, 0.5),
              blurRadius: 2.01,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  visitor.fullname,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.05,
                    color: kFontColor3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      sort == SortVisitorBy.checkedIn
                          ? 'Checked In'
                          : 'Checked Out',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.04,
                        color: sort == SortVisitorBy.checkedIn
                            ? kGreenColor
                            : kRedColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: kOnSurfaceColor,
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  visitor.phone,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.04,
                    color: const Color(0xFF797979),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  sort == SortVisitorBy.checkedIn
                      ? visitor.checkedInAt.vDTFormat
                      : DateFormat('MMM d, yyyy, h:mm a')
                          .format(visitor.checkedOutAt!),
                  style: GoogleFonts.montserrat(
                    fontSize: 10.03,
                    color: const Color(0xFF797979),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
