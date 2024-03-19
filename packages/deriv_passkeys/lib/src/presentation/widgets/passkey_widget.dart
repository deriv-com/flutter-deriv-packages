import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/utils/date_time_utils.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// [PasskeyWidget] is a widget that displays the passkey information.
class PasskeyWidget extends StatefulWidget {
  /// Creates a [PasskeyWidget].
  const PasskeyWidget({
    required this.passkey,
    super.key,
  });

  /// The passkey entity.
  final DerivPasskeyEntity passkey;

  @override
  State<PasskeyWidget> createState() => _PasskeyWidgetState();
}

class _PasskeyWidgetState extends State<PasskeyWidget> {
  String _lastUsed() {
    String lastUsed = 'Never';
    if (widget.passkey.lastUsed != null) {
      lastUsed = formattedDate(dateTimeFromTimestamp(widget.passkey.lastUsed!));
    }
    return lastUsed;
  }

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            Assets.passkeySvgIcon,
            package: 'deriv_passkeys',
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Passkey', style: TextStyle(fontSize: 14)),
                Text(
                  // TODO(bassam): Add localization
                  'Stored on: ${widget.passkey.storedOn}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
                Text(
                  // TODO(bassam): Add localization
                  // TODO(bassam): lastUsed is an int and should be formatted as a date and localized as well
                  'Last used: ${_lastUsed()}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
              ],
            ),
          ),
          // TODO(bassam): uncomment and implement once phase 2 starts
          // DropdownButtonHideUnderline(
          //   child: DropdownButton(
          //     icon: Icon(Icons.more_vert),
          //     items: <Widget>[
          //       TextButton(
          //         onPressed: () {
          //         },
          //         child: Text(
          //           // TODO(bassam): Add localization.
          //           'Rename',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: context.theme.colors.general,
          //           ),
          //         ),
          //       ),
          //       TextButton(
          //         onPressed: () {
          //         },
          //         child: Text(
          //           // TODO(bassam): Add localization.
          //           'Revoke',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: context.theme.colors.general,
          //           ),
          //         ),
          //       ),
          //     ]
          //         .map((Widget item) => DropdownMenuItem<Widget>(
          //               value: item,
          //               child: item,
          //             ))
          //         .toList(),
          //     onChanged: (Widget? value) {},
          //   ),
          // ),
        ],
      );
}
