// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddPageState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  bool? get saved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPageStateCopyWith<AddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPageStateCopyWith<$Res> {
  factory $AddPageStateCopyWith(
          AddPageState value, $Res Function(AddPageState) then) =
      _$AddPageStateCopyWithImpl<$Res, AddPageState>;
  @useResult
  $Res call(
      {Status status, String? errorMessage, String? content, bool? saved});
}

/// @nodoc
class _$AddPageStateCopyWithImpl<$Res, $Val extends AddPageState>
    implements $AddPageStateCopyWith<$Res> {
  _$AddPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? content = freezed,
    Object? saved = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: freezed == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPageStateImplCopyWith<$Res>
    implements $AddPageStateCopyWith<$Res> {
  factory _$$AddPageStateImplCopyWith(
          _$AddPageStateImpl value, $Res Function(_$AddPageStateImpl) then) =
      __$$AddPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status, String? errorMessage, String? content, bool? saved});
}

/// @nodoc
class __$$AddPageStateImplCopyWithImpl<$Res>
    extends _$AddPageStateCopyWithImpl<$Res, _$AddPageStateImpl>
    implements _$$AddPageStateImplCopyWith<$Res> {
  __$$AddPageStateImplCopyWithImpl(
      _$AddPageStateImpl _value, $Res Function(_$AddPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? content = freezed,
    Object? saved = freezed,
  }) {
    return _then(_$AddPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: freezed == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AddPageStateImpl implements _AddPageState {
  _$AddPageStateImpl(
      {this.status = Status.initial,
      this.errorMessage,
      this.content,
      this.saved});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final String? content;
  @override
  final bool? saved;

  @override
  String toString() {
    return 'AddPageState(status: $status, errorMessage: $errorMessage, content: $content, saved: $saved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, content, saved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPageStateImplCopyWith<_$AddPageStateImpl> get copyWith =>
      __$$AddPageStateImplCopyWithImpl<_$AddPageStateImpl>(this, _$identity);
}

abstract class _AddPageState implements AddPageState {
  factory _AddPageState(
      {final Status status,
      final String? errorMessage,
      final String? content,
      final bool? saved}) = _$AddPageStateImpl;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  String? get content;
  @override
  bool? get saved;
  @override
  @JsonKey(ignore: true)
  _$$AddPageStateImplCopyWith<_$AddPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
