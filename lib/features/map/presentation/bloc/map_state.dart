import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:built_collection/built_collection.dart';

part 'map_state.g.dart';

abstract class MapState implements Built<MapState, MapStateBuilder> {
  bool get isLoading;

  MapState._();

  BuiltSet<Marker> get markers;

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..markers.replace({}),
      );
}
