import 'package:calculadora/models/gradiente/aritmetico.dart';

import '../gradiente.dart';

class GradienteAritmetico extends StatelessWidget {
  const GradienteAritmetico({super.key});

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
                Text('Valor: ',
                    style: GoogleFonts.poppins(
                        color: AppColor.white, fontSize: 12)),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  calculo: () {
                    final monto = double.parse(montoController.text);
                    final tasaCrecimiento =
                        double.parse(tasaCrecimientoController.text);
                    final interes = double.parse(interesController.text)/100;
                    final numeroPeriodo =
                        int.parse(numeroPeriodoController.text);
                    resultado = GradienteGeometrico.calcularValorPresente(
                      A: monto,
                      g: tasaCrecimiento,
                      i: interes,
                      n: numeroPeriodo,
                      positivo: true,
                    );
                    print(resultado);
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

class DrowdownBox extends StatelessWidget {
  const DrowdownBox({
    super.key,
    required this.gradient,
  });

  final List<String> gradient;

  @override
  Widget build(BuildContext context) {
    var inputBorde = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
    var inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 25),
      labelText: 'Seleccione una opción',
      labelStyle: GoogleFonts.poppins(
        color: Colors.white.withOpacity(0.4),
      ),
      border: inputBorde,
      filled: true,
      fillColor: AppColor.primary,
    );
    return DropdownButtonFormField(
        value: gradient[0],
        decoration: inputDecoration,
        dropdownColor: AppColor.primary,
        items: gradient.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                )),
          );
        }).toList(),
        onChanged: (value) {});
  }
}

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
