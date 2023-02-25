import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class UserModel {
  String? name;
  String? email;
  String? password;
  String? role;
  UserModel({
    this.name,
    this.email,
    this.password,
    this.role,
  });
  factory UserModel.from(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);


   Map<String, dynamic> toJson() => _$UserModelToJson(this);

    @override
  String toString() => 'LoginModel(name:$name,email: $email, password: $password,role: $role )';
}
