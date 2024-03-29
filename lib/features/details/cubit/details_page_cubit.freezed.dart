// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsPageState {
  Status get status => throw _privateConstructorUsedError;
  ItemsModel? get selectedItem => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsPageStateCopyWith<DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPageStateCopyWith<$Res> {
  factory $DetailsPageStateCopyWith(
          DetailsPageState value, $Res Function(DetailsPageState) then) =
      _$DetailsPageStateCopyWithImpl<$Res, DetailsPageState>;
  @useResult
  $Res call(
      {Status status,
      ItemsModel? selectedItem,
      String? errorMessage,
      String? id});

  $ItemsModelCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class _$DetailsPageStateCopyWithImpl<$Res, $Val extends DetailsPageState>
    implements $DetailsPageStateCopyWith<$Res> {
  _$DetailsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedItem = freezed,
    Object? errorMessage = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as ItemsModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemsModelCopyWith<$Res>? get selectedItem {
    if (_value.selectedItem == null) {
      return null;
    }

    return $ItemsModelCopyWith<$Res>(_value.selectedItem!, (value) {
      return _then(_value.copyWith(selectedItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsPageStateImplCopyWith<$Res>
    implements $DetailsPageStateCopyWith<$Res> {
  factory _$$DetailsPageStateImplCopyWith(_$DetailsPageStateImpl value,
          $Res Function(_$DetailsPageStateImpl) then) =
      __$$DetailsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      ItemsModel? selectedItem,
      String? errorMessage,
      String? id});

  @override
  $ItemsModelCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class __$$DetailsPageStateImplCopyWithImpl<$Res>
    extends _$DetailsPageStateCopyWithImpl<$Res, _$DetailsPageStateImpl>
    implements _$$DetailsPageStateImplCopyWith<$Res> {
  __$$DetailsPageStateImplCopyWithImpl(_$DetailsPageStateImpl _value,
      $Res Function(_$DetailsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedItem = freezed,
    Object? errorMessage = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DetailsPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as ItemsModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DetailsPageStateImpl implements _DetailsPageState {
  _$DetailsPageStateImpl(
      {this.status = Status.initial,
      this.selectedItem,
      this.errorMessage,
      this.id});

  @override
  @JsonKey()
  final Status status;
  @override
  final ItemsModel? selectedItem;
  @override
  final String? errorMessage;
  @override
  final String? id;

  @override
  String toString() {
    return 'DetailsPageState(status: $status, selectedItem: $selectedItem, errorMessage: $errorMessage, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, selectedItem, errorMessage, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsPageStateImplCopyWith<_$DetailsPageStateImpl> get copyWith =>
      __$$DetailsPageStateImplCopyWithImpl<_$DetailsPageStateImpl>(
          this, _$identity);
}

abstract class _DetailsPageState implements DetailsPageState {
  factory _DetailsPageState(
      {final Status status,
      final ItemsModel? selectedItem,
      final String? errorMessage,
      final String? id}) = _$DetailsPageStateImpl;

  @override
  Status get status;
  @override
  ItemsModel? get selectedItem;
  @override
  String? get errorMessage;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$DetailsPageStateImplCopyWith<_$DetailsPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
