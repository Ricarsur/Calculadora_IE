import 'package:calculadora/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum TextfieldType {
  number,
  date,
  porcent,
}

class TextFieldWidget extends StatefulWidget {
  final Function(DateTime)? fechaInicio;
  final Function(DateTime)? fechaFin;
  final Function(double)? valor;
  final TextfieldType? textfieldType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final double? width;
  final String text;
  const TextFieldWidget(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      required this.text,
      this.hintText,
      this.width = 200,
      this.textfieldType = TextfieldType.number,
      this.fechaInicio,
      this.fechaFin,
      this.valor});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  DateTime dateInicio = DateTime.now();
  late DateTime dateFin = dateInicio.add(const Duration(days: 3));
  String date = '';

  late List<TextInputFormatter> textInputFormatter = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(),
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widget.prefixIcon == null ? 0 : 8),
              child: Text(widget.text,
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500)),
            ),
            Row(
              children: [
                widget.prefixIcon ?? Container(),
                Expanded(
                  child: widget.textfieldType != TextfieldType.date
                      ? TextField(
                          cursorColor: AppColor.greenLigth,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              widget.valor!(double.parse(value));
                            } else {
                              widget.valor!(0);
                            }
                          },
                          inputFormatters: textInputFormatter,
                          style: GoogleFonts.poppins(color: AppColor.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.hintText,
                              hintStyle: GoogleFonts.poppins(
                                  color: AppColor.white.withOpacity(0.3))),
                        )
                      : GestureDetector(
                          onTap: () {
                            _showAlertDialog();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              date,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
                        ),
                ),
                widget.suffixIcon ?? Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    date = '${DateFormat('dd/MM/yyyy').format(dateInicio).toString()} -'
        // ignore: lines_longer_than_80_chars
        ' ${DateFormat('dd/MM/yyyy').format(dateFin).toString()}';
    if (widget.textfieldType == TextfieldType.number) {
      textInputFormatter.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(?:[1-9][0-9]*|0)(?:\.[0-9]*)?$')));
      /* textInputFormatter
          .add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))); */
    } else if (widget.textfieldType == TextfieldType.date) {
      textInputFormatter
          .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')));
    } else {
      textInputFormatter.add(FilteringTextInputFormatter.allow(
          RegExp(r'^(100|\d{1,2}(\.\d*)?|\.\d+)$')));
    }
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        setState(() {
          dateInicio = args.value.startDate;
          dateFin = args.value.endDate ?? args.value.startDate;
        });
        date = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        widget.fechaInicio!(args.value.startDate);
        widget.fechaFin!(args.value.endDate ?? args.value.startDate);
      }
    });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
            child: Container(
              height: 400,
              color: AppColor.white,
              child: SfDateRangePicker(
                navigationMode: DateRangePickerNavigationMode.snap,
                monthFormat: "MMMM",
                selectionTextStyle: TextStyle(color: AppColor.black),
                rangeTextStyle: TextStyle(color: AppColor.black),
                monthViewSettings: DateRangePickerMonthViewSettings(
                    firstDayOfWeek: 1,
                    dayFormat: 'EEE',
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        textStyle: TextStyle(color: AppColor.white))),
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: TextStyle(color: AppColor.white)),
                yearCellStyle: DateRangePickerYearCellStyle(
                    todayTextStyle: TextStyle(color: AppColor.white),
                    textStyle: TextStyle(color: AppColor.white)),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    todayTextStyle: TextStyle(color: AppColor.white),
                    textStyle: TextStyle(color: AppColor.white)),
                todayHighlightColor: AppColor.greenLigth,
                rangeSelectionColor: AppColor.greenLigth.withOpacity(0.5),
                selectionColor: AppColor.greenLigth.withOpacity(0.9),
                endRangeSelectionColor: AppColor.greenLigth,
                startRangeSelectionColor: AppColor.greenLigth,
                toggleDaySelection: false,
                backgroundColor: AppColor.primary,
                cancelText: 'Cancelar',
                showActionButtons: true,
                onCancel: () {
                  Navigator.pop(context);
                },
                onSubmit: (value) {
                  Navigator.pop(context);
                },
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(dateInicio, dateFin),
              ),
            ),
          );
        });
  }
}
