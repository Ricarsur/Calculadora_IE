import 'package:calculadora/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/interes_compuesto.dart';
import 'widget/interes_rate_input.dart';

class InteresCompuestoPage extends StatelessWidget {
  final compuesto = InteresCompuesto();
  @override
  final key = GlobalKey();
  final capitalController = TextEditingController();
  final TasaIController = TextEditingController();
  final MontoCompController = TextEditingController();
  final tiempoController = const TextEditingValue();
  InteresCompuestoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        child: Form(
            key: key,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Interés compuesto",
                      style: GoogleFonts.poppins(
                          color: AppColor.white, fontSize: 18)),
                  const SizedBox(
                    height: 25,
                  ),
                  InterestRateInput(
                    helperText:
                        "Monto de dinero que tiene disponible para invertir inicialmente.",
                    labelText: "Capital",
                    icon: Icons.attach_money_rounded,
                    controller: capitalController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InterestRateInput(
                    helperText:
                        "Es la cantidad de dinero relacionada con el interés por cada 100.",
                    labelText: "Tasa de interés",
                    icon: Icons.percent,
                    controller: TasaIController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InterestRateInput(
                    helperText:
                        "Es el saldo al final de un período en una inversión o préstamo.",
                    labelText: "Monto compuesto",
                    icon: Icons.attach_money_rounded,
                    controller: MontoCompController,
                  ),
                  const SizedBox(height: 25),
                  Text("${compuesto.calcularCapital(12, 250000, 2)}"),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      datoCalcular(context);
                    },
                    child: const Text('Calcular'),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void datoCalcular(BuildContext context) {
    // Obtenemos el texto de los controladores de texto
    final capitalText = capitalController.text;
    final tasaInteresText = TasaIController.text;
    final montoCompuestoText = MontoCompController.text;

    // Verificamos si alguno de los campos está vacío
    if (capitalText.isEmpty ||
        tasaInteresText.isEmpty ||
        montoCompuestoText.isEmpty) {
      // Mostrar un mensaje de error o tomar alguna acción en caso de campos vacíos
      // Por ejemplo, mostrar un diálogo de error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Por favor, complete todos los campos antes de calcular.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Si todos los campos están completos, puedes realizar el cálculo aquí
      // Aquí puedes llamar a la función que realiza el cálculo
      final capital = double.parse(capitalText);
      final tasaInteres = double.parse(tasaInteresText);
      final montoCompuesto = double.parse(montoCompuestoText);

      final resultado = compuesto.calcularCapital(capital, tasaInteres,
          tiempoController); // Asegúrate de que calcularCapital acepte los parámetros adecuados

      // Mostrar el resultado o realizar otras acciones según tu necesidad
      print('El resultado es: $resultado');
    }
  }
}
