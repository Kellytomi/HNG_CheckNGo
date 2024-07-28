import 'package:firebase_auth/firebase_auth.dart';

class AdminService {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password
                    );
  }
}
