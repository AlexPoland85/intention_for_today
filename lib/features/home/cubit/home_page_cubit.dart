import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/domain/models/items_model.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'dart:async';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.itemsRepository) : super(HomePageState());

  final ItemsRepository itemsRepository;

  Future<void> start({required String id}) async {
    emit(
      HomePageState(
        status: Status.loading,
      ),
    );
    try {
      final itemsStream = itemsRepository.getItems(id);
      final usersItemsStream = itemsRepository.getUsersItems(id);

      final List<ItemsModel> items = await itemsStream.first;
      final List<ItemsModel> usersItems = await usersItemsStream.first;

      emit(
        HomePageState(
          status: Status.success,
          id: id,
          items: items + usersItems,
        ),
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
