import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../core/repository/base_repository.dart';
import '../../core/utils/app_enums.dart';
import 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final BaseRepository _baseRepository;

  AppCubit(
    this._baseRepository,
  ) : super(AppState.initial());

  void getAppLanguage() async {
    final result = await _baseRepository.getAppLanguage();
    result.fold((_) {}, (language) {
      emit(state.rebuild((b) => b..appLanguage = language));
    });
  }

  void changeAppLanguage() async {
    await _baseRepository.setAppLanguage(
      state.appLanguage == Language.en ? Language.ar : Language.en,
    );
    emit(state.rebuild(
      (b) => b
        ..appLanguage =
            state.appLanguage == Language.en ? Language.ar : Language.en,
    ));
  }
}
