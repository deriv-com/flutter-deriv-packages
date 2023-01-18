import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:deriv_auth/features/auth/services/base_auth_service.dart';

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
          () => service.login(any(), accountsList: any(named: 'accountsList')),
        );
      });

      test('should emit [AuthLoggedInState] if there is default account', () {
        when(() => service.getDefaultAccount())
            .thenAnswer((_) => Future<AccountModel?>.value(mockedAccountModel));
        when(() => service.getLatestAccounts()).thenAnswer((_) =>
            Future<List<AccountModel>>.value(
                <AccountModel>[mockedAccountModel]));
        when(() =>
                service.login(any(), accountsList: any(named: 'accountsList')))
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
        authCubit.otpLogin(otp: 'otp', email: 'email', password: 'pass');

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
        when(() => service.onLoggedOut()).thenAnswer(
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
    },
  );
}
