import 'pages.dart';

class GradienteAritmetico extends StatefulWidget {
  const GradienteAritmetico({super.key});

  @override
  State<GradienteAritmetico> createState() => _GradienteAritmeticoState();
}

class _GradienteAritmeticoState extends State<GradienteAritmetico> {
  final resultadoController = ResultadoController();
  final interesController = TextEditingController();
  final montoController = TextEditingController();
  final tasaCrecimientoController = TextEditingController();
  final numeroPeriodoController = TextEditingController();
  double resultadoPositivo = 0;
  double resultadoNegativo = 0;
  String valueCombo = "Valor futuro";
  @override
  Widget build(BuildContext context) {
    final List<String> gradient = ['Valor futuro', 'Valor presente', 'Valor presente infinito'];
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
                GroupInput(
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
                    setState(() {});
                  },
                ),
                const SizedBox(height: 25),
                ResultLabel(resultadoController: resultadoController),
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
    futuro = GradienteGeometrico.calcularValorFuturo(A: monto, i: interes, n: numeroPeriodo, g: tasaCrecimiento, positivo: false);

    return futuro;
  }

  double futuroPositivo() {
    double futuro = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    futuro = GradienteGeometrico.calcularValorFuturo(A: monto, i: interes, n: numeroPeriodo, g: tasaCrecimiento, positivo: true);

    return futuro;
  }

  double gradienteNegativo() {
    double gradiente = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;
    final numeroPeriodo = int.parse(numeroPeriodoController.text);
    gradiente = GradienteGeometrico.calcularValorPresente(
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
    gradiente = GradienteGeometrico.calcularValorPresente(
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

    valor = GradienteGeometrico.calcularPresenteInfinito(A: monto, G: tasaCrecimiento, I: interes, positivo: false);
    return valor;
  }

  double infinitoPositivo() {
    double valor = 0;
    final monto = double.parse(montoController.text);
    final tasaCrecimiento = double.parse(tasaCrecimientoController.text);
    final interes = double.parse(interesController.text) / 100;

    valor = GradienteGeometrico.calcularPresenteInfinito(A: monto, G: tasaCrecimiento, I: interes, positivo: true);
    return valor;
  }

  void tipOperation(String option) {
    switch (option) {
      case 'Valor futuro':
        resultadoPositivo = futuroPositivo();
        resultadoPositivo = futuroNegativo();
        resultadoController.actualizarResultadoPositivo(resultadoPositivo);
        resultadoController.actualizarResultadoNegativo(resultadoNegativo);

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
