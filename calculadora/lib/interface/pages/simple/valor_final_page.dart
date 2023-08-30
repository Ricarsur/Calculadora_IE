import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/color.dart';
import '../../widgets/textfield_widget.dart';

class ValorFinalSimplePage extends StatefulWidget {
  const ValorFinalSimplePage({super.key});

  @override
  State<ValorFinalSimplePage> createState() => _ValorFinalSimplePageState();
}

class _ValorFinalSimplePageState extends State<ValorFinalSimplePage> {
  String? option = 'fecha';
  double valorFinal = 0;
  double porcentaje = 0;
  double valorInicial = 0;
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();
  late int diferenciaEnDias = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width / 12),
            child: Row(children: [
              Expanded(
                child: RadioListTile(
                  fillColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColor.greenLigth;
                      } else {
                        return AppColor.white.withOpacity(0.7);
                      }
                    },
                  ),
                  title: Text(
                    "Seleccionar fechas",
                    style: GoogleFonts.poppins(
                        color: AppColor.white.withOpacity(0.7)),
                  ),
                  value: "fecha",
                  groupValue: option,
                  onChanged: (value) {
                    setState(() {
                      option = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  fillColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColor.greenLigth;
                      } else {
                        return AppColor.white.withOpacity(0.7);
                      }
                    },
                  ),
                  title: Text("Digitar tiempo",
                      style: GoogleFonts.poppins(
                          color: AppColor.white.withOpacity(0.7))),
                  value: "tiempo",
                  groupValue: option,
                  onChanged: (value) {
                    setState(() {
                      option = value.toString();
                    });
                  },
                ),
              ),
            ]),
          ),
          const SizedBox(height: 40),
          option == 'fecha'
              ? TextFieldWidget(
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
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textfieldFecha('Años', 2),
                    const SizedBox(width: 15),
                    textfieldFecha('Meses', 2),
                    const SizedBox(width: 15),
                    textfieldFecha('Días', 3)
                  ],
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
      ),
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

  Widget textfieldFecha(String text, int maxNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(color: AppColor.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 50,
          width: 45,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.greenLigth),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxNumber),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: AppColor.white),
            cursorColor: AppColor.greenLigth,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
