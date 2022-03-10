import 'package:deriv_ui/core/widgets/date_range_picker/range_picker_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../util/color.dart';

import '../../../util/strings_const.dart';
import '../../helpers/color_helper.dart';
import '../animated_popup.dart';
import 'calendar_date_range.dart';
import 'input_date_range.dart';
import 'models/animated_popup_dialog_card_model.dart';
import 'models/date_range_model.dart';
import 'models/date_range_textfield.dart';
import 'models/input_date_model.dart';
import 'selected_date_range.dart';

/// Calendar date range picker widget.
class DateRangePicker extends StatefulWidget {
  /// Initializes calendar date range picker widget.
  const DateRangePicker({
    required this.currentDate,
    required this.minAllowedDate,
    required this.maxAllowedDate,
    this.selectedDateRangeTextStyle = const TextStyle(),
    this.selectedDateRangeColor = LightThemeColors.base02,
    this.monthItemHeaderHeight = 48,
    this.monthItemRowHeight = 48,
    this.horizontalPadding = 8,
    this.monthItemSpaceBetweenRows = 8,
    this.monthItemFooterHeight = 16,
    this.style = const TextStyle(color: LightThemeColors.base03),
    this.containerEdgeColor = BrandColors.coral,
    this.highLightColor = BrandColors.coral,
    this.dayStyle = const TextStyle(),
    this.splashColor = BrandColors.coral,
    this.boxCircleColor = BrandColors.coral,
    this.selectDayColor = LightThemeColors.base01,
    this.disableDayColor = LightThemeColors.base04,
    this.initialStartDate,
    this.initialEndDate,
    this.mode = DateRangPickerMode.calendar,
    this.backgroundColor=LightThemeColors.base08,
    this.appBarPadding = const EdgeInsets.all(8),
    this.backgroundColorSelectedDateRange=LightThemeColors.base07,
    this.bottomPadding=16,
    this.leftPadding=72,
    this.verticalPadding=8,
    this.calendarStyle=const TextStyle(color: LightThemeColors.base03),
    this.animatedPopupDialogCardModel = const AnimatedPopupDialogCardModel(),
    this.headerHeight = 48,
    this.headerStyle=const TextStyle(color: LightThemeColors.base04),
    this.checkIconButtonColor=LightThemeColors.base02,
    this.checkIconButtonTooltip,
    this.checkIconButtonLabel,
    this.closeIconColor=LightThemeColors.base02,
    this.closeIconLabel,
    this.closeIconTooltip,
    this.calenderTitle,
    this.editButtonRightPadding=8,
    this.editIconColor=LightThemeColors.base02,
    this.editLabel,
    this.editTooltip,
    this.labelTextSelectedStartDate,
    this.labelTextSelectedEndDate,
    this.inputDateRangeModel=const InputDateRangeModel(),
    this.dateRangeTextFieldModel= const DateRangeTextFieldModel(),
    Key? key,
  }) : super(key: key);

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The earliest allowed [DateTime] that the user can select.
  final DateTime minAllowedDate;

  /// The latest allowed [DateTime] that the user can select.
  final DateTime maxAllowedDate;

  /// The [DateTime] that represents the start of the initial date range
  /// selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range
  /// selection.
  final DateTime? initialEndDate;

  /// Date range Picker mode determine range picker starts in calendar or
  /// input mode.
  ///
  /// Default value is [DateRangPickerMode.calendar].
  final DateRangPickerMode mode;

  /// Padding for AppBar in Date Picker.
  ///
  /// Default value is 8
  final EdgeInsetsGeometry appBarPadding;

  /// Background color of Date Picker.
  ///
  /// Default value is [LightThemeColors.base08]
  final Color? backgroundColor;

  /// Set color of close icon in AppBar of Date Picker.
  ///
  /// Default value is [LightThemeColors.base02]
  final Color? closeIconColor;

  /// Set color of check right icon in AppBar of Date Picker.
  ///
  ///  /// Default value is [LightThemeColors.base02]
  final Color? checkIconButtonColor;

