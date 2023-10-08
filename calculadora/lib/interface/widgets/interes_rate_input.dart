import 'package:calculadora/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestRateInput extends StatelessWidget {
  final String helperText;
  final String labelText;
  final IconData? icon;
  final TextEditingController controller;
  final TextfieldType textfieldType;

  const InterestRateInput({
    Key? key,
    required this.helperText,
    required this.labelText,
    this.icon,
    required this.controller,
    required this.textfieldType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(color: Colors.white),
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.greenLigth,
      inputFormatters: _configureInputFormatters(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        helperText: helperText,
        fillColor: AppColor.primary,
        filled: true,
        helperStyle: GoogleFonts.poppins(color: Colors.white),
        helperMaxLines: 2,
        errorStyle: const TextStyle(fontSize: 15, color: Colors.red),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.white.withOpacity(0.4),
              )
            : null,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.3)),
      ),
    );
  }

  List<TextInputFormatter> _configureInputFormatters() {
    final List<TextInputFormatter> inputFormatters = [];
    if (textfieldType == TextfieldType.number) {
      inputFormatters.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(?:[1-9][0-9]*|0)(?:\.[0-9]*)?$')));
    } else if (textfieldType == TextfieldType.date) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')));
    } else {
      inputFormatters.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(100|\d{1,2}(\.\d*)?|\.\d+)$')));
    }
    return inputFormatters;
  }
}

enum TextfieldType {
  number,
  date,
  other,
}
