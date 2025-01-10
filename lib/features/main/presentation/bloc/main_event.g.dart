// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetPageIndex extends SetPageIndex {
  @override
  final int pageIndex;

  factory _$SetPageIndex([void Function(SetPageIndexBuilder)? updates]) =>
      (new SetPageIndexBuilder()..update(updates))._build();

  _$SetPageIndex._({required this.pageIndex}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pageIndex, r'SetPageIndex', 'pageIndex');
  }

  @override
  SetPageIndex rebuild(void Function(SetPageIndexBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetPageIndexBuilder toBuilder() => new SetPageIndexBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetPageIndex && pageIndex == other.pageIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pageIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetPageIndex')
          ..add('pageIndex', pageIndex))
        .toString();
  }
}

class SetPageIndexBuilder
    implements Builder<SetPageIndex, SetPageIndexBuilder> {
  _$SetPageIndex? _$v;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  SetPageIndexBuilder();

  SetPageIndexBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageIndex = $v.pageIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetPageIndex other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetPageIndex;
  }

  @override
  void update(void Function(SetPageIndexBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetPageIndex build() => _build();

  _$SetPageIndex _build() {
    final _$result = _$v ??
        new _$SetPageIndex._(
            pageIndex: BuiltValueNullFieldError.checkNotNull(
                pageIndex, r'SetPageIndex', 'pageIndex'));
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrentTrip extends GetCurrentTrip {
  factory _$GetCurrentTrip([void Function(GetCurrentTripBuilder)? updates]) =>
      (new GetCurrentTripBuilder()..update(updates))._build();

  _$GetCurrentTrip._() : super._();

  @override
  GetCurrentTrip rebuild(void Function(GetCurrentTripBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrentTripBuilder toBuilder() =>
      new GetCurrentTripBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrentTrip;
  }

  @override
  int get hashCode {
    return 354660668;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrentTrip').toString();
  }
}

class GetCurrentTripBuilder
    implements Builder<GetCurrentTrip, GetCurrentTripBuilder> {
  _$GetCurrentTrip? _$v;

  GetCurrentTripBuilder();

  @override
  void replace(GetCurrentTrip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrentTrip;
  }

  @override
  void update(void Function(GetCurrentTripBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrentTrip build() => _build();

  _$GetCurrentTrip _build() {
    final _$result = _$v ?? new _$GetCurrentTrip._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
