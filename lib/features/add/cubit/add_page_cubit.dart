import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';

part 'add_page_cubit.freezed.dart';
part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit(this.itemsRepository)
      : super(
          AddPageState(
            status: Status.success,
          ),
        );

  final ItemsRepository itemsRepository;

  Future<void> addUsersItem({required String content}) async {
    emit(
      AddPageState(
        status: Status.loading,
      ),
    );
    try {
      await itemsRepository.addUsersItem(content);
      emit(
        AddPageState(status: Status.success, saved: true),
      );
    } catch (error) {
      emit(
        AddPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
