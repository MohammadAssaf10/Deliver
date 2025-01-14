import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/app_enums.dart';
import '../../data/repositories/app_repository.dart';
import 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;

  AppCubit(
    this._appRepository,
  ) : super(AppState.initial());

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
    emit(state.rebuild(
      (b) => b
        ..appLanguage =
            state.appLanguage == Language.en ? Language.ar : Language.en,
    ));
  }
}
