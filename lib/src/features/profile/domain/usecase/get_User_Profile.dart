import 'package:merova/src/features/profile/domain/entities/entities.dart';
import 'package:merova/src/features/profile/domain/repository/profile_repository.dart';

class GetUserProfile{
  final ProfileRepository repository;
  GetUserProfile(this.repository);
  Future<UserEntity>call(){
    return repository.getUserProfile();
  }
}