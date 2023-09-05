import 'package:calculadora/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/interes_rate_input.dart';

class InteresCompuestoPage extends StatelessWidget {
  const InteresCompuestoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        child: Form(
            key: key,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Interés compuest0o",
                      style: GoogleFonts.poppins(
                          color: AppColor.white, fontSize: 18)),
                  const SizedBox(
                    height: 25,
                  ),
                  const interestRateInput(
                    helperText:
                        "Monto de dinero que tiene disponible para invertir inicialmente.",
                    labelText: "Capital",
                    icon: Icons.attach_money_rounded,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  const interestRateInput(
                      helperText:
                          "Es la cantidad de dinero relacionada con el interés por cada 100.",
                      labelText: "Tasa de interés",
                      icon: Icons.percent),
                  SizedBox(
                    height: 25,
                  ),
                  const interestRateInput(
                      helperText:
                          "Es el saldo al final de un período en una inversión o préstamo.",
                      labelText: "Monto compuesto",
                      icon: Icons.attach_money_rounded,),
                ],
              ),
            )),
      ),
    );
  }
}
