import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../models/my_conversation.dart';

abstract class MyConversationsRemoteDataSource extends BaseRemoteDataSource {
  Future<List<MyConversation>> getMyConversations(int tripId);
}
