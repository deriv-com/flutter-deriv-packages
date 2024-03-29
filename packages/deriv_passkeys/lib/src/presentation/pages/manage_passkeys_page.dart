import 'dart:io';

import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';
import 'package:deriv_passkeys/src/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/widgets/passkey_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// A stateless widget to build the Manage Passkeys page.
class ManagePasskeysPage extends StatefulWidget {
  /// Creates a [ManagePasskeysPage].
  const ManagePasskeysPage({
    required this.derivPasskeysBloc,
    super.key,
  });

  /// The bloc to handle the passkey state
  final DerivPasskeysBloc derivPasskeysBloc;

  @override
  State<ManagePasskeysPage> createState() => _ManagePasskeysPageState();
}

class _ManagePasskeysPageState extends State<ManagePasskeysPage> {
  @override
  void initState() {
    super.initState();
    widget.derivPasskeysBloc.add(const DerivPasskeysGetPasskeysListEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          title: const Text('Passkeys', style: TextStyle(fontSize: 20)),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  Assets.learnMorePasskeysIcon,
                  package: 'deriv_passkeys',
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                      builder: (BuildContext context) =>
                          const LearnMorePasskeysPage()),
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<DerivPasskeysBloc, DerivPasskeysState>(
            bloc: widget.derivPasskeysBloc,
            listener: (BuildContext context, DerivPasskeysState state) {
              if (state is DerivPasskeysCreatedSuccessfullyState) {
                String platformName =
                    context.derivPasskeysLocalizations.unsupportedPlatform;
                //get if device is android or ios
                if (Platform.isIOS) {
                  platformName = 'IOS';
                }
                if (Platform.isAndroid) {
                  platformName = 'Android';
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                      builder: (BuildContext context) => PasskeyCreatedPage(
                            platformName: platformName,
                            onPageClose: (BuildContext context) {
                              Navigator.pop(context);
                            },
                          )),
                );
              } else if (state is DerivPasskeysErrorState) {
                showAlertDialog(
                  context: context,
                  title: context.derivPasskeysLocalizations.unexpectedError,
                  content: Text(
                    context
                        .derivPasskeysLocalizations.unexpectedErrorDescription,
                  ),
                  positiveActionLabel: context.derivPasskeysLocalizations.ok,
                  onPositiveActionPressed: () {
                    Navigator.of(context).pop();
                  },
                );
                widget.derivPasskeysBloc
                    .add(const DerivPasskeysGetPasskeysListEvent());
              }
            },
            builder: (BuildContext context, DerivPasskeysState state) {
              if (state is DerivPasskeysLoadedState) {
                return SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildDerivPasskeysLoadedContent(
                          context,
                          state,
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: PrimaryButton(
                              onPressed: () {
                                widget.derivPasskeysBloc
                                    .add(DerivPasskeysCreateCredentialEvent());
                              },
                              child: Text(context
                                  .derivPasskeysLocalizations.createPassKey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            }),
      );

  Widget _buildDerivPasskeysListContent(
          BuildContext context, DerivPasskeysLoadedState state) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: state.passkeysList.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PasskeyWidget(passkey: state.passkeysList[index]),
            ),
          ),
        ),
      );

  Widget _buildDerivPasskeysEmptyContent(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: SvgPicture.asset(
                  Assets.addPasskeyIcon,
                  package: 'deriv_passkeys',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  context.derivPasskeysLocalizations.experienceSaferLogins,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text:
                              '${context.derivPasskeysLocalizations.enhanceSecurity} '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Widget>(
                                builder: (_) => const LearnMorePasskeysPage(),
                              ),
                            );
                          },
                          child: Text(
                            '${context.derivPasskeysLocalizations.here}.',
                            style: TextStyle(color: context.theme.colors.coral),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildDerivPasskeysLoadedContent(
      BuildContext context, DerivPasskeysLoadedState state) {
    if (state.passkeysList.isEmpty) {
      return _buildDerivPasskeysEmptyContent(context);
    }
    return _buildDerivPasskeysListContent(context, state);
  }
}
