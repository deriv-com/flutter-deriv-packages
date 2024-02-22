import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:deriv_ui/deriv_ui.dart';

/// {@template date_range_picker}
/// Deriv Theme based date range picker.
///
/// When the date picker is first displayed, it will show the month of
/// [initialStartDate], with [initialStartDate] to [initialEndDate] selected.
///
/// The [minAllowedDate] is the earliest allowable date. The [maxAllowedDate] is the latest
/// allowable date. [initialStartDate] and [initialEndDate] must either fall between these dates,
/// or be equal to one of them. For each of these [DateTime] parameters, only
/// their dates are considered. Their time fields are ignored. They must all
/// be non-null.
///
/// The [currentDate] represents the current day (i.e. today). This
/// date will be highlighted in the day grid. If null, the date of
/// `DateTime.now()` will be used.
///
/// The [context], [useRootNavigator] and [routeSettings] arguments are passed to
/// [showDialog], the documentation for which discusses how it is used. [context]
/// and [useRootNavigator] must be non-null.
///
/// The following optional string parameters allow you to override the default
/// text used for various parts of the dialog:
///
///   * [cancelText], label on the cancel button.
///   * [confirmText], label on the ok button.
///   * [fieldStartLabelText], label for the start date text input field.
///   * [fieldEndLabelText], label for the end date text input field.
///   * [labelSelectedDateRange], label for the selected date range.
///   * [semanticLabelEditIcon], semantic label for the edit icon.
///   * [semanticLabelClose], semantic label for the close icon.
///   * [semanticLabelConfirm], semantic label for the confirm icon.
///   * [semanticLabelCalendar], semantic label for the calendar icon.
///   * [toolTipEdit], tooltip for the edit icon.
///   * [toolTipClose], tooltip for the close icon.
///   * [toolTipConfirm], tooltip for the confirm icon.
///   * [toolTipCalendar], tooltip for the calendar icon.

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
/// {@endtemplate}
class DerivDateRangePicker extends StatefulWidget {
  ///{@macro date_range_picker}
  DerivDateRangePicker({
    required BuildContext context,
    required this.minAllowedDate,
    required this.maxAllowedDate,
    this.labelSelectedDateRange,
    this.currentDate,
    this.cancelText,
    this.confirmText,
    this.semanticLabelEditIcon,
    this.semanticLabelClose,
    this.initialStartDate,
    this.initialEndDate,
    this.mode = DateRangePickerMode.calendar,
    this.toolTipEdit,
    this.toolTipClose,
    this.semanticLabelConfirm,
    this.toolTipConfirm,
    this.fieldStartLabelText,
    this.fieldEndLabelText,
    this.semanticLabelCalendar,
    this.toolTipCalendar,
    Key? key,
  })  : assert(minAllowedDate.isBefore(maxAllowedDate)),
        assert(
            initialEndDate == null || initialEndDate.isBefore(maxAllowedDate)),
        assert(initialStartDate == null ||
            initialEndDate == null ||
            initialStartDate.isBefore(initialEndDate)),
        assert(debugCheckHasDateRangeLocalizations(context)),
        super(key: key);

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime? currentDate;

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
  /// Default value is [DateRangePickerMode.calendar].
  final DateRangePickerMode mode;

  /// Label for start date text field.
  final String? fieldStartLabelText;

  /// Label for end date text field.
  final String? fieldEndLabelText;

  /// Label for selected date range.
  final String? labelSelectedDateRange;

  /// Label for cancel button in [DateRangePickerMode.input].
  final String? cancelText;

  /// Label for confirm button in [DateRangePickerMode.input].
  final String? confirmText;

  /// Semantic label for edit icon.
  final String? semanticLabelEditIcon;

  /// Text that describes the action that will occur when the edit button is long pressed.
  final String? toolTipEdit;

  /// Semantic label for close icon.
  final String? semanticLabelClose;

  /// Text that describes the action that will occur when the close button is long pressed.
  final String? toolTipClose;

  /// Semantic label for confirm icon.
  final String? semanticLabelConfirm;

  /// Text that describes the action that will occur when the confirm button is long pressed.
  final String? toolTipConfirm;

  /// Semantic label for Calendar icon.
  final String? semanticLabelCalendar;

  /// Text that describes the action that will occur when the Calendar icon is long pressed.
  final String? toolTipCalendar;

  @override
  _DerivDateRangePickerState createState() => _DerivDateRangePickerState();
}

class _DerivDateRangePickerState extends State<DerivDateRangePicker> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool showCalendar = true;
  @override
  void initState() {
    super.initState();

    selectedStartDate = widget.initialStartDate;
    selectedEndDate = widget.initialEndDate;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.mode == DateRangePickerMode.input) {
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
            semanticLabel: widget.semanticLabelClose ??
                context.localization!.labelSemanticClose,
            color: context.theme.colors.general,
          ),
          tooltip: widget.toolTipClose ?? context.localization!.labelClose,
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(ThemeProvider.margin08),
            child: IconButton(
              icon: Icon(
                Icons.check,
                semanticLabel: widget.semanticLabelConfirm ??
                    context.localization!.labelSemanticConfirm,
                color: context.theme.colors.general.withOpacity(
                  getOpacity(isEnabled: _isSaveEnabled()),
                ),
              ),
              tooltip:
                  widget.toolTipConfirm ?? context.localization!.labelConfirm,
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
                    widget.labelSelectedDateRange ??
                        context.localization!.labelSelectedDateRange,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.overline,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SelectedDateRange(
                      fieldStartLabelText: widget.fieldStartLabelText ??
                          context.localization!.labelStartDate,
                      fieldEndLabelText: widget.fieldEndLabelText ??
                          context.localization!.labelEndDate,
                      currentDate: widget.currentDate ?? DateTime.now(),
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
              currentDate: widget.currentDate ?? DateTime.now(),
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
                semanticLabel: widget.semanticLabelEditIcon ??
                    context.localization!.labelSemanticEditIcon,
                color: context.theme.colors.general,
              ),
              tooltip: widget.toolTipEdit ?? context.localization!.labelEdit,
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
          fieldStartLabelText: widget.fieldStartLabelText,
          fieldEndLabelText: widget.fieldEndLabelText,
          cancelText:
              widget.cancelText ?? context.localization!.labelActionCancel,
          confirmText:
              widget.confirmText ?? context.localization!.labelActionOk,
          labelSelectedDateRange: widget.labelSelectedDateRange,
          semanticCalendarLabel: widget.semanticLabelCalendar,
          toolTipCalendar: widget.toolTipCalendar,
          currentDate: widget.currentDate ?? DateTime.now(),
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

  void _setSelectedDate() => Navigator.maybePop(
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
