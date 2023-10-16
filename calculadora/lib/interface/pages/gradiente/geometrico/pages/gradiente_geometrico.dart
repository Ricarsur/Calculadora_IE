
import 'package:calculadora/interface/pages/gradiente/geometrico/pages/pages.dart';


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

  double resultadoGeometrico = 0;
  String valueCombo = "Anticipado";
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    final List<String> gradient = [
      'Anticipado',
      'Vencido',
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
                ResultadoGeometrico(resultadoController: resultadoGeometricoController),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  calculo: () {
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
}
