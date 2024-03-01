part of 'root_page_cubit.dart';

@freezed
abstract class RootPageState with _$RootPageState {
  factory RootPageState({
    auth.User? user,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _RootPageState;
}
