import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.UId,
    required super.email,
    required super.fullName,
    required super.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      UId: json['UId'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? json['full_name'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class SignupResponseModel {
  final String message;
  final String otp;

  SignupResponseModel({required this.message, required this.otp});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'] ?? '',
      otp: json['otp'] ?? '',
    );
  }
}
