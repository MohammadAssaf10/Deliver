import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../core/utils/app_functions.dart';
import '../models/my_conversation.dart';
import 'my_conversations_remote_data_source.dart';

@LazySingleton(as: MyConversationsRemoteDataSource)
class MyConversationsRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MyConversationsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  MyConversationsRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<List<MyConversation>> getMyConversations(int tripId) async {
    final QuerySnapshot<Map<String, dynamic>> myConversationsQuerySnapshot =
        await _firebaseFirestore.collection('chat').get();
    final List<MyConversation> myConversations = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> docs
        in myConversationsQuerySnapshot.docs) {
      final int docsId = int.parse(docs.id);
      if (docsId == tripId) {
        myConversations.add(MyConversation.fromJson(docs.data()));
      }
    }
    dPrint('myConversations: ${myConversations.toString()}');
    return myConversations;
  }
}
