import '../model/profile_model.dart';
import 'profile_datasource.dart';

class ProfileMockDataSource implements ProfileDataSource {
  @override
  Future<UserModel> getUserProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      fullName: 'Sandesh Sah (Mock)',
      email: 'sandesh@merova.com',
      phone: '+977 9800000000',
      dob: '2000-01-01',
      address: 'Kathmandu, Nepal',
      profileImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    );
  }

  @override
  Future<UserModel> updateProfile(UserModel userModel) async {
    await Future.delayed(const Duration(seconds: 1));
    return userModel;
  }

  @override
  Future<UserModel> uploadProfileImage(String filePath) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      fullName: 'Sandesh Sah (Mock)',
      email: 'sandesh@merova.com',
      phone: '+977 9800000000',
      dob: '2000-01-01',
      address: 'Kathmandu, Nepal',
      profileImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    );
  }
}
