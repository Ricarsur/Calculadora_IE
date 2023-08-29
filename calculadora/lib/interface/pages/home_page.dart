import 'package:calculadora/interface/widgets/top_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/color.dart';
import '../widgets/bottom_menu_widget.dart';
import '../widgets/textfield_widget.dart';

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
          physics: const NeverScrollableScrollPhysics(),
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
  double paddingText = 0;
  final PageController _subPageController = PageController();
  @override
  Widget build(BuildContext context) {
    DateTime dateTimeNow = DateTime.now();
    DateTime addAnio = dateTimeNow.add(
      const Duration(days: 365),
    );
    return Column(
      children: [
        const SizedBox(height: 20),
        TopMenuWidget(
          onPageChanged: (index) {
            _subPageController.jumpToPage(index);
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _subPageController,
            children: [
              valorFinal(dateTimeNow, addAnio),
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
        ),
      ],
    );
  }

  Padding valorFinal(DateTime dateTimeNow, DateTime addAnio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldWidget(
                text: 'Monto inicial',
                width: 150,
                prefixIcon: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white.withOpacity(0.3),
                ),
                hintText: '0.0',
              ),
              const TextFieldWidget(
                text: 'Tasa de interés',
                width: 150,
                hintText: '0.0%',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldWidget(
                text: 'Fecha inicial',
                width: 150,
                hintText:
                    DateFormat('dd/MM/yyyy').format(dateTimeNow).toString(),
              ),
              TextFieldWidget(
                text: 'Fecha final',
                width: 150,
                hintText: DateFormat('dd/MM/yyyy').format(addAnio).toString(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
              child: Text('Valor Final: \$200',
                  style: GoogleFonts.poppins(
                      color: AppColor.white.withOpacity(0.7), fontSize: 21))),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  minWidth: 200,
                  height: 50,
                  color: AppColor.greenLigth,
                  onPressed: () {},
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
              const SizedBox(width: 10),
              MaterialButton(
                height: 50,
                minWidth: 10,
                color: Colors.redAccent,
                onPressed: () {},
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColor.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
