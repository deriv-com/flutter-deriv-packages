import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth/features/auth/services/base_auth_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocked_data/mocked_auth_models.dart';

class MockAuthService extends Mock implements BaseAuthService {}

void main() {
  late final DerivAuthCubit authCubit;
  late final MockAuthService service;

  setUpAll(() async {
    service = MockAuthService();
    authCubit = DerivAuthCubit(authService: service);
  });

  group(
    'auth cubit tests =>',
    () {
      test('.output returns stream of [DerivAuthState]', () {
        expect(authCubit.output, isA<Stream<DerivAuthState>>());
      });

      test('should emit [AuthLoggedOutState] for the first app start.', () {
        when(() => service.getDefaultAccount())
            .thenAnswer((_) => Future<AccountModel?>.value());

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedOutState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.authorizeDefaultAccount();

        verify(() => service.getDefaultAccount()).called(1);
        verifyNever(
          () => service.login(any(), accounts: any(named: 'accounts')),
        );
      });

      test('should emit [AuthLoggedInState] if there is default account.', () {
        when(() => service.getDefaultAccount())
            .thenAnswer((_) => Future<AccountModel?>.value(mockedAccountModel));

        when(() => service.getLatestAccounts()).thenAnswer((_) =>
            Future<List<AccountModel>>.value(
                <AccountModel>[mockedAccountModel]));

        when(() => service.getLandingCompany(any())).thenAnswer((_) =>
            Future<LandingCompanyEntity>.value(const LandingCompanyEntity()));

        when(() => service.login(any(), accounts: any(named: 'accounts')))
            .thenAnswer((_) =>
                Future<AuthorizeEntity>.value(mockedValidAuthorizeEntity));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedInState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.authorizeDefaultAccount();

        verify(() => service.getDefaultAccount()).called(1);
      });

      test('should emit [AuthLoggedInState] upon a successful system login.',
          () {
        registerFallbackValue(GetTokensRequestModel(type: AuthType.system));

        when(() => service.onLoginRequest(any())).thenAnswer(
            (_) => Future<AuthorizeEntity>.value(mockedValidAuthorizeEntity));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedInState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.systemLogin(email: 'email', password: 'password');

        verify(() => service.onLoginRequest(any())).called(1);
      });
      test('should emit [AuthLoggedInState] upon a successful social login.',
          () {
        registerFallbackValue(GetTokensRequestModel(type: AuthType.social));

        when(() => service.onLoginRequest(any())).thenAnswer(
            (_) => Future<AuthorizeEntity>.value(mockedValidAuthorizeEntity));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedInState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.socialLogin(oneAllConnectionToken: 'token');

        verify(() => service.onLoginRequest(any())).called(1);
      });
      test('should emit [AuthLoggedInState] upon a successful otp login.', () {
        when(() => service.onLoginRequest(any())).thenAnswer(
            (_) => Future<AuthorizeEntity>.value(mockedValidAuthorizeEntity));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedInState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );
        authCubit.systemLogin(email: 'email', password: 'pass', otp: 'otp');

        verify(() => service.onLoginRequest(any())).called(1);
      });

      test('should emit [AuthErrorState] when an exception occurs in service.',
          () {
        registerFallbackValue(GetTokensRequestModel(type: AuthType.system));

        when(() => service.onLoginRequest(any())).thenThrow(DerivAuthException(
          message: 'message',
          type: AuthErrorType.expiredAccount,
        ));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthErrorState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.systemLogin(email: 'email', password: 'pass');

        verify(() => service.onLoginRequest(any())).called(1);
      });
      test('should emit [AuthLoggedOutState] upon a successful logout.', () {
        when(() => service.logout()).thenAnswer((_) => Future<void>.value());
        when(() => service.onLogout()).thenAnswer((_) => Future<void>.value());
        when(() => service.onPostLogout()).thenAnswer(
          (_) => Future<void>.value(),
        );

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedOutState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.logout();

        verify(() => service.logout()).called(1);
      });

      test('emits [AuthLoggedInState] upon successful token login', () {
        const String _token = 'token';

        when(() => service.getLatestAccounts()).thenAnswer((_) =>
            Future<List<AccountModel>>.value(
                <AccountModel>[mockedAccountModel]));

        when(() => service.login(any(), accounts: any(named: 'accounts')))
            .thenAnswer((_) =>
                Future<AuthorizeEntity>.value(mockedValidAuthorizeEntity));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthLoggedInState>().having(
              (DerivAuthLoggedInState state) => state.authorizeEntity,
              'authorized entity',
              mockedValidAuthorizeEntity),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.tokenLogin(_token);

        verify(
          () => service.login(any(), accounts: any(named: 'accounts')),
        ).called(1);
      });

      test(
          'emits [AuthErrorState] when an exception occurs in login service during token login',
          () {
        const String _token = 'token';

        when(() => service.getLatestAccounts()).thenAnswer((_) =>
            Future<List<AccountModel>>.value(
                <AccountModel>[mockedAccountModel]));

        when(() => service.login(any(), accounts: any(named: 'accounts')))
            .thenThrow(DerivAuthException(
          message: 'message',
          type: AuthErrorType.invalidToken,
        ));

        final List<TypeMatcher<DerivAuthState>> expectedResponse =
            <TypeMatcher<DerivAuthState>>[
          isA<DerivAuthLoadingState>(),
          isA<DerivAuthErrorState>(),
        ];

        expectLater(
          authCubit.stream,
          emitsInOrder(expectedResponse),
        );

        authCubit.tokenLogin(_token);

        verify(
          () => service.login(any(), accounts: any(named: 'accounts')),
        ).called(1);
      });
    },
  );
}
