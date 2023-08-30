import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color.dart';
import '../../widgets/textfield_widget.dart';

class ValorInicialSimplePage extends StatefulWidget {
  const ValorInicialSimplePage({super.key});

  @override
  State<ValorInicialSimplePage> createState() => _ValorInicialSimplePageState();
}

class _ValorInicialSimplePageState extends State<ValorInicialSimplePage> {
  int anios = 0;
  int dias = 0;
  int meses = 0;
  double valorFinal = 0;
  double porcentaje = 0;
  double valorInicial = 0;
  double valorInteres = 0;
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();
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
            TextFieldWidget(
              valor: (value) {
                setState(() {
                  porcentaje = value;
                });
              },
              text: 'Tasa de interés',
              width: 150,
              hintText: '0.0%',
              textfieldType: TextfieldType.porcent,
            ),
          ],
        ),
        const SizedBox(height: 40),
        TextFieldWidget(
          text: 'Seleccione fechas',
          textfieldType: TextfieldType.date,
          width: 250,
          fechaInicio: (value) {
            setState(() {
              fechaInicio = value;
            });
          },
          fechaFin: (value) {
            setState(() {
              fechaFin = value;
            });
          },
        ),
        const SizedBox(height: 40),
        Center(
            child: Text('Valor Final: \$$valorInicial',
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

    if (porcentaje != 0 && valorInteres != 0) {
      setState(() {
        int years = fechaFin.year - fechaInicio.year;
        int months = fechaFin.month - fechaInicio.month;
        int days = fechaFin.day - fechaInicio.day;

        if (days < 0) {
          months--;
          days += daysInMonth(fechaFin.month - 1, fechaFin.year);
        }

        if (months < 0) {
          years--;
          months += 12;
        }

        valorInicial =
            valorInteres / (tasa * (years + (months / 12) + (days / 365)));
        valorInicial = double.parse(valorInicial.toStringAsFixed(2));

        anios = years;
        meses = months;
        dias = days;
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
}
