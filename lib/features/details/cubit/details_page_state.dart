part of 'details_page_cubit.dart';

@freezed
class DetailsPageState with _$DetailsPageState {
  factory DetailsPageState({
    @Default([]) List<ItemsModel> items,
    @Default(Status.initial) Status status,
    ItemsModel? selectedItem,
    String? errorMessage,
    String? id,
  }) = _DetailsPageState;
}

// @freezed
// class DetailsPageState with _$DetailsPageState {
//   factory DetailsPageState({
//     @Default(Status.initial) Status status,
//     String? id,
//     List<ItemModel> items,
//     List<ItemModel> usersItems,
//     ItemModel? selectedItem,
//     String? errorMessage,
//   }) = _DetailsPageState;
// }