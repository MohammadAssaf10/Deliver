import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/app_repository.dart';
import 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final AppRepository _appRepository;

  AppCubit(
    this._appRepository,
  ) : super(AppState.initial());

  void getAppLanguage() {
    final String language = _appRepository.getAppLanguage();
    emit(
      state.rebuild(
        (b) => b..isEnglishLanguage = language == 'en',
      ),
    );
  }

  void setAppLanguage(String language) async {
    await _appRepository.setAppLanguage(language);
    emit(state.rebuild(
      (b) => b..isEnglishLanguage = !state.isEnglishLanguage,
    ));
  }
}
