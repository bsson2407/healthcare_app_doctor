import 'package:json_annotation/json_annotation.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse {
  String? message;
  int? statusCode;
  List<DataResponse> data;
  // DataResponse[] data;

  AppointmentResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String? id;
  String? fullName;
  String? phone;
  DateTime? dateOfBirth;
  DateTime? dateMeeting;
  String? notes;
  String? timeMeeting;
  String? statusAppointment;
  DoctorInAppointmentResponse? doctor;
  DataResponse({
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

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class DoctorInAppointmentResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? phone;
  String? email;
  String? workPlace;
  String? specialize;

  DoctorInAppointmentResponse({
    this.id,
    this.fullName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.email,
    this.workPlace,
    this.specialize,
  });

  factory DoctorInAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorInAppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorInAppointmentResponseToJson(this);
}
