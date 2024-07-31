import 'dart:ui';

import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return empty;
  }
}

final activeUsers = Scaffold(
  floatingActionButton: FloatingActionButton.extended(
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    label: Row(
      children: [
        Text(
          'Read Tag to checkout',
          style: GoogleFonts.inter(
              color: const Color(0xfff3f3f3),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 4,
        ),
        const Icon(
          Icons.nfc,
        ),
      ],
    ),
    backgroundColor: kPrimaryColor,
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  body: Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffE6E6E6), Color(0xffD8EBFF)]),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 19),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff003366)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Active visitors",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff707070),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: Color(0xff003366))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add visitor",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff003366),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.add,
                            color: Color(0xff003366),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

final empty = Scaffold(
  body: Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffE6E6E6), Color(0xffD8EBFF)]),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 19),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff003366)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Active visitors",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff707070),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/ghost.svg"),
                      const SizedBox(
                        height: 22.0,
                      ),
                      Text(
                        "It seems like you just got here. you do not have active visitors. Write to NFC tag to start adding visitors.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff6B6E71)),
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xff003366),
                  ),
                ),
                onPressed: () {},
                child: const Text("Write to NFC tag"),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);
