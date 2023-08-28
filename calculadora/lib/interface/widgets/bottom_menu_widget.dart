import 'package:flutter/material.dart';

import '../../constants/color.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({super.key});

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
            print('boton 1');
          }),
          iconButtonMenu(
              'Interés compuesto', 'assets/icons/interes-compuesto.png', () {
            print('boton 2');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: AppColor.white,
              width: 26,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(color: AppColor.white, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
