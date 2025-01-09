// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCurrentLocation extends GetCurrentLocation {
  factory _$GetCurrentLocation(
          [void Function(GetCurrentLocationBuilder)? updates]) =>
      (new GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._() : super._();

  @override
  GetCurrentLocation rebuild(
          void Function(GetCurrentLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentLocationBuilder toBuilder() =>
      new GetCurrentLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrentLocation;
  }

  @override
  int get hashCode {
    return 214810858;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrentLocation').toString();
  }
}

class GetCurrentLocationBuilder
    implements Builder<GetCurrentLocation, GetCurrentLocationBuilder> {
  _$GetCurrentLocation? _$v;

  GetCurrentLocationBuilder();

  @override
  void replace(GetCurrentLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrentLocation;
  }

  @override
  void update(void Function(GetCurrentLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentLocation build() => _build();

  _$GetCurrentLocation _build() {
    final _$result = _$v ?? new _$GetCurrentLocation._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeIsPanelOpenState extends ChangeIsPanelOpenState {
  @override
  final bool isPanelOpen;

  factory _$ChangeIsPanelOpenState(
          [void Function(ChangeIsPanelOpenStateBuilder)? updates]) =>
      (new ChangeIsPanelOpenStateBuilder()..update(updates))._build();

  _$ChangeIsPanelOpenState._({required this.isPanelOpen}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isPanelOpen, r'ChangeIsPanelOpenState', 'isPanelOpen');
  }

  @override
  ChangeIsPanelOpenState rebuild(
          void Function(ChangeIsPanelOpenStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeIsPanelOpenStateBuilder toBuilder() =>
      new ChangeIsPanelOpenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeIsPanelOpenState && isPanelOpen == other.isPanelOpen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isPanelOpen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeIsPanelOpenState')
          ..add('isPanelOpen', isPanelOpen))
        .toString();
  }
}

class ChangeIsPanelOpenStateBuilder
    implements Builder<ChangeIsPanelOpenState, ChangeIsPanelOpenStateBuilder> {
  _$ChangeIsPanelOpenState? _$v;

  bool? _isPanelOpen;
  bool? get isPanelOpen => _$this._isPanelOpen;
  set isPanelOpen(bool? isPanelOpen) => _$this._isPanelOpen = isPanelOpen;

  ChangeIsPanelOpenStateBuilder();

  ChangeIsPanelOpenStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isPanelOpen = $v.isPanelOpen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeIsPanelOpenState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeIsPanelOpenState;
  }

  @override
  void update(void Function(ChangeIsPanelOpenStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeIsPanelOpenState build() => _build();

  _$ChangeIsPanelOpenState _build() {
    final _$result = _$v ??
        new _$ChangeIsPanelOpenState._(
            isPanelOpen: BuiltValueNullFieldError.checkNotNull(
                isPanelOpen, r'ChangeIsPanelOpenState', 'isPanelOpen'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeIsStartPointState extends ChangeIsStartPointState {
  @override
  final bool? isStartPoint;

  factory _$ChangeIsStartPointState(
          [void Function(ChangeIsStartPointStateBuilder)? updates]) =>
      (new ChangeIsStartPointStateBuilder()..update(updates))._build();

  _$ChangeIsStartPointState._({this.isStartPoint}) : super._();

  @override
  ChangeIsStartPointState rebuild(
          void Function(ChangeIsStartPointStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeIsStartPointStateBuilder toBuilder() =>
      new ChangeIsStartPointStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeIsStartPointState &&
        isStartPoint == other.isStartPoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isStartPoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeIsStartPointState')
          ..add('isStartPoint', isStartPoint))
        .toString();
  }
}

class ChangeIsStartPointStateBuilder
    implements
        Builder<ChangeIsStartPointState, ChangeIsStartPointStateBuilder> {
  _$ChangeIsStartPointState? _$v;

  bool? _isStartPoint;
  bool? get isStartPoint => _$this._isStartPoint;
  set isStartPoint(bool? isStartPoint) => _$this._isStartPoint = isStartPoint;

  ChangeIsStartPointStateBuilder();

  ChangeIsStartPointStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isStartPoint = $v.isStartPoint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeIsStartPointState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeIsStartPointState;
  }

  @override
  void update(void Function(ChangeIsStartPointStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeIsStartPointState build() => _build();

  _$ChangeIsStartPointState _build() {
    final _$result =
        _$v ?? new _$ChangeIsStartPointState._(isStartPoint: isStartPoint);
    replace(_$result);
    return _$result;
  }
}

class _$SetHintMessage extends SetHintMessage {
  @override
  final String message;

  factory _$SetHintMessage([void Function(SetHintMessageBuilder)? updates]) =>
      (new SetHintMessageBuilder()..update(updates))._build();

  _$SetHintMessage._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'SetHintMessage', 'message');
  }

  @override
  SetHintMessage rebuild(void Function(SetHintMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetHintMessageBuilder toBuilder() =>
      new SetHintMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetHintMessage && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetHintMessage')
          ..add('message', message))
        .toString();
  }
}

class SetHintMessageBuilder
    implements Builder<SetHintMessage, SetHintMessageBuilder> {
  _$SetHintMessage? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SetHintMessageBuilder();

  SetHintMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetHintMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetHintMessage;
  }

  @override
  void update(void Function(SetHintMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetHintMessage build() => _build();

  _$SetHintMessage _build() {
    final _$result = _$v ??
        new _$SetHintMessage._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'SetHintMessage', 'message'));
    replace(_$result);
    return _$result;
  }
}

class _$SetStartPoint extends SetStartPoint {
  @override
  final LocationInfo startPoint;

  factory _$SetStartPoint([void Function(SetStartPointBuilder)? updates]) =>
      (new SetStartPointBuilder()..update(updates))._build();

  _$SetStartPoint._({required this.startPoint}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startPoint, r'SetStartPoint', 'startPoint');
  }

  @override
  SetStartPoint rebuild(void Function(SetStartPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetStartPointBuilder toBuilder() => new SetStartPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetStartPoint && startPoint == other.startPoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startPoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetStartPoint')
          ..add('startPoint', startPoint))
        .toString();
  }
}

class SetStartPointBuilder
    implements Builder<SetStartPoint, SetStartPointBuilder> {
  _$SetStartPoint? _$v;

  LocationInfo? _startPoint;
  LocationInfo? get startPoint => _$this._startPoint;
  set startPoint(LocationInfo? startPoint) => _$this._startPoint = startPoint;

  SetStartPointBuilder();

  SetStartPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startPoint = $v.startPoint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetStartPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetStartPoint;
  }

  @override
  void update(void Function(SetStartPointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetStartPoint build() => _build();

  _$SetStartPoint _build() {
    final _$result = _$v ??
        new _$SetStartPoint._(
            startPoint: BuiltValueNullFieldError.checkNotNull(
                startPoint, r'SetStartPoint', 'startPoint'));
    replace(_$result);
    return _$result;
  }
}

class _$SetEndPoint extends SetEndPoint {
  @override
  final LocationInfo endPoint;

  factory _$SetEndPoint([void Function(SetEndPointBuilder)? updates]) =>
      (new SetEndPointBuilder()..update(updates))._build();

  _$SetEndPoint._({required this.endPoint}) : super._() {
    BuiltValueNullFieldError.checkNotNull(endPoint, r'SetEndPoint', 'endPoint');
  }

  @override
  SetEndPoint rebuild(void Function(SetEndPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetEndPointBuilder toBuilder() => new SetEndPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetEndPoint && endPoint == other.endPoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, endPoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetEndPoint')
          ..add('endPoint', endPoint))
        .toString();
  }
}

class SetEndPointBuilder implements Builder<SetEndPoint, SetEndPointBuilder> {
  _$SetEndPoint? _$v;

  LocationInfo? _endPoint;
  LocationInfo? get endPoint => _$this._endPoint;
  set endPoint(LocationInfo? endPoint) => _$this._endPoint = endPoint;

  SetEndPointBuilder();

  SetEndPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _endPoint = $v.endPoint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetEndPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetEndPoint;
  }

  @override
  void update(void Function(SetEndPointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetEndPoint build() => _build();

  _$SetEndPoint _build() {
    final _$result = _$v ??
        new _$SetEndPoint._(
            endPoint: BuiltValueNullFieldError.checkNotNull(
                endPoint, r'SetEndPoint', 'endPoint'));
    replace(_$result);
    return _$result;
  }
}

class _$CalculateDistance extends CalculateDistance {
  factory _$CalculateDistance(
          [void Function(CalculateDistanceBuilder)? updates]) =>
      (new CalculateDistanceBuilder()..update(updates))._build();

  _$CalculateDistance._() : super._();

  @override
  CalculateDistance rebuild(void Function(CalculateDistanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalculateDistanceBuilder toBuilder() =>
      new CalculateDistanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalculateDistance;
  }

  @override
  int get hashCode {
    return 1027237629;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'CalculateDistance').toString();
  }
}

class CalculateDistanceBuilder
    implements Builder<CalculateDistance, CalculateDistanceBuilder> {
  _$CalculateDistance? _$v;

  CalculateDistanceBuilder();

  @override
  void replace(CalculateDistance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CalculateDistance;
  }

  @override
  void update(void Function(CalculateDistanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CalculateDistance build() => _build();

  _$CalculateDistance _build() {
    final _$result = _$v ?? new _$CalculateDistance._();
    replace(_$result);
    return _$result;
  }
}

class _$CreateNewTrip extends CreateNewTrip {
  factory _$CreateNewTrip([void Function(CreateNewTripBuilder)? updates]) =>
      (new CreateNewTripBuilder()..update(updates))._build();

  _$CreateNewTrip._() : super._();

  @override
  CreateNewTrip rebuild(void Function(CreateNewTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateNewTripBuilder toBuilder() => new CreateNewTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateNewTrip;
  }

  @override
  int get hashCode {
    return 149946870;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'CreateNewTrip').toString();
  }
}

class CreateNewTripBuilder
    implements Builder<CreateNewTrip, CreateNewTripBuilder> {
  _$CreateNewTrip? _$v;

  CreateNewTripBuilder();

  @override
  void replace(CreateNewTrip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateNewTrip;
  }

  @override
  void update(void Function(CreateNewTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateNewTrip build() => _build();

  _$CreateNewTrip _build() {
    final _$result = _$v ?? new _$CreateNewTrip._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
