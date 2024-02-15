import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/repositories/login_auth_repository.dart';

part 'root_page_state.dart';
part 'root_page_cubit.freezed.dart';

class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit(this._loginAuthRepository)
      : super(
          RootPageState(
            user: null,
          ),
        );

  final LoginAuthRepository _loginAuthRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      RootPageState(
        user: null,
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription = _loginAuthRepository.start().listen((user) {
        emit(
          RootPageState(
            user: user,
            status: Status.success,
          ),
        );
      });
    } catch (error) {
      emit(
        RootPageState(
          user: null,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
