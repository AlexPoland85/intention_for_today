part of 'root_page_cubit.dart';

@freezed
class RootPageState with _$RootPageState {
  factory RootPageState({
    User? user,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _RootPageState;
}
