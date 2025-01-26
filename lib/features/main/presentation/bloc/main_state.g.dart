// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainState extends MainState {
  @override
  final bool isLoading;
  @override
  final int pageIndex;
  @override
  final Trip? trip;

  factory _$MainState([void Function(MainStateBuilder)? updates]) =>
      (new MainStateBuilder()..update(updates))._build();

  _$MainState._({required this.isLoading, required this.pageIndex, this.trip})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'MainState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(pageIndex, r'MainState', 'pageIndex');
  }

  @override
  MainState rebuild(void Function(MainStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainStateBuilder toBuilder() => new MainStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainState &&
        isLoading == other.isLoading &&
        pageIndex == other.pageIndex &&
        trip == other.trip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, pageIndex.hashCode);
    _$hash = $jc(_$hash, trip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainState')
          ..add('isLoading', isLoading)
          ..add('pageIndex', pageIndex)
          ..add('trip', trip))
        .toString();
  }
}

class MainStateBuilder implements Builder<MainState, MainStateBuilder> {
  _$MainState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  Trip? _trip;
  Trip? get trip => _$this._trip;
  set trip(Trip? trip) => _$this._trip = trip;

  MainStateBuilder();

  MainStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _pageIndex = $v.pageIndex;
      _trip = $v.trip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainState;
  }

  @override
  void update(void Function(MainStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainState build() => _build();

  _$MainState _build() {
    final _$result = _$v ??
        new _$MainState._(
          isLoading: BuiltValueNullFieldError.checkNotNull(
              isLoading, r'MainState', 'isLoading'),
          pageIndex: BuiltValueNullFieldError.checkNotNull(
              pageIndex, r'MainState', 'pageIndex'),
          trip: trip,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
