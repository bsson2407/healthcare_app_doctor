// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRecordRequest _$HealthRecordRequestFromJson(Map<String, dynamic> json) =>
    HealthRecordRequest(
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      heartRateIndicator: json['heartRateIndicator'] as String?,
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      glucose: json['glucose'] as String?,
      cholesterol: json['cholesterol'] as String?,
    );

Map<String, dynamic> _$HealthRecordRequestToJson(
        HealthRecordRequest instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'heartRateIndicator': instance.heartRateIndicator,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'glucose': instance.glucose,
      'cholesterol': instance.cholesterol,
    };
