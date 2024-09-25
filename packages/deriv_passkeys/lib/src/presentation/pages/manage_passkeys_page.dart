import 'package:deriv_passkeys/src/core/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/mixins/passkey_event_tracking_mixin.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';
import 'package:deriv_passkeys/src/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/utils/handle_errors_utils.dart';
import 'package:deriv_passkeys/src/presentation/widgets/passkey_created_call_to_action.dart';
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
    required this.addMorePasskeysNavigationCallback,
    required this.continueTradingNavigationCallback,
    this.onExitPasskeysFlow,
    super.key,
  });

  /// The route name for the manage passkeys page.
  static const String routeName = 'manage_passkeys_page';

  /// Callback to be called when the user wants to add more passkeys.
  final void Function(BuildContext context) addMorePasskeysNavigationCallback;

  /// Callback to be called when the user wants to continue trading.
  final void Function(BuildContext context) continueTradingNavigationCallback;

  /// Callback to be called when user exits the passkey flow and continues working with the app.
  final void Function()? onExitPasskeysFlow;

  @override
  State<ManagePasskeysPage> createState() => _ManagePasskeysPageState();
}

class _ManagePasskeysPageState extends State<ManagePasskeysPage>
    with PasskeyEventTrackingMixin {
  @override
  void initState() {
    super.initState();
    trackOpenManagePasskeysPage();
    context
        .read<DerivPasskeysBloc>()
        .add(const DerivPasskeysGetPasskeysListEvent());
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          trackCloseManagePasskeysPage();
          return true;
        },
        child: Scaffold(
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
                      builder: (BuildContext context) => LearnMorePasskeysPage(
                        onPageClosed: (BuildContext context) {
                          Navigator.pop(context);
                        },
                        addMorePasskeysNavigationCallback:
                            (BuildContext context) {
                          trackAddMorePasskeys();
                          widget.addMorePasskeysNavigationCallback(context);
                        },
                        continueTradingNavigationCallback:
                            (BuildContext context) {
                          trackContinueTrading();
                          widget.continueTradingNavigationCallback(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: BlocConsumer<DerivPasskeysBloc, DerivPasskeysState>(
              listener: (BuildContext context, DerivPasskeysState state) {
            if (state is DerivPasskeysCreatedSuccessfullyState) {
              trackCreatePasskeySuccess();
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => PasskeyCreatedPage(
                    onExitPasskeysFlow: () {
                      if (widget.onExitPasskeysFlow != null) {
                        widget.onExitPasskeysFlow!.call();
                      }
                    },
                    onPageClose: (BuildContext context) {
                      Navigator.pop(context);
                    },
                    bottomCallToAction: PasskeysCreatedCallToAction(
                      addMorePasskeysNavigationCallback:
                          (BuildContext context) {
                        trackAddMorePasskeys();
                        widget.addMorePasskeysNavigationCallback(context);
                      },
                      continueTradingNavigationCallback:
                          (BuildContext context) {
                        trackContinueTrading();
                        widget.continueTradingNavigationCallback(context);

                        if (widget.onExitPasskeysFlow != null) {
                          widget.onExitPasskeysFlow!.call();
                        }
                      },
                    ),
                  ),
                ),
              );
            } else if (state is DerivPasskeysErrorState) {
              trackPasskeyError('${state.errorCode}: ${state.message}');
              handlePasskeysError(context, state);
            }
          }, builder: (BuildContext context, DerivPasskeysState state) {
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
                              trackCreatePasskey();
                              context
                                  .read<DerivPasskeysBloc>()
                                  .add(DerivPasskeysCreateCredentialEvent());
                            },
                            child: Text(
                              context.derivPasskeysLocalizations.createPasskey,
                              style: TextStyle(
                                color: context.theme.colors.prominent,
                              ),
                            ),
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
        ),
      );

  Widget _buildDerivPasskeysListContent(
    BuildContext context,
    DerivPasskeysLoadedState state,
  ) =>
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
                child: Text(
                  context.derivPasskeysLocalizations.enhanceSecurity,
                  textAlign: TextAlign.center,
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
