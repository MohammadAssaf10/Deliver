import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/conversation_remote_data_source.dart';
import '../models/message.dart';

@lazySingleton
class ConversationRepository extends BaseRepositoryImpl {
  final ConversationRemoteDataSource _conversationRemoteDataSource;
  ConversationRepository(
    super._networkInfo,
    this._conversationRemoteDataSource,
  );

  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  getConversation(int tripId) async => await requestApi(
    () async => await _conversationRemoteDataSource.getConversation(tripId),
    (dataModel) {
      return dataModel;
    },
  );

  Future<Either<Failure, void>> sendMessage(
    int tripId,
    Message message,
  ) async => await requestApi(
    () async =>
        await _conversationRemoteDataSource.sendMessage(tripId, message),
    (_) {
      return;
    },
  );
}
