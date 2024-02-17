import 'package:ecommerceapp/presentation/login/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final FirebaseException exception;
  const ErrorScreen({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('An error occured'),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An Error occured. Please try again !',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(exception.code)
          ],
        ),
      ),
    );
  }
}
