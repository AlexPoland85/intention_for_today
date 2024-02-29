import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';
import 'dart:math';

part 'details_page_cubit.freezed.dart';
part 'details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  DetailsPageCubit(this.itemsRepository) : super(DetailsPageState());

  final ItemsRepository itemsRepository;

  Future<void> drawItem({required String id}) async {
    emit(
      DetailsPageState(
        status: Status.loading,
      ),
    );
    try {
      final itemsStream = itemsRepository.getItems(id);
      final usersItemsStream = itemsRepository.getUsersItems(id);

      final List<ItemsModel> items = await itemsStream.first;
      final List<ItemsModel> usersItems = await usersItemsStream.first;

      final List<ItemsModel> allItems = items + usersItems;

      if (allItems.isNotEmpty) {
        final Random random = Random();
        final randomItem = allItems[random.nextInt(allItems.length)];

        emit(
          DetailsPageState(
            status: Status.success,
            id: id,
            selectedItem: randomItem,
          ),
        );
      }
    } catch (error) {
      emit(
        DetailsPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> deleteItems({required String id}) async {
    emit(
      DetailsPageState(
        status: Status.loading,
      ),
    );
    try {
      await itemsRepository.deleteUsersItem(id);
      emit(
        DetailsPageState(status: Status.success, id: id),
      );
    } catch (error) {
      emit(
        DetailsPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
