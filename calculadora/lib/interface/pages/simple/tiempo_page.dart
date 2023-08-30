import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color.dart';
import '../../widgets/textfield_widget.dart';

class TiempoSimplePage extends StatefulWidget {
  const TiempoSimplePage({super.key});

  @override
  State<TiempoSimplePage> createState() => _TiempoSimplePageState();
}

class _TiempoSimplePageState extends State<TiempoSimplePage> {
  int anios = 0;
  int dias = 0;
  int meses = 0;
  double valorFinal = 0;
  double porcentaje = 0;
  double valorInicial = 0;
  double valorInteres = 0;
  double tiempo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFieldWidget(
              valor: (value) {
                setState(() {
                  valorInicial = value;
                });
              },
              text: 'Monto inicial',
              width: 150,
              prefixIcon: Icon(
                Icons.attach_money_rounded,
                color: Colors.white.withOpacity(0.3),
              ),
              hintText: '0.0',
            ),
            TextFieldWidget(
              valor: (value) {
                setState(() {
                  valorInteres = value;
                });
              },
              text: 'Interes producido',
              width: 150,
              prefixIcon: Icon(
                Icons.attach_money_rounded,
                color: Colors.white.withOpacity(0.3),
              ),
              hintText: '0.0',
            ),
          ],
        ),
        const SizedBox(height: 40),
        TextFieldWidget(
          valor: (value) {
            porcentaje = value;
          },
          text: 'Tasa de interés',
          width: 150,
          hintText: '0.0%',
          textfieldType: TextfieldType.porcent,
        ),
        const SizedBox(height: 40),
        Center(
            child: Text('Tiempo: ${generateTimeString()}',
                style: GoogleFonts.poppins(
                    color: AppColor.white.withOpacity(0.7), fontSize: 21))),
        const SizedBox(height: 40),
        MaterialButton(
            minWidth: 200,
            height: 50,
            color: AppColor.greenLigth,
            onPressed: () {
              calcularValorFinal(context);
            },
            child: const Text(
              'Calcular',
              style: TextStyle(fontWeight: FontWeight.w600),
            )),
      ],
    );
  }

  void calcularValorFinal(BuildContext context) {
    double tasa = porcentaje / 100;
    double valor = 0;
    if (valorInteres != 0 && valorInicial != 0 && porcentaje != 0) {
      valor = valorInicial * tasa;
      valor = valorInteres / valor;
      int totalDays = (valor * 365).floor();
      int yearsInResult = totalDays ~/ 365;
      int monthsInResult = ((totalDays % 365) ~/ 30.44).floor();
      int daysInResult = (totalDays % 30.44).floor();
      setState(() {
        anios = yearsInResult;
        meses = monthsInResult;
        dias = daysInResult;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor ingrese los datos'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  int daysInMonth(int month, int year) {
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 29; // Leap year
      } else {
        return 28;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 30;
    } else {
      return 31;
    }
  }

  String generateTimeString() {
    String timeString = '';

    if (anios > 0) {
      timeString += '$anios años ';
    }
    if (meses > 0) {
      timeString += '$meses meses ';
    }
    if (dias > 0) {
      timeString += '$dias días';
    }

    return timeString.trim(); // Elimina espacios adicionales al final
  }
}
