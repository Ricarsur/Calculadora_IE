import 'package:calculadora/interface/pages/compuesto/interes_compuesto_page.dart';
import 'package:calculadora/interface/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
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
          children: [
            const PageInteresSimple(),
            const InteresCompuestoPage()
          ],
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
          child: TextFieldWidget(
            text: 'Seleccione fechas',
            textfieldType: TextfieldType.date,
            width: 250,
            textoFecha: (value) {
              textFecha = value;
            },
            fechaInicio: (value) {
              setState(() {
                fechaInicio = value;
                validar();
              });
            },
            fechaFin: (value) {
              setState(() {
                fechaFin = value;
                validar();
              });
            },
          ),
        ),
        const SizedBox(height: 30),
        Text(
          textoResultado,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(color: AppColor.white, fontSize: 15),
        )
      ],
    );
  }

  void calcularTasa() {
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
      double valorDia = ((years / 1) + (months / 12) + (days / 365));
      valorDia = valorDia * valorInicial;

      porcentaje = valorInteres / valorDia;

      anios = years;
      meses = months;
      dias = days;
      porcentaje = porcentaje * 100;
      textoResultado = 'Tasa de interés: $porcentaje%';
    });
  }

  void calcularTiempo() {
    double tasa = porcentaje / 100;
    double valor = 0;
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
      textoResultado = 'Tiempo: ${generateTimeString()}';
    });
  }

  void calcularValorInicial() {
    double valorIni = 0;
    double tasa = porcentaje / 100;
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

      valorIni = valorInteres / (tasa * (years + (months / 12) + (days / 365)));

      anios = years;
      meses = months;
      dias = days;
      textoResultado = 'Monto inicial: $valorIni';
    });
  }

  void calcularValorInteres() {
    double tasa = porcentaje / 100;
    double valorInteress = 0;
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

      valorInteress =
          valorInicial * (tasa) * (years + (months / 12) + (days / 365));

      anios = years;
      meses = months;
      dias = days;
      textoResultado = 'Interés producido: $valorInteress';
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

  void validar() {
    //calcular tasa de interes y esconder el campo
    if (valorInicial != 0 && valorInteres != 0 && textFecha != 'nada') {
      setState(() {
        value = 2;
      });
      calcularTasa();

      //calcular valor interes y esconder el campo
    } else if (valorInicial != 0 && porcentaje != 0 && textFecha != 'nada') {
      setState(() {
        value = 3;
      });
      calcularValorInteres();

      //calcular Capital y esconder el campo
    } else if (valorInteres != 0 && porcentaje != 0 && textFecha != 'nada') {
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
