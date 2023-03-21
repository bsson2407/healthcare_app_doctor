import 'package:json_annotation/json_annotation.dart';
part 'appointment_request.g.dart';

@JsonSerializable()
class AppointmentRequest {
  String? fullName;
  String? phone;
  DateTime? dateOfBirth;
  DateTime? dateMeeting;
  String? notes;
  String? timeMeeting;

  AppointmentRequest({
     this.fullName,
     this.phone,
     this.dateOfBirth,
     this.dateMeeting,
     this.notes,
     this.timeMeeting,
  });

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentRequestToJson(this);
}
