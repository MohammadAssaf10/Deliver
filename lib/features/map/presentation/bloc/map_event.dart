import 'package:built_value/built_value.dart';

import '../../../../core/entities/address.dart';
import '../../../../core/entities/trip.dart';

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

abstract class SetIsStartAddress extends MapEvent
    implements Built<SetIsStartAddress, SetIsStartAddressBuilder> {
  bool get isStartAddress;

  SetIsStartAddress._();

  factory SetIsStartAddress([void Function(SetIsStartAddressBuilder) updates]) =
      _$SetIsStartAddress;
}

abstract class SetHintMessage extends MapEvent
    implements Built<SetHintMessage, SetHintMessageBuilder> {
  String get message;

  SetHintMessage._();

  factory SetHintMessage([void Function(SetHintMessageBuilder) updates]) =
      _$SetHintMessage;
}

abstract class SetStartAddress extends MapEvent
    implements Built<SetStartAddress, SetStartAddressBuilder> {
  Address get address;

  SetStartAddress._();

  factory SetStartAddress([void Function(SetStartAddressBuilder) updates]) =
      _$SetStartAddress;
}

abstract class SetEndAddress extends MapEvent
    implements Built<SetEndAddress, SetEndAddressBuilder> {
  Address get address;

  SetEndAddress._();

  factory SetEndAddress([void Function(SetEndAddressBuilder) updates]) =
      _$SetEndAddress;
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

abstract class SetCurrentTrip extends MapEvent
    implements Built<SetCurrentTrip, SetCurrentTripBuilder> {
  Trip get trip;

  SetCurrentTrip._();

  factory SetCurrentTrip([void Function(SetCurrentTripBuilder) updates]) =
      _$SetCurrentTrip;
}
