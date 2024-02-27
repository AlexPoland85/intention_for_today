import 'package:firebase_auth/firebase_auth.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/login_auth_data_source.dart';

class LoginAuthRepository {
  LoginAuthRepository(this._loginAuthDataSource);

  final LoginAuthDataSource _loginAuthDataSource;

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _loginAuthDataSource.signIn(
      email,
      password,
    );
  }

  Future<void> createUserAccount({
    required String email,
    required String password,
  }) async {
    await _loginAuthDataSource.createUser(
      email,
      password,
    );
  }

  Future<void> signOutUser() async {
    await _loginAuthDataSource.signOut();
  }

  Stream<User?> start() {
    return _loginAuthDataSource.start();
  }
}
