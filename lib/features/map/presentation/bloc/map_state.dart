import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/trip_info.dart';
import '../../domain/entities/location_info.dart';

part 'map_state.g.dart';

abstract class MapState implements Built<MapState, MapStateBuilder> {
  bool get isLoading;

  LocationInfo? get startLocation;

  LocationInfo? get endLocation;

  BuiltSet<Marker> get markers;

  bool get isPanelOpen;

  bool? get isStartPoint;

  GoogleMapController? get googleMapController;

  TripInfo? get tripInfo;

  String get message;

  MapState._();

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..markers.replace({})
          ..startLocation = null
          ..endLocation = null
          ..isPanelOpen = false
          ..isStartPoint = null
          ..googleMapController = null
          ..tripInfo = null
          ..message = "",
      );
}
