// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:merova/src/features/personalInformation/domain/usecase/personal_information.dart';
// import 'package:merova/src/features/personalInformation/presentation/bloc/personal_info_event.dart';
// import 'package:merova/src/features/personalInformation/presentation/bloc/personal_info_state.dart';
//
// class PersonalInfoBloc
//     extends Bloc<PersonalInfoEvent, PersonalInfoState> {
//
//   final PersonalInformation getPersonalInformation;
//
//
//   PersonalInfoBloc(
//       this.getPersonalInformation,
//       ) : super(PersonalInformationInitial()) {
//
//     on<LoadPersonalInformation>(_onLoad);
//   }
//
//   Future<void> _onLoad(
//       LoadPersonalInformation event,
//       Emitter<PersonalInfoState> emit) async {
//
//     emit(PersonalInformationLoading());
//
//     try {
//       final data = await getPersonalInformation();
//       emit(PersonalInformationLoaded(data));
//     } catch (e) {
//       emit(PersonalInformationError("Failed to load"));
//     }
//   }
// }