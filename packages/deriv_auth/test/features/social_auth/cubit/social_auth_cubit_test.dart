import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/social_auth/services/base_social_web_view_service.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_social_provider_model.dart';

class MockSocialAuthService extends Mock implements BaseSocialAuthService {}

class MockSocialWebViewService extends Mock
    implements BaseSocialWebViewService {}

void main() {
  late final BaseSocialAuthService _socialAuthService;
  late final BaseSocialWebViewService _socialAuthWebViewService;
  late final SocialAuthCubit _socialAuthCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    _socialAuthService = MockSocialAuthService();
    _socialAuthWebViewService = MockSocialWebViewService();

    registerFallbackValue(({required String code, required String state}) {});
  });

  group('SocialAuthCubit', () {
    test(
        'emits [SocialAuthLoadedState] with social auth providers on initialization.',
        () {
      final List<TypeMatcher<SocialAuthState>> expectedResponse =
          <TypeMatcher<SocialAuthState>>[
        isA<SocialAuthLoadedState>().having(
          (SocialAuthLoadedState state) => state.socialAuthProviders,
          'list of social auth providers',
          mockSocialAuthProviders,
        ),
      ];

      when(() => _socialAuthService.getSocialAuthProviders())
          .thenAnswer((_) async => mockSocialAuthProviders);

      _socialAuthCubit = SocialAuthCubit(
          socialAuthService: _socialAuthService,
          socialAuthWebViewService: _socialAuthWebViewService);

      expectLater(
        _socialAuthCubit.stream,
        emitsInOrder(expectedResponse),
      );

      verify(() => _socialAuthService.getSocialAuthProviders()).called(1);
    });

    test('emits [SocialAuthErrorState] when an error occurs.', () {
      when(() => _socialAuthService.getSocialAuthProviders())
          .thenThrow(HTTPClientException(
        statusCode: 500,
        message: 'message',
        errorCode: 'TEST_CODE',
      ));

      final List<TypeMatcher<SocialAuthState>> expectedResponse =
          <TypeMatcher<SocialAuthState>>[
        isA<SocialAuthLoadingState>(),
        isA<SocialAuthErrorState>(),
      ];

      expectLater(
        _socialAuthCubit.stream,
        emitsInOrder(expectedResponse),
      );

      _socialAuthCubit.getSocialAuthProviders();

      verify(() => _socialAuthService.getSocialAuthProviders()).called(1);
    });

    test(
        'calls [BaseSocialWebViewService.handleSocialAuth] and emits [SocialAuthLoadedState]',
        () {
      when(() => _socialAuthService.getSocialAuthProviders())
          .thenAnswer((_) async => mockSocialAuthProviders);

      when(
        () => _socialAuthWebViewService.handleSocialAuth(
            socialAuthProviderModel: mockSocialAuthProvider,
            socialAuthUriHandler: any(named: 'socialAuthUriHandler'),
            redirectURL: 'deriv://example',
            onError: any(named: 'onError')),
      ).thenAnswer((_) => Future<void>.value());

      final SocialAuthCubit socialAuthCubit = SocialAuthCubit(
          socialAuthService: _socialAuthService,
          socialAuthWebViewService: _socialAuthWebViewService)
        ..selectSocialLoginProvider(
            selectedSocialAuthProvider: mockSocialAuthProvider.name,
            redirectUrl: 'deriv://example',
            onWebViewError: (String error) {},
            onRedirectUrlReceived: (SocialAuthDto socialAuthDto) {});

      final List<TypeMatcher<SocialAuthState>> expectedResponse =
          <TypeMatcher<SocialAuthState>>[
        isA<SocialAuthLoadedState>().having(
          (SocialAuthLoadedState state) => state.socialAuthProviders,
          'list of social auth providers',
          mockSocialAuthProviders,
        ),
      ];

      expect(
        socialAuthCubit.stream,
        emitsInOrder(expectedResponse),
      );
    });
  });
}
