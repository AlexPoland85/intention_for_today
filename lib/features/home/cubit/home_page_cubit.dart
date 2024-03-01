import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.itemsRepository) : super(HomePageState());

  final ItemsRepository itemsRepository;

  Future<void> start({required String id}) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final itemsStream = itemsRepository.getItems(id);
      final usersItemsStream = itemsRepository.getUsersItems(id);

      final List<ItemsModel> items = await itemsStream.first;
      final List<ItemsModel> usersItems = await usersItemsStream.first;

      emit(
        state.copyWith(
          status: Status.success,
          id: id,
          items: items + usersItems,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
