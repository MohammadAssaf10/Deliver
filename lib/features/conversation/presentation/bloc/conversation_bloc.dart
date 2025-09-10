import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../profile/data/models/profile.dart';
import '../../data/models/message.dart';
import '../../data/repositories/conversation_repository.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

@injectable
class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final ConversationRepository _conversationRepository;
  final TextEditingController messageController = TextEditingController();

  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
  messagesStreamSubscription;

  void getConversation(int tripId) =>
      add(GetConversation((b) => b..tripId = tripId));

  void sendMessage(int tripId, String message) => add(
    SendMessage(
      (b) => b
        ..message = message
        ..tripId = tripId,
    ),
  );

  @override
  Future<void> close() {
    messagesStreamSubscription.cancel();
    messageController.dispose();
    return super.close();
  }

  ConversationBloc(this._conversationRepository)
    : super(ConversationState.initial()) {
    on<GetConversation>((event, emit) async {
      emit(state.rebuild((b) => b..status = BlocStatus.loading));
      final result = await _conversationRepository.getConversation(
        event.tripId,
      );
      result.fold(
        (failure) {
          emit(state.rebuild((b) => b..status = BlocStatus.error));
        },
        (data) {
          messagesStreamSubscription = data.listen((messageSnapshot) {
            for (QueryDocumentSnapshot<Map<String, dynamic>> messageDocs
                in messageSnapshot.docs) {
              final Message message = Message.fromJson(messageDocs.data());
              dPrint('message: ${message.toString()}');
              if (!state.messages.contains(message)) {
                add(AddMessage((b) => b..message = message));
              }
            }
          });
          emit(state.rebuild((b) => b..status = BlocStatus.success));
        },
      );
    });
    on<SendMessage>((event, emit) async {
      messageController.clear();

      final Profile? profile = getIt<AppCubit>().state.profile;
      if (profile == null) return;
      final int senderId = profile.userId;
      final Message message = Message(
        id: 1,
        message: event.message,
        senderId: senderId,
        date: DateTime.now(),
      );
      await _conversationRepository.sendMessage(event.tripId, message);
    }, transformer: restartable());
    on<AddMessage>((event, emit) {
      emit(state.rebuild((b) => b..messages.insert(0, event.message)));
    });
  }
}
