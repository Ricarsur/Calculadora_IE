import 'package:calculadora/interface/pages/gradiente/geometrico/pages/pages.dart';

class ResultadoGeometrico extends StatelessWidget {
  const ResultadoGeometrico({
    super.key,
    required this.resultadoController,
  });

  final ResultadoGeomtricoController resultadoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resultado: ${resultadoController.resultado} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
      ],
    );
  }
}
