// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConversation _$MyConversationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MyConversation', json, ($checkedConvert) {
      final val = MyConversation(
        driverName: $checkedConvert('driverName', (v) => v as String?),
        riderName: $checkedConvert('riderName', (v) => v as String),
        isActive: $checkedConvert('isActive', (v) => v as bool),
        tripId: $checkedConvert('tripId', (v) => (v as num).toInt()),
      );
      return val;
    });
