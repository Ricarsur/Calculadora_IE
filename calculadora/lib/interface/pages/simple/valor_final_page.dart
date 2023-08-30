import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color.dart';
import '../../widgets/textfield_widget.dart';

class ValorFinalSimplePage extends StatefulWidget {
  const ValorFinalSimplePage({super.key});

  @override
  State<ValorFinalSimplePage> createState() => _ValorFinalSimplePageState();
}

class _ValorFinalSimplePageState extends State<ValorFinalSimplePage> {
  double valorFinal = 0;
  double porcentaje = 0;
  double valorInicial = 0;
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();
  late int diferenciaEnDias = 0;
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
                valorInicial = value;
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
                porcentaje = value;
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
            child: Text('Valor Final: \$$valorFinal',
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
    int diferencia = fechaFin.difference(fechaInicio).inDays;
    if (porcentaje != 0 && valorInicial != 0) {
      setState(() {
        diferenciaEnDias = diferencia;
        valorFinal = valorInicial * (1 + (tasa) * (diferenciaEnDias / 365));
        valorFinal = double.parse(valorFinal.toStringAsFixed(2));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor ingrese los datos'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
