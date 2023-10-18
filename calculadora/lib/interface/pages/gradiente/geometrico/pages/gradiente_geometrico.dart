import 'package:calculadora/interface/pages/gradiente/geometrico/pages/pages.dart';
import 'package:calculadora/models/gradiente/geometrico.dart';

class GradienteGeometrico extends StatefulWidget {
  const GradienteGeometrico({super.key});

  @override
  State<GradienteGeometrico> createState() => _GradienteAritmeticoState();
}

class _GradienteAritmeticoState extends State<GradienteGeometrico> {
  final resultadoGeometricoController = ResultadoGeomtricoController();
  final interesMensualController = TextEditingController();
  final montoPrestadoController = TextEditingController();
  final incrementoPorcentualController = TextEditingController();
  final periodoGraciaController = TextEditingController();
  final plazoPrestamoController = TextEditingController();
  double resultadoFuturoAnticipado = 0;
  double resultadoFuturoVencido = 0;
  double resultadoPresenteVencido = 0;
  double resultadoPresenteAnticipado = 0;
  double resultadoinfinito = 0;

  double resultadoGeometrico = 0;
  String valueCombo = "Anticipado";
  String ValuePFI = "Presente";
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    final List<String> gradient = [
      'Anticipado',
      'Vencido',
    ];
    final List<String> gradient2 = [
      'Presente',
      'Futuro',
      'infinito',
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
                GroupInputG(
                  visible: visible,
                  interesMensualController: interesMensualController,
                  montoPrestadoController: montoPrestadoController,
                  incrementoPorcentualController:
                      incrementoPorcentualController,
                  periodoGraciaController: periodoGraciaController,
                  plazoPrestamoController: plazoPrestamoController,
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
                DrowdownBox(
                  gradient: gradient2,
                  valorCombo: (value) {
                    ValuePFI = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 25),
                ResultadoGeometrico(
                    resultadoController: resultadoGeometricoController),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  calculo: () {
                    tipOperation(ValuePFI);
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

  double futuroAnticipado() {
    double FuturoAnticipado = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    final numeroPeriodos = double.parse(periodoGraciaController.text);
    if (aumento == interes) {
      FuturoAnticipado = MGradienteGeometrico.ValorFuturoGeoAnticipado_GigualI(
          A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      FuturoAnticipado =
          MGradienteGeometrico.ValorFuturoGeoAnticipado_GdiferentI(
              A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return FuturoAnticipado;
  }

  double futuroVencido() {
    double futuroVencido = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    final numeroPeriodos = double.parse(periodoGraciaController.text);
    if (aumento == interes) {
      futuroVencido = MGradienteGeometrico.ValorFuturoGeoVencido_GigualI(
          A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      futuroVencido = MGradienteGeometrico.ValorFuturoGeoVencido_GdiferentI(
          A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return futuroVencido;
  }

  double infinito() {
    double valor = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    valor =
        MGradienteGeometrico.ValorInfinito(A: monto, I: interes, G: aumento);
    return valor;
  }

  double presenteAnticipado() {
    double presenteAnticipado = 0;
    final monto = double.parse(montoPrestadoController.text);
    final numeroPeriodos = double.parse(periodoGraciaController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    if (aumento == interes) {
      presenteAnticipado =
          MGradienteGeometrico.ValorPresenteGeometricoAnticipado_GigualI(
              A: monto, N: numeroPeriodos);
    } else if (aumento != interes) {
      presenteAnticipado =
          MGradienteGeometrico.ValorPresenteGeometricoAnticipado_GdiferentI(
              A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return presenteAnticipado;
  }

  double presenteVencido() {
    double presenteVencido = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    final numeroPeriodos = double.parse(periodoGraciaController.text);
    if (aumento == interes) {
      presenteVencido =
          MGradienteGeometrico.ValorPresenteGeometricoVencido_GigualI(
              A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      presenteVencido =
          MGradienteGeometrico.ValorPresenteGeometricoVencido_GdiferentI(
              A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return presenteVencido;
  }

  void tipOperation(String option) {
    switch (option) {
      case 'Valor futuro':
        switch (valueCombo) {
          case 'Anticipado':
            resultadoFuturoAnticipado = futuroAnticipado();
            break;
          case 'Vencido':
            resultadoFuturoAnticipado = futuroVencido();
            break;
        }
        resultadoGeometricoController
            .actualizarResultadoPositivo(resultadoFuturoAnticipado);
        break;
      case 'Valor presente':
        switch (valueCombo) {
          case 'Anticipado':
            resultadoPresenteAnticipado = presenteAnticipado();
            break;
          case 'Vencido':
            resultadoPresenteVencido = presenteVencido();
            break;
        }
        resultadoGeometricoController
            .actualizarResultadoPositivo(resultadoPresenteAnticipado);
        break;
      case 'infinito':
        resultadoinfinito = infinito();
        resultadoGeometricoController
            .actualizarResultadoPositivo(resultadoinfinito);
        break;
    }
  }
}
