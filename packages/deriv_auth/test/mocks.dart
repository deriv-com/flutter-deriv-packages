import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends Mock implements DerivAuthCubit {}

class MockDerivResetPassCubit extends Mock implements DerivResetPassCubit {}

class MockSignupCubit extends Mock implements DerivSignupCubit {}

class MockSocialAuthCubit extends Mock implements SocialAuthCubit {}
