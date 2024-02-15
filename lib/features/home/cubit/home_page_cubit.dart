import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';
import 'dart:math';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.itemsRepository) : super(HomePageState());

  final ItemsRepository itemsRepository;

  Future<void> fetchItems({required String id}) async {
    emit(
      HomePageState(
        status: Status.loading,
      ),
    );
    try {
      itemsRepository.getItems(id);
      emit(
        HomePageState(status: Status.success, id: id),
      );
    } catch (error) {
      emit(
        HomePageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> fetchUsersItems({required String id}) async {
    emit(
      HomePageState(
        status: Status.loading,
      ),
    );
    try {
      itemsRepository.getUsersItems(id);
      emit(
        HomePageState(status: Status.success, id: id),
      );
    } catch (error) {
      emit(
        HomePageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> drawItem({required String id}) async {
    emit(
      HomePageState(
        status: Status.loading,
      ),
    );
    try {
      final itemsStream = itemsRepository.getItems(id);
      final usersItemsStream = itemsRepository.getUsersItems(id);

      final List<ItemsModel> allItems =
          await itemsStream.asyncMap((items) async {
        final usersItems = await usersItemsStream.first;
        return items + usersItems;
      }).first;

      if (allItems.isNotEmpty) {
        final Random random = Random();
        final randomItem = allItems[random.nextInt(allItems.length)];

        emit(
          HomePageState(
            status: Status.success,
            id: id,
            selectedItem: randomItem,
          ),
        );
      } else {
        emit(
          HomePageState(
            status: Status.success,
            id: id,
            errorMessage: 'No items available.',
          ),
        );
      }
    } catch (error) {
      emit(
        HomePageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> deleteItems({required String id}) async {
    emit(
      HomePageState(
        status: Status.loading,
      ),
    );
    try {
      await itemsRepository.deleteUsersItem(id);
      emit(
        HomePageState(status: Status.success, id: id),
      );
    } catch (error) {
      emit(
        HomePageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
