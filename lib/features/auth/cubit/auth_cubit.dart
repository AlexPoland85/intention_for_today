import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/domain/repositories/login_auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginAuthRepository)
      : super(
          AuthState(),
        );
  final LoginAuthRepository _loginAuthRepository;

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      await _loginAuthRepository.signInUser(
        email: email,
        password: password,
      );
      emit(
        AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createUserAccount({
    required String email,
    required String password,
  }) async {
    try {
      await _loginAuthRepository.createUserAccount(
          email: email, password: password);
      emit(
        AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOutUser() async {
    try {
      await _loginAuthRepository.signOutUser();
      emit(
        AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
