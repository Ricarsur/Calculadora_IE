import 'compuesto.dart';

class InteresCompuestoPage extends StatefulWidget {
  const InteresCompuestoPage({super.key});

  @override
  State<InteresCompuestoPage> createState() => _InteresCompuestoPageState();
}

class _InteresCompuestoPageState extends State<InteresCompuestoPage> {
  final compuesto = InteresCompuesto();
  String valorCombo = "";
  String resultado = "";
  double valorPeriodo = 0;
  double valorTasa = 0;
  int tiempoC = 8;

  final capitalController = TextEditingController();

  final tasaIController = TextEditingController();

  final montoCompController = TextEditingController();

  final tiempoController = TextEditingController();

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
                Text("Interés compuesto",
                    style: GoogleFonts.poppins(
                        color: AppColor.white, fontSize: 18)),
                const SizedBox(
                  height: 25,
                ),
                InterestRateInput(
                  textfieldType: TextfieldType.number,
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
                  textfieldType: TextfieldType.other,
                  helperText:
                      "Es la cantidad de dinero relacionada con el interés por cada 100.",
                  labelText: "Tasa de interés",
                  icon: Icons.percent,
                  controller: tasaIController,
                ),
                const SizedBox(
                  height: 25,
                ),
                InterestRateInput(
                  textfieldType: TextfieldType.number,
                  helperText:
                      "Es el saldo al final de un período en una inversión o préstamo.",
                  labelText: "Monto compuesto",
                  icon: Icons.attach_money_rounded,
                  controller: montoCompController,
                ),
                const SizedBox(height: 25),
                TimeWidget(
                  tiempoController: tiempoController,
                  valor: (valor) {
                    valorCombo = valor;
                  },
                ),
                const SizedBox(height: 15),
                Text(resultado,
                    style: GoogleFonts.poppins(color: Colors.white)),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    final nuevoResultado = datoCalcular(context);
                    setState(() {
                      resultado = nuevoResultado;
                    });
                  },
                  child: const Text('Calcular'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Visibility(
                    visible: valorPeriodo != 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(tiempoC, (index) {
                        return Text(
                          "Periodo ${index + 1} = ${calcularMontoPeriodo()}",
                          style: GoogleFonts.poppins(color: Colors.white),
                        );
                      }),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  String calcularMontoPeriodo() {
    double valor = 0;
    setState(() {
      valorPeriodo = valorPeriodo * (1 + valorTasa);
      valor = valorPeriodo;
    });

    return valor.toString();
  }

  dynamic conversionFecha() {
    num tiempoFinal;
    final tiempo = int.parse(tiempoController.text);
    if (capitalController.text.isEmpty) {
      switch (valorCombo) {
        case 'Diario':
          tiempoFinal = tiempo / 365;
          break;
        case 'Mensual':
          tiempoFinal = tiempo / 12;
          break;
        case 'Trimestral':
          tiempoFinal = tiempo / 4;
          break;
        case 'Cuatrimestral':
          tiempoFinal = tiempo / 3;
          break;
        case 'Semestral':
          tiempoFinal = tiempo / 2;
          break;
        default:
          tiempoFinal = tiempo;
          break;
      }
    } else {
      switch (valorCombo) {
        case 'Diario':
          tiempoFinal = tiempo / 30.417;
          break;
        case 'Anual':
          tiempoFinal = tiempo * 12;
          break;
        case 'Trimestral':
          tiempoFinal = tiempo * 4;
          break;
        case 'Cuatrimestral':
          tiempoFinal = tiempo * 3;
          break;
        case 'Semestral':
          tiempoFinal = tiempo * 2;
          break;
        default:
          tiempoFinal = tiempo;
          break;
      }
    }
    return tiempoFinal;
  }

  String datoCalcular(BuildContext context) {
    final compuesto = InteresCompuesto();
    final capitalText = capitalController.text;
    final tasaInteresText = tasaIController.text;
    final montoCompuestoText = montoCompController.text;
    final tiempoText = tiempoController.text;

    if (capitalText.isEmpty &&
        tasaInteresText.isNotEmpty &&
        montoCompuestoText.isNotEmpty &&
        tiempoText.isNotEmpty) {
      double tasa = double.parse(tasaInteresText);
      final monto = double.parse(montoCompuestoText);
      final tiempo = conversionFecha();

      final res = compuesto.calcularCapital(tasa, monto, tiempo);
      return "Capital depositado: ${res.toString()}";
    } else if (tasaInteresText.isEmpty &&
        capitalText.isNotEmpty &&
        montoCompuestoText.isNotEmpty &&
        tiempoText.isNotEmpty) {
      final monto = double.parse(montoCompuestoText);
      final tiempo = conversionFecha();
      final capital = double.parse(capitalText);
      final res = compuesto.calcularTasaInteres(monto, capital, tiempo);
      return "Tasa de interés: ${res.toString()}";
    } else if (tasaInteresText.isNotEmpty &&
        capitalText.isNotEmpty &&
        montoCompuestoText.isNotEmpty &&
        tiempoText.isEmpty) {
      final tasa = double.parse(tasaInteresText);
      final monto = double.parse(montoCompuestoText);
      final capital = double.parse(capitalText);
      final res = compuesto.calcularTiempo(tasa, monto, capital);
      int anios = res.toInt(); // Extraer los años completos
      double mesesDecimal =
          (res - anios) * 12; // Calcular los meses en valor decimal
      int meses = mesesDecimal.toInt(); // Extraer los meses completos
      double diasDecimal =
          (mesesDecimal - meses) * 31; // Calcular los días en valor decimal
      int dias = diasDecimal.toInt();

      return 'Tiempo: ${generateTimeString(anios, meses, dias)}';
    } else if (tasaInteresText.isNotEmpty &&
        capitalText.isNotEmpty &&
        montoCompuestoText.isEmpty &&
        tiempoText.isNotEmpty) {
      final tasa = double.parse(tasaInteresText);
      final capital = double.parse(capitalText);
      final tiempo = conversionFecha();
      tiempoC = tiempo;
      final res = compuesto.calcularMontoCompuesto(tasa, capital, tiempo);
      valorTasa = tasa / 100;
      valorPeriodo = res;
      return "Monto compuesto: ${res.toString()}";
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Por favor, seleccione exactamente tres campos para realizar un cálculo.'),
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
    }
    return "";
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
}
