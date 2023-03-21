// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record_day_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRecordDayResponse _$HealthRecordDayResponseFromJson(
        Map<String, dynamic> json) =>
    HealthRecordDayResponse(
      data: json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HealthRecordDayResponseToJson(
        HealthRecordDayResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      id: json['id'] as String?,
      healthRecordId: json['healthRecordId'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      indexBmi: json['indexBmi'] as String?,
      heartRateIndicator: json['heartRateIndicator'] as String?,
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      glucose: json['glucose'] as String?,
      cholesterol: json['cholesterol'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'indexBmi': instance.indexBmi,
      'heartRateIndicator': instance.heartRateIndicator,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'glucose': instance.glucose,
      'cholesterol': instance.cholesterol,
      'healthRecordId': instance.healthRecordId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
