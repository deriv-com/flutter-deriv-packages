import 'package:deriv_passkeys/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/presentation/constants/assets.dart';
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
                  'Stored on: ${widget.passkey.storedOn}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
                Text(
                  'Last used on: ${widget.passkey.lastUsed}',
                  style: TextStyle(
                    fontSize: 12,
                    color: context.theme.colors.general,
                  ),
                ),
                // const SizedBox(height: 4),
                // SvgPicture.asset(
                //   Assets.faceIdIcon,
                //   package: 'deriv_passkeys',
                //   color: context.theme.colors.general,
                // ),
              ],
            ),
          ),
          DropdownButtonHideUnderline(
              child: DropdownButton(
            icon: Icon(Icons.more_vert),
            items: <Widget>[
              TextButton(
                onPressed: () {
                  print('Rename');
                },
                child: Text(
                  'Rename',
                  style: TextStyle(
                    fontSize: 14,
                    color: context.theme.colors.general,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Revoke');
                },
                child: Text(
                  'Revoke',
                  style: TextStyle(
                    fontSize: 14,
                    color: context.theme.colors.general,
                  ),
                ),
              ),
            ]
                .map((Widget item) => DropdownMenuItem(
                      value: item,
                      child: item,
                    ))
                .toList(),
            onChanged: (Widget? value) {},
          )),
        ],
      );
}
