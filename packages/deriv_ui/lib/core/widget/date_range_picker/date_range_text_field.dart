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
    Key? key,
  }) : super(key: key);

  /// Initial start date.
  final DateTime? initialStartDate;

  /// Initial end date.
  final DateTime? initialEndDate;

  /// The accepted Date format for the TextField
  final String dateFormat;

  /// `true` if the selected start-date is valid
  final bool isStartDateValid;

  /// `true` if the selected end-date is valid
  final bool isEndDateValid;

  /// On editing complete handler.
  final _DateRangeTextFieldHandler? onEditingComplete;

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
            hintText: widget.dateFormat.toUpperCase(),
            labelText: context.localization.labelStartDate,
            controller: startDateInputController,
            isValidDate: widget.isStartDateValid,
          ),
          const SizedBox(width: ThemeProvider.margin08),
          _buildDateTextField(
            hintText: widget.dateFormat.toUpperCase(),
            labelText: context.localization.labelEndDate,
            controller: endDateInputController,
            isValidDate: widget.isEndDateValid,
          ),
        ],
      );

  Widget _buildDateTextField({
    required String hintText,
    required String labelText,
    required TextEditingController? controller,
    required bool isValidDate,
  }) =>
      Expanded(
        child: TextField(
          inputFormatters: <MaskTextInputFormatter>[maskFormatter],
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: context.theme.brandGreenishColor,
          textInputAction: controller == startDateInputController
              ? TextInputAction.next
              : TextInputAction.done,
          style: context.theme.textStyle(
            textStyle: TextStyles.subheading,
            color: context.theme.base03Color,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isValidDate
                    ? context.theme.base06Color
                    : context.theme.brandCoralColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isValidDate
                    ? context.theme.brandGreenishColor
                    : context.theme.brandCoralColor,
              ),
            ),
            hintText: hintText,
            hintStyle: context.theme.textStyle(
              textStyle: TextStyles.subheading,
              color: context.theme.base04Color,
            ),
            labelText: labelText,
            labelStyle: context.theme.textStyle(
              textStyle: TextStyles.subheading,
              color: context.theme.brandGreenishColor,
            ),
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
