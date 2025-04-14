import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  void getProfile() => add(GetProfile());

  ProfileBloc(
    this._profileRepository,
  ) : super(ProfileState.initial()) {
    on<GetProfile>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..profile = null));
      final result = await _profileRepository.getProfile();
      result.fold((failure) {
        emit(state.rebuild((b) => b..isLoading = false));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..profile = data,
        ));
      });
    });
  }
}
