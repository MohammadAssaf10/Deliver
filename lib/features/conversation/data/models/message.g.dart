// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Message', json, ($checkedConvert) {
      final val = Message(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String),
        senderId: $checkedConvert('senderId', (v) => (v as num).toInt()),
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
      );
      return val;
    });

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'senderId': instance.senderId,
  'date': instance.date.toIso8601String(),
};
