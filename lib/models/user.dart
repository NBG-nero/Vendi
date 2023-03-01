import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum Usertype { admin, user }

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
  });
  factory UserModel.from(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() =>
      'LoginModel(id:$id,name:$name,email: $email, password: $password,role: $role )';
}
