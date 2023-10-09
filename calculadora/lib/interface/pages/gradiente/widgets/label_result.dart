

import 'widgets.dart';

class ResultLabel extends StatelessWidget {
  const ResultLabel({
    super.key,
    required this.resultadoController,
  });

  final ResultadoController resultadoController;

  @override
  Widget build(BuildContext context) {
    return Text('Valor: ${resultadoController.resultado} ',
        style: GoogleFonts.poppins(
            color: AppColor.white, fontSize: 12));
  }
}
