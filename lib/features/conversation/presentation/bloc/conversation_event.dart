import 'package:built_value/built_value.dart';

import '../../data/models/message.dart';

part 'conversation_event.g.dart';

abstract class ConversationEvent {}

abstract class GetConversation extends ConversationEvent
    implements Built<GetConversation, GetConversationBuilder> {
  int get tripId;
  GetConversation._();
  factory GetConversation([void Function(GetConversationBuilder) updates]) =
      _$GetConversation;
}

abstract class AddMessage extends ConversationEvent
    implements Built<AddMessage, AddMessageBuilder> {
  Message get message;

  AddMessage._();
  factory AddMessage([void Function(AddMessageBuilder) updates]) = _$AddMessage;
}

abstract class SendMessage extends ConversationEvent
    implements Built<SendMessage, SendMessageBuilder> {
  String get message;
  int get tripId;
  SendMessage._();
  factory SendMessage([void Function(SendMessageBuilder) updates]) =
      _$SendMessage;
}
