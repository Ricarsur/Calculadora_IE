import 'pages.dart';

class GradienteAritmetico extends StatefulWidget {
  const GradienteAritmetico({super.key});

  @override
  State<GradienteAritmetico> createState() => _GradienteAritmeticoState();
}

class _GradienteAritmeticoState extends State<GradienteAritmetico> {
  final resultadoController = ResultadoAritmeticoController();
  final interesController = TextEditingController();
  final montoController = TextEditingController();
  final tasaCrecimientoController = TextEditingController();
  final numeroPeriodoController = TextEditingController();
  double resultadoFuturoPositivo = 0;
  double resultadoFuturoNegativo = 0;
  double resultadoFuturoNominal = 0;
  double resultadoEfectiva = 0;
  double resultadoPositivo = 0;
  double resultadoNegativo = 0;
  String valueCombo = "Valor futuro";
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final List<String> gradient = [
      'Valor futuro',
      'Valor presente',
      'Valor presente infinito'
    ];
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
                GroupInputA(
                  visible: visible,
                  montoController: montoController,
                  tasaCrecimientoController: tasaCrecimientoController,
                  interesController: interesController,
                  numeroPeriodoController: numeroPeriodoController,
                ),
                const SizedBox(height: 25),
                DrowdownBox(
                  gradient: gradient,
                  valorCombo: (value) {
                    valueCombo = value;
                    setState(() {
                      if (valueCombo == 'Valor presente infinito') {
                        visible = false;
                      } else {
                        visible = true;
                      }
                    });
                  },
                ),
                const SizedBox(height: 25),
                ResultAritmetico(resultadoController: resultadoController),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  calculo: () {
                    tipOperation(valueCombo);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double futuroNegativo() {
    double futuro = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    futuro = MGradienteAritmetico.calcularValorFuturo(
        A: monto,
        i: interes,
        n: numeroPeriodo,
        g: tasaCrecimiento,
        positivo: false);

    return futuro;
  }

  double futuroPositivo() {
    double futuro = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    futuro = MGradienteAritmetico.calcularValorFuturo(
        A: monto,
        i: interes,
        n: numeroPeriodo,
        g: tasaCrecimiento,
        positivo: true);

    return futuro;
  }

  double futuroEfectiva() {
    double futuro = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = double.parse(numeroPeriodoController.text);
    futuro = MGradienteAritmetico.calcularValorEfectiva(
        A: monto, j: interes, n: numeroPeriodo, G: tasaCrecimiento);

    return futuro;
  }

  double futuroNominal() {
    double nominal = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = double.parse(numeroPeriodoController.text);
    nominal = MGradienteAritmetico.calcularValorFuturoNominal(
        A: monto, G: tasaCrecimiento, j: interes, m: 2, n: numeroPeriodo);

    return nominal;
  }

  double gradienteNegativo() {
    double gradiente = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    gradiente = MGradienteAritmetico.calcularValorPresente(
      A: monto,
      g: tasaCrecimiento,
      i: interes,
      n: numeroPeriodo,
      positivo: false,
    );

    return gradiente;
  }

  double gradientePositivo() {
    double gradiente = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    gradiente = MGradienteAritmetico.calcularValorPresente(
      A: monto,
      g: tasaCrecimiento,
      i: interes,
      n: numeroPeriodo,
      positivo: true,
    );

    return gradiente;
  }

  double infinitoNegativo() {
    double valor = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;

    valor = MGradienteAritmetico.calcularPresenteInfinito(
        A: monto, G: tasaCrecimiento, I: interes, positivo: false);
    return valor;
  }

  double infinitoPositivo() {
    double valor = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;

    valor = MGradienteAritmetico.calcularPresenteInfinito(
        A: monto, G: tasaCrecimiento, I: interes, positivo: true);
    return valor;
  }

  void tipOperation(String option) {
    switch (option) {
      case 'Valor futuro':
        resultadoFuturoPositivo = futuroPositivo();
        resultadoFuturoNegativo = futuroNegativo();
        resultadoFuturoNominal = futuroNominal();
        resultadoEfectiva = futuroEfectiva();
        resultadoController
            .actualizarResultadoPositivo(resultadoFuturoPositivo);
        resultadoController
            .actualizarResultadoNegativo(resultadoFuturoNegativo);
        resultadoController.actualizarResultadoNomial(resultadoFuturoNominal);
        resultadoController.actualizarResultadoEfectiva(resultadoEfectiva);

        break;
      case 'Valor presente':
        resultadoPositivo = gradientePositivo();
        resultadoNegativo = gradienteNegativo();
        resultadoController.actualizarResultadoPositivo(resultadoPositivo);
        resultadoController.actualizarResultadoNegativo(resultadoNegativo);

        break;
      case 'Valor presente infinito':
        resultadoPositivo = infinitoPositivo();
        resultadoNegativo = infinitoNegativo();
        resultadoController.actualizarResultadoPositivo(resultadoPositivo);
        resultadoController.actualizarResultadoNegativo(resultadoNegativo);
        break;
    }
  }
}
