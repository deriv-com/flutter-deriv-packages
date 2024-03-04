import 'dart:io';

import 'package:deriv_passkeys/presentation/constants/assets.dart';
import 'package:deriv_passkeys/presentation/pages/learn_more_passkeys_page.dart';
import 'package:deriv_passkeys/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/presentation/widgets/passkey_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// Main singleFeature flow in wallets.
///
/// This is the landing page after a user clicks on the singleFeature button.
class ManagePasskeysPage extends StatefulWidget {
  /// Creates a [ManagePasskeysPage].
  const ManagePasskeysPage({
    super.key,
  });

  @override
  State<ManagePasskeysPage> createState() => _ManagePasskeysPageState();
}

class _ManagePasskeysPageState extends State<ManagePasskeysPage> {
  @override
  void initState() {
    super.initState();
    context.read<DerivPasskeysBloc>().add(const DerivPasskeysInit());
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
            listener: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysNotSupported ||
              state is DerivPasskeysLoading) {
            return;
          } else if (state is! DerivPasskeysLoaded) {
            context
                .read<DerivPasskeysBloc>()
                .add(const DerivPasskeysGetPasskeysList());
          }
          if (state is DerivPasskeysCreatedSuccessfully) {
            String platformName = 'Unsupported Platform';
            //get if device is android or ios
            if (Platform.isIOS) {
              // TODO(bassam): replace with localized string if needed
              platformName = 'IOS';
            }
            if (Platform.isAndroid) {
              // TODO(bassam): replace with localized string if needed
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
          } else if (state is DerivPasskeysError) {
            // TODO(bassam): Handle error state if needed, e.g., show a Snackbar
          }
        }, builder: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysLoaded) {
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
                            context
                                .read<DerivPasskeysBloc>()
                                .add(DerivPasskeysCreateCredential());
                          },
                          child: const Text('Create Passkey'),
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
          BuildContext context, DerivPasskeysLoaded state) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.builder(
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Experience safer logins',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(
                          text:
                              'To enhance your security, tap Create passkey. Learn more about passkeys '),
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
                            'here.',
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
      BuildContext context, DerivPasskeysLoaded state) {
    if (state.passkeysList.isEmpty) {
      return _buildDerivPasskeysEmptyContent(context);
    }
    return _buildDerivPasskeysListContent(context, state);
  }
}
