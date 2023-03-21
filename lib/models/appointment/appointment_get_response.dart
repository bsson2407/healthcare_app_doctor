import 'package:json_annotation/json_annotation.dart';

part 'appointment_get_response.g.dart';

@JsonSerializable()
class AppointmentGetResponse {
  String? message;
  int? statusCode;
  DataAppointmentGetResponse data;
  // DataAppointmentGetResponse[] data;

  AppointmentGetResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory AppointmentGetResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentGetResponseToJson(this);
}

@JsonSerializable()
class DataAppointmentGetResponse {
  String? id;
  String? fullName;
  String? phone;
  DateTime? dateOfBirth;
  DateTime? dateMeeting;
  String? notes;
  String? timeMeeting;
  String? statusAppointment;
  DoctorInAppointmentGetResponse? doctor;
  DataAppointmentGetResponse({
    this.id,
    this.fullName,
    this.phone,
    this.dateOfBirth,
    this.dateMeeting,
    this.notes,
    this.timeMeeting,
    this.statusAppointment,
    this.doctor,
  });

  factory DataAppointmentGetResponse.fromJson(Map<String, dynamic> json) =>
      _$DataAppointmentGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataAppointmentGetResponseToJson(this);
}

@JsonSerializable()
class DoctorInAppointmentGetResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? phone;
  String? email;
  String? workPlace;
  String? specialize;

  DoctorInAppointmentGetResponse({
    this.id,
    this.fullName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.email,
    this.workPlace,
    this.specialize,
  });

  factory DoctorInAppointmentGetResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorInAppointmentGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorInAppointmentGetResponseToJson(this);
}
