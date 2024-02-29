## Single Entry:

Single entry will enable you to just call one Widget and get the entire Authentication flow</br>

#### Example:

```Dart
AuthEntryPage(
              AuthEntryModel(
                getStartedPage: GetStartedPageModel(
                  slides: [
                    DerivGetStartedSlideModel(
                      imagePath: 'lib/auth/assets/images/charts.svg',
                      supportingText: 'Charts',
                    ),
                    DerivGetStartedSlideModel(
                      imagePath: 'lib/auth/assets/images/live_chat.svg',
                      supportingText: 'Live Chat',
                    ),
                    DerivGetStartedSlideModel(
                      imagePath: 'lib/auth/assets/images/markets.svg',
                      supportingText: 'Markets',
                    ),
                  ],
                  appLogoIconPath:
                      'lib/auth/assets/images/ic_logo_extended.svg',
                  backgroundImagePath: 'lib/auth/assets/images/triangles.svg',
                ),
                loginPageModel: LoginPageModel(
                  welcomeLabel: 'Welcome back testing!',
                  greetingLabel:
                      'Log in to your Deriv account to start trading and investing.',
                  onLoggedIn: (_) => HomePageRoute().go(context),
                  authErrorStateHandler:
                      AuthErrorStateHandler(context: context),
                  onLoginError: (_) {},
                  onSocialAuthButtonPressed: (_) {},
                  isSocialAuthEnabled: false,
                  socialAuthStateHandler: (SocialAuthState) {},
                  redirectURL: '',
                  onWebViewError: (String) {},
                ),
                derivAuthCubit: BlocProvider.of<DerivAuthCubit>(context),
                signupPageModel: SignupPageModel(
                  verificationCode: '',
                  signupPageLable: 'Start trading with Deriv',
                  signupPageDescription:
                      'Join over 1 million traders worldwide who loves trading at Deriv.',
                  isSocialAuthEnabled: false,
                  onSingupError: (DerivSignupErrorState) {},
                  socialAuthStateHandler: (SocialAuthState) {},
                  redirectURL: '',
                  onWebViewError: (String) {},
                ),
                settingPageModel: SettingPageModel(
                  appLabel: 'dblanc',
                  appId: () => PrefService.getString('appId') ?? defaultAppId,
                  endpoint: () =>
                      PrefService.getString('endpoint') ?? defaultEndpoint,
                  saveValues: _saveValues,
                  updateFlavorConfigs: _updateFlavorConfigs,
                ),
                resetPassPageModel: ResetPassPageModel(
                  onResetPassSucceed: () {},
                  onResetPassError: ({
                    required bool isLinkExpired,
                    String? error,
                  }) {},
                  residences: Future.value([
                    const DerivResidenceModel(
                      isDisabled: false,
                      name: 'Indonecsia',
                      code: 'ID',
                    ),
                    const DerivResidenceModel(
                      isDisabled: true,
                      name: 'England',
                      code: 'UK',
                    ),
                  ]),
                  userResidence: 'id',
                ),
              ),
            ),

```
