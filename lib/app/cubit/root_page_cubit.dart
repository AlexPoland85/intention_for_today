import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intention_for_today/app/core/enums.dart';

part 'root_page_state.dart';
part 'root_page_cubit.freezed.dart';

@injectable
class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit()
      : super(
          RootPageState(
            user: null,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      RootPageState(
        user: null,
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          auth.FirebaseAuth.instance.authStateChanges().listen((user) {
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

  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
