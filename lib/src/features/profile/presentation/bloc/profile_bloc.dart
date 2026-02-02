import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecase/get_User_Profile.dart';
import '../../domain/usecase/update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfile getUserProfile;
  final UpdateProfile updateProfile;

  ProfileBloc({required this.getUserProfile, required this.updateProfile})
    : super(ProfileInitial()) {
    on<ProfileLoad>(_onProfileLoad);
    on<ProfileUpdate>(_onProfileUpdate);
  }

  Future<void> _onProfileLoad(
    ProfileLoad event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final user = await getUserProfile.call();
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onProfileUpdate(
    ProfileUpdate event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final user = await updateProfile.call(event.user);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
