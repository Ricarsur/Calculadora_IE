
import 'widgets.dart';

class GroupInput extends StatelessWidget {
  const GroupInput({
    super.key,
    required this.montoController,
    required this.tasaCrecimientoController,
    required this.interesController,
    required this.numeroPeriodoController,
  });

  final TextEditingController montoController;
  final TextEditingController tasaCrecimientoController;
  final TextEditingController interesController;
  final TextEditingController numeroPeriodoController;

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
          labelText: "Número de períodos",
          helperText:
              "Indica la cantidad de veces que se aplicará el incremento.",
          icon: Icons.calendar_today,
          controller: numeroPeriodoController,
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
