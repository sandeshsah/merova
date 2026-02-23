import 'package:merova/src/features/personalInformation/data/datasource/personal_remote_data_source.dart';
import 'package:merova/src/features/personalInformation/domain/entity/personal_entities.dart';
import 'package:merova/src/features/personalInformation/domain/repository/personal_repository.dart';

class PersonalRepositoryImpl implements PersonalRepository {

  final PersonalRemoteDataSource remote;

  PersonalRepositoryImpl(this.remote);

  @override
  Future<PersonalEntities> getPersonalInformation() async {
    return await remote.getPersonalInformation();
  }
}