import 'widgets.dart';

class ResultLabel extends StatelessWidget {
  const ResultLabel({
    super.key,
    required this.resultadoController,
  });

  final ResultadoController resultadoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Presente positivo: ${resultadoController.resultadoPositivo} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12)),
        Text('Presente negativo: ${resultadoController.resultadoNegativo} ',
            style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12))
      ],
    );
  }
}
