import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.label,
    this.isOptional = false,
    this.hintText,
    this.maxLines,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.textInputAction,
  });
  final String label;
  final bool isOptional;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isOptional) ...[
              const SizedBox(width: 20.0),
              Text(
                'Optional',
                style: GoogleFonts.montserrat(
                  fontSize: 12.0,
                  color: const Color(0xFF3478F5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          cursorColor: kPrimaryColor,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: const Color(0xFF595959),
            fontWeight: FontWeight.w500,
          ),
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          validator: validator,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFF9F9F9),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 17.0),
            hintStyle: const TextStyle(
              fontSize: 12.0,
              color: kFontColor2,
              fontWeight: FontWeight.w500,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.03)),
              borderSide: BorderSide(color: Color(0xFFA7A7A7)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.03)),
              borderSide: BorderSide(color: Color(0xFFA7A7A7)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.03)),
              borderSide: BorderSide(color: Color(0xFFA7A7A7)),
            ),
          ),
        ),
      ],
    );
  }
}
