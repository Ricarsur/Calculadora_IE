import 'package:calculadora/interface/pages/compuesto/compuesto.dart';

class TimeWidget extends StatefulWidget {
  final TextEditingController tiempoController;
  final Function(String) valor;
  const TimeWidget({
    super.key,
    required this.tiempoController,
    required this.valor,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "Diario",
      "Mensual",
      "Trimestral",
      "Cuatrimestral",
      "Semestral",
      "Anual"
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline
          .alphabetic, // Alinea los elementos basados en la línea alfabética
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InterestRateInput(
              textfieldType: TextfieldType.number,
              helperText: "",
              labelText: "Tiempo",
              icon: Icons.punch_clock_outlined,
              controller: widget.tiempoController,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment:
                  Alignment.centerLeft, // Alinea el contenido a la izquierda
              child: DropdownButtonFormField(
                value: items[0],
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  labelText: 'Seleccione una opción',
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: AppColor.primary,
                ),
                dropdownColor: AppColor.primary,
                items: items.map((name) {
                  return DropdownMenuItem(
                    value: name,
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  widget.valor(value!);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
