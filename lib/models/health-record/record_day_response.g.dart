// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_day_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDayResponse _$RecordDayResponseFromJson(Map<String, dynamic> json) =>
    RecordDayResponse(
      data: json['data'] == null
          ? null
          : DataResponseDayResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RecordDayResponseToJson(RecordDayResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataResponseDayResponse _$DataResponseDayResponseFromJson(
        Map<String, dynamic> json) =>
    DataResponseDayResponse(
      healthRecordId: json['healthRecordId'] as String?,
      indexBmi: json['indexBmi'] as String?,
      status: json['status'] as String?,
      heartRateIndicator: json['heartRateIndicator'] as String?,
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      glucose: json['glucose'] as String?,
      cholesterol: json['cholesterol'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      recordBmi: json['recordBmi'] == null
          ? null
          : RecordResponse.fromJson(json['recordBmi'] as Map<String, dynamic>),
      recordCholesterol: json['recordCholesterol'] == null
          ? null
          : RecordResponse.fromJson(
              json['recordCholesterol'] as Map<String, dynamic>),
      recordHeartBeat: json['recordHeartBeat'] == null
          ? null
          : RecordResponse.fromJson(
              json['recordHeartBeat'] as Map<String, dynamic>),
      recordGlucose: json['recordGlucose'] == null
          ? null
          : RecordResponse.fromJson(
              json['recordGlucose'] as Map<String, dynamic>),
      recordBloodPressure: json['recordBloodPressure'] == null
          ? null
          : RecordResponse.fromJson(
              json['recordBloodPressure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseDayResponseToJson(
        DataResponseDayResponse instance) =>
    <String, dynamic>{
      'healthRecordId': instance.healthRecordId,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'indexBmi': instance.indexBmi,
      'heartRateIndicator': instance.heartRateIndicator,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'glucose': instance.glucose,
      'cholesterol': instance.cholesterol,
      'recordBmi': instance.recordBmi,
      'recordCholesterol': instance.recordCholesterol,
      'recordHeartBeat': instance.recordHeartBeat,
      'recordGlucose': instance.recordGlucose,
      'recordBloodPressure': instance.recordBloodPressure,
    };

RecordResponse _$RecordResponseFromJson(Map<String, dynamic> json) =>
    RecordResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RecordResponseToJson(RecordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
