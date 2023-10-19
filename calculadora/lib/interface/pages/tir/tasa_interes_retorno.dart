import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../models/tir/tasa_interna.dart';
import '../gradiente/aritmetico/widgets/group_input.dart';
import '../gradiente/widget/button.dart';

class Tir extends StatefulWidget {
  const Tir({super.key});

  @override
  State<Tir> createState() => _TirState();
}

class _TirState extends State<Tir> {
  double valorActual = 0;
  double valorTasaInterna = 0;
  final montoController = TextEditingController();
  final interesController = TextEditingController();
  final primerFlujoController = TextEditingController();
  final segundoFlujoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                GroupInputT(
                  montoController: montoController,
                  interesController: interesController,
                  primerAnioController: primerFlujoController,
                  segundoAnioController: segundoFlujoController,
                ),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  calculo: () {
                    setState(() {
                      valorTasaInterna = calcularTIR();
                      valorActual = calcularVAN();
                    });
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Valor actual neto: \$ $valorActual",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Tasa interna de retorno: $valorTasaInterna %",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  double calcularTIR() {
    double valorActual = 0;
    double monto = double.parse(montoController.text);
    double primerFlujo = double.parse(primerFlujoController.text);
    double segundoFlujo = double.parse(segundoFlujoController.text);
    valorActual = TasaInternaRetorno.calcularTIR(primerFlujo, segundoFlujo, monto);
    return valorActual;
  }

  double calcularVAN() {
    double valorActual = 0;
    double monto = double.parse(montoController.text);
    double interes = double.parse(interesController.text) / 100;
    double primerFlujo = double.parse(primerFlujoController.text);
    double segundoFlujo = double.parse(segundoFlujoController.text);
    valorActual = TasaInternaRetorno.calcularVAN(interes, [primerFlujo, segundoFlujo], monto);
    return valorActual;
  }
}
