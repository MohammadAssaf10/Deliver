import 'package:json_annotation/json_annotation.dart';

part 'my_conversation.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MyConversation {
  @JsonKey(name: 'driverName')
  final String? driverName;
  @JsonKey(name: 'riderName')
  final String riderName;
  @JsonKey(name: 'isActive')
  final bool isActive;
  @JsonKey(name: 'tripId')
  final int tripId;

  MyConversation({
    this.driverName,
    required this.riderName,
    required this.isActive,
    required this.tripId,
  });

  factory MyConversation.fromJson(Map<String, dynamic> json) =>
      _$MyConversationFromJson(json);

}
