import 'package:calculadora/interface/widgets/interes_rate_input.dart';
import 'package:flutter/material.dart';

class GroupInputG extends StatefulWidget {
  final bool visible;
  final TextEditingController interesMensualController;
  final TextEditingController montoPrestadoController;
  final TextEditingController incrementoPorcentualController;
  final TextEditingController periodoGraciaController;
  final TextEditingController plazoPrestamoController;
  const GroupInputG({
    super.key,
    required this.visible,
    required this.interesMensualController,
    required this.montoPrestadoController,
    required this.incrementoPorcentualController,
    required this.periodoGraciaController,
    required this.plazoPrestamoController,
  });

  @override
  State<GroupInputG> createState() => _GroupInputGState();
}

class _GroupInputGState extends State<GroupInputG> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText:
              "La tasa de interés mensual es el extra que pagas cada mes por pedir prestado dinero.",
          labelText: "Tasa de interés mensual",
          icon: Icons.percent,
          controller: widget.interesMensualController,
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText: "Dinero que has pedido prestado.",
          labelText: "Monto del préstamo",
          icon: Icons.attach_money_rounded,
          controller: widget.montoPrestadoController,
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText: "Indica cuánto aumentan tus pagos cada mes",
          labelText: "Incremento porcentual de las cuotas",
          icon: Icons.percent,
          controller: widget.incrementoPorcentualController,
        ),
        Visibility(visible: widget.visible, child: const SizedBox(height: 25)),
        Visibility(
          visible: widget.visible,
          child: InterestRateInput(
            textfieldType: TextfieldType.number,
            labelText: "Periodo de gracia",
            helperText: "No tienes que hacer pagos durante este periodo.",
            icon: Icons.calendar_today,
            controller: widget.periodoGraciaController,
          ),
        ),
        const SizedBox(height: 25),
        InterestRateInput(
          textfieldType: TextfieldType.number,
          helperText: "Es el tiempo total que te tomará pagar el préstamo",
          labelText: "Plazo del préstamo en meses",
          icon: Icons.calendar_today,
          controller: widget.plazoPrestamoController,
        ),
      ],
    );
  }
}
