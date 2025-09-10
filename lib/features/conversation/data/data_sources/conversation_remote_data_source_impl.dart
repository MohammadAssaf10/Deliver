import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../models/message.dart';
import 'conversation_remote_data_source.dart';

@LazySingleton(as: ConversationRemoteDataSource)
class ConversationRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ConversationRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ConversationRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getConversation(
    int tripId,
  ) async {
    final Stream<QuerySnapshot<Map<String, dynamic>>> messagesStream =
        _firebaseFirestore
            .collection('chat')
            .doc(tripId.toString())
            .collection('messages')
            .orderBy('date', descending: false)
            .snapshots();
    return messagesStream;
  }

  @override
  Future<void> sendMessage(int tripId, Message message) async {
    final lastMessage = await _firebaseFirestore
        .collection('chat')
        .doc(tripId.toString())
        .collection('messages')
        .orderBy('date')
        .get();
    int lastMessageId = 0;
    Message updateMessage = message;
    if (lastMessage.docs.isNotEmpty) {
      lastMessageId = int.parse(lastMessage.docs.last.id);
      updateMessage = updateMessage.copyWith(id: lastMessageId + 1);
    }
    await _firebaseFirestore
        .collection('chat')
        .doc(tripId.toString())
        .collection('messages')
        .doc((lastMessageId + 1).toString())
        .set(updateMessage.toJson());
  }
}
