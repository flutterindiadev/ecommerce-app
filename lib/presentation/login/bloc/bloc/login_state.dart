part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoggedInstate extends LoginState {
  final UserCredential credential;

  LoggedInstate(this.credential);
}

final class LoginErrorState extends LoginState {
  final FirebaseAuthException exception;

  LoginErrorState(this.exception);
}

final class LogingInstate extends LoginState {}

final class SignupState extends LoginState {}

final class UserExistsState extends LoginState {}
