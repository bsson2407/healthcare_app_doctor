// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) =>
    PatientResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataPatientResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PatientResponseToJson(PatientResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataPatientResponse _$DataPatientResponseFromJson(Map<String, dynamic> json) =>
    DataPatientResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      job: json['job'] as String?,
      phone: json['phone'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
      state: json['state'] as String?,
      healthRecord: json['healthRecord'] == null
          ? null
          : DataHealthRecordIdResponse.fromJson(
              json['healthRecord'] as Map<String, dynamic>),
      medicalHistory: json['medicalHistory'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$DataPatientResponseToJson(
        DataPatientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'job': instance.job,
      'insuranceNumber': instance.insuranceNumber,
      'state': instance.state,
      'medicalHistory': instance.medicalHistory,
      'healthRecord': instance.healthRecord,
    };

DataHealthRecordIdResponse _$DataHealthRecordIdResponseFromJson(
        Map<String, dynamic> json) =>
    DataHealthRecordIdResponse(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataHealthRecordIdResponseToJson(
        DataHealthRecordIdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
