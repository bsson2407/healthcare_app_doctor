import 'package:json_annotation/json_annotation.dart';

part 'health_record_response.g.dart';

@JsonSerializable()
class HealthRecordResponse {
  String? message;
  int? statusCode;
  List<DataResponse> data;
  // DataResponse[] data;

  HealthRecordResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory HealthRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HealthRecordResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String? id;
  String? height;
  String? weight;
  String? indexBmi;
  String? heartRateIndicator;
  String? systolic;
  String? diastolic;
  String? glucose;
  String? cholesterol;
  String? healthRecordId;
  DateTime? createdAt;

  DataResponse({
    this.id,
    this.healthRecordId,
    this.height,
    this.weight,
    this.indexBmi,
    this.heartRateIndicator,
    this.systolic,
    this.diastolic,
    this.glucose,
    this.cholesterol,
    this.createdAt,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
