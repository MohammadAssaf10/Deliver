import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../../../activities/presentation/bloc/activities_bloc.dart';
import '../../../activities/presentation/pages/activities_page.dart';
import '../../data/repositories/main_repository.dart';
import '../pages/home_body.dart';
import 'main_event.dart';
import 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final PageController pageController = PageController();
  final List<Widget> pages = [
    HomeBody(),
    BlocProvider<ActivitiesBloc>(
      create: (context) => getIt<ActivitiesBloc>()..getTripHistories(),
      child: ActivitiesPage(),
    ),
    AccountPage(),
  ];
  final MainRepository _mainRepository;

  void setPageIndex(int pageIndex) =>
      add(SetPageIndex((b) => b..pageIndex = pageIndex));

  void getCurrentTrip() => add(GetCurrentTrip());

  MainBloc(
    this._mainRepository,
  ) : super(MainState.initial()) {
    on<SetPageIndex>((event, emit) {
      emit(state.rebuild((b) => b..pageIndex = event.pageIndex));
    });
    on<GetCurrentTrip>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      final result = await _mainRepository.getCurrentTrip();
      result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
        emit(state.rebuild((b) => b..isLoading = false));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..trip = data,
        ));
      });
    });
  }
}
