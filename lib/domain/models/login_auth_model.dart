import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_auth_model.freezed.dart';
part 'login_auth_model.g.dart';

@freezed
class LoginAuthModel with _$LoginAuthModel {
  const LoginAuthModel._();
  factory LoginAuthModel({
    required String email,
    required String password,
  }) = _LoginAuthModel;

  factory LoginAuthModel.fromJson(Map<String, dynamic> json) =>
      _$LoginAuthModelFromJson(json);
}

// @JsonSerializable()
// class LoginAuthModel {
//   const LoginAuthModel({
//     required this.email,
//     required this.password,
//   });
//   final String email;
//   final String password;

//   factory LoginAuthModel.fromJson(Map<String, dynamic> json) =>
//       _$LoginAuthModelFromJson(json);

//   Map<String, dynamic> toJson() => _$LoginAuthModelToJson(this);
// }

