import 'package:built_value/built_value.dart';

import '../../../../core/entities/trip.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  bool get isLoading;

  int get pageIndex;

  Trip? get trip;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;

  factory MainState.initial() {
    return MainState(
      (b) => b
        ..isLoading = false
        ..pageIndex = 0
        ..trip = null,
    );
  }
}
