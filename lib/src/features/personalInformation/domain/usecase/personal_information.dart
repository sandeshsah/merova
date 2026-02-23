import 'package:merova/src/features/personalInformation/domain/entity/personal_entities.dart';
import 'package:merova/src/features/personalInformation/domain/repository/personal_repository.dart';

class PersonalInformation {
  final PersonalRepository repository;

  PersonalInformation(this.repository);

  Future<PersonalEntities> call() async {
    return await repository.getPersonalInformation();
  }
}