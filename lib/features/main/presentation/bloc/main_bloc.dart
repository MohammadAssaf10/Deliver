import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../domain/repositories/main_repository.dart';
import '../pages/home_body.dart';
import 'main_event.dart';
import 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final PageController pageController = PageController();
  final List<Widget> pages = const [
    HomeBody(),
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
