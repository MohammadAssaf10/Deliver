// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCurrentLocation extends GetCurrentLocation {
  factory _$GetCurrentLocation([
    void Function(GetCurrentLocationBuilder)? updates,
  ]) => (new GetCurrentLocationBuilder()..update(updates))._build();

  _$GetCurrentLocation._() : super._();

  @override
  GetCurrentLocation rebuild(
    void Function(GetCurrentLocationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

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

  factory _$ChangeIsPanelOpenState([
    void Function(ChangeIsPanelOpenStateBuilder)? updates,
  ]) => (new ChangeIsPanelOpenStateBuilder()..update(updates))._build();

  _$ChangeIsPanelOpenState._({required this.isPanelOpen}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      isPanelOpen,
      r'ChangeIsPanelOpenState',
      'isPanelOpen',
    );
  }

  @override
  ChangeIsPanelOpenState rebuild(
    void Function(ChangeIsPanelOpenStateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

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
      ..add('isPanelOpen', isPanelOpen)).toString();
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
    final _$result =
        _$v ??
        new _$ChangeIsPanelOpenState._(
          isPanelOpen: BuiltValueNullFieldError.checkNotNull(
            isPanelOpen,
            r'ChangeIsPanelOpenState',
            'isPanelOpen',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SetIsStartAddress extends SetIsStartAddress {
  @override
  final bool isStartAddress;

  factory _$SetIsStartAddress([
    void Function(SetIsStartAddressBuilder)? updates,
  ]) => (new SetIsStartAddressBuilder()..update(updates))._build();

  _$SetIsStartAddress._({required this.isStartAddress}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      isStartAddress,
      r'SetIsStartAddress',
      'isStartAddress',
    );
  }

  @override
  SetIsStartAddress rebuild(void Function(SetIsStartAddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetIsStartAddressBuilder toBuilder() =>
      new SetIsStartAddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetIsStartAddress && isStartAddress == other.isStartAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isStartAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetIsStartAddress')
      ..add('isStartAddress', isStartAddress)).toString();
  }
}

class SetIsStartAddressBuilder
    implements Builder<SetIsStartAddress, SetIsStartAddressBuilder> {
  _$SetIsStartAddress? _$v;

  bool? _isStartAddress;
  bool? get isStartAddress => _$this._isStartAddress;
  set isStartAddress(bool? isStartAddress) =>
      _$this._isStartAddress = isStartAddress;

  SetIsStartAddressBuilder();

  SetIsStartAddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isStartAddress = $v.isStartAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetIsStartAddress other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetIsStartAddress;
  }

  @override
  void update(void Function(SetIsStartAddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetIsStartAddress build() => _build();

  _$SetIsStartAddress _build() {
    final _$result =
        _$v ??
        new _$SetIsStartAddress._(
          isStartAddress: BuiltValueNullFieldError.checkNotNull(
            isStartAddress,
            r'SetIsStartAddress',
            'isStartAddress',
          ),
        );
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
      message,
      r'SetHintMessage',
      'message',
    );
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
      ..add('message', message)).toString();
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
    final _$result =
        _$v ??
        new _$SetHintMessage._(
          message: BuiltValueNullFieldError.checkNotNull(
            message,
            r'SetHintMessage',
            'message',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SetStartAddress extends SetStartAddress {
  @override
  final Address address;

  factory _$SetStartAddress([void Function(SetStartAddressBuilder)? updates]) =>
      (new SetStartAddressBuilder()..update(updates))._build();

  _$SetStartAddress._({required this.address}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      address,
      r'SetStartAddress',
      'address',
    );
  }

  @override
  SetStartAddress rebuild(void Function(SetStartAddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetStartAddressBuilder toBuilder() =>
      new SetStartAddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetStartAddress && address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetStartAddress')
      ..add('address', address)).toString();
  }
}

class SetStartAddressBuilder
    implements Builder<SetStartAddress, SetStartAddressBuilder> {
  _$SetStartAddress? _$v;

  Address? _address;
  Address? get address => _$this._address;
  set address(Address? address) => _$this._address = address;

  SetStartAddressBuilder();

  SetStartAddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetStartAddress other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetStartAddress;
  }

  @override
  void update(void Function(SetStartAddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetStartAddress build() => _build();

  _$SetStartAddress _build() {
    final _$result =
        _$v ??
        new _$SetStartAddress._(
          address: BuiltValueNullFieldError.checkNotNull(
            address,
            r'SetStartAddress',
            'address',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SetEndAddress extends SetEndAddress {
  @override
  final Address address;

  factory _$SetEndAddress([void Function(SetEndAddressBuilder)? updates]) =>
      (new SetEndAddressBuilder()..update(updates))._build();

  _$SetEndAddress._({required this.address}) : super._() {
    BuiltValueNullFieldError.checkNotNull(address, r'SetEndAddress', 'address');
  }

  @override
  SetEndAddress rebuild(void Function(SetEndAddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetEndAddressBuilder toBuilder() => new SetEndAddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetEndAddress && address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetEndAddress')
      ..add('address', address)).toString();
  }
}

class SetEndAddressBuilder
    implements Builder<SetEndAddress, SetEndAddressBuilder> {
  _$SetEndAddress? _$v;

  Address? _address;
  Address? get address => _$this._address;
  set address(Address? address) => _$this._address = address;

  SetEndAddressBuilder();

  SetEndAddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetEndAddress other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetEndAddress;
  }

  @override
  void update(void Function(SetEndAddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetEndAddress build() => _build();

  _$SetEndAddress _build() {
    final _$result =
        _$v ??
        new _$SetEndAddress._(
          address: BuiltValueNullFieldError.checkNotNull(
            address,
            r'SetEndAddress',
            'address',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$CalculateDistance extends CalculateDistance {
  factory _$CalculateDistance([
    void Function(CalculateDistanceBuilder)? updates,
  ]) => (new CalculateDistanceBuilder()..update(updates))._build();

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

class _$SetCurrentTrip extends SetCurrentTrip {
  @override
  final Trip trip;

  factory _$SetCurrentTrip([void Function(SetCurrentTripBuilder)? updates]) =>
      (new SetCurrentTripBuilder()..update(updates))._build();

  _$SetCurrentTrip._({required this.trip}) : super._() {
    BuiltValueNullFieldError.checkNotNull(trip, r'SetCurrentTrip', 'trip');
  }

  @override
  SetCurrentTrip rebuild(void Function(SetCurrentTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetCurrentTripBuilder toBuilder() =>
      new SetCurrentTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetCurrentTrip && trip == other.trip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, trip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetCurrentTrip')
      ..add('trip', trip)).toString();
  }
}

class SetCurrentTripBuilder
    implements Builder<SetCurrentTrip, SetCurrentTripBuilder> {
  _$SetCurrentTrip? _$v;

  Trip? _trip;
  Trip? get trip => _$this._trip;
  set trip(Trip? trip) => _$this._trip = trip;

  SetCurrentTripBuilder();

  SetCurrentTripBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _trip = $v.trip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetCurrentTrip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetCurrentTrip;
  }

  @override
  void update(void Function(SetCurrentTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetCurrentTrip build() => _build();

  _$SetCurrentTrip _build() {
    final _$result =
        _$v ??
        new _$SetCurrentTrip._(
          trip: BuiltValueNullFieldError.checkNotNull(
            trip,
            r'SetCurrentTrip',
            'trip',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$DeleteCurrentTrip extends DeleteCurrentTrip {
  factory _$DeleteCurrentTrip([
    void Function(DeleteCurrentTripBuilder)? updates,
  ]) => (new DeleteCurrentTripBuilder()..update(updates))._build();

  _$DeleteCurrentTrip._() : super._();

  @override
  DeleteCurrentTrip rebuild(void Function(DeleteCurrentTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteCurrentTripBuilder toBuilder() =>
      new DeleteCurrentTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteCurrentTrip;
  }

  @override
  int get hashCode {
    return 47992717;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'DeleteCurrentTrip').toString();
  }
}

class DeleteCurrentTripBuilder
    implements Builder<DeleteCurrentTrip, DeleteCurrentTripBuilder> {
  _$DeleteCurrentTrip? _$v;

  DeleteCurrentTripBuilder();

  @override
  void replace(DeleteCurrentTrip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteCurrentTrip;
  }

  @override
  void update(void Function(DeleteCurrentTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteCurrentTrip build() => _build();

  _$DeleteCurrentTrip _build() {
    final _$result = _$v ?? new _$DeleteCurrentTrip._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
