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
  int _currentPage = 0;
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
          },
              _currentPage == 0
                  ? AppColor.white
                  : AppColor.white.withOpacity(0.3),
              0),
          iconButtonMenu(
              'Interés compuesto', 'assets/icons/interes-compuesto.png', () {
            widget.onPageChanged(1);
          },
              _currentPage == 1
                  ? AppColor.white
                  : AppColor.white.withOpacity(0.3),
              1),
              iconButtonMenu(
                  'Gradiente', 'assets/icons/graph.png', () {
            widget.onPageChanged(2);
            },
              _currentPage == 2
              ? AppColor.white
              : AppColor.white.withOpacity(0.3),
              2),
              iconButtonMenu(
                  'Tasa de retorno', 'assets/icons/align.png', () {
            widget.onPageChanged(3);
            },
              _currentPage == 3
              ? AppColor.white
              : AppColor.white.withOpacity(0.3),
              3),
        ],
      ),
    );
  }

  Expanded iconButtonMenu(String text, String image, VoidCallback voidCallback,
      Color color, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          voidCallback();
          setState(() {
            _currentPage = index;
          });
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                color: color,
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(color: color, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
