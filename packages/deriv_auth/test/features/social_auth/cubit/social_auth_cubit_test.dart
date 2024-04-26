import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mock_social_provider_model.dart';

class MockSocialAuthService extends Mock implements BaseSocialAuthService {}

void main() {
  late final BaseSocialAuthService _socialAuthService;
  late final SocialAuthCubit _socialAuthCubit;

  setUpAll(() {
    _socialAuthService = MockSocialAuthService();
    _socialAuthCubit = SocialAuthCubit(socialAuthService: _socialAuthService);
  });

  group('SocialAuthCubit', () {
    test('emits [SocialAuthLoadedState] with social auth providers.', () {
      when(() => _socialAuthService.getSocialAuthProviders())
          .thenAnswer((_) async => mockSocialAuthProviders);

      final List<TypeMatcher<SocialAuthState>> expectedResponse =
          <TypeMatcher<SocialAuthState>>[
        isA<SocialAuthLoadingState>(),
        isA<SocialAuthLoadedState>().having(
          (SocialAuthLoadedState state) => state.socialAuthProviders,
          'list of social auth providers',
          mockSocialAuthProviders,
        ),
      ];

      expectLater(
        _socialAuthCubit.stream,
        emitsInOrder(expectedResponse),
      );

      _socialAuthCubit.getSocialAuthProviders();

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
  });
}
