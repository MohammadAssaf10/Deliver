// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Profile', json, ($checkedConvert) {
      final val = Profile(
        userId: $checkedConvert('userId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        phone: $checkedConvert('phone', (v) => v as String),
        profileImage: $checkedConvert('profileImage', (v) => v as String?),
      );
      return val;
    });
