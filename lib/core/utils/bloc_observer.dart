import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_enums.dart';
import 'app_functions.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    dPrint('onCreate -- ${bloc.runtimeType}', stringColor: StringColor.blue);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dPrint('onClose -- ${bloc.runtimeType}', stringColor: StringColor.cyan);
  }
}
