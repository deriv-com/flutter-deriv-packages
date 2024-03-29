import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/widgets/section_title_and_content.dart';
import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A stateless widget to build the Learn More Passkeys page.
class LearnMorePasskeysPage extends StatelessWidget {
  /// Creates a [LearnMorePasskeysPage].
  const LearnMorePasskeysPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: SvgPicture.asset(
                      Assets.effortlessPasskeysIcon,
                      package: 'deriv_passkeys',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      context.derivPasskeysLocalizations.effortlessLogin,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SectionTitleAndContent(
                    title: context.derivPasskeysLocalizations.whatArePasskeys,
                    content: context
                        .derivPasskeysLocalizations.whatArePasskeysDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  SectionTitleAndContent(
                    title: context.derivPasskeysLocalizations.whyPasskeys,
                    content: context
                        .derivPasskeysLocalizations.whyPasskeysDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  SectionTitleAndContent(
                    title:
                        context.derivPasskeysLocalizations.howToCreatePasskey,
                    content: context.derivPasskeysLocalizations
                        .howToCreatePasskeyDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  SectionTitleAndContent(
                    title: context
                        .derivPasskeysLocalizations.whereArePasskeysSaved,
                    content: context.derivPasskeysLocalizations
                        .whereArePasskeysSavedDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  SectionTitleAndContent(
                    title: context
                        .derivPasskeysLocalizations.whatHappensIfEmailChanged,
                    content: context.derivPasskeysLocalizations
                        .whatHappensIfEmailChangedDescription,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.theme.colors.active,
                      ),
                    ),
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset(
                            Assets.lightBulbIcon,
                            package: 'deriv_passkeys',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${context.derivPasskeysLocalizations.tips}:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colors.prominent,
                                ),
                              ),
                              Text(
                                '${context.derivPasskeysLocalizations.beforeUsingPasskeys}:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colors.general,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              UnorderedList(
                                texts: <String>[
                                  context.derivPasskeysLocalizations
                                      .enableScreenLock,
                                  context.derivPasskeysLocalizations
                                      .signInGoogleOrIcloud,
                                  context.derivPasskeysLocalizations
                                      .enableBluetooth
                                ],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colors.general,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
