import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: commonPadding,
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/iphone.png'),
                    const SizedBox(height: 50),
                    Text(
                      'Innovating checkout process. Helping businesses manage their visitors.',
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        color: kFontColor3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/tab');
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
