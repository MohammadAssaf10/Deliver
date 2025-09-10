import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/my_conversations_remote_data_source.dart';
import '../models/my_conversation.dart';

@lazySingleton
class MyConversationsRepository extends BaseRepositoryImpl {
  final MyConversationsRemoteDataSource _myConversationsRemoteDataSource;
  MyConversationsRepository(
    super._networkInfo,
    this._myConversationsRemoteDataSource,
  );

  Future<Either<Failure, List<MyConversation>>> getMyConversations(
    int id,
  ) async => requestApi(
    () async => await _myConversationsRemoteDataSource.getMyConversations(id),
    (dataModel) {
      return dataModel;
    },
  );
}
