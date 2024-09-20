import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../core/utils/base_bloc_state.dart';

part 'map_state.g.dart';

abstract class MapState
    with BaseState
    implements Built<MapState, MapStateBuilder> {
  MapState._();

  BuiltSet<Marker> get markers;

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..isError = false
          ..isSuccess = false
          ..message = ''
          ..markers.replace({}),
      );
}
