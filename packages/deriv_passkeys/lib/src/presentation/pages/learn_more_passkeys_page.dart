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
        // TODO(bassam): localize all the strings in this page
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'Effortless login with passkeys',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SectionTitleAndContent(
                    title: 'What are passkeys?',
                    content:
                        'Passkeys are a security measure that lets you log in the same way you unlock your device: with a fingerprint, a face scan, or a screen lock PIN.',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  const SectionTitleAndContent(
                    title: 'Why passkeys?',
                    content:
                        'Passkeys are an added layer of security that protects your account against unauthorised access and phishing attacks.',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  const SectionTitleAndContent(
                    title: 'How to create a passkey?',
                    content:
                        'Go to ‘Account Settings’ on [platform name] to set up your passkey. Each device can only save one passkey; however, iOS users may still see the "Create passkey" button due to iOS’s ability to save passkeys on other devices.',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  const SectionTitleAndContent(
                    title: 'Where are passkeys saved?',
                    content:
                        'Passkeys are saved in your Google password manager for Android devices and in iCloud keychain on iOS devices to help you sign in on other devices. ',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      color: context.theme.colors.hover,
                    ),
                  ),
                  const SectionTitleAndContent(
                    title: 'What happens if my Deriv account email is changed?',
                    content:
                        'Even if you change your email address, you can still continue to log in to your Deriv account with the same passkey. ',
                  ),
                  Container(
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
                                'Tips:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colors.prominent,
                                ),
                              ),
                              Text(
                                'Before using passkeys:',
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
                                texts: const <String>[
                                  'Enable screen lock on your device.',
                                  'Sign in to your Google or iCloud account.',
                                  'Enable Bluetooth.',
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
