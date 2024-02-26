import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_env/deriv_env.dart';
import 'package:deriv_passkeys/data/data_sources/deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/mappers/deriv_passkeys_mapper.dart';
import 'package:deriv_passkeys/data/repositories/deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/interactor/services/deriv_passkeys_service.dart';
import 'package:deriv_passkeys/presentation/pages/effortless_passkeys_login_page.dart';
import 'package:deriv_passkeys/presentation/pages/manage_passkeys_page.dart';
import 'package:deriv_passkeys/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/presentation/widgets/continue_with_passkey_button.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_api/state/server_time/server_time_cubit.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_auth/core/connection_info.dart';
import 'package:flutter_deriv_api/api/response/logout_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:passkeys_poc/secure_storage/base_secure_storage.dart';
import 'package:passkeys_poc/secure_storage/secure_storage.dart';
import 'package:flutter_deriv_api/api/response/authorize_response_result.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env().initialize(EnvLoader(filePath: '.env'));

  runFlutterApp();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DerivPasskeysBloc(
        DerivPasskeysService(
          DerivPasskeysRepository(
            DerivPasskeysDataSource(
              DerivPasskeysMapper(),
            ),
          ),
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: context.theme.colors.secondary,
          fontFamily: context.theme.fontFamily,
          brightness: Brightness.dark,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
            modalBarrierColor: Colors.black.withOpacity(0.72),
          ),
          unselectedWidgetColor: context.theme.colors.lessProminent,
          toggleButtonsTheme: ToggleButtonsThemeData(
            textStyle: context.theme.textStyle(
              textStyle: TextStyles.body2,
            ),
          ),
          colorScheme: const ColorScheme.dark().copyWith(
            primary: context.theme.colors.prominent,
            secondary: context.theme.colors.coral,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: context.theme.colors.lessProminent,
            selectionHandleColor: context.theme.colors.lessProminent,
            selectionColor: context.theme.colors.lessProminent,
          ),
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: context.theme.colors.secondary,
            centerTitle: false,
          ),
        ),
        home: const MyPage(),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colors.primary,
      appBar: AppBar(
        title: const Text('Deriv Passkeys example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ContinueWithPasskeyButton(),
          InkWell(
            onTap: () async {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute<Widget>(
                  builder: (_) => EffortlessPasskeysPage(
                    onFlowComplete: (context) {
                      context.read<DerivPasskeysBloc>().add(
                            const DerivPasskeysGetPasskeysList(),
                          );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (_) => const ManagePasskeysPage(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            child: const Text("Go to Effortless Passkeys Page"),
          )
        ],
      ),
    );
  }
}

/// App Bloc Observer bootstrap
class AppBlocObserver extends BlocObserver {
  /// App Bloc Observer constructor
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// bootstrap
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  runApp(await builder());
}

/// Convert a list of integers to a string.
String convertBytesToString(List<int> input) => String.fromCharCodes(input);

/// Convert a 2D list of integers to a string.
String convert2DIntListToString(List<List<int>> list) {
  final string = StringBuffer();

  for (final row in list) {
    string.write(convertBytesToString(row));
  }

  return '$string';
}

/// Random auto-generated key.
const List<List<int>> key = <List<int>>[
  <int>[0x6a, 0x4b, 0x36, 0x78, 0x37, 0x48, 0x6e, 0x54],
  <int>[0x51, 0x46, 0x65, 0x69, 0x32, 0x38, 0x73, 0x55],
  <int>[0x63, 0x5a, 0x31, 0x6c, 0x4f, 0x79, 0x66, 0x44],
  <int>[0x6d, 0x52, 0x77, 0x62, 0x76, 0x7a, 0x45, 0x39],
];

Future<void> runFlutterApp() async {
  final connectionCubit = ConnectionCubit(
    ConnectionInformation(
      appId: '23789',
      brand: 'deriv',
      endpoint: 'qa163.deriv.dev',
      authEndpoint: 'qa163.deriv.dev',
    ),
  );

  final appToken = Env().get<String>(
    'DERIV_API_KEY',
    decryptionKey: convert2DIntListToString(key),
  );

  final derivAuthCubit = DerivAuthCubit(
    authService: DerivAuthService(
      jwtService: DerivJwtService(
        repository: DerivJwtRepository(
          client: HttpClient(),
          appToken: appToken,
          connectionInfo: DerivAuthConnectionInfo(),
        ),
      ),
      tokenService: DerivTokenService(),
      authRepository: DerivAuthRepository(),
      connectionInfo: DerivAuthConnectionInfo(),
    ),
  );

  final serverTimeCubit = ServerTimeCubit(
    connectionCubit,
  );

  await bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionCubit>(create: (_) => connectionCubit),
        BlocProvider<ServerTimeCubit>(create: (_) => serverTimeCubit),
      ],
      child: MyApp(),
    ),
  );
}

/// Class that contains ConnectionInfo
class DerivAuthConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => ConnectionCubit.appId;

  @override
  String get endpoint => ConnectionCubit.endpoint;
}

/// Class to implement Authentication Repository.
class DerivAuthRepository implements BaseAuthRepository {
  /// Persistent storage.
  final BaseSecureStorage _secureStorage = SecureStorage();

