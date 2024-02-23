import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';

part 'add_page_cubit.freezed.dart';
part 'add_page_state.dart';

@injectable
class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit(this.itemsRepository) : super(AddPageState());

  final ItemsRepository itemsRepository;

  Future<void> start() async {
    emit(
      AddPageState(
        status: Status.success,
      ),
    );
  }

  Future<void> addUsersItem({required String content}) async {
    emit(
      AddPageState(
        status: Status.loading,
      ),
    );
    try {
      await itemsRepository.addUsersItem(content);
      emit(
        AddPageState(status: Status.success),
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
