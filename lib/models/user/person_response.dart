import 'package:json_annotation/json_annotation.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse {
  String message;
  int statusCode;
  DataPersonResponse? data;

  PersonResponse({
    this.data,
    required this.statusCode,
    required this.message,
  });

  factory PersonResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}

@JsonSerializable()
class DataPersonResponse {
  String? id;
  String? phone;
  String? memberId;
  PersonPatientResponse? patient;

  DataPersonResponse(
      {required this.id,
      required this.phone,
      required this.memberId,
      required this.patient});

  factory DataPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$DataPersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataPersonResponseToJson(this);
}

@JsonSerializable()
class PersonPatientResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? address;
  String? phone;
  String? avatar;
  String? job;
  String? insuranceNumber;
  String? state;
  String? medicalHistory;

  PersonPatientResponse(
      {this.id,
      this.fullName,
      this.gender,
      this.address,
      this.avatar,
      this.job,
      this.phone,
      this.insuranceNumber,
      this.state,
      this.medicalHistory,
      this.dateOfBirth});

  factory PersonPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonPatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonPatientResponseToJson(this);
}
