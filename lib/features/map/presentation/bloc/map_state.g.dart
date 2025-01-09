// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapState extends MapState {
  @override
  final bool isLoading;
  @override
  final LocationInfo? startLocation;
  @override
  final LocationInfo? endLocation;
  @override
  final BuiltSet<Marker> markers;
  @override
  final bool isPanelOpen;
  @override
  final bool? isStartPoint;
  @override
  final GoogleMapController? googleMapController;
  @override
  final TripInfo? tripInfo;
  @override
  final String message;

  factory _$MapState([void Function(MapStateBuilder)? updates]) =>
      (new MapStateBuilder()..update(updates))._build();

  _$MapState._(
      {required this.isLoading,
      this.startLocation,
      this.endLocation,
      required this.markers,
      required this.isPanelOpen,
      this.isStartPoint,
      this.googleMapController,
      this.tripInfo,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'MapState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(markers, r'MapState', 'markers');
    BuiltValueNullFieldError.checkNotNull(
        isPanelOpen, r'MapState', 'isPanelOpen');
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
        isLoading == other.isLoading &&
        startLocation == other.startLocation &&
        endLocation == other.endLocation &&
        markers == other.markers &&
        isPanelOpen == other.isPanelOpen &&
        isStartPoint == other.isStartPoint &&
        googleMapController == other.googleMapController &&
        tripInfo == other.tripInfo &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, startLocation.hashCode);
    _$hash = $jc(_$hash, endLocation.hashCode);
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jc(_$hash, isStartPoint.hashCode);
    _$hash = $jc(_$hash, googleMapController.hashCode);
    _$hash = $jc(_$hash, tripInfo.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapState')
          ..add('isLoading', isLoading)
          ..add('startLocation', startLocation)
          ..add('endLocation', endLocation)
          ..add('markers', markers)
          ..add('isPanelOpen', isPanelOpen)
          ..add('isStartPoint', isStartPoint)
          ..add('googleMapController', googleMapController)
          ..add('tripInfo', tripInfo)
          ..add('message', message))
        .toString();
  }
}

class MapStateBuilder implements Builder<MapState, MapStateBuilder> {
  _$MapState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  LocationInfo? _startLocation;
  LocationInfo? get startLocation => _$this._startLocation;
  set startLocation(LocationInfo? startLocation) =>
      _$this._startLocation = startLocation;

  LocationInfo? _endLocation;
  LocationInfo? get endLocation => _$this._endLocation;
  set endLocation(LocationInfo? endLocation) =>
      _$this._endLocation = endLocation;

  SetBuilder<Marker>? _markers;
  SetBuilder<Marker> get markers =>
      _$this._markers ??= new SetBuilder<Marker>();
  set markers(SetBuilder<Marker>? markers) => _$this._markers = markers;

  bool? _isPanelOpen;
  bool? get isPanelOpen => _$this._isPanelOpen;
  set isPanelOpen(bool? isPanelOpen) => _$this._isPanelOpen = isPanelOpen;

  bool? _isStartPoint;
  bool? get isStartPoint => _$this._isStartPoint;
  set isStartPoint(bool? isStartPoint) => _$this._isStartPoint = isStartPoint;

  GoogleMapController? _googleMapController;
  GoogleMapController? get googleMapController => _$this._googleMapController;
  set googleMapController(GoogleMapController? googleMapController) =>
      _$this._googleMapController = googleMapController;

  TripInfo? _tripInfo;
  TripInfo? get tripInfo => _$this._tripInfo;
  set tripInfo(TripInfo? tripInfo) => _$this._tripInfo = tripInfo;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MapStateBuilder();

  MapStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _startLocation = $v.startLocation;
      _endLocation = $v.endLocation;
      _markers = $v.markers.toBuilder();
      _isPanelOpen = $v.isPanelOpen;
      _isStartPoint = $v.isStartPoint;
      _googleMapController = $v.googleMapController;
      _tripInfo = $v.tripInfo;
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
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'MapState', 'isLoading'),
              startLocation: startLocation,
              endLocation: endLocation,
              markers: markers.build(),
              isPanelOpen: BuiltValueNullFieldError.checkNotNull(
                  isPanelOpen, r'MapState', 'isPanelOpen'),
              isStartPoint: isStartPoint,
              googleMapController: googleMapController,
              tripInfo: tripInfo,
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
