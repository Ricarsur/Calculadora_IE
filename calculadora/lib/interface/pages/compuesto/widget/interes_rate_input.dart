import 'package:calculadora/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class interestRateInput extends StatelessWidget {
  final String helperText;
  final String labelText;
  final IconData? icon;
  final TextEditingController controller;
  const interestRateInput({
    super.key,
    required this.helperText,
    required this.labelText,
    this.icon, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        style: GoogleFonts.poppins(color: Colors.white),
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: AppColor.greenLigth,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          helperText: helperText,
          fillColor: AppColor.primary,
          filled: true,
          helperStyle: GoogleFonts.poppins(color: Colors.white),
          helperMaxLines: 2,
          errorStyle: TextStyle(fontSize: 18, color: Colors.red),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          prefixIcon: icon != null?  Icon(
            icon,
            color: Colors.white.withOpacity(0.4),
          ) :  null,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
          hintStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}