// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapState extends MapState {
  @override
  final BuiltSet<Marker> markers;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String message;

  factory _$MapState([void Function(MapStateBuilder)? updates]) =>
      (new MapStateBuilder()..update(updates))._build();

  _$MapState._(
      {required this.markers,
      required this.isLoading,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(markers, r'MapState', 'markers');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'MapState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'MapState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'MapState', 'message');
  }

  @override
  MapState rebuild(void Function(MapStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapStateBuilder toBuilder() => new MapStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapState &&
        markers == other.markers &&
        isLoading == other.isLoading &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapState')
          ..add('markers', markers)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class MapStateBuilder implements Builder<MapState, MapStateBuilder> {
  _$MapState? _$v;

  SetBuilder<Marker>? _markers;
  SetBuilder<Marker> get markers =>
      _$this._markers ??= new SetBuilder<Marker>();
  set markers(SetBuilder<Marker>? markers) => _$this._markers = markers;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MapStateBuilder();

  MapStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _markers = $v.markers.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapState;
  }

  @override
  void update(void Function(MapStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapState build() => _build();

  _$MapState _build() {
    _$MapState _$result;
    try {
      _$result = _$v ??
          new _$MapState._(
              markers: markers.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'MapState', 'isLoading'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'MapState', 'error'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'MapState', 'message'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'markers';
        markers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MapState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
