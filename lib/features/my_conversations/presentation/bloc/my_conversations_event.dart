import 'package:built_value/built_value.dart';

part 'my_conversations_event.g.dart';

abstract class MyConversationsEvent {}

abstract class GetMyConversations extends MyConversationsEvent implements Built<GetMyConversations, GetMyConversationsBuilder> {
  

  GetMyConversations._();
  factory GetMyConversations([void Function(GetMyConversationsBuilder) updates]) = _$GetMyConversations;
}