  @override
  Future<AuthorizeResponseEntity> authorize(String? token) async {
    try {
      final response = await AuthorizeResponse.authorizeMethod(
        AuthorizeRequest(authorize: token, tokens: const []),
      );

      return AuthorizeResponseEntity.fromJson(response.authorize!.toJson());
    } on BaseAPIException catch (exception) {
      switch (exception.code) {
        case 'InvalidToken':
          throw DerivAuthException(
            message: exception.message!,
            type: AuthErrorType.expiredAccount,
          );
        case 'AccountDisabled':
          throw DerivAuthException(
            message: exception.message!,
            type: AuthErrorType.disabledClient,
          );
        case 'DisabledClient':
          throw DerivAuthException(
            message: exception.message!,
            type: AuthErrorType.disabledClient,
          );
        default:
          throw DerivAuthException(
            message: '$exception',
            type: AuthErrorType.failedAuthorization,
          );
      }
    }
  }

  @override
  Future<AccountModel?> getDefaultAccount() async =>
      _secureStorage.userDefaultAccount;

  @override
  Future<List<AccountModel>> getLatestAccounts() => _secureStorage.userAccounts;

  @override
  Future<void> logout() => LogoutResponse.logoutMethod(const LogoutRequest());

  @override
  Future<void> onPostLogout() async {
    // await removeFCMToken();
  }

  @override
  Future<void> onLogout() async {
    // BlocManager.instance.register<NotificationsCubit>(NotificationsCubit());
    // final NotificationsCubit notificationCubit =
    //     BlocManager.instance.fetch<NotificationsCubit>();
    // await notificationCubit.fetchNotifications();
    // await notificationCubit.resetNotificationDatabase();
    // await Analytics().init(isEnabled: true, firebaseApp: Firebase.app());
    // Analytics().logLogoutEvent();
    // await clearOnLogoutPreferences();
    await _secureStorage.clearAllData();
  }

  @override
  Future<void> onLogin(AuthorizeEntity authorizeEntity) async {
    final accounts = authorizeEntity.accounts;

    // Add user email and full name to account data before saving it.
    for (final account in accounts) {
      account
        ..email = authorizeEntity.email
        ..fullName = authorizeEntity.fullname
        ..userId = authorizeEntity.userId;
    }

    // adding disabled accounts to the list.
    for (final accountModel in accounts) {
      if (accountModel.isDisabled ?? false) {
        accounts.add(
          AccountModel(
            accountId: accountModel.accountId,
            currency: accountModel.currency,
            isDisabled: true,
          ),
        );
      }
    }

    // Sort accounts based on the [currenciesDisplayOrder].
    accounts.sort(
      (AccountModel account, AccountModel other) =>
          _compareAccountCurrencyDisplayOrder(
        authorize: authorizeEntity,
        account: account,
        other: other,
      ),
    );

    if (authorizeEntity.refreshToken?.isNotEmpty ?? false) {
      await _secureStorage.setRefreshToken(authorizeEntity.refreshToken);
    }

    await _secureStorage.addAccounts(accounts);
    await _secureStorage.setDefaultUser(authorizeEntity.email!);
    await _secureStorage.setDefaultAccount(authorizeEntity.loginid!);
    await _secureStorage.setDefaultUserId(
      userId: '${authorizeEntity.userId}',
    );

    /// Set feedback reminder flag to true.
    // final PersistentConfigurationHelper persistentConfHelper =
    //     PersistentConfigurationHelper();
    //
    // final bool shouldShowFeedbackReminder =
    //     await persistentConfHelper.getShouldShowFeedbackReminder() ?? true;
    //
    // await persistentConfHelper.storeShouldShowFeedbackReminder(
    //   value: shouldShowFeedbackReminder,
    // );

    /// onSendSignupEvent is called after the user has logged in.
    // if (authorizeEntity.signupProvider != null &&
    //     _canSendSignupDoneEvent(accounts)) {
    //   final AccountModel? vrAccount = getVRAccount(accounts);
    //
    //   trackAdjustEvent(
    //     adjustEventVirtualSignupDone,
    //     callbackParameters: <String, String>{
    //       'signup_provider': authorizeEntity.signupProvider!,
    //       'binary_user_id': '${authorizeEntity.userId ?? " "}',
    //       'loginid': vrAccount!.accountId,
    //     },
    //   );
    // }
  }

  /* bool _canSendSignupDoneEvent(List<AccountModel>? accounts) =>
      accounts != null && accounts.isNotEmpty && hasVRAccount(accounts);
*/
  /// If [accounts] contains a VR account return true
  /// otherwise returns false.
  bool hasVRAccount(List<AccountModel> accounts) => accounts.any(isVRAccount);

  /// Returns true if the [account] is a VR account, otherwise returns false.
  bool isVRAccount(AccountModel account) =>
      account.accountId.toUpperCase().contains('VR');

  int _compareAccountCurrencyDisplayOrder({
    required AuthorizeEntity authorize,
    required AccountModel account,
    required AccountModel other,
  }) {
    //   // put demo account at the end of the list.
    //   if (isVRAccount(account)) {
    //     return 1;
    //   }
    //
    //   if (isVRAccount(other)) {
    //     return -1;
    //   }
    //
    //   final AccountModel? firstAccount = authorize.accounts.firstWhereOrNull(
    //     (AccountModel? element) => element!.accountId == account.accountId,
    //   );
    //
    //   final AccountModel? otherAccount = authorize.accounts.firstWhereOrNull(
    //     (AccountModel? element) => element!.accountId == other.accountId,
    //   );
    //
    //   if (firstAccount == null || otherAccount == null) {
    //     return 0;
    //   }
    //
    //   return currenciesDisplayOrder.indexOf(firstAccount.currency!) -
    //       currenciesDisplayOrder.indexOf(otherAccount.currency!);
    return -1;
  }

  @override
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode) {
    // TODO: implement getLandingCompany
    throw UnimplementedError();
  }
}
