import 'package:ecommerceapp/presentation/login/bloc/bloc/login_bloc.dart';
import 'package:ecommerceapp/presentation/login/pages/error_screen.dart';
import 'package:ecommerceapp/presentation/product/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ErrorScreen(exception: state.exception)));
          }

          if (state is LoggedInstate) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ProductsPage()));
          }

          if (state is UserExistsState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProductsPage()));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            // SignUp
            if (state is SignupState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Image.asset('assets/images/loginimage.jpeg'),
                    const Center(
                        child: Text(
                      'Please Sign up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          label: Text('Email'),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const CircularProgressIndicator();
                        }

                        return ElevatedButton(
                            onPressed: () {
                              if (emailController.text != '' &&
                                  passwordController.text.length > 6) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  CreateAccountWithEmailandPasswordEvent(
                                      email: emailController.text,
                                      password: passwordController.text),
                                );
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 15),
                            ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member? ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(ToggleLogin());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }

            //Login

            if (state is LogingInstate) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Image.asset('assets/images/loginimage.jpeg'),
                    const Center(
                        child: Text(
                      'Please Login to Continue',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          label: Text('Email'),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          label: Text('Password'),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const CircularProgressIndicator();
                        }

                        return ElevatedButton(
                          onPressed: () {
                            if (emailController.text != '' &&
                                passwordController.text.length > 6) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  SigninwithEmailandPassword(
                                      email: emailController.text,
                                      password: passwordController.text));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New User? ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(ToggleLogin());
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
