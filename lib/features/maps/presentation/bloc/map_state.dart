import 'package:built_value/built_value.dart';

import '../../../../core/bloc/base_state.dart';

part 'map_state.g.dart';

abstract class MapState
    with BaseState
    implements Built<MapState, MapStateBuilder> {
  MapState._();

  factory MapState([void Function(MapStateBuilder) updates]) = _$MapState;

  factory MapState.initial() => MapState(
        (b) => b
          ..isLoading = false
          ..error = false
          ..message = '',
      );
}
