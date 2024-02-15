part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default([]) List<ItemsModel> items,
    @Default(Status.initial) Status status,
    ItemsModel? selectedItem,
    String? errorMessage,
    String? id,
  }) = _HomePageState;
}

// @freezed
// class HomePageState with _$HomePageState {
//   factory HomePageState({
//     @Default(Status.initial) Status status,
//     String? id,
//     List<ItemModel> items,
//     List<ItemModel> usersItems,
//     ItemModel? selectedItem,
//     String? errorMessage,
//   }) = _HomePageState;
// }