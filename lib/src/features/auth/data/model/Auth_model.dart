import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.UId,
    required super.email,
    required super.password
  });


  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        UId: json['UId'],
        email: json['email'],
        password: json['password']
    );
  }
}