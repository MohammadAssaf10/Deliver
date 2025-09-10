import 'package:built_value/built_value.dart';

import '../../../core/utils/app_enums.dart';
import '../../../features/profile/data/models/profile.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  Language get appLanguage;

  BlocStatus get profileStatus;
  Profile? get profile;

  BlocStatus get logoutStatus;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initial() => AppState(
    (b) => b
      ..appLanguage = Language.en
      ..profileStatus = BlocStatus.initial
      ..profile = null
      ..logoutStatus = BlocStatus.initial,
  );
}
