import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:deriv_theme/text_styles.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///{@template date_range_picker}
/// Customized date range picker widget that supports both `input` and `calendar` mode.
///
/// For example:
/// ```dart
/// showDialog<DateRangeModel>(
///   context: context,
///   builder: (context) => DerivDateRangePicker(
///     currentDate: DateTime.now(),
///     minAllowedDate: DateTime(2021, 1, 1),
///     maxAllowedDate: DateTime(2021, 12, 31),
///     initialStartDate: DateTime(2021, 1, 1),
///     initialEndDate: DateTime(2021, 1, 28),
///     mode: DateRangPickerMode.calendar,
/// ));
///
/// ```
///
/// This will open a dialog with a calendar view. Once the user selects a date range and
/// closes the dialog, [DateRangeModel] will be returned through which you can access the `startDate` and `endDate`
/// of the range.
///
/// **Note:** `initialStartDate` and `initialEndDate` must be within the range of `minAllowedDate` and `maxAllowedDate`.
/// {@endtemplate}
class DerivDateRangePicker extends StatefulWidget {
  ///{@macro date_range_picker}
  const DerivDateRangePicker({
    required this.currentDate,
    required this.minAllowedDate,
    required this.maxAllowedDate,
    this.initialStartDate,
    this.initialEndDate,
    this.mode = DateRangPickerMode.calendar,
    Key? key,
  }) : super(key: key);

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The earliest allowed [DateTime] that the user can select.
  final DateTime minAllowedDate;

  /// The latest allowed [DateTime] that the user can select.
  final DateTime maxAllowedDate;

  /// The [DateTime] that represents the start of the initial date range selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range selection.
  final DateTime? initialEndDate;

  /// Date range Picker mode determine range picker starts in calendar or input mode.
  ///
  /// Default value is [DateRangPickerMode.calendar].
  final DateRangPickerMode mode;

  @override
  DerivDateRangePickerState createState() => DerivDateRangePickerState();
}

class DerivDateRangePickerState extends State<DerivDateRangePicker> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool showCalendar = true;
  @override
  void initState() {
    super.initState();

    selectedStartDate = widget.initialStartDate;
    selectedEndDate = widget.initialEndDate;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.mode == DateRangPickerMode.input) {
        showDateRangeInputDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Visibility(
        visible: showCalendar,
        child: Scaffold(
          backgroundColor: context.theme.colors.prominent,
          appBar: _buildAppBar(),
          body: _buildCalendar(),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            // semanticLabel: context.localization.semanticCloseIcon,
            semanticLabel: 'semanticCloseIcon',
            color: context.theme.colors.general,
          ),
          tooltip: 'labelClose',
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(ThemeProvider.margin08),
            child: IconButton(
              icon: Icon(
                Icons.check,
                semanticLabel: 'semanticConfirmIcon',
                color: context.theme.colors.general.withOpacity(
                  getOpacity(isEnabled: _isSaveEnabled()),
                ),
              ),
              tooltip: 'labelConfirm',
              onPressed: _isSaveEnabled() ? _setSelectedDate : null,
            ),
          ),
        ],
      );

  Widget _buildCalendar() => Column(
        children: <Widget>[
          Container(
            color: context.theme.colors.secondary,
            padding: const EdgeInsets.only(
              left: ThemeProvider.margin72,
              bottom: ThemeProvider.margin16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: ThemeProvider.margin08,
                  ),
                  child: Text(
                    'labelSelectedRange',
                    style: context.theme.textStyle(
                      textStyle: TextStyles.overline,
                      color: context.theme.colors.lessProminent,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SelectedDateRange(
                      currentDate: widget.currentDate,
                      startDate: selectedStartDate,
                      endDate: selectedEndDate,
                    ),
                    _buildEditButton(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: CalendarDateRange(
              currentDate: widget.currentDate,
              firstDate: widget.minAllowedDate,
              lastDate: widget.maxAllowedDate,
              initialStartDate: selectedStartDate,
              initialEndDate: selectedEndDate,
              onStartDateChanged: (DateTime date) =>
                  setState(() => selectedStartDate = date),
              onEndDateChanged: (DateTime? date) =>
                  setState(() => selectedEndDate = date),
            ),
          ),
        ],
      );

  Widget _buildEditButton() => Container(
        padding: const EdgeInsets.only(
          right: ThemeProvider.margin08,
        ),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.edit,
                semanticLabel: 'semanticEditIcon',
                color: context.theme.colors.general,
              ),
              tooltip: 'labelEdit',
              onPressed: showDateRangeInputDialog,
            ),
          ),
        ),
      );

  Future<void> showDateRangeInputDialog() async {
    setState(() => showCalendar = false);

    final DateRangeModel? datePickerResult = await showDialog<DateRangeModel>(
      context: context,
      builder: (BuildContext context) => AnimatedPopupDialog(
        child: InputDateRange(
          currentDate: widget.currentDate,
          minAllowedDate: widget.minAllowedDate,
          maxAllowedDate: widget.maxAllowedDate,
          initialStartDate: selectedStartDate,
          initialEndDate: selectedEndDate,
        ),
      ),
    );

    if (datePickerResult == null) {
      return;
    }

    setState(() {
      showCalendar = datePickerResult.showCalendar ?? true;

      selectedStartDate = datePickerResult.startDate;
      selectedEndDate = datePickerResult.endDate;
    });

    if (!showCalendar) {
      _setSelectedDate();
    }
  }

  void _setSelectedDate() => Navigator.pop(
        context,
        selectedStartDate == null && selectedEndDate == null
            ? null
            : DateRangeModel(
                startDate: selectedStartDate,
                endDate: selectedEndDate,
              ),
      );

  bool _isSaveEnabled() => selectedStartDate != null || selectedEndDate != null;
}
