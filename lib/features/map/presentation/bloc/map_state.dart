import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/entities/address.dart';
import '../../../main/domain/entities/trip.dart';
import '../../domain/entities/trip_distance_and_duration.dart';

part 'map_state.g.dart';

abstract class MapState implements Built<MapState, MapStateBuilder> {
  bool get isLoading;

  Address? get startAddress;

  Address? get endAddress;

  BuiltSet<Marker> get markers;

  bool get isPanelOpen;

  bool? get isStartAddress;

  GoogleMapController? get googleMapController;

  TripDistanceAndDuration? get tripDistanceAndDuration;

  String get message;

  Trip? get currentTrip;

  MapState._();

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..markers.replace({})
          ..startAddress = null
          ..endAddress = null
          ..isPanelOpen = false
          ..isStartAddress = null
          ..googleMapController = null
          ..tripDistanceAndDuration = null
          ..message = ""
          ..currentTrip = null,
      );
}
