// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationState extends ConversationState {
  @override
  final BlocStatus status;
  @override
  final BuiltList<Message> messages;

  factory _$ConversationState([
    void Function(ConversationStateBuilder)? updates,
  ]) => (ConversationStateBuilder()..update(updates))._build();

  _$ConversationState._({required this.status, required this.messages})
    : super._();
  @override
  ConversationState rebuild(void Function(ConversationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationStateBuilder toBuilder() =>
      ConversationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationState &&
        status == other.status &&
        messages == other.messages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, messages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationState')
          ..add('status', status)
          ..add('messages', messages))
        .toString();
  }
}

class ConversationStateBuilder
    implements Builder<ConversationState, ConversationStateBuilder> {
  _$ConversationState? _$v;

  BlocStatus? _status;
  BlocStatus? get status => _$this._status;
  set status(BlocStatus? status) => _$this._status = status;

  ListBuilder<Message>? _messages;
  ListBuilder<Message> get messages =>
      _$this._messages ??= ListBuilder<Message>();
  set messages(ListBuilder<Message>? messages) => _$this._messages = messages;

  ConversationStateBuilder();

  ConversationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _messages = $v.messages.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationState other) {
    _$v = other as _$ConversationState;
  }

  @override
  void update(void Function(ConversationStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationState build() => _build();

  _$ConversationState _build() {
    _$ConversationState _$result;
    try {
      _$result =
          _$v ??
          _$ConversationState._(
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'ConversationState',
              'status',
            ),
            messages: messages.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ConversationState',
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
