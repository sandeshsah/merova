import 'package:merova/src/features/profile/domain/entities/entities.dart';
import 'package:merova/src/features/profile/domain/repository/profile_repository.dart';

class UpdateProfile{
  final ProfileRepository repository;
  UpdateProfile(this.repository);
  
  Future<UserEntity> call(UserEntity userEntity){
    return repository.updateProfile(userEntity);
  }
}