import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:deriv_auth/core/services/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/core/services/jwt/services/base_jwt_service.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:deriv_auth/core/constants/constants.dart';

import 'package:deriv_auth/deriv_auth.dart';

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
          client: any(named: 'client'),
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
          client: any(named: 'client'),
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
          'should return valid authorize model when calling login with valid token',
          () async {
        final AuthorizeEntity response = await authService.login(
          validToken,
          accountsList: <AccountModel>[
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
          'should return valid authorize model when calling loginRequest with valid jwt',
          () async {
        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(validJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
          GetTokensRequestModel(
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
      test('should auto fetch new jwt token if current one is expired ',
          () async {
        reset(jwtService);

        when(() => jwtService.getJwtToken()).thenAnswer(
          (_) => Future<String>.value(invalidJwtToken),
        );

        final AuthorizeEntity response = await authService.onLoginRequest(
            GetTokensRequestModel(
              type: AuthType.system,
              email: 'email',
              password: 'pass',
              signupProvider: 'signupProvider',
            ), () {
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
    },
  );
}
