import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../domain/repositories/activities_repository.dart';
import 'activities_event.dart';
import 'activities_state.dart';

@injectable
class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final ActivitiesRepository _activitiesRepository;
  final ScrollController controller = ScrollController();

  void getTripHistories() => add(GetTripHistories());

  ActivitiesBloc(
    this._activitiesRepository,
  ) : super(ActivitiesState.initial()) {
    on<GetTripHistories>((event, emit) async {
      if (state.tripHistories.currentPage == 1) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = true
            ..isError = false,
        ));
      } else {
        emit(state.rebuild((b) => b..tripHistories.isLoading = true));
      }
      final result = await _activitiesRepository
          .getTripHistories(state.tripHistories.currentPage);
      result.fold((failure) {
        if (state.tripHistories.currentPage > 1) {
          showToastMessage(
            failure.errorMessage,
            isError: true,
          );
        }
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..tripHistories.isLoading = false
            ..isError =
                state.tripHistories.currentPage > 1 ? state.isError : true,
        ));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..tripHistories.isLoading = false
            ..tripHistories.items.addAll(data)
            ..tripHistories.currentPage = b.tripHistories.currentPage! + 1
            ..tripHistories.isFinished = data.isEmpty,
        ));
        if (!state.isListenerAdded) {
          controller.addListener(() {
            if (state.tripHistories.shouldGetMoreData(controller)) {
              getTripHistories();
            }
          });
          emit(state.rebuild((b) => b..isListenerAdded = true));
        }
      });
    }, transformer: droppable());
  }
}
