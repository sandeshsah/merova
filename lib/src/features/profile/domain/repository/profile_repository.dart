import 'package:merova/src/features/profile/domain/entities/entities.dart';

abstract class ProfileRepository{
  Future<UserEntity> getUserProfile();
  Future<UserEntity> updateProfile(UserEntity userEntity);
  Future<UserEntity> uploadProfileImage(String filePath);
}