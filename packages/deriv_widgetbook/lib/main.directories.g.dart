// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deriv_widgetbook/components/date_range_picker/date_range_picker_calender_usecase.dart'
    as _i2;
import 'package:deriv_widgetbook/components/expandable_bottomsheet/expandable_bottomsheet_usecase.dart'
    as _i3;
import 'package:deriv_widgetbook/components/grouped_list_view/grouped_list_view_usecase.dart'
    as _i4;
import 'package:deriv_widgetbook/components/numpad/numpad_with_exchanger_usecase.dart'
    as _i5;
import 'package:deriv_widgetbook/components/numpad/numpad_without_exchanger_usecase.dart'
    as _i6;
import 'package:deriv_widgetbook/theme/colors_usecases.dart' as _i7;
import 'package:deriv_widgetbook/widgets/buttons/primary_button_usecases.dart'
    as _i14;
import 'package:deriv_widgetbook/widgets/buttons/secondary_button_usecases.dart'
    as _i15;
import 'package:deriv_widgetbook/widgets/checkbox/checkbox_usecases.dart'
    as _i10;
import 'package:deriv_widgetbook/widgets/dialogs/custom_alert_dailog_usecases.dart'
    as _i9;
import 'package:deriv_widgetbook/widgets/dialogs/popup_alert_dialog_usecases.dart'
    as _i13;
import 'package:deriv_widgetbook/widgets/full_screen_message/full_screen_message_usecases.dart'
    as _i11;
import 'package:deriv_widgetbook/widgets/loading_indicator/loading_indicator_usecases.dart'
    as _i12;
import 'package:deriv_widgetbook/widgets/text_fields/base_text_field_usecases.dart'
    as _i8;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'date_range_picker',
        children: [
          _i1.WidgetbookFolder(
            name: 'widgets',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'DerivDateRangePicker',
                useCase: _i1.WidgetbookUseCase(
                  name: 'DateRangePicker calendar mode',
                  builder: _i2.dateRangePickerCalendarUseCase,
                ),
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'expandable_bottom_sheet',
        children: [
          _i1.WidgetbookFolder(
            name: 'widgets',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ExpandableBottomSheet',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.expandableBottomSheetDefaultUseCase,
                ),
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'grouped_list_view',
        children: [
          _i1.WidgetbookFolder(
            name: 'widgets',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GroupedListView<dynamic, dynamic>',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Grouped List View',
                  builder: _i4.groupedListViewUseCase,
                ),
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'numpad',
        children: [
          _i1.WidgetbookFolder(
            name: 'widgets',
            children: [
              _i1.WidgetbookComponent(
                name: 'NumberPad',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'With Currency Exchanger',
                    builder: _i5.numpadWithCurrencyExchangerUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Without Currency Exchanger',
                    builder: _i6.numpadUseCase,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'theme',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'ColorLabel',
        useCase: _i1.WidgetbookUseCase(
          name: 'General Colors',
          builder: _i7.buildColorUseCase,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'BaseTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i8.baseTextFieldDisabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Enabled',
            builder: _i8.baseTextFieldEnabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Error',
            builder: _i8.baseTextFieldErrorUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'CustomAlertDialog',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'No button',
            builder: _i9.customAlertDialogNoButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'One button',
            builder: _i9.customAlertDialogOneButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Two buttons',
            builder: _i9.customAlertDialogUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'CustomCheckbox',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'checked',
            builder: _i10.checkboxCheckedUsecase,
          ),
          _i1.WidgetbookUseCase(
            name: 'unchecked',
            builder: _i10.checkboxUncheckedUsecase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'FullscreenMessage',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'No button',
            builder: _i11.fullScreenMessageUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'With button',
            builder: _i11.fullScreenMessageWithButtonUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'LoadingIndicator',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Circular',
            builder: _i12.loadingIndicatorUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Linear',
            builder: _i12.linearLoadingIndicatorUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'PopupAlertDialog',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'With checkbox',
            builder: _i13.popupAlertDialogUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Without checkbox',
            builder: _i13.popupAlertDialogWithoutCheckboxUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'PrimaryButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i14.primaryButtonDisabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Enabled',
            builder: _i14.primaryButtonEnabledUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'SecondaryButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Disabled',
            builder: _i15.secondaryButtonDisabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Enabled',
            builder: _i15.secondaryButtonEnabledUseCase,
          ),
        ],
      ),
    ],
  ),
];
