// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentGetResponse _$AppointmentGetResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentGetResponse(
      data: DataAppointmentGetResponse.fromJson(
          json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppointmentGetResponseToJson(
        AppointmentGetResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataAppointmentGetResponse _$DataAppointmentGetResponseFromJson(
        Map<String, dynamic> json) =>
    DataAppointmentGetResponse(
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
          : DoctorInAppointmentGetResponse.fromJson(
              json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataAppointmentGetResponseToJson(
        DataAppointmentGetResponse instance) =>
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

DoctorInAppointmentGetResponse _$DoctorInAppointmentGetResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorInAppointmentGetResponse(
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

Map<String, dynamic> _$DoctorInAppointmentGetResponseToJson(
        DoctorInAppointmentGetResponse instance) =>
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
