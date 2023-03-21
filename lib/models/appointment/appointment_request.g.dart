// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentRequest _$AppointmentRequestFromJson(Map<String, dynamic> json) =>
    AppointmentRequest(
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
    );

Map<String, dynamic> _$AppointmentRequestToJson(AppointmentRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'dateMeeting': instance.dateMeeting?.toIso8601String(),
      'notes': instance.notes,
      'timeMeeting': instance.timeMeeting,
    };
