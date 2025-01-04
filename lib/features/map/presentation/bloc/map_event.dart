import 'package:built_value/built_value.dart';

part 'map_event.g.dart';

abstract class MapEvent {}

abstract class GetCurrentLocation extends MapEvent
    implements Built<GetCurrentLocation, GetCurrentLocationBuilder> {
  GetCurrentLocation._();

  factory GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder) updates]) =
      _$GetCurrentLocation;
}
