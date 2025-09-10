// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ActivitiesState extends ActivitiesState {
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isListenerAdded;
  @override
  final PaginationStateData<TripHistory> tripHistories;

  factory _$ActivitiesState([void Function(ActivitiesStateBuilder)? updates]) =>
      (ActivitiesStateBuilder()..update(updates))._build();

  _$ActivitiesState._({
    required this.isLoading,
    required this.isError,
    required this.isListenerAdded,
    required this.tripHistories,
  }) : super._();
  @override
  ActivitiesState rebuild(void Function(ActivitiesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivitiesStateBuilder toBuilder() => ActivitiesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivitiesState &&
        isLoading == other.isLoading &&
        isError == other.isError &&
        isListenerAdded == other.isListenerAdded &&
        tripHistories == other.tripHistories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, isListenerAdded.hashCode);
    _$hash = $jc(_$hash, tripHistories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivitiesState')
          ..add('isLoading', isLoading)
          ..add('isError', isError)
          ..add('isListenerAdded', isListenerAdded)
          ..add('tripHistories', tripHistories))
        .toString();
  }
}

class ActivitiesStateBuilder
    implements Builder<ActivitiesState, ActivitiesStateBuilder> {
  _$ActivitiesState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  bool? _isListenerAdded;
  bool? get isListenerAdded => _$this._isListenerAdded;
  set isListenerAdded(bool? isListenerAdded) =>
      _$this._isListenerAdded = isListenerAdded;

  PaginationStateDataBuilder<TripHistory>? _tripHistories;
  PaginationStateDataBuilder<TripHistory> get tripHistories =>
      _$this._tripHistories ??= PaginationStateDataBuilder<TripHistory>();
  set tripHistories(PaginationStateDataBuilder<TripHistory>? tripHistories) =>
      _$this._tripHistories = tripHistories;

  ActivitiesStateBuilder();

  ActivitiesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isError = $v.isError;
      _isListenerAdded = $v.isListenerAdded;
      _tripHistories = $v.tripHistories.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivitiesState other) {
    _$v = other as _$ActivitiesState;
  }

  @override
  void update(void Function(ActivitiesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivitiesState build() => _build();

  _$ActivitiesState _build() {
    _$ActivitiesState _$result;
    try {
      _$result =
          _$v ??
          _$ActivitiesState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
              isLoading,
              r'ActivitiesState',
              'isLoading',
            ),
            isError: BuiltValueNullFieldError.checkNotNull(
              isError,
              r'ActivitiesState',
              'isError',
            ),
            isListenerAdded: BuiltValueNullFieldError.checkNotNull(
              isListenerAdded,
              r'ActivitiesState',
              'isListenerAdded',
            ),
            tripHistories: tripHistories.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tripHistories';
        tripHistories.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ActivitiesState',
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
