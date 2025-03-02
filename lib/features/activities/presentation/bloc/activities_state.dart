import 'package:built_value/built_value.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../domain/entities/trip_history.dart';

part 'activities_state.g.dart';

abstract class ActivitiesState
    implements Built<ActivitiesState, ActivitiesStateBuilder> {
  bool get isLoading;
  bool get isError;
  bool get isListenerAdded;

  PaginationStateData<TripHistory> get tripHistories;

  ActivitiesState._();

  factory ActivitiesState([void Function(ActivitiesStateBuilder) updates]) =
      _$ActivitiesState;

  factory ActivitiesState.initial() {
    return ActivitiesState((b) => b
      ..isLoading = false
      ..isError = false
      ..isListenerAdded = false
      ..tripHistories.replace(PaginationStateData<TripHistory>.initial()));
  }
}
