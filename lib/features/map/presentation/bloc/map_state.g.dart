// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapState extends MapState {
  @override
  final bool isLoading;
  @override
  final Address? startAddress;
  @override
  final Address? endAddress;
  @override
  final BuiltSet<Marker> markers;
  @override
  final bool isPanelOpen;
  @override
  final bool? isStartAddress;
  @override
  final GoogleMapController? googleMapController;
  @override
  final TripDistanceAndDuration? tripDistanceAndDuration;
  @override
  final String message;
  @override
  final Trip? currentTrip;

  factory _$MapState([void Function(MapStateBuilder)? updates]) =>
      (new MapStateBuilder()..update(updates))._build();

  _$MapState._(
      {required this.isLoading,
      this.startAddress,
      this.endAddress,
      required this.markers,
      required this.isPanelOpen,
      this.isStartAddress,
      this.googleMapController,
      this.tripDistanceAndDuration,
      required this.message,
      this.currentTrip})
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
        startAddress == other.startAddress &&
        endAddress == other.endAddress &&
        markers == other.markers &&
        isPanelOpen == other.isPanelOpen &&
        isStartAddress == other.isStartAddress &&
        googleMapController == other.googleMapController &&
        tripDistanceAndDuration == other.tripDistanceAndDuration &&
        message == other.message &&
        currentTrip == other.currentTrip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, startAddress.hashCode);
    _$hash = $jc(_$hash, endAddress.hashCode);
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jc(_$hash, isStartAddress.hashCode);
    _$hash = $jc(_$hash, googleMapController.hashCode);
    _$hash = $jc(_$hash, tripDistanceAndDuration.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, currentTrip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapState')
          ..add('isLoading', isLoading)
          ..add('startAddress', startAddress)
          ..add('endAddress', endAddress)
          ..add('markers', markers)
          ..add('isPanelOpen', isPanelOpen)
          ..add('isStartAddress', isStartAddress)
          ..add('googleMapController', googleMapController)
          ..add('tripDistanceAndDuration', tripDistanceAndDuration)
          ..add('message', message)
          ..add('currentTrip', currentTrip))
        .toString();
  }
}

class MapStateBuilder implements Builder<MapState, MapStateBuilder> {
  _$MapState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  Address? _startAddress;
  Address? get startAddress => _$this._startAddress;
  set startAddress(Address? startAddress) =>
      _$this._startAddress = startAddress;

  Address? _endAddress;
  Address? get endAddress => _$this._endAddress;
  set endAddress(Address? endAddress) => _$this._endAddress = endAddress;

  SetBuilder<Marker>? _markers;
  SetBuilder<Marker> get markers =>
      _$this._markers ??= new SetBuilder<Marker>();
  set markers(SetBuilder<Marker>? markers) => _$this._markers = markers;

  bool? _isPanelOpen;
  bool? get isPanelOpen => _$this._isPanelOpen;
  set isPanelOpen(bool? isPanelOpen) => _$this._isPanelOpen = isPanelOpen;

  bool? _isStartAddress;
  bool? get isStartAddress => _$this._isStartAddress;
  set isStartAddress(bool? isStartAddress) =>
      _$this._isStartAddress = isStartAddress;

  GoogleMapController? _googleMapController;
  GoogleMapController? get googleMapController => _$this._googleMapController;
  set googleMapController(GoogleMapController? googleMapController) =>
      _$this._googleMapController = googleMapController;

  TripDistanceAndDuration? _tripDistanceAndDuration;
  TripDistanceAndDuration? get tripDistanceAndDuration =>
      _$this._tripDistanceAndDuration;
  set tripDistanceAndDuration(
          TripDistanceAndDuration? tripDistanceAndDuration) =>
      _$this._tripDistanceAndDuration = tripDistanceAndDuration;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Trip? _currentTrip;
  Trip? get currentTrip => _$this._currentTrip;
  set currentTrip(Trip? currentTrip) => _$this._currentTrip = currentTrip;

  MapStateBuilder();

  MapStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _startAddress = $v.startAddress;
      _endAddress = $v.endAddress;
      _markers = $v.markers.toBuilder();
      _isPanelOpen = $v.isPanelOpen;
      _isStartAddress = $v.isStartAddress;
      _googleMapController = $v.googleMapController;
      _tripDistanceAndDuration = $v.tripDistanceAndDuration;
      _message = $v.message;
      _currentTrip = $v.currentTrip;
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
              startAddress: startAddress,
              endAddress: endAddress,
              markers: markers.build(),
              isPanelOpen: BuiltValueNullFieldError.checkNotNull(
                  isPanelOpen, r'MapState', 'isPanelOpen'),
              isStartAddress: isStartAddress,
              googleMapController: googleMapController,
              tripDistanceAndDuration: tripDistanceAndDuration,
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'MapState', 'message'),
              currentTrip: currentTrip);
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
