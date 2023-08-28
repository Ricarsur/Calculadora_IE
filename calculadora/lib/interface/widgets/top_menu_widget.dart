import 'package:flutter/material.dart';

import '../../constants/color.dart';

class TopMenuWidget extends StatefulWidget {
  const TopMenuWidget({super.key});

  @override
  State<TopMenuWidget> createState() => _TopMenuWidgetState();
}

class _TopMenuWidgetState extends State<TopMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
