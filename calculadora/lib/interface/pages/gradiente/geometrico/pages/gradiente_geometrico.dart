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
  final numeroPeriodoController = TextEditingController();

  double resultadoFuturoAnticipado = 0;
  double resultadoFuturoVencido = 0;
  double resultadoPresenteVencido = 0;
  double resultadoPresenteAnticipado = 0;
  double resultadoinfinito = 0;

  double resultadoGeometrico = 0;
  String valueCombo = "Anticipado";
  String valuePFI = "Presente";
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
                  incrementoPorcentualController: incrementoPorcentualController,
                  numeroPeriodoController: numeroPeriodoController,
                ),
                const SizedBox(height: 25),
                DrowdownBox(
                  gradient: gradient2,
                  valorCombo: (value) {
                    setState(() {
                      valuePFI = value;
                      if (value != 'infinito') {
                        visible = true;
                      } else {
                        visible = false;
                      }
                    });
                  },
                ),
                const SizedBox(height: 25),
                Visibility(
                  visible: visible,
                  child: DrowdownBox(
                    gradient: gradient,
                    valorCombo: (value) {
                      setState(() {
                        valueCombo = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text('Resultado $resultadoGeometrico', style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 25),
                Button(
                  calculo: () {
                    setState(() {
                      tipOperation(valuePFI);
                    });
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
    final numeroPeriodos = double.parse(numeroPeriodoController.text);
    if (aumento == interes) {
      FuturoAnticipado =
          MGradienteGeometrico.ValorFuturoGeoAnticipado_GigualI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      FuturoAnticipado =
          MGradienteGeometrico.ValorFuturoGeoAnticipado_GdiferentI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return FuturoAnticipado;
  }

  double futuroVencido() {
    double futuroVencido = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    final numeroPeriodos = double.parse(numeroPeriodoController.text);
    if (aumento == interes) {
      futuroVencido = MGradienteGeometrico.ValorFuturoGeoVencido_GigualI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      futuroVencido = MGradienteGeometrico.ValorFuturoGeoVencido_GdiferentI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return futuroVencido;
  }

  double infinito() {
    double valor = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    if (aumento < interes) {
      valor = MGradienteGeometrico.ValorInfinito(A: monto, I: interes, G: aumento);
    } else {
      print('error');
    }
    return valor;
  }

  double presenteAnticipado() {
    double presenteAnticipado = 0;
    final monto = double.parse(montoPrestadoController.text);
    final numeroPeriodos = double.parse(numeroPeriodoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    if (aumento == interes) {
      presenteAnticipado = MGradienteGeometrico.ValorPresenteGeometricoAnticipado_GigualI(A: monto, N: numeroPeriodos);
    } else if (aumento != interes) {
      presenteAnticipado =
          MGradienteGeometrico.ValorPresenteGeometricoAnticipado_GdiferentI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return presenteAnticipado;
  }

  double presenteVencido() {
    double presenteVencido = 0;
    final monto = double.parse(montoPrestadoController.text);
    final interes = double.parse(interesMensualController.text) / 100;
    final aumento = double.parse(incrementoPorcentualController.text) / 100;
    final numeroPeriodos = double.parse(numeroPeriodoController.text);
    if (aumento == interes) {
      presenteVencido =
          MGradienteGeometrico.ValorPresenteGeometricoVencido_GigualI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    } else if (aumento != interes) {
      presenteVencido =
          MGradienteGeometrico.ValorPresenteGeometricoVencido_GdiferentI(A: monto, G: aumento, I: interes, N: numeroPeriodos);
    }
    return presenteVencido;
  }

  void tipOperation(String option) {
    switch (option) {
      case 'Futuro':
        switch (valueCombo) {
          case 'Anticipado':
            resultadoGeometrico = futuroAnticipado();
            break;
          case 'Vencido':
            resultadoGeometrico = futuroVencido();
            break;
        }
        resultadoGeometricoController.actualizarResultadoPositivo(resultadoFuturoAnticipado);
        break;
      case 'Presente':
        switch (valueCombo) {
          case 'Anticipado':
            resultadoGeometrico = presenteAnticipado();
            break;
          case 'Vencido':
            resultadoGeometrico = presenteVencido();
            break;
        }
        resultadoGeometricoController.actualizarResultadoPositivo(resultadoPresenteAnticipado);
        break;
      case 'infinito':
        resultadoGeometrico = infinito();
        resultadoGeometricoController.actualizarResultadoPositivo(resultadoinfinito);
        break;
    }
  }
}
