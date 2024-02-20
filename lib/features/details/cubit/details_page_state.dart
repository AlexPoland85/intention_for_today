part of 'details_page_cubit.dart';

@freezed
class DetailsPageState with _$DetailsPageState {
  factory DetailsPageState({
    @Default(Status.initial) Status status,
    ItemsModel? selectedItem,
    String? errorMessage,
    String? id,
  }) = _DetailsPageState;
}
