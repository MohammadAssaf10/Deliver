import 'package:built_value/built_value.dart';

import '../../domain/entities/location_info.dart';

part 'map_event.g.dart';

abstract class MapEvent {}

abstract class GetCurrentLocation extends MapEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {
  GetCurrentLocation._();

  factory GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder) updates]) =
      _$GetCurrentLocation;
}

abstract class ChangeIsPanelOpenState extends MapEvent
    implements Built<ChangeIsPanelOpenState, ChangeIsPanelOpenStateBuilder> {
  bool get isPanelOpen;

  ChangeIsPanelOpenState._();

  factory ChangeIsPanelOpenState(
          [void Function(ChangeIsPanelOpenStateBuilder) updates]) =
      _$ChangeIsPanelOpenState;
}

abstract class ChangeIsStartPointState extends MapEvent
    implements Built<ChangeIsStartPointState, ChangeIsStartPointStateBuilder> {
  bool? get isStartPoint;

  ChangeIsStartPointState._();

  factory ChangeIsStartPointState(
          [void Function(ChangeIsStartPointStateBuilder) updates]) =
      _$ChangeIsStartPointState;
}

abstract class SetHintMessage extends MapEvent
    implements Built<SetHintMessage, SetHintMessageBuilder> {
  String get message;

  SetHintMessage._();

  factory SetHintMessage([void Function(SetHintMessageBuilder) updates]) =
      _$SetHintMessage;
}

abstract class SetStartPoint extends MapEvent
    implements Built<SetStartPoint, SetStartPointBuilder> {
  LocationInfo get startPoint;

  SetStartPoint._();

  factory SetStartPoint([void Function(SetStartPointBuilder) updates]) =
      _$SetStartPoint;
}

abstract class SetEndPoint extends MapEvent
    implements Built<SetEndPoint, SetEndPointBuilder> {
  LocationInfo get endPoint;

  SetEndPoint._();

  factory SetEndPoint([void Function(SetEndPointBuilder) updates]) =
      _$SetEndPoint;
}

abstract class CalculateDistance extends MapEvent
    implements Built<CalculateDistance, CalculateDistanceBuilder> {
  CalculateDistance._();

  factory CalculateDistance([void Function(CalculateDistanceBuilder) updates]) =
      _$CalculateDistance;
}

abstract class CreateNewTrip extends MapEvent
    implements Built<CreateNewTrip, CreateNewTripBuilder> {
  CreateNewTrip._();

  factory CreateNewTrip([void Function(CreateNewTripBuilder) updates]) =
      _$CreateNewTrip;
}
