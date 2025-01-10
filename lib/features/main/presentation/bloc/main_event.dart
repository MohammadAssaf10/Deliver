import 'package:built_value/built_value.dart';

part 'main_event.g.dart';

abstract class MainEvent {}

abstract class SetPageIndex extends MainEvent
    implements Built<SetPageIndex, SetPageIndexBuilder> {
  int get pageIndex;

  SetPageIndex._();

  factory SetPageIndex([void Function(SetPageIndexBuilder) updates]) =
      _$SetPageIndex;
}

abstract class GetCurrentTrip extends MainEvent
    implements Built<GetCurrentTrip, GetCurrentTripBuilder> {
  GetCurrentTrip._();

  factory GetCurrentTrip([void Function(GetCurrentTripBuilder) updates]) =
      _$GetCurrentTrip;
}
