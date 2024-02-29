import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/services/jwt/services/base_jwt_service.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:deriv_auth/deriv_auth.dart';

import '../../social_auth/mocks/mock_social_auth_dto.dart';
import '../mocked_data/mocked_auth_models.dart';

class MockAuthRepository extends Mock implements BaseAuthRepository {}

class MockJwtService extends Mock implements BaseJwtService {}

class MockTokenService extends Mock implements BaseTokenService {}

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => 'appId';

  @override
  String get endpoint => 'endpoint';
}

void main() {
  const String validToken = 'validToken';
  const String validJwtToken = 'validJwtToken';
  const String invalidJwtToken = 'invalidJwtToken';

  late final DerivAuthService authService;
  late final BaseAuthRepository repository;
  late final BaseJwtService jwtService;
  late final BaseTokenService tokenService;
  late final AuthConnectionInfo connectionInfo;

  setUpAll(() {
    repository = MockAuthRepository();
    jwtService = MockJwtService();
    tokenService = MockTokenService();
    connectionInfo = MockConnectionInfo();

    authService = DerivAuthService(
      authRepository: repository,
      jwtService: jwtService,
      connectionInfo: connectionInfo,
      tokenService: tokenService,
    );

    registerFallbackValue(mockedValidAuthorizeEntity);
    registerFallbackValue(GetTokensRequestModel());
    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockConnectionInfo());

    when(() => tokenService.getUserTokens(
          request: any(named: 'request'),
          jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
          connectionInfo: any(named: 'connectionInfo'),
        )).thenAnswer(
      (_) => Future<GetTokensResponseModel>.value(GetTokensResponseModel(
        refreshToken: 'refreshToken',
        socialType: null,
        tokens: <Token>[
          Token(loginid: 'CR90000003', token: validToken),
        ],
      )),
    );

    when(() => tokenService.getUserTokens(
          request: any(named: 'request'),
          jwtToken: any(named: 'jwtToken', that: equals(invalidJwtToken)),
          connectionInfo: any(named: 'connectionInfo'),
        )).thenThrow(
      HTTPClientException(
        message: 'invalid jwt token',
        errorCode: invalidJwtTokenError,
        statusCode: 400,
      ),
    );

    when(() => repository.authorize(validToken)).thenAnswer((_) =>
        Future<AuthorizeResponseEntity>.value(const AuthorizeResponseEntity(
            authorize: mockedValidAuthorizeEntity)));

    when(() => repository.onLogin(any()))
        .thenAnswer((_) => Future<void>.value());
  });

  group(
    'auth service tests =>',
    () {
      test(
          'should return valid authorize model when calling login with valid token.',
          () async {
        final AuthorizeEntity response = await authService.login(
          validToken,
          accounts: <AccountModel>[
            AccountModel(accountId: '0', token: validToken)
          ],
          refreshToken: 'refreshToken',
          signupProvider: 'signupProvider',
        );

        expect(response.userId, mockedValidAuthorizeEntity.userId);
        expect(response.refreshToken, 'refreshToken');
        expect(response.signupProvider, 'signupProvider');
        expect(
            response.accountList
                ?.every((AccountListItem account) => account.token != null),
            true);

        verify(() => repository.onLogin(any())).called(1);
      });

      test(
          'should return valid authorize model when calling loginRequest with valid jwt.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
          request: GetTokensRequestModel(
            type: AuthType.system,
            email: 'email',
            password: 'pass',
            signupProvider: 'signupProvider',
          ),
        );

        expect(response.userId, mockedValidAuthorizeEntity.userId);
        expect(response.refreshToken, 'refreshToken');
        expect(response.signupProvider, 'signupProvider');
        expect(
            response.accountList
                ?.every((AccountListItem account) => account.token != null),
            true);

        verify(() => repository.onLogin(any())).called(1);
      });

      test(
          'should return valid authorize model when calling social type loginRequest with valid jwt.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
          request: GetTokensRequestModel(
            type: AuthType.social,
            signupProvider: 'signupProvider',
            oneAllConnectionToken: 'oneAllConnectionToken',
          ),
        );

        expect(response.userId, mockedValidAuthorizeEntity.userId);
        expect(response.refreshToken, 'refreshToken');
        expect(response.signupProvider, 'signupProvider');
        expect(
            response.accountList
                ?.every((AccountListItem account) => account.token != null),
            true);

        verify(() => repository.onLogin(any())).called(1);
      });

      test(
          'should return valid authorize model when calling socialLogin type loginRequest with valid jwt.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
          request: GetTokensRequestModel(
            type: AuthType.socialLogin,
            signupProvider: 'signupProvider',
            socialAuthDto: mockSocialAuthDto,
          ),
        );

        expect(response.userId, mockedValidAuthorizeEntity.userId);
        expect(response.refreshToken, 'refreshToken');
        expect(response.signupProvider, 'signupProvider');
        expect(
            response.accountList
                ?.every((AccountListItem account) => account.token != null),
            true);

        verify(() => repository.onLogin(any())).called(1);
      });

      test('should auto fetch new jwt token if current one is expired.',
          () async {
        reset(jwtService);

        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(invalidJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
            request: GetTokensRequestModel(
              type: AuthType.system,
              email: 'email',
              password: 'pass',
              signupProvider: 'signupProvider',
            ),
            onInvalidJwtToken: () {
              when(() => jwtService.getJwtToken()).thenAnswer(
                (_) => Future<String>.value(validJwtToken),
              );
            });

        verify(() => jwtService.getJwtToken()).called(2);

        expect(response.userId, mockedValidAuthorizeEntity.userId);
        expect(response.refreshToken, 'refreshToken');
        expect(response.signupProvider, 'signupProvider');
        expect(
            response.accountList
                ?.every((AccountListItem account) => account.token != null),
            true);
      });

      test(
          'should throw [DerivAuthException] of type [invalidCredentials] on login with invalid credentials.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'invalid credentials',
            errorCode: invalidCredentialError,
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                  (DerivAuthException exception) => exception.type,
                  'exception type',
                  AuthErrorType.invalidCredential),
            ));
      });

      test(
          'should throw [DerivAuthException] of type [invalid2faCode] on login with invalid 2fa code.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'invalid 2fa code',
            errorCode: invalidAuthCodeError,
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                  (DerivAuthException exception) => exception.type,
                  'exception type',
                  AuthErrorType.invalid2faCode),
            ));
      });

      test(
          'should throw [DerivAuthException] of type [missingOTPError] on login with no otp.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'missing otp',
            errorCode: missingOTPError,
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                  (DerivAuthException exception) => exception.type,
                  'exception type',
                  AuthErrorType.missingOtp),
            ));
      });

      test(
          'should throw [DerivAuthException] of type [failedAuthorization] on login exception.',
          () async {
        when(() => repository.onLogin(any()))
            .thenThrow(Exception('FailedAuthorization'));

        expect(
            authService.login(
              validToken,
              accounts: <AccountModel>[
                AccountModel(accountId: '0', token: validToken)
              ],
              refreshToken: 'refreshToken',
              signupProvider: 'signupProvider',
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'exception type',
                AuthErrorType.failedAuthorization,
              ),
            ));
      });

      test(
          'should throw [DerivAuthException] of type [expiredAccount] on login when token is expired.',
          () async {
        when(() => repository.authorize(validToken))
            .thenAnswer((_) => Future<AuthorizeResponseEntity>.value(
                  const AuthorizeResponseEntity(),
                ));

        expect(
            authService.login(
              validToken,
              accounts: <AccountModel>[
                AccountModel(accountId: '0', token: validToken)
              ],
              refreshToken: 'refreshToken',
              signupProvider: 'signupProvider',
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'exception type',
                AuthErrorType.expiredAccount,
              ),
            ));
      });

      test(
          'should throw [DerivAuthException] of type [expiredAccount] on login with invalid token.',
          () async {
        when(() => repository.onLogin(any()))
            .thenThrow(Exception('InvalidToken'));

        expect(
            authService.login(
              validToken,
              accounts: <AccountModel>[
                AccountModel(accountId: '0', token: validToken)
              ],
              refreshToken: 'refreshToken',
              signupProvider: 'signupProvider',
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'exception type',
                AuthErrorType.expiredAccount,
              ),
            ));
      });

      test('should throw [DerivAuthException] of type [selfClosed].', () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'self closed',
            errorCode: selfClosedError,
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'self closed',
                AuthErrorType.selfClosed,
              ),
            ));
      });
      test(
          'should throw [DerivAuthException] of type [accountUnavailableError] on login with an unanvailable account.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'account unavailable',
            errorCode: accountUnavailableError,
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'account unavailable',
                AuthErrorType.accountUnavailable,
              ),
            ));
      });
      test(
          'should throw [DerivAuthException] of type [failedAuthorization] on login and an unknown error occurs.',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        when(() => tokenService.getUserTokens(
              request: any(named: 'request'),
              jwtToken: any(named: 'jwtToken', that: equals(validJwtToken)),
              connectionInfo: any(named: 'connectionInfo'),
            )).thenThrow(
          HTTPClientException(
            message: 'unknown error',
            errorCode: 'unknown error',
            statusCode: 400,
          ),
        );

        expect(
            authService.onLoginRequest(
              request: GetTokensRequestModel(
                type: AuthType.system,
                email: 'email',
                password: 'pass',
                signupProvider: 'signupProvider',
              ),
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'unknown error',
                AuthErrorType.failedAuthorization,
              ),
            ));
      });
      test(
          'should throw [DerivAuthException] of type [unsupportedCountry] on login when country not supported.',
          () async {
        when(() => repository.authorize(validToken))
            .thenAnswer((_) => Future<AuthorizeResponseEntity>.value(
                  const AuthorizeResponseEntity(
                    authorize: mockedUnsupportedAuthorizeEntity,
                  ),
                ));

        expect(
            authService.login(
              validToken,
              accounts: <AccountModel>[
                AccountModel(accountId: '0', token: validToken)
              ],
              refreshToken: 'refreshToken',
              signupProvider: 'signupProvider',
            ),
            throwsA(
              isA<DerivAuthException>().having(
                (DerivAuthException exception) => exception.type,
                'exception type',
                AuthErrorType.unsupportedCountry,
              ),
            ));
      });

      test('should return latest accounts.', () async {
        when(() => repository.getLatestAccounts())
            .thenAnswer((_) => Future<List<AccountModel>>.value(
                  <AccountModel>[
                    mockedAccountModel,
                  ],
                ));

        final List<AccountModel> accounts =
            await authService.getLatestAccounts();

        expect(accounts, <AccountModel>[mockedAccountModel]);

        verify(() => repository.getLatestAccounts()).called(1);
      });

      test('should return default account.', () async {
        when(() => repository.getDefaultAccount())
            .thenAnswer((_) => Future<AccountModel>.value(mockedAccountModel));

        final AccountModel? account = await authService.getDefaultAccount();

        expect(account, mockedAccountModel);

        verify(() => repository.getDefaultAccount()).called(1);
      });

      test('should logout the user.', () async {
        when(() => repository.logout()).thenAnswer((_) => Future<void>.value());

        await authService.logout();

        verify(() => repository.logout()).called(1);
      });

      test('should call the [onLoggedOut] method.', () async {
        when(() => repository.onPostLogout())
            .thenAnswer((_) => Future<void>.value());

        await authService.onPostLogout();

        verify(() => repository.onPostLogout()).called(1);
      });
    },
  );
}
