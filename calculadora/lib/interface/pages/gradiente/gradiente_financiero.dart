import 'gradiente.dart';

class GradienteFinanciero extends StatelessWidget {
  const GradienteFinanciero({super.key});

  @override
  Widget build(BuildContext context) {
    final interesController = TextEditingController();
    final montoController = TextEditingController();
    final tasaCrecimientoController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleGradient(),
                const SizedBox(height: 25),
                GroupInput(
                    montoController: montoController,
                    tasaCrecimientoController: tasaCrecimientoController,
                    interesController: interesController), 
                    const SizedBox(height: 25),
                Text('Valor: ', style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GroupInput extends StatelessWidget {
  const GroupInput({
    super.key,
    required this.montoController,
    required this.tasaCrecimientoController,
    required this.interesController,
  });

  final TextEditingController montoController;
  final TextEditingController tasaCrecimientoController;
  final TextEditingController interesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText: "Valor del primer pago o anualidad inicial",
          labelText: "Monto inicial",
          icon: Icons.attach_money_rounded,
          controller: montoController,
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText:
              "Tasa de crecimiento anual o diferencia entre pagos consecutivos",
          labelText: "Tasa crecimiento",
          icon: Icons.attach_money_rounded,
          controller: tasaCrecimientoController,
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          labelText: "Número de pagos",
          helperText: "Número total de pagos o periodos en la serie",
          icon: Icons.attach_money_rounded,
          controller: tasaCrecimientoController,
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText:
              "Tasa de interés por periodo, expresada en formato decimal",
          labelText: "Interes",
          icon: Icons.percent,
          controller: interesController,
        ),
      ],
    );
  }
}

class TitleGradient extends StatelessWidget {
  const TitleGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Gradiente",
        style: GoogleFonts.poppins(color: AppColor.white, fontSize: 18));
  }
}
