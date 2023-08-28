import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

class BottomMenuWidget extends StatefulWidget {
  final Function(int) onPageChanged;
  const BottomMenuWidget({super.key, required this.onPageChanged});

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconButtonMenu('Interés simple', 'assets/icons/interes-simple.png',
              () {
            widget.onPageChanged(0);
          }),
          iconButtonMenu(
              'Interés compuesto', 'assets/icons/interes-compuesto.png', () {
            widget.onPageChanged(1);
          }),
        ],
      ),
    );
  }

  Expanded iconButtonMenu(
      String text, String image, VoidCallback voidCallback) {
    return Expanded(
      child: GestureDetector(
        onTap: voidCallback,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                color: AppColor.white,
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: GoogleFonts.poppins(color: AppColor.white, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
