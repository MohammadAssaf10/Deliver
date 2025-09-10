import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../core/di/di.dart';
import '../../data/repositories/splash_repository.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepository _splashRepository;

  void checkUserAuthentication() {
    add(CheckUserAuthentication());
  }

  SplashBloc(this._splashRepository) : super(SplashState.initial()) {
    on<CheckUserAuthentication>((event, emit) async {
      emit(SplashState.initial());
      final result = await _splashRepository.isUserAuthenticated();
      await Future.delayed(const Duration(milliseconds: 1500));
      result.fold(
        (failure) {
          emit(
            state.rebuild(
              (b) => b
                ..isError = true
                ..errorMessage = failure.errorMessage,
            ),
          );
        },
        (data) {
          emit(state.rebuild((b) => b..isAuth = data));
          if (data) {
            getIt<AppCubit>().getProfile();
          }
        },
      );
    });
  }
}
