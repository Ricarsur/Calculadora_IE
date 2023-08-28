import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../widgets/bottom_menu_widget.dart';
import '../widgets/textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth / 7.2),
          child: const BottomMenuWidget(),
        ),
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            children: [
              TextFieldWidget(
                text: 'Monto inicial',
                prefixIcon: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.black.withOpacity(0.3),
                ),
                hintText: '0.00',
              ),
            ],
          ),
        ));
  }
}
