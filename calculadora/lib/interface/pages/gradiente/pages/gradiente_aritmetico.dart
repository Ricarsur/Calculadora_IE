

import 'pages.dart';

class GradienteAritmetico extends StatefulWidget {
  const GradienteAritmetico({super.key});

  @override
  State<GradienteAritmetico> createState() => _GradienteAritmeticoState();
}

class _GradienteAritmeticoState extends State<GradienteAritmetico> {
  final resultadoController = ResultadoController();
  @override
  Widget build(BuildContext context) {
    final interesController = TextEditingController();
    final montoController = TextEditingController();
    final tasaCrecimientoController = TextEditingController();
    final numeroPeriodoController = TextEditingController();
    double resultado = 0;
    final List<String> gradient = ['Valor futuro', 'Valor presente'];
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
                DrowdownBox(gradient: gradient),
                const SizedBox(height: 25),
                Button(
                  calculo: () {
                    final monto = double.parse(montoController.text);
                    final tasaCrecimiento =
                        double.parse(tasaCrecimientoController.text);
                    final interes = double.parse(interesController.text) / 100;
                    final numeroPeriodo =
                        int.parse(numeroPeriodoController.text);
                    resultado = GradienteGeometrico.calcularValorPresente(
                      A: monto,
                      g: tasaCrecimiento,
                      i: interes,
                      n: numeroPeriodo,
                      positivo: true,
                    );
                    resultadoController.actualizarResultado(resultado);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ResultLabel(resultadoController: resultadoController),
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
}





