// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResponse _$PersonResponseFromJson(Map<String, dynamic> json) =>
    PersonResponse(
      data: json['data'] == null
          ? null
          : DataPersonResponse.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PersonResponseToJson(PersonResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataPersonResponse _$DataPersonResponseFromJson(Map<String, dynamic> json) =>
    DataPersonResponse(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      memberId: json['memberId'] as String?,
      patient: json['patient'] == null
          ? null
          : PersonPatientResponse.fromJson(
              json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataPersonResponseToJson(DataPersonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'memberId': instance.memberId,
      'patient': instance.patient,
    };

PersonPatientResponse _$PersonPatientResponseFromJson(
        Map<String, dynamic> json) =>
    PersonPatientResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      job: json['job'] as String?,
      phone: json['phone'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
      state: json['state'] as String?,
      medicalHistory: json['medicalHistory'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PersonPatientResponseToJson(
        PersonPatientResponse instance) =>
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
    };
