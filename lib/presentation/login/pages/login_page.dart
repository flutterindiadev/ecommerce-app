import 'package:ecommerceapp/presentation/login/bloc/bloc/login_bloc.dart';
import 'package:ecommerceapp/presentation/login/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(ToggleLogin()),
      child: const LoginView(),
    );
  }
}
