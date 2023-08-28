import 'package:calculadora/interface/widgets/top_menu_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../widgets/bottom_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class PageInteresSimple extends StatefulWidget {
  const PageInteresSimple({
    super.key,
  });

  @override
  State<PageInteresSimple> createState() => _PageInteresSimpleState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth / 6),
          child: BottomMenuWidget(
            onPageChanged: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        ),
        backgroundColor: AppColor.background,
        body: SafeArea(
            child: PageView(
          controller: _pageController,
          children: [
            const PageInteresSimple(),
            Center(
              child: Text('Interes compuesto',
                  style: TextStyle(color: AppColor.white)),
            )
          ],
        )));
  }
}

class _PageInteresSimpleState extends State<PageInteresSimple> {
  final PageController _subPageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopMenuWidget(
          onPageChanged: (index) {
            _subPageController.jumpToPage(index);
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: PageView(
            controller: _subPageController,
            children: [
              Center(
                child: Text('1', style: TextStyle(color: AppColor.white)),
              ),
              Center(
                child: Text('2', style: TextStyle(color: AppColor.white)),
              ),
              Center(
                child: Text('3', style: TextStyle(color: AppColor.white)),
              ),
              Center(
                child: Text('4', style: TextStyle(color: AppColor.white)),
              ),
              Center(
                child: Text('5', style: TextStyle(color: AppColor.white)),
              ),
            ],
          ),
        )
        /* TextFieldWidget(
          text: 'Monto inicial',
          width: 150,
          prefixIcon: Icon(
            Icons.attach_money_rounded,
            color: Colors.white.withOpacity(0.3),
          ),
          hintText: '0.00',
        ), */
      ],
    );
  }
}
