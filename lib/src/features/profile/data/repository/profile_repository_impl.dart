import '../../domain/entities/entities.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/profile_remote_datasource.dart';
import '../model/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> getUserProfile() async {
    return await remoteDataSource.getUserProfile();
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
    return await remoteDataSource.updateProfile(userModel);
  }
}
