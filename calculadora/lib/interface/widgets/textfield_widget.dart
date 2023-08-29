import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

enum TextfieldType {
  number,
  date,
  porcent,
}

class TextFieldWidget extends StatefulWidget {
  final TextfieldType? textfieldType;
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
      this.width = 200,
      this.textfieldType = TextfieldType.number});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  late List<TextInputFormatter> textInputFormatter = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(),
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widget.prefixIcon == null ? 0 : 8),
              child: Text(widget.text,
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500)),
            ),
            Row(
              children: [
                widget.prefixIcon ?? Container(),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    inputFormatters: textInputFormatter,
                    style: GoogleFonts.poppins(color: AppColor.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: GoogleFonts.poppins(
                            color: AppColor.white.withOpacity(0.3))),
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

  @override
  void initState() {
    super.initState();
    if (widget.textfieldType == TextfieldType.number) {
      textInputFormatter.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(?:[1-9][0-9]*|0)(?:\.[0-9]*)?$')));
      /* textInputFormatter
          .add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))); */
    } else if (widget.textfieldType == TextfieldType.date) {
      textInputFormatter
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')));
    } else {
      textInputFormatter.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(?!100(\.0*)?$)(\d{1,2}(\.\d*)?|\.\d+)$')));
    }
  }
}
