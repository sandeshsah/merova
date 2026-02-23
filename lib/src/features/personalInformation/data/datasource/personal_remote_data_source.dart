import 'package:dio/dio.dart';
import 'package:merova/src/features/personalInformation/data/model/personal_model.dart';
import 'package:merova/src/features/personalInformation/domain/repository/personal_repository.dart';

abstract class PersonalRemoteDataSource {
  Future<PersonalModel> getPersonalInformation();
}


class PersonalRemoteDataSourceImpl implements PersonalRepository {
  final Dio dio;

  PersonalRemoteDataSourceImpl(this.dio);

  Future<PersonalModel> getPersonalInformation() async {
    final response = await dio.get('/user/profile');
    return PersonalModel.fromJson(response.data);
  }

}