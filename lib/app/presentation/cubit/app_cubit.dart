import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_functions.dart';
import '../../../features/profile/data/repositories/profile_repository.dart';
import '../../data/repositories/app_repository.dart';
import 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;
  final ProfileRepository _profileRepository;

  AppCubit(this._appRepository, this._profileRepository)
    : super(AppState.initial());

  void getAppLanguage() async {
    final result = await _appRepository.getAppLanguage();
    result.fold((_) {}, (language) {
      emit(state.rebuild((b) => b..appLanguage = language));
    });
  }

  void changeAppLanguage() async {
    await _appRepository.setAppLanguage(
      state.appLanguage == Language.en ? Language.ar : Language.en,
    );
    emit(
      state.rebuild(
        (b) => b
          ..appLanguage = state.appLanguage == Language.en
              ? Language.ar
              : Language.en,
      ),
    );
  }

  void getProfile() async {
    emit(state.rebuild((b) => b..profileStatus = BlocStatus.loading));
    final result = await _profileRepository.getProfile();
    result.fold(
      (_) {
        emit(state.rebuild((b) => b..profileStatus = BlocStatus.error));
      },
      (profile) {
        emit(
          state.rebuild(
            (b) => b
              ..profileStatus = BlocStatus.success
              ..profile = profile,
          ),
        );
      },
    );
  }

  void logout() async {
    emit(state.rebuild((b) => b..logoutStatus = BlocStatus.loading));
    final result = await _profileRepository.logout();
    result.fold(
      (failure) {
        emit(state.rebuild((b) => b..logoutStatus = BlocStatus.error));
        showToastMessage(failure.errorMessage, isError: true);
      },
      (message) {
        emit(
          state.rebuild(
            (b) => b
              ..logoutStatus = BlocStatus.success
              ..profile = null,
          ),
        );
        showToastMessage(message);
      },
    );
    emit(state.rebuild((b) => b..logoutStatus = BlocStatus.initial));
  }
}
