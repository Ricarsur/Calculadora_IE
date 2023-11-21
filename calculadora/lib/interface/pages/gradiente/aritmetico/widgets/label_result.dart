import 'widgets.dart';

class ResultAritmetico extends StatelessWidget {
  const ResultAritmetico({
    super.key,
    required this.resultadoController,
  });

  final ResultadoAritmeticoController resultadoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Presente positivo: ${resultadoController.resultadoPositivo} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
        Text('Presente negativo: ${resultadoController.resultadoNegativo} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
        Text('Futuro nominal: ${resultadoController.resultadoNominal} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
        Text('Futuro efectiva: ${resultadoController.resultadoEfectiva} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
      ],
    );
  }
}
