class UserEntity{
  final String fullName;
  final String? email;
  final String? phone;
  final String? dob;
  final String? address;
  final String? profileImage;

  UserEntity({
    required this.fullName,
    required this.email,
    required this.phone,
    this.dob,
    this.address,
    required this.profileImage,
  });
}