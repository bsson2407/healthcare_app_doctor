import 'package:json_annotation/json_annotation.dart';

part 'record_day_response.g.dart';

@JsonSerializable()
class RecordDayResponse {
  String? message;
  int? statusCode;
  DataResponseDayResponse? data;
  // DataResponse[] data;

  RecordDayResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory RecordDayResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordDayResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecordDayResponseToJson(this);
}

@JsonSerializable()
class DataResponseDayResponse {
  String? healthRecordId;
  String? status;
  DateTime? createdAt;
  String? indexBmi;
  String? heartRateIndicator;
  String? systolic;
  String? diastolic;
  String? glucose;
  String? cholesterol;
  RecordResponse? recordBmi;
  RecordResponse? recordCholesterol;
  RecordResponse? recordHeartBeat;
  RecordResponse? recordGlucose;
  RecordResponse? recordBloodPressure;

  DataResponseDayResponse({
    this.healthRecordId,
    this.indexBmi,
    this.status,
    this.heartRateIndicator,
    this.systolic,
    this.diastolic,
    this.glucose,
    this.cholesterol,
    this.createdAt,
    this.recordBmi,
    this.recordCholesterol,
    this.recordHeartBeat,
    this.recordGlucose,
    this.recordBloodPressure,
  });

  factory DataResponseDayResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseDayResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseDayResponseToJson(this);
}

@JsonSerializable()
class RecordResponse {
  String? status;
  String? message;

  RecordResponse({
    this.status,
    this.message,
  });

  factory RecordResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecordResponseToJson(this);
}
