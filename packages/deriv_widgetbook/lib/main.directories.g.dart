// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deriv_widgetbook/widgets/buttons/primary_button_usecases.dart'
    as _i3;
import 'package:deriv_widgetbook/widgets/buttons/secondary_button_usecases.dart'
    as _i4;
import 'package:deriv_widgetbook/widgets/checkbox/checkbox_usecases.dart'
    as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'CustomCheckbox',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'checked',
            builder: _i2.checkboxCheckedUsecase,
          ),
          _i1.WidgetbookUseCase(
            name: 'unchecked',
            builder: _i2.checkboxUncheckedUsecase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'PrimaryButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'disabled',
            builder: _i3.primaryButtonDisabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'enabled',
            builder: _i3.primaryButtonEnabledUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'SecondaryButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'disabled',
            builder: _i4.secondaryButtonDisabledUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'enabled',
            builder: _i4.secondaryButtonEnabledUseCase,
          ),
        ],
      ),
    ],
  )
];
