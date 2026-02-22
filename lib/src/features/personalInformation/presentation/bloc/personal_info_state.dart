import 'package:merova/src/features/personalInformation/domain/entity/personal_entities.dart';

abstract class PersonalInfoState {}

class PersonalInformationInitial extends PersonalInfoState {}

class PersonalInformationLoading extends PersonalInfoState {}

class PersonalInformationLoaded extends PersonalInfoState {
  final PersonalEntities info;
  PersonalInformationLoaded(this.info);
}

class PersonalInformationError extends PersonalInfoState {
  final String message;
  PersonalInformationError(this.message);
}