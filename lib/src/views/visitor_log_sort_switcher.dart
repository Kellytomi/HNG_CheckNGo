import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorLogSortSwitcher extends StatelessWidget {
  const VisitorLogSortSwitcher(
      {super.key, required this.sort, required this.onSwitch});
  final SortVisitorBy sort;
  final ValueChanged<SortVisitorBy> onSwitch;

  bool get isCheckIn {
    return switch (sort) {
      SortVisitorBy.checkedIn => true,
      SortVisitorBy.checkedOut => false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onSwitch(SortVisitorBy.checkedIn),
          child: _TextItem(
            text: 'Check In',
            isCheckIn: isCheckIn,
          ),
        ),
        GestureDetector(
          onTap: () => onSwitch(SortVisitorBy.checkedOut),
          child: _TextItem(
            text: 'Check Out',
            isCheckIn: !isCheckIn,
          ),
        ),
      ],
    );
  }
}

class _TextItem extends StatelessWidget {
  const _TextItem({required this.text, required this.isCheckIn});
  final String text;
  final bool isCheckIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: isCheckIn ? kPrimaryColor : const Color(0xFF6B6B6B),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: 90,
          height: 2,
          color: isCheckIn ? kPrimaryColor : kOnSurfaceColor2,
        ),
      ],
    );
  }
}
