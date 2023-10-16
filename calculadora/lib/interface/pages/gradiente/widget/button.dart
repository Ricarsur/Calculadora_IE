import '../aritmetico/widgets/widgets.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.calculo});
  final Function calculo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          calculo();
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: Text('Calcular',
                style: GoogleFonts.poppins(color: AppColor.white)),
          ),
        ));
  }
}