part of 'add_page_cubit.dart';

@freezed
class AddPageState with _$AddPageState {
  factory AddPageState({
    @Default([]) List<ItemsModel> items,
    @Default(Status.initial) Status status,
    String? errorMessage,
    String? content,
  }) = _AddPageState;
}

// class AddPageState {
//   const AddPageState({
//     this.saved = false,
//     this.errorMessage = '',
//   });

//   final bool saved;
//   final String errorMessage;
// }
