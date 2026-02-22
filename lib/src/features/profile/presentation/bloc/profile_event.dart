part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileLoad extends ProfileEvent {}

class ProfileUpdate extends ProfileEvent {
  final UserEntity user;
  ProfileUpdate(this.user);
}
class UploadProfileImageRequest extends ProfileEvent{
  final String filePath;
  UploadProfileImageRequest(this.filePath);
}
