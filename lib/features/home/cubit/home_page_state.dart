part of 'home_page_cubit.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default([]) List<ItemsModel> items,
    @Default(Status.initial) Status status,
    ItemsModel? selectedItem,
    String? errorMessage,
    String? id,
  }) = _HomePageState;
}
