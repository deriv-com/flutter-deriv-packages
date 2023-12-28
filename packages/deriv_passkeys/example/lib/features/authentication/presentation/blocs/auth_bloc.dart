import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passkeys_poc/core/domain/base_usecase.dart';
import 'package:passkeys_poc/features/authentication/domain/usecases/cred/cred_usecases.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_event.dart';
import 'package:passkeys_poc/features/authentication/presentation/blocs/auth_state.dart';
import 'package:passkeys_poc/features/authentication/presentation/entities/user_entity.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final CredLoginUseCase _credLoginUseCase;
  final CredSignupUseCase _credSignupUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc() : 
    _credLoginUseCase = CredLoginUseCase(),
    _credSignupUseCase = CredSignupUseCase(),
    _logoutUseCase = LogoutUseCase(),
  super(InitialAuthState()){
    on<LoginEvent>((event, emit) async{
      emit(LoadingAuthState());
      final result = await _credLoginUseCase.call(CredLoginUseCaseParams(
        email: event.userEntity.email,
        password: event.userEntity.password!,
      ));
      result.fold(
        (failure) => emit(ErrorAuthState(failure)),
        (user) {
          UserEntity userEntity = UserEntity(
            id: user.id,
            email: user.email,
            name: user.name,
          );
          
          emit(AuthenticatedState(userEntity));

          },
      );
    });

    on<SignupEvent>((event, emit) async{
      emit(LoadingAuthState());
      final result = await _credSignupUseCase.call(CredSignupUseCaseParams(
        email: event.userEntity.email,
        password: event.userEntity.password!,
        name: event.userEntity.name!,
      ));
      result.fold(
        (failure) => emit(ErrorAuthState(failure)),
        (user) {
          UserEntity userEntity = UserEntity(
            id: user.id,
            email: user.email,
            name: user.name,
          );
          
          emit(AuthenticatedState(userEntity));

          },
      );
    });

    on<LogoutEvent>((event, emit) async{
      emit(LoadingAuthState());
      final result = await _logoutUseCase.call(EmptyRequest());
      result.fold(
        (failure) => emit(ErrorAuthState(failure)),
        (user) {
          emit(InitialAuthState());
          },
      );
    });



  }
}