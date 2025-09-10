// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapState extends MapState {
  @override
  final bool isLoading;
  @override
  final Address? tripStartAddress;
  @override
  final Address? currentAddress;
  @override
  final Address? tripEndAddress;
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
  @override
  final BlocStatus deleteTripStatus;

  factory _$MapState([void Function(MapStateBuilder)? updates]) =>
      (MapStateBuilder()..update(updates))._build();

  _$MapState._({
    required this.isLoading,
    this.tripStartAddress,
    this.currentAddress,
    this.tripEndAddress,
    required this.markers,
    required this.isPanelOpen,
    this.isStartAddress,
    this.googleMapController,
    this.tripDistanceAndDuration,
    required this.message,
    this.currentTrip,
    required this.deleteTripStatus,
  }) : super._();
  @override
  MapState rebuild(void Function(MapStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapStateBuilder toBuilder() => MapStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapState &&
        isLoading == other.isLoading &&
        tripStartAddress == other.tripStartAddress &&
        currentAddress == other.currentAddress &&
        tripEndAddress == other.tripEndAddress &&
        markers == other.markers &&
        isPanelOpen == other.isPanelOpen &&
        isStartAddress == other.isStartAddress &&
        googleMapController == other.googleMapController &&
        tripDistanceAndDuration == other.tripDistanceAndDuration &&
        message == other.message &&
        currentTrip == other.currentTrip &&
        deleteTripStatus == other.deleteTripStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, tripStartAddress.hashCode);
    _$hash = $jc(_$hash, currentAddress.hashCode);
    _$hash = $jc(_$hash, tripEndAddress.hashCode);
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jc(_$hash, isStartAddress.hashCode);
    _$hash = $jc(_$hash, googleMapController.hashCode);
    _$hash = $jc(_$hash, tripDistanceAndDuration.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, currentTrip.hashCode);
    _$hash = $jc(_$hash, deleteTripStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapState')
          ..add('isLoading', isLoading)
          ..add('tripStartAddress', tripStartAddress)
          ..add('currentAddress', currentAddress)
          ..add('tripEndAddress', tripEndAddress)
          ..add('markers', markers)
          ..add('isPanelOpen', isPanelOpen)
          ..add('isStartAddress', isStartAddress)
          ..add('googleMapController', googleMapController)
          ..add('tripDistanceAndDuration', tripDistanceAndDuration)
          ..add('message', message)
          ..add('currentTrip', currentTrip)
          ..add('deleteTripStatus', deleteTripStatus))
        .toString();
  }
}

class MapStateBuilder implements Builder<MapState, MapStateBuilder> {
  _$MapState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  Address? _tripStartAddress;
  Address? get tripStartAddress => _$this._tripStartAddress;
  set tripStartAddress(Address? tripStartAddress) =>
      _$this._tripStartAddress = tripStartAddress;

  Address? _currentAddress;
  Address? get currentAddress => _$this._currentAddress;
  set currentAddress(Address? currentAddress) =>
      _$this._currentAddress = currentAddress;

  Address? _tripEndAddress;
  Address? get tripEndAddress => _$this._tripEndAddress;
  set tripEndAddress(Address? tripEndAddress) =>
      _$this._tripEndAddress = tripEndAddress;

  SetBuilder<Marker>? _markers;
  SetBuilder<Marker> get markers => _$this._markers ??= SetBuilder<Marker>();
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
    TripDistanceAndDuration? tripDistanceAndDuration,
  ) => _$this._tripDistanceAndDuration = tripDistanceAndDuration;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Trip? _currentTrip;
  Trip? get currentTrip => _$this._currentTrip;
  set currentTrip(Trip? currentTrip) => _$this._currentTrip = currentTrip;

  BlocStatus? _deleteTripStatus;
  BlocStatus? get deleteTripStatus => _$this._deleteTripStatus;
  set deleteTripStatus(BlocStatus? deleteTripStatus) =>
      _$this._deleteTripStatus = deleteTripStatus;

  MapStateBuilder();

  MapStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _tripStartAddress = $v.tripStartAddress;
      _currentAddress = $v.currentAddress;
      _tripEndAddress = $v.tripEndAddress;
      _markers = $v.markers.toBuilder();
      _isPanelOpen = $v.isPanelOpen;
      _isStartAddress = $v.isStartAddress;
      _googleMapController = $v.googleMapController;
      _tripDistanceAndDuration = $v.tripDistanceAndDuration;
      _message = $v.message;
      _currentTrip = $v.currentTrip;
      _deleteTripStatus = $v.deleteTripStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapState other) {
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
      _$result =
          _$v ??
          _$MapState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
              isLoading,
              r'MapState',
              'isLoading',
            ),
            tripStartAddress: tripStartAddress,
            currentAddress: currentAddress,
            tripEndAddress: tripEndAddress,
            markers: markers.build(),
            isPanelOpen: BuiltValueNullFieldError.checkNotNull(
              isPanelOpen,
              r'MapState',
              'isPanelOpen',
            ),
            isStartAddress: isStartAddress,
            googleMapController: googleMapController,
            tripDistanceAndDuration: tripDistanceAndDuration,
            message: BuiltValueNullFieldError.checkNotNull(
              message,
              r'MapState',
              'message',
            ),
            currentTrip: currentTrip,
            deleteTripStatus: BuiltValueNullFieldError.checkNotNull(
              deleteTripStatus,
              r'MapState',
              'deleteTripStatus',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'markers';
        markers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'MapState',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
