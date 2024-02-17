part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class CreateAccountWithEmailandPasswordEvent extends LoginEvent {
  final String email;

  final String password;

  CreateAccountWithEmailandPasswordEvent(
      {required this.email, required this.password});
}

class SigninwithEmailandPassword extends LoginEvent {
  final String email;

  final String password;

  SigninwithEmailandPassword({required this.email, required this.password});
}

class ToggleLogin extends LoginEvent {
  ToggleLogin();
}
