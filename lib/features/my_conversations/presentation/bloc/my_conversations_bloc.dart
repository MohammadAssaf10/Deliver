import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/my_conversations_repository.dart';
import 'my_conversations_event.dart';
import 'my_conversations_state.dart';


@injectable
class MyConversationsBloc extends Bloc<MyConversationsEvent, MyConversationsState> {
  final MyConversationsRepository _myConversationsRepository;
  MyConversationsBloc(this._myConversationsRepository) : super(MyConversationsState.initial()) {
    on<MyConversationsEvent>((event, emit) {
      // TODO: implement event handlers
    });
  }
}
