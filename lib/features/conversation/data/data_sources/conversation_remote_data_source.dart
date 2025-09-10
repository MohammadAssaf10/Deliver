import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../models/message.dart';

abstract class ConversationRemoteDataSource extends BaseRemoteDataSource {
  Future<void> sendMessage(int tripId, Message message);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getConversation(int tripId);
}
