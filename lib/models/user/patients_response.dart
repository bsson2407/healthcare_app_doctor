import 'package:json_annotation/json_annotation.dart';

part 'patients_response.g.dart';

@JsonSerializable()
class PatientResponse {
  String message;
  int statusCode;
  List<DataPatientResponse> data;

  PatientResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseToJson(this);
}
//0353810417
//0343220597
@JsonSerializable()
class DataPatientResponse {
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
  DataHealthRecordIdResponse? healthRecord;

  DataPatientResponse(
      {this.id,
      this.fullName,
      this.gender,
      this.address,
      this.avatar,
      this.job,
      this.phone,
      this.insuranceNumber,
      this.state,
      this.healthRecord,
      this.medicalHistory,
      this.dateOfBirth});

  factory DataPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$DataPatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataPatientResponseToJson(this);
}

@JsonSerializable()
class DataHealthRecordIdResponse {
  String? id;

  DataHealthRecordIdResponse({
    this.id,
  });

  factory DataHealthRecordIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DataHealthRecordIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataHealthRecordIdResponseToJson(this);
}