  /// Background color of selected date range in Date Picker.
  ///
  /// /// Default value is [LightThemeColors.base07]
  final Color? backgroundColorSelectedDateRange;

  /// Bottom padding of selected date range in Date Picker.
  ///
  /// Default value is 16
  final double? bottomPadding;

  /// Left padding of selected date range in Date Picker.
  ///
  /// Default value is 72
  final double? leftPadding;

  /// Vertical padding of selected date range in Date Picker.
  ///
  /// Default value is 8
  final double? verticalPadding;

  /// Text style of selected date range title in Date Picker.
  ///
  /// Default value is [TextStyle(color: LightThemeColors.base03)]
  final TextStyle? calendarStyle;

  /// Properties of the dialog editing the selected date in Date Picker.
  final AnimatedPopupDialogCardModel? animatedPopupDialogCardModel;

  /// Set the color of selected date in Date Picker.
  ///
  /// Default value is [LightThemeColors.base02]
  final Color selectedDateRangeColor;

  /// Set the [TextStyle] of selected date in Date Picker.
  ///
  /// Default value is [TextStyle()]
  final TextStyle selectedDateRangeTextStyle;

  /// Month item row height in scrollable Calendar
  ///
  /// Default value is 48
  final double monthItemRowHeight;

  ///  Month Item Space between row in scrollable Calendar
  ///
  ///  Default value is 8
  final double monthItemSpaceBetweenRows;

  /// Month item header height in scrollable Calendar
  ///
  ///  Default value is 48
  final double monthItemHeaderHeight;

  /// horizontal  padding in scrollable Calendar
  ///
  /// Default value is 8
  final double horizontalPadding;

  /// margin of bottom in scrollable Calendar
  ///
  /// Default value is 16
  final double monthItemFooterHeight;

  /// Display month name [TextStyle] in scrollable Calendar
  ///
  /// Default value is [TextStyle(color: LightThemeColors.base03)]
  final TextStyle style;

  /// Container edge color in scrollable Calendar
  ///
  /// Default value is [BrandColors.coral]
  final Color containerEdgeColor;

  /// High Light color of selected date range in scrollable Calendar
  ///
  /// Default value is [BrandColors.coral]
  final Color highLightColor;

  /// day [TextStyle] of TextStyle in scrollable Calendar
  ///
  /// Default value is [TextStyle()]
  final TextStyle dayStyle;

  /// color  of Splash  in scrollable Calendar
  ///
  /// Default value is [BrandColors.coral]
  final Color splashColor;

  /// color of Box circle  in scrollable Calendar
  ///
  /// Default value is [BrandColors.coral]
  final Color boxCircleColor;

  /// color of select day  in scrollable Calendar
  ///
  /// Default value is [LightThemeColors.base01]
  final Color selectDayColor;

  /// color of Unselected day  in scrollable Calendar
  ///
  /// Default value is [LightThemeColors.base04]
  final Color disableDayColor;

  /// This is represents header height for day header.
  ///
  /// Default value is 48
  final double? headerHeight;

  /// This is represents header style for day header.
  ///
  /// Default value is [TextStyle(color: LightThemeColors.base04)]
  final TextStyle? headerStyle;

  /// Set label of close icon in AppBar of Date Picker.
  final String? closeIconLabel;

  /// Set tooltip of close icon in AppBar of Date Picker.
  final String? closeIconTooltip;

  /// Set label of check right icon in AppBar of Date Picker.
  final String? checkIconButtonLabel;

  /// Set tooltip of check right icon in AppBar of Date Picker.
  final String? checkIconButtonTooltip;

  /// Set title of selected date range header in Date Picker.
  final String? calenderTitle;

  /// Set right padding of edit button of selected date in Date Picker.
  ///
  /// Default value is 8
  final double? editButtonRightPadding;

  /// Set Color of edit button of selected date in Date Picker.
  ///
  /// Default value is [LightThemeColors.base02]
  final Color? editIconColor;

  /// Set label of edit button of selected date in Date Picker.
  final String? editLabel;

