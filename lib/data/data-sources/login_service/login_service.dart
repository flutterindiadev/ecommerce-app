import 'package:ecommerceapp/data/data-sources/local/sharedprefs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  String email;
  String password;

  LoginService({required this.email, required this.password});

  Future<UserCredential?> signupwithEmailandPassword() async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Sharedprefs().setVal(key: 'token', val: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        rethrow;
      } else if (e.code == 'email-already-in-use') {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    return credential;
  }

  Future<UserCredential?> loginwithEmailandPassword() async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Sharedprefs().setVal(key: 'token', val: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    return credential;
  }
}
