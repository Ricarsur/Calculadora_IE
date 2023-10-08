import 'package:calculadora/interface/pages/compuesto/interes_compuesto_page.dart';
import 'package:calculadora/interface/pages/gradiente/home_gradientes.dart';
import 'package:calculadora/interface/pages/tir/tasa_interes_retorno.dart';
import 'package:calculadora/interface/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [PageInteresSimple(), InteresCompuestoPage(), HomeGradiente(), Tir() ],
        )));
  }
}

class _PageInteresSimpleState extends State<PageInteresSimple> {
  int anios = 0;
  int dias = 0;
  int meses = 0;
  int value = 0;
  double porcentaje = 0;
  double valorInicial = 0;
  double valorInteres = 0;
  String textFecha = 'nada';
  String textoResultado = '';
  // ignore: avoid_init_to_null
  DateTime fechaInicio = DateTime.now();

  // ignore: avoid_init_to_null
  DateTime fechaFin = DateTime.now();
  late int diferenciaEnDias = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Interés simple',
          style: GoogleFonts.poppins(color: AppColor.white, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: value != 1,
          child: TextFieldWidget(
            width: 250,
            valor: (value) {
              valorInicial = value;
              validar();
            },
            text: 'Monto inicial',
            prefixIcon: Icon(
              Icons.attach_money_rounded,
              color: Colors.white.withOpacity(0.3),
            ),
            hintText: '0.0',
          ),
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: value != 2,
          child: TextFieldWidget(
            width: 250,
            valor: (value) {
              porcentaje = value;
              validar();
            },
            text: 'Tasa de interés',
            hintText: '0.0%',
            textfieldType: TextfieldType.porcent,
          ),
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: value != 3,
          child: TextFieldWidget(
            width: 250,
            valor: (value) {
              valorInteres = value;
              validar();
            },
            text: 'Valor interés',
            prefixIcon: Icon(
              Icons.attach_money_rounded,
              color: Colors.white.withOpacity(0.3),
            ),
            hintText: '0.0',
          ),
        ),
        const SizedBox(height: 10),
        Visibility(
            visible: value != 4,
            child: Container(
              width: 250,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Ingrese fecha',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.white.withOpacity(0.8),
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Años',
                        style: GoogleFonts.poppins(
                            color: AppColor.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Meses',
                        style: GoogleFonts.poppins(
                            color: AppColor.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Días',
                        style: GoogleFonts.poppins(
                            color: AppColor.white.withOpacity(0.4)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                anios = int.parse(value);
                              } else {
                                anios = 0;
                              }
                              validar();
                            },
                            cursorColor: AppColor.white,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(color: AppColor.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              meses = int.parse(value);
                            } else {
                              meses = 0;
                            }
                            validar();
                          },
                          cursorColor: AppColor.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.white),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                dias = int.parse(value);
                              } else {
                                dias = 0;
                              }
                              validar();
                            },
                            cursorColor: AppColor.white,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(color: AppColor.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )),
        const SizedBox(height: 30),
        Text(
          textoResultado,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(color: AppColor.white, fontSize: 15),
        ),
      ],
    );
  }

  void calcularTasa() {
    setState(() {
      double pocentajes = 0;
      int years = anios;
      int months = meses;
      int days = dias;
      double valorDia = ((years / 1) + (months / 12) + (days / 365));
      valorDia = valorDia * valorInicial;

      pocentajes = valorInteres / valorDia;

      pocentajes = pocentajes * 100;
      textoResultado = 'Tasa de interés: $pocentajes%';
    });
  }

  void calcularTiempo() {
    double tasa = porcentaje / 100;
    double valor = valorInicial * tasa;
    valor = valorInteres / valor;

    int anios = valor.toInt(); // Extraer los años completos
    double mesesDecimal =
        (valor - anios) * 12; // Calcular los meses en valor decimal
    int meses = mesesDecimal.toInt(); // Extraer los meses completos
    double diasDecimal =
        (mesesDecimal - meses) * 31; // Calcular los días en valor decimal
    int dias = diasDecimal.toInt(); // Extraer los días completos

    setState(() {
      textoResultado = 'Tiempo: ${generateTimeString(anios, meses, dias)}';
    });
  }

  void calcularValorInicial() {
    double valorIni = 0;
    double tasa = porcentaje / 100;
    setState(() {
      int years = anios;
      int months = meses;
      int days = dias;

      valorIni = valorInteres / (tasa * (years + (months / 12) + (days / 365)));

      textoResultado = 'Monto inicial: $valorIni';
    });
  }

  void calcularValorInteres() {
    double capitalFinal = 0;
    double tasa = porcentaje / 100;
    double valorInteres = 0;
    int diasTotal = 0;
    setState(() {
      int years = anios;
      int months = meses;
      int days = dias;
      diasTotal = years * 365 + months * 30 + days;
      valorInteres = (valorInicial * tasa * diasTotal) / 365;
      capitalFinal = valorInicial + valorInteres;

      anios = years;
      meses = months;
      dias = days;

      textoResultado =
          'Interés producido: $valorInteres \n Capital final: $capitalFinal';
    });
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

  String generateTimeString(int anio, int mes, int dia) {
    String timeString = '';

    if (anio > 0) {
      timeString += '$anio años ';
    }
    if (mes > 0) {
      timeString += '$mes meses ';
    }
    if (dia > 0) {
      timeString += '$dia días';
    }

    return timeString.trim(); // Elimina espacios adicionales al final
  }

  void validar() {
    //calcular tasa de interes y esconder el campo
    if (valorInicial != 0 &&
        valorInteres != 0 &&
        (anios != 0 || meses != 0 || dias != 0)) {
      setState(() {
        value = 2;
      });
      calcularTasa();

      //calcular valor interes y esconder el campo
    } else if (valorInicial != 0 &&
        porcentaje != 0 &&
        (anios != 0 || meses != 0 || dias != 0)) {
      setState(() {
        value = 3;
      });
      calcularValorInteres();

      //calcular Capital y esconder el campo
    } else if (valorInteres != 0 &&
        porcentaje != 0 &&
        (anios != 0 || meses != 0 || dias != 0)) {
      setState(() {
        value = 1;
      });
      calcularValorInicial();
    } //calcular Tiempo y esconder el campo
    else if (valorInteres != 0 && valorInicial != 0 && porcentaje != 0) {
      setState(() {
        value = 4;
      });
      calcularTiempo();
    } else {
      setState(() {
        value = 0;
        textoResultado = '';
      });
    }
  }
}
