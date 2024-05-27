import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth/deriv_auth.dart';
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
  SocialAuthCubit _socialAuthCubit;

  setUpAll(() {
    _socialAuthService = MockSocialAuthService();
    _socialAuthWebViewService = MockSocialWebViewService();

    registerFallbackValue(({required String code, required String state}) {});
  });

  group('SocialAuthCubit', () {
    blocTest(
      'emits [SocialAuthErrorState] when an error occurs.',
      build: () {
        _socialAuthCubit = SocialAuthCubit(
          socialAuthService: _socialAuthService,
          socialAuthWebViewService: _socialAuthWebViewService,
        );
        when(() => _socialAuthService.getSocialAuthProviders())
            .thenThrow(HTTPClientException(
          statusCode: 500,
          message: 'message',
          errorCode: 'TEST_CODE',
        ));

        return _socialAuthCubit;
      },
      act: (SocialAuthCubit cubit) => cubit.getSocialAuthProviders(),
      expect: () => <TypeMatcher<SocialAuthState>>[
        isA<SocialAuthLoadingState>(),
        isA<SocialAuthErrorState>(),
      ],
    );

    blocTest<SocialAuthCubit, SocialAuthState>(
        'emits [SocialAuthLoadedState] with social auth providers on initialization.',
        build: () {
          _socialAuthCubit = SocialAuthCubit(
            socialAuthService: _socialAuthService,
            socialAuthWebViewService: _socialAuthWebViewService,
          );
          when(() => _socialAuthService.getSocialAuthProviders()).thenAnswer(
              (_) async => <SocialAuthProviderModel>[mockSocialAuthProvider]);

          when(
            () => _socialAuthWebViewService.handleSocialAuth(
                socialAuthProviderModel: mockSocialAuthProvider,
                socialAuthUriHandler: any(named: 'socialAuthUriHandler'),
                redirectURL: 'deriv://example',
                onError: any(named: 'onError')),
          ).thenAnswer((_) async => Future<void>.value());
          return _socialAuthCubit;
        },
        act: (SocialAuthCubit cubit) async {
          await cubit.getSocialAuthProviders();

          return cubit.selectSocialLoginProvider(
              selectedSocialAuthProvider: mockSocialAuthProvider.name,
              redirectUrl: 'deriv://example',
              onWebViewError: (String error) {},
              onRedirectUrlReceived: (SocialAuthDto socialAuthDto) {});
        },
        expect: () => <TypeMatcher<SocialAuthState>>[
              isA<SocialAuthLoadingState>(),
              isA<SocialAuthLoadedState>(),
              isA<SocialAuthLoadingState>(),
              isA<SocialAuthLoadedState>(),
            ]);
  });
}
