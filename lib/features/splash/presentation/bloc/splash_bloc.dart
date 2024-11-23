import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../../sign_in/data/models/sign_in_request.dart';
import '../../../sign_in/domain/repositories/sign_in_repository.dart';
import '../../domain/repositories/splash_repository.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepository _splashRepository;
  final SignInRepository _signInRepository;

  void checkUserAuthentication() {
    add(CheckUserAuthentication());
  }

  SplashBloc(
    this._splashRepository,
    this._signInRepository,
  ) : super(SplashState.initial()) {
    on<CheckUserAuthentication>((event, emit) async {
      emit(SplashState.initial());
      final result = await _splashRepository.isUserAuthenticated();
      await Future.delayed(const Duration(milliseconds: 1500));
      result.fold(
        (failure) {
          emit(state.rebuild((b) => b..isError = true));
        },
        (data) {
          emit(state.rebuild((b) => b..isAuth = data));
          if (data) {
            add(TokenNeedRefresh());
          } else {
            emit(state.rebuild((b) => b..isTokenUpToDate = true));
          }
        },
      );
    });
    on<TokenNeedRefresh>((event, emit) async {
      final result = await _splashRepository.tokenNeedRefresh();
      await result.fold((failure) {
        emit(state.rebuild((b) => b..isError = true));
      }, (data) async {
        if (data) {
          add(RefreshToken());
        } else {
          emit(state.rebuild((b) => b..isTokenUpToDate = true));
        }
      });
    });

    on<RefreshToken>((event, emit) async {
      final String phoneNumber = await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.phoneNumber);
      final String password = await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.password);
      final SignInRequest signInRequest = SignInRequest(
        phoneNumber: phoneNumber,
        password: password,
      );
      final result = await _signInRepository.signIn(signInRequest);
      result.fold((failure) {
        emit(state.rebuild((b) => b..isError = true));
      }, (_) {
        emit(state.rebuild((b) => b..isTokenUpToDate = true));
      });
    });
  }
}
