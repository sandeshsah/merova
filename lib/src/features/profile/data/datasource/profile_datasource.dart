import '../model/profile_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getUserProfile();
  Future<UserModel> updateProfile(UserModel userModel);
  Future<UserModel> uploadProfileImage(String filePath);
}
