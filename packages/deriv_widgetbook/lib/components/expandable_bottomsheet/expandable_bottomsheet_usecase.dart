import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: ExpandableBottomSheet,
)
Widget expandableBottomSheetDefaultUseCase(BuildContext context) => const Align(
      alignment: Alignment.bottomCenter,
      child: ExpandableBottomSheet(
        labelContractDetails: 'Test Label Contract Details',
        upperContent: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Expand Me',
            style: TextStyle(fontSize: 24),
          ),
        ),
        lowerContent: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
