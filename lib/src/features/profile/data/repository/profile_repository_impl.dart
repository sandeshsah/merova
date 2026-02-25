import '../../domain/entities/entities.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/profile_datasource.dart';
import '../model/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity> getUserProfile() async {
    return await dataSource.getUserProfile();
  }

  @override
  Future<UserEntity> updateProfile(UserEntity userEntity) async {
    final userModel = UserModel(
      fullName: userEntity.fullName,
      email: userEntity.email,
      phone: userEntity.phone,
      dob: userEntity.dob,
      address: userEntity.address,
      profileImage: userEntity.profileImage,
    );
    return await dataSource.updateProfile(userModel);
  }

  @override
  Future<UserEntity> uploadProfileImage(String filePath) async {
    return await dataSource.uploadProfileImage(filePath);
  }
}
