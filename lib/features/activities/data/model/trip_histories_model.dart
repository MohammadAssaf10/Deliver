import 'package:json_annotation/json_annotation.dart';

import 'trip_history_model.dart';

part 'trip_histories_model.g.dart';

@JsonSerializable(createToJson: false)
class TripHistoriesModel{
  @JsonKey(name: 'data')
  final List<TripHistoryModel> tripHistories;

  TripHistoriesModel({required this.tripHistories});

  factory TripHistoriesModel.fromJson(Map<String, dynamic> json) =>
      _$TripHistoriesModelFromJson(json);
}