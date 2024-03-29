part of 'add_page_cubit.dart';

@freezed
abstract class AddPageState with _$AddPageState {
  factory AddPageState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    String? content,
    bool? saved,
  }) = _AddPageState;
}
