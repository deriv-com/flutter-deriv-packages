// part of 'login_cubit.dart';

// /// Login feature states.
// abstract class LoginState {
//   /// Initializes splash states.
//   const LoginState();
// }

// /// Initial state.
// class LoginInitialState extends LoginState {
//   /// Initializes initial state.
//   const LoginInitialState();
// }

// /// Loading state.
// class LoginLoadingState extends LoginState {
//   /// Initializes initial state.
//   const LoginLoadingState();
// }

// /// Account authorized state.
// class LoginAuthorizedState extends LoginState {
//   /// Initializes authorized state.
//   const LoginAuthorizedState();
// }

// /// Account unauthorized state.
// class LoginUnauthorizedState extends LoginState {
//   /// Initializes unauthorized state.
//   const LoginUnauthorizedState({
//     this.authErrorType,
//     this.errorCode,
//     this.errorMessage,
//     this.logoutReason,
//   });

//   /// The type of the auth error.
//   final AuthErrorType? authErrorType;

//   /// The error code.
//   final String? errorCode;

//   /// The message of the auth error.
//   final String? errorMessage;

//   /// Reason for logout, usually force logout.
//   final String? logoutReason;
// }

// /// Account has connection state.
// class LoginHasConnectionState extends LoginState {
//   /// Initializes has connection state.
//   const LoginHasConnectionState({this.hasConnection});

//   /// Status of connectivity
//   final bool? hasConnection;

//   @override
//   String toString() => 'LoginHasConnectionState(hasConnection: $hasConnection)';
// }
