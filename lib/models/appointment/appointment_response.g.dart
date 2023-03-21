// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      dateMeeting: json['dateMeeting'] == null
          ? null
          : DateTime.parse(json['dateMeeting'] as String),
      notes: json['notes'] as String?,
      timeMeeting: json['timeMeeting'] as String?,
      statusAppointment: json['statusAppointment'] as String?,
      doctor: json['doctor'] == null
          ? null
          : DoctorInAppointmentResponse.fromJson(
              json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'dateMeeting': instance.dateMeeting?.toIso8601String(),
      'notes': instance.notes,
      'timeMeeting': instance.timeMeeting,
      'statusAppointment': instance.statusAppointment,
      'doctor': instance.doctor,
    };

DoctorInAppointmentResponse _$DoctorInAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorInAppointmentResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      workPlace: json['workPlace'] as String?,
      specialize: json['specialize'] as String?,
    );

Map<String, dynamic> _$DoctorInAppointmentResponseToJson(
        DoctorInAppointmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phone': instance.phone,
      'email': instance.email,
      'workPlace': instance.workPlace,
      'specialize': instance.specialize,
    };
