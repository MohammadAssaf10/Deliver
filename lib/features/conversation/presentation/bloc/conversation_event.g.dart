// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetConversation extends GetConversation {
  @override
  final int tripId;

  factory _$GetConversation([void Function(GetConversationBuilder)? updates]) =>
      (GetConversationBuilder()..update(updates))._build();

  _$GetConversation._({required this.tripId}) : super._();
  @override
  GetConversation rebuild(void Function(GetConversationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetConversationBuilder toBuilder() => GetConversationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetConversation && tripId == other.tripId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tripId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'GetConversation',
    )..add('tripId', tripId)).toString();
  }
}

class GetConversationBuilder
    implements Builder<GetConversation, GetConversationBuilder> {
  _$GetConversation? _$v;

  int? _tripId;
  int? get tripId => _$this._tripId;
  set tripId(int? tripId) => _$this._tripId = tripId;

  GetConversationBuilder();

  GetConversationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripId = $v.tripId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetConversation other) {
    _$v = other as _$GetConversation;
  }

  @override
  void update(void Function(GetConversationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetConversation build() => _build();

  _$GetConversation _build() {
    final _$result =
        _$v ??
        _$GetConversation._(
          tripId: BuiltValueNullFieldError.checkNotNull(
            tripId,
            r'GetConversation',
            'tripId',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$AddMessage extends AddMessage {
  @override
  final Message message;

  factory _$AddMessage([void Function(AddMessageBuilder)? updates]) =>
      (AddMessageBuilder()..update(updates))._build();

  _$AddMessage._({required this.message}) : super._();
  @override
  AddMessage rebuild(void Function(AddMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddMessageBuilder toBuilder() => AddMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddMessage && message == other.message;
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
    return (newBuiltValueToStringHelper(
      r'AddMessage',
    )..add('message', message)).toString();
  }
}

class AddMessageBuilder implements Builder<AddMessage, AddMessageBuilder> {
  _$AddMessage? _$v;

  Message? _message;
  Message? get message => _$this._message;
  set message(Message? message) => _$this._message = message;

  AddMessageBuilder();

  AddMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddMessage other) {
    _$v = other as _$AddMessage;
  }

  @override
  void update(void Function(AddMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddMessage build() => _build();

  _$AddMessage _build() {
    final _$result =
        _$v ??
        _$AddMessage._(
          message: BuiltValueNullFieldError.checkNotNull(
            message,
            r'AddMessage',
            'message',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SendMessage extends SendMessage {
  @override
  final String message;
  @override
  final int tripId;

  factory _$SendMessage([void Function(SendMessageBuilder)? updates]) =>
      (SendMessageBuilder()..update(updates))._build();

  _$SendMessage._({required this.message, required this.tripId}) : super._();
  @override
  SendMessage rebuild(void Function(SendMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendMessageBuilder toBuilder() => SendMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendMessage &&
        message == other.message &&
        tripId == other.tripId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, tripId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendMessage')
          ..add('message', message)
          ..add('tripId', tripId))
        .toString();
  }
}

class SendMessageBuilder implements Builder<SendMessage, SendMessageBuilder> {
  _$SendMessage? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _tripId;
  int? get tripId => _$this._tripId;
  set tripId(int? tripId) => _$this._tripId = tripId;

  SendMessageBuilder();

  SendMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _tripId = $v.tripId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendMessage other) {
    _$v = other as _$SendMessage;
  }

  @override
  void update(void Function(SendMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendMessage build() => _build();

  _$SendMessage _build() {
    final _$result =
        _$v ??
        _$SendMessage._(
          message: BuiltValueNullFieldError.checkNotNull(
            message,
            r'SendMessage',
            'message',
          ),
          tripId: BuiltValueNullFieldError.checkNotNull(
            tripId,
            r'SendMessage',
            'tripId',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