  /// Set tooltip of edit button of selected date in Date Picker.
  final String? editTooltip;

  /// Start date Label Text of selected date range in Date Picker.
  final String? labelTextSelectedStartDate;

  /// End date Label Text of selected date range in Date Picker.
  final String? labelTextSelectedEndDate;

  /// Properties of the  selected date range edit dialog.
  final InputDateRangeModel? inputDateRangeModel;

  ///  Properties of the TextField in selected date range edit dialog.
  final DateRangeTextFieldModel? dateRangeTextFieldModel;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool showCalendar = true;

  @override
  void initState() {
    super.initState();

    selectedStartDate = widget.initialStartDate;
    selectedEndDate = widget.initialEndDate;

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (widget.mode == DateRangPickerMode.input) {
        showDateRangeInputDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Visibility(
    visible: showCalendar,
    child: Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: _buildAppBar(context,
          appBarPadding: widget.appBarPadding,
          closeIconColor: widget.closeIconColor,
          closeIconLabel: widget.closeIconLabel,
          closeIconTooltip: widget.closeIconTooltip,
          checkIconButtonColor: widget.checkIconButtonColor,
          checkIconButtonLabel: widget.checkIconButtonLabel,
          checkIconButtonTooltip: widget.checkIconButtonTooltip),
      body: _buildCalendar(
          currentDate: widget.currentDate,
          selectedDateRangeColor: widget.selectedDateRangeColor,
          selectedDateRangeTextStyle: widget.selectedDateRangeTextStyle,
          bottomPadding: widget.bottomPadding,
          color: widget.backgroundColorSelectedDateRange,
          leftPadding: widget.leftPadding,
          style: widget.calendarStyle,
          verticalPadding: widget.verticalPadding,
          calenderTitle: widget.calenderTitle,
          editTooltip: widget.editTooltip,
          editButtonRightPadding: widget.editButtonRightPadding,
          editLabel: widget.editLabel,
          editIconColor: widget.editIconColor,
          labelTextSelectedEndDate: widget.labelTextSelectedEndDate,
          labelTextSelectedStartDate: widget.labelTextSelectedStartDate),
    ),
  );

  AppBar _buildAppBar(BuildContext context,
      {EdgeInsetsGeometry appBarPadding = const EdgeInsets.all(0),
        Color? closeIconColor,
        Color? checkIconButtonColor,
        String? checkIconButtonLabel,
        String? checkIconButtonTooltip,
        String? closeIconLabel,
        String? closeIconTooltip}) =>
      AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            semanticLabel: closeIconLabel ?? semanticCloseIcon,
            color: closeIconColor,
          ),
          tooltip: closeIconTooltip ?? labelClose,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: appBarPadding,
            child: IconButton(
              icon: Icon(
                Icons.check,
                semanticLabel: checkIconButtonLabel ?? semanticConfirmIcon,
                color: checkIconButtonColor != null
                    ? checkIconButtonColor.withOpacity(
                  getOpacity(isEnabled: _isSaveEnabled()),
                )
                    : checkIconButtonColor,
              ),
              tooltip: checkIconButtonTooltip ?? labelConfirm,
              onPressed: _isSaveEnabled() ? _setSelectedDate : null,
            ),
          ),
        ],
      );

  Widget _buildCalendar({
    required DateTime currentDate,
    Color? selectedDateRangeColor,
    TextStyle? selectedDateRangeTextStyle,
    Color? color,
    double? leftPadding,
    double? bottomPadding,
    double? verticalPadding,
    TextStyle? style,
    String? calenderTitle,
    double? editButtonRightPadding,
    Color? editIconColor,
    String? editLabel,
    String? editTooltip,
    String? labelTextSelectedStartDate,
    String? labelTextSelectedEndDate,
  }) =>
      Column(
        children: <Widget>[
          Container(
            color: color,
            padding: EdgeInsets.only(
              left: leftPadding ?? 72,
              bottom: bottomPadding ?? 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? 0,
                  ),
                  child: Text(
                    calenderTitle ?? labelSelectedRange,
                    style: style,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SelectedDateRange(
                      currentDate: currentDate,
                      startDate: selectedStartDate,
                      endDate: selectedEndDate,
                      color: selectedDateRangeColor,
                      style: selectedDateRangeTextStyle,
                      labelTextEndDate: labelTextSelectedStartDate,
                      labelTextStartDate: labelTextSelectedEndDate,
                    ),
                    _buildEditButton(
                        editButtonRightPadding: editButtonRightPadding,
                        editIconColor: editIconColor,
                        editLabel: editLabel,
                        editTooltip: editTooltip),
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
              horizontalPadding: widget.horizontalPadding,
              style: widget.style,
              splashColor: widget.splashColor,
              selectDayColor: widget.selectDayColor,
              monthItemHeaderHeight: widget.monthItemHeaderHeight,
              highLightColor: widget.highLightColor,
              disableDayColor: widget.disableDayColor,
              dayStyle: widget.dayStyle,
              boxCircleColor: widget.boxCircleColor,
              monthItemRowHeight: widget.monthItemRowHeight,
              monthItemSpaceBetweenRows: widget.monthItemSpaceBetweenRows,
              containerEdgeColor: widget.containerEdgeColor,
              monthItemFooterHeight: widget.monthItemFooterHeight,
              headerHeight: widget.headerHeight,
              headerStyle: widget.headerStyle,
            ),
          ),
        ],
      );

  Widget _buildEditButton(
      {double? editButtonRightPadding,
        Color? editIconColor,
        String? editLabel,
        String? editTooltip}) =>
      Container(
        padding: EdgeInsets.only(
          right: editButtonRightPadding ?? 8,
        ),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.edit,
                semanticLabel: editLabel ?? semanticEditIcon,
                color: editIconColor,
              ),
              tooltip: editTooltip ?? labelEdit,
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
          selectedDateRangeTextStyle:
          widget.inputDateRangeModel?.selectedDateRangeTextStyle,
          selectedDateRangeColor:
          widget.inputDateRangeModel?.selectedDateRangeColor,
          labelTextSelectedStartDate: widget.labelTextSelectedStartDate,
          labelTextSelectedEndDate: widget.labelTextSelectedEndDate,
          backgroundColor: widget.inputDateRangeModel?.backgroundColor,
          cancelButtonStyle: widget.inputDateRangeModel?.cancelButtonStyle,
          cancelButtonText: widget.inputDateRangeModel?.cancelButtonText,
          dateInputPadding: widget.inputDateRangeModel?.dateInputPadding,
          dateRangeIconColor: widget.inputDateRangeModel?.dateRangeIconColor,
          dateRangeLabel: widget.inputDateRangeModel?.dateRangeLabel,
          dateRangeTooltip: widget.inputDateRangeModel?.dateRangeTooltip,
          labelTextSelectedRange:
          widget.inputDateRangeModel?.labelTextSelectedRange,
          okButtonNotValidColor:
          widget.inputDateRangeModel?.okButtonNotValidColor,
          okButtonStyle: widget.inputDateRangeModel?.okButtonStyle,
          okButtonText: widget.inputDateRangeModel?.okButtonText,
          okButtonValidColor: widget.inputDateRangeModel?.okButtonValidColor,
          titleColor: widget.inputDateRangeModel?.titleColor,
          titlePadding: widget.inputDateRangeModel?.titlePadding,
          titleStyle: widget.inputDateRangeModel?.titleStyle,
          verticalPadding: widget.inputDateRangeModel?.verticalPadding,
          dateRangeTextFieldModel: widget.dateRangeTextFieldModel,
        ),
        cardBorderRadius: widget.animatedPopupDialogCardModel?.cardBorderRadius,
        cardColor: widget.animatedPopupDialogCardModel?.cardColor,
        cardElevation: widget.animatedPopupDialogCardModel?.cardElevation,
        cardPadding: widget.animatedPopupDialogCardModel?.cardPadding,
        verticalMargin: widget.animatedPopupDialogCardModel?.verticalMargin,
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
