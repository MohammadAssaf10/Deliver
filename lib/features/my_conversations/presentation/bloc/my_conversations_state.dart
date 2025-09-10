import 'package:built_value/built_value.dart';

part 'my_conversations_state.g.dart';

abstract class MyConversationsState implements Built<MyConversationsState, MyConversationsStateBuilder> {
  

  MyConversationsState._();
  factory MyConversationsState([void Function(MyConversationsStateBuilder) updates]) = _$MyConversationsState;

  factory MyConversationsState.initial() => MyConversationsState();
}

