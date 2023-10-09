import 'widgets.dart';

class DrowdownBox extends StatefulWidget {
  const DrowdownBox({
    super.key,
    required this.gradient, required this.valorCombo,
  });

  final List<String> gradient;
   final Function(String) valorCombo; 

  @override
  State<DrowdownBox> createState() => _DrowdownBoxState();
}

class _DrowdownBoxState extends State<DrowdownBox> {
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
        value: widget.gradient[0],
        decoration: inputDecoration,
        dropdownColor: AppColor.primary,
        items: widget.gradient.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                )),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            widget.valorCombo(value!); 
          });
        });
  }
}