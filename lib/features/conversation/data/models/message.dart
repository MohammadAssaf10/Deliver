import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(checked: true)
class Message extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'senderId')
  final int senderId;
  @JsonKey(name: 'date')
  final DateTime date;

  const Message({
    required this.id,
    required this.message,
    required this.senderId,
    required this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object?> get props => [id, message, senderId, date];

  Message copyWith({
    int? id,
    String? message,
    int? senderId,
    DateTime? date,
  }) {
    return Message(
      id: id ?? this.id,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      date: date ?? this.date,
    );
  }
}
