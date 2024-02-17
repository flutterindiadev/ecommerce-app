import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/data/data-sources/local/sharedprefs.dart';
import 'package:ecommerceapp/data/data-sources/login_service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<CreateAccountWithEmailandPasswordEvent>(
        _onCreateAccountWithEmailandPasswordEvent);

    on<ToggleLogin>(_onTaggleLogin);

    on<SigninwithEmailandPassword>(_onSigninWithEmailandPassword);
  }

  _onCreateAccountWithEmailandPasswordEvent(
      CreateAccountWithEmailandPasswordEvent event,
      Emitter<LoginState> emitter) async {
    var creds;

    try {
      emit(LoginLoadingState());
      creds = await LoginService(email: event.email, password: event.password)
          .signupwithEmailandPassword();
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e));
    }

    if (creds != null) {
      emit(LoggedInstate(creds));
    }
  }

  _onTaggleLogin(ToggleLogin event, Emitter<LoginState> emitter) async {
    String? token = await Sharedprefs().getVal(key: 'token');

    if (token != null) {
      emit(UserExistsState());
    }

    if (state is LoginInitial) {
      emit(LogingInstate());
      return;
    }

    if (state is LogingInstate) {
      emit(SignupState());
      return;
    }

    if (state is SignupState) {
      emit(LogingInstate());
      return;
    }
  }

  _onSigninWithEmailandPassword(
      SigninwithEmailandPassword event, Emitter<LoginState> emitter) async {
    var creds;
    try {
      creds = await LoginService(email: event.email, password: event.password)
          .loginwithEmailandPassword();
      if (creds != null) {
        emit(LoggedInstate(creds));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e));
    }
  }
}
