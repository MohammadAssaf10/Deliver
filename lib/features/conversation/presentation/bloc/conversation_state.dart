import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../../../../core/utils/app_enums.dart';
import '../../data/models/message.dart';

part 'conversation_state.g.dart';

abstract class ConversationState
    implements Built<ConversationState, ConversationStateBuilder> {
  BlocStatus get status;
  BuiltList<Message> get messages;

  ConversationState._();
  factory ConversationState([void Function(ConversationStateBuilder) updates]) =
      _$ConversationState;

  factory ConversationState.initial() => ConversationState(
    (b) => b
      ..status = BlocStatus.initial
      ..messages.replace([]),
  );
}
