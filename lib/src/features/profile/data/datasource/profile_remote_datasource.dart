import '../model/profile_model.dart';

class ProfileRemoteDataSource {
  Future<UserModel> getUserProfile() async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      fullName: 'Sandesh Sah',
      email: 'sandesh@merova.com',
      phone: '+977 9800000000',
      dob: '2000-01-01',
      address: 'Kathmandu, Nepal',
      profileImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    );
  }

  Future<UserModel> updateProfile(UserModel userModel) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return userModel;
  }

  Future<UserModel> uploadProfileImage(String filePath) async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(
      fullName: 'Sandesh Sah',
      email: 'sandesh@merova.com',
      phone: '+977 9800000000',
      dob: '2000-01-01',
      address: 'Kathmandu, Nepal',
      profileImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    );
  }
}
