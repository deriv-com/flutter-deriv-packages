import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/core/extensions/context_extensions.dart';
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
    String lastUsed = context.derivPasskeysLocalizations.never;
    if (widget.passkey.lastUsed != null) {
      lastUsed = formattedDate(dateTimeFromTimestamp(widget.passkey.lastUsed!));
    }
    return lastUsed;
  }

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SvgPicture.asset(
              Assets.passkeySvgIcon,
              package: 'deriv_passkeys',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.passkey.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colors.prominent,
                    )),
                Text(
                  '${context.derivPasskeysLocalizations.storedOn}: ${widget.passkey.storedOn}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
                Text(
                  '${context.derivPasskeysLocalizations.lastUsed}: ${_lastUsed()}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
              ],
            ),
          ),
          // TODO(bassam): uncomment and implement once phase 2 starts
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(Icons.more_vert),
              items: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    context.derivPasskeysLocalizations.rename,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    context.derivPasskeysLocalizations.revoke,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
              ]
                  .map((Widget item) => DropdownMenuItem<Widget>(
                        value: item,
                        child: item,
                      ))
                  .toList(),
              onChanged: (Widget? value) {},
            ),
          ),
        ],
      );
}
