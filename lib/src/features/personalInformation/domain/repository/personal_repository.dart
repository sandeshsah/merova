import 'package:merova/src/features/personalInformation/domain/entity/personal_entities.dart';

abstract class PersonalRepository {
  Future<PersonalEntities> getPersonalInformation();
}