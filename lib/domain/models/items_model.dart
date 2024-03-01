import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_model.freezed.dart';
part 'items_model.g.dart';

@freezed
class ItemsModel with _$ItemsModel {
  const ItemsModel._();
  factory ItemsModel({
    required String id,
    required String items,
    required String usersItems,
  }) = _ItemsModel;

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);
}
