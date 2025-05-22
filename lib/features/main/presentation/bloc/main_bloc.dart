import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl_standalone.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../activities/presentation/bloc/activities_bloc.dart';
import '../../../activities/presentation/pages/activities_page.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../data/repositories/main_repository.dart';
import '../pages/home_body.dart';
import 'main_event.dart';
import 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final PageController pageController = PageController();
  final List<Widget> pages = [
    const HomeBody(),
    BlocProvider<ActivitiesBloc>(
      create: (context) => getIt<ActivitiesBloc>()..getTripHistories(),
      child: const ActivitiesPage(),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileBloc>()..getProfile(),
      child: const ProfilePage(),
    ),
  ];
  final MainRepository _mainRepository;

  void setPageIndex(int pageIndex) =>
      add(SetPageIndex((b) => b..pageIndex = pageIndex));

  void getCurrentTrip() => add(GetCurrentTrip());

  void refreshFCMToken() => add(RefreshFCMToken());

  MainBloc(this._mainRepository) : super(MainState.initial()) {
    on<SetPageIndex>((event, emit) {
      emit(state.rebuild((b) => b..pageIndex = event.pageIndex));
    });
    on<GetCurrentTrip>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      final result = await _mainRepository.getCurrentTrip();
      result.fold(
        (failure) {
          showToastMessage(failure.errorMessage, isError: true);
          emit(state.rebuild((b) => b..isLoading = false));
        },
        (data) {
          emit(
            state.rebuild(
              (b) =>
                  b
                    ..isLoading = false
                    ..trip = data,
            ),
          );
        },
      );
    });
    on<RefreshFCMToken>((event, emit) async {
      final result = await _mainRepository.refreshFCMToken();
      result.fold(
        (failure) {
          dPrint(
            'Error when refresh FCM Token: ${failure.errorMessage}',
            stringColor: StringColor.red,
          );
        },
        (_) {
          dPrint('Success Refresh FCM Token', stringColor: StringColor.green);
        },
      );
    });
  }
}
