part of 'input_date_range.dart';

typedef _DateRangeTextFieldHandler = void Function(
  InputDateModel,
  InputDateModel,
);

/// Date range text field widget.
class _DateRangeTextField extends StatefulWidget {
  /// Initializes date range text field.
  const _DateRangeTextField({
    required this.initialStartDate,
    required this.initialEndDate,
    required this.isStartDateValid,
    required this.isEndDateValid,
    required this.onEditingComplete,
    this.dateFormat = 'dd-MM-yyyy',
    this.width=8,
    this.cursorColor=BrandColors.greenish,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.inputBorderValidColor,
    this.inputBorderNotValidColor,
    this.outlineBorderValidColor,
    this.outlineBorderNotValidColor,
    this.labelTextStartDate,
    this.labelTextEndDate,
    Key? key,
  }) : super(key: key);

  /// Initial start date.
  final DateTime? initialStartDate;

  /// Initial end date.
  final DateTime? initialEndDate;

  /// The accepted Date format for the TextField
  final String? dateFormat;

  /// `true` if the selected start-date is valid
  final bool isStartDateValid;

  /// `true` if the selected end-date is valid
  final bool isEndDateValid;

  /// On editing complete handler.
  final _DateRangeTextFieldHandler? onEditingComplete;

  /// TextField Width
  final double? width;

  /// TextField Cursor color
  final Color? cursorColor;

  /// TextField TextStyle
  final TextStyle? style;

  /// TextField hintStyle
  final TextStyle? hintStyle;

  /// TextField labelStyle
  final TextStyle? labelStyle;

  /// TextField input decoration border valid color
  final Color? inputBorderValidColor;

  /// TextField input decoration border not valid color
  final Color? inputBorderNotValidColor;

  /// TextField outline decoration border valid color
  final Color? outlineBorderValidColor;

  /// TextField outline decoration border not valid color
  final Color? outlineBorderNotValidColor;

  /// Label text of start date TextField
  final String? labelTextStartDate;

  /// Label text of end date TextField.
  final String? labelTextEndDate;

  @override
  _DateRangeTextFieldState createState() => _DateRangeTextFieldState();
}

class _DateRangeTextFieldState extends State<_DateRangeTextField> {
  late DateFormat dateFormatter;
  DateTime? startDate;
  DateTime? endDate;

  final TextEditingController startDateInputController =
      TextEditingController();
  final TextEditingController endDateInputController = TextEditingController();

  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '##-##-####');

  @override
  void initState() {
    super.initState();

    dateFormatter = DateFormat(widget.dateFormat);
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;

    _setInputControllers();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          _buildDateTextField(
              hintText: widget.dateFormat?.toUpperCase(),
              labelText: widget.labelTextStartDate??labelStartDate,
              controller: startDateInputController,
              isValidDate: widget.isStartDateValid,
              style: widget.style,
              cursorColor: widget.cursorColor,
              hintStyle: widget.hintStyle,
              inputBorderNotValidColor: widget.inputBorderNotValidColor,
              inputBorderValidColor: widget.inputBorderValidColor,
              labelStyle: widget.labelStyle,
              outlineBorderNotValidColor: widget.outlineBorderNotValidColor,
              outlineBorderValidColor: widget.outlineBorderValidColor),
          SizedBox(width: widget.width ?? 0),
          _buildDateTextField(
              hintText: widget.dateFormat?.toUpperCase(),
              labelText:widget.labelTextEndDate?? labelEndDate,
              controller: endDateInputController,
              isValidDate: widget.isEndDateValid,
              style: widget.style,
              cursorColor: widget.cursorColor,
              hintStyle: widget.hintStyle,
              inputBorderNotValidColor: widget.inputBorderNotValidColor,
              inputBorderValidColor: widget.inputBorderValidColor,
              labelStyle: widget.labelStyle,
              outlineBorderNotValidColor: widget.outlineBorderNotValidColor,
              outlineBorderValidColor: widget.outlineBorderValidColor),
        ],
      );

  Widget _buildDateTextField(
          {required String? hintText,
          required String labelText,
          required TextEditingController? controller,
          required bool isValidDate,
          Color? cursorColor,
          TextStyle? style,
          TextStyle? hintStyle,
          TextStyle? labelStyle,
          Color? inputBorderValidColor,
          Color? inputBorderNotValidColor,
          Color? outlineBorderValidColor,
          Color? outlineBorderNotValidColor}) =>
      Expanded(
        child: TextField(
          inputFormatters: <MaskTextInputFormatter>[maskFormatter],
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: cursorColor,
          textInputAction: controller == startDateInputController
              ? TextInputAction.next
              : TextInputAction.done,
          style: style,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isValidDate
                      ? inputBorderValidColor ?? Colors.black
                      : inputBorderNotValidColor ?? Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isValidDate
                      ? outlineBorderValidColor ?? Colors.black
                      : outlineBorderNotValidColor ?? Colors.red),
            ),
            hintText: hintText,
            hintStyle: hintStyle,
            labelText: labelText,
            labelStyle: labelStyle,
          ),
          onChanged: (_) => _updateDates(),
        ),
      );

  void _updateDates() {
    final InputDateModel startDateModel = parseDate(
      date: startDateInputController.text,
    );
    final InputDateModel endDateModel = parseDate(
      date: endDateInputController.text,
    );

    widget.onEditingComplete?.call(
      startDateModel,
      endDateModel,
    );
  }

  void _setInputControllers() {
    startDateInputController.text =
        startDate == null ? '' : dateFormatter.format(startDate!);
    endDateInputController.text =
        endDate == null ? '' : dateFormatter.format(endDate!);
  }

  @override
  void dispose() {
    startDateInputController.dispose();
    endDateInputController.dispose();

    super.dispose();
  }
}
