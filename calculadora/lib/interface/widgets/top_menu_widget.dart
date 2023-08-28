import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

class TopMenuWidget extends StatefulWidget {
  final Function(int) onPageChanged;
  const TopMenuWidget({super.key, required this.onPageChanged});

  @override
  State<TopMenuWidget> createState() => _TopMenuWidgetState();
}

class _TopMenuWidgetState extends State<TopMenuWidget> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeWidth / 8.5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemTextMenu('Valor final', () {
            widget.onPageChanged(0);
          }, _index == 0 ? AppColor.white : AppColor.white.withOpacity(0.3), 0),
          itemTextMenu('Valor inicial', () {
            widget.onPageChanged(1);
          }, _index == 1 ? AppColor.white : AppColor.white.withOpacity(0.3), 1),
          itemTextMenu('Interés', () {
            widget.onPageChanged(2);
          }, _index == 2 ? AppColor.white : AppColor.white.withOpacity(0.3), 2),
          itemTextMenu('Tasa de interés', () {
            widget.onPageChanged(3);
          }, _index == 3 ? AppColor.white : AppColor.white.withOpacity(0.3), 3),
          itemTextMenu('Tiempo', () {
            widget.onPageChanged(4);
          }, _index == 4 ? AppColor.white : AppColor.white.withOpacity(0.3), 4),
        ],
      ),
    );
  }

  GestureDetector itemTextMenu(
      String text, VoidCallback voidCallback, Color color, int index) {
    return GestureDetector(
      onTap: () {
        voidCallback();
        setState(() {
          _index = index;
        });
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(color: color, fontSize: 10),
      ),
    );
  }
}
