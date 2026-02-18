import '../../domain/entities/entities.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.fullName,
    required super.email,
    required super.phone,
    super.dob,
    super.address,
    required super.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fullName: json['fullName'],
    email: json['email'],
    phone: json['phone'],
    dob: json['dob'],
    address: json['address'],
    profileImage: json['profileImage'],
  );

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'phone': phone,
    'dob': dob,
    'address': address,
    'profileImage': profileImage,
  };
}
