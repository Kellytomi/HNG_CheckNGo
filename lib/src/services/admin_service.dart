import 'package:checkngo/src/models/admin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminService {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<Admin> getAdmin() async {
    // use the current logged in user to fetch and return the admin
    // replace the mock admin with the admin fetchec
    final admin = FirebaseAuth.instance.currentUser;
    final email = admin?.email;
    return const Admin(id: '08034554326', email: 'admin@gmail.com', orgName: 'Admin');
  }
}
