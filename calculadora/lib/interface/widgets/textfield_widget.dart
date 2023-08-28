import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

class TextFieldWidget extends StatefulWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final double? width;
  final String text;
  const TextFieldWidget(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      required this.text,
      this.hintText,
      this.width});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(),
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widget.prefixIcon == null ? 0 : 8),
              child: Text(widget.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.black.withOpacity(0.8),
                      fontWeight: FontWeight.w600)),
            ),
            Row(
              children: [
                widget.prefixIcon ?? Container(),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: GoogleFonts.poppins()),
                  ),
                ),
                widget.suffixIcon ?? Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
