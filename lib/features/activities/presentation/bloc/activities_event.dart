import 'package:built_value/built_value.dart';

part 'activities_event.g.dart';

abstract class ActivitiesEvent {}

abstract class GetTripHistories extends ActivitiesEvent
    implements Built<GetTripHistories, GetTripHistoriesBuilder> {
  GetTripHistories._();

  factory GetTripHistories([void Function(GetTripHistoriesBuilder) updates]) =
      _$GetTripHistories;
}
