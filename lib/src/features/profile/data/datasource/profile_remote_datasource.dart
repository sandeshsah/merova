import '../model/profile_model.dart';
import 'profile_datasource.dart';

class ProfileRemoteDataSource implements ProfileDataSource {
  @override
  Future<UserModel> getUserProfile() async {
    // TODO: Implement real API call using Dio
    throw UnimplementedError(
      "ProfileRemoteDataSource.getUserProfile not implemented",
    );
  }

  @override
  Future<UserModel> updateProfile(UserModel userModel) async {
    // TODO: Implement real API call using Dio
    throw UnimplementedError(
      "ProfileRemoteDataSource.updateProfile not implemented",
    );
  }

  @override
  Future<UserModel> uploadProfileImage(String filePath) async {
    // TODO: Implement real API call using Dio
    throw UnimplementedError(
      "ProfileRemoteDataSource.uploadProfileImage not implemented",
    );
  }
}
